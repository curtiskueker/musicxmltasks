<div class="content-header">Stored Procedures</div>

<div class="content">
I've set up a process that uses a stored procedure called <code>score_report</code> which has the common score-processing statements.
Individual stored procedures that generate score data are called from there.
</div>

<div class="content-section"><code>score_report</code> stored procedure</div>

<div class="content">
Here's the stored procedure <code>score_report</code>:
</div>

<div class="content">
<textarea class="example" readonly rows="160">
drop procedure if exists score_report;

delimiter //
create procedure score_report
(in v_procedure_name varchar(255), in v_score_id int)
proc: begin
    declare is_end_of_data boolean default false;
    declare is_report_run boolean default false;
    declare v_current_transposition int;
    declare v_current_part_id int default 0;
    declare v_part_id int default 0;
    declare v_current_measure_number varchar(255) default '';
    declare v_measure_number varchar(255);
    declare v_music_data_id int;
    declare v_music_data_type varchar(255);
    declare v_voice varchar(255);
    declare v_current_measure_duration int default 0;
    declare v_previous_duration int default 0;
    declare v_duration int;
    declare is_new_measure boolean;
    declare v_octave int;
    declare v_previous_octave int;
    declare v_grace_id int;
    declare is_chord boolean;
    declare v_note_type_type varchar(255);
    declare v_chromatic int;
    declare v_step varchar(255);
    declare v_previous_step varchar(255);
    declare v_pitch_alter int;
    declare v_previous_pitch_alter int;

    declare c_score_items cursor for
        select part_id, measure_number, music_data_id, music_data_type, voice, duration, grace_id, chord, note_type_type, step, pitch_alter, octave, chromatic
        from score_view
        where score_id = v_score_id;

    declare continue handler for not found set is_end_of_data = true;

    create table if not exists report_run (
        score_id int,
        procedure_name varchar(255)
    );

    create temporary table if not exists report_current_music_data (
        measure_number varchar(255),
        music_data_type varchar(31),
        transposition int,
        note_type_type varchar(31),
        octave int,
        step varchar(255),
        pitch_alter int,
        previous_octave int,
        previous_step varchar(255),
        previous_pitch_alter int,
        new_measure boolean,
        grace_id int
    );

    create temporary table if not exists report_previous_voice_note (
        voice varchar(255),
        octave int,
        step varchar(255),
        pitch_alter int
    );

    if not exists(select id from score where id = v_score_id) then
        select concat('Score ID ', v_score_id, ' not found') as error_message;
        leave proc;
    end if;

    if exists(select score_id from report_run where score_id = v_score_id and procedure_name = v_procedure_name) then
        select concat('Report ', v_procedure_name, ' already run for score ', v_score_name) as error_message;
        leave proc;
    end if;

    select concat('Running report ', v_procedure_name, ' for score id ', v_score_id) as message;

    set @s_procedure_statement = concat('call ', v_procedure_name, '(', v_score_id, ')');
    prepare s_procedure_statement from @s_procedure_statement;

    open c_score_items;
    score_items_loop: loop
        fetch c_score_items into
            v_part_id, v_measure_number, v_music_data_id, v_music_data_type,
            v_voice, v_duration, v_grace_id, is_chord, v_note_type_type,
            v_step, v_pitch_alter, v_octave, v_chromatic;
        if is_end_of_data then leave score_items_loop; end if;
        if v_part_id != v_current_part_id then
            set v_current_transposition = null;
            set v_current_part_id = v_part_id;
            delete from report_previous_voice_note;
        end if;
        if v_measure_number != v_current_measure_number then
            set v_current_measure_number = v_measure_number;
            set v_current_measure_duration = 0;
        end if;

        -- process the music data type
        case v_music_data_type
            when 'attributes' then
                if v_chromatic is not null then set v_current_transposition = v_chromatic; end if;
            when 'backup' then
                set v_current_measure_duration = v_current_measure_duration - v_duration;
            when 'forward' then
                set v_current_measure_duration = v_current_measure_duration + v_duration;
            when 'note' then
                if is_tied_note(v_music_data_id) then iterate score_items_loop; end if;
                if v_note_type_type = 'pitch' then
                    if not is_chord then
                        if exists (select voice from report_previous_voice_note where voice = v_voice) then
                            select octave, step, pitch_alter into v_previous_octave, v_previous_step, v_previous_pitch_alter
                            from report_previous_voice_note where voice = v_voice;
                        else
                            set v_previous_octave = null;
                            set v_previous_step = null;
                            set v_previous_pitch_alter = null;
                        end if;
                        if exists (select voice from report_previous_voice_note where voice = v_voice) then
                            update report_previous_voice_note set octave = v_octave, step = v_step, pitch_alter = v_pitch_alter where voice = v_voice;
                        else
                            insert into report_previous_voice_note (voice, octave, step, pitch_alter) values (v_voice, v_octave, v_step, v_pitch_alter);
                        end if;
                    end if;
                elseif v_note_type_type = 'rest' then
                    delete from report_previous_voice_note where voice = v_voice;
                end if;
                if is_chord then set v_current_measure_duration = v_current_measure_duration - v_previous_duration; end if;
                if v_current_measure_duration = 0 then
                    set is_new_measure = true;
                else
                    set is_new_measure = false;
                end if;
                set v_current_measure_duration = v_current_measure_duration + v_duration;
                set v_previous_duration = v_duration;
            else begin end;
            end case;

        -- replace current state used by reports procedures
        delete from report_current_music_data;
        insert into report_current_music_data
            (measure_number, music_data_type, transposition, note_type_type,
             octave, step, pitch_alter, previous_octave, previous_step, previous_pitch_alter, new_measure, grace_id)
            values
            (v_measure_number, v_music_data_type, v_current_transposition, v_note_type_type,
             v_octave, v_step, v_pitch_alter, v_previous_octave, v_previous_step, v_previous_pitch_alter, is_new_measure, v_grace_id);

        -- run a report
        execute s_procedure_statement;
        set is_report_run = true;

    end loop;
    close c_score_items;
    deallocate prepare s_procedure_statement;

    if is_report_run then insert into report_run (score_id, procedure_name) values (v_score_id, v_procedure_name); end if;
    drop temporary table if exists report_previous_voice_note;
    drop temporary table if exists report_current_music_data;
end //
delimiter ;
</textarea>
</div>

<div class="content">
All of the utility functions, such as <code>is_tied_note</code>, are listed on the Functions page.
</div>

<div class="content">
The report procedure name and score ID are passed in as arguments.
    A score's ID value is the <code>id</code> field in the <code>score</code> table.
    The call at the MySQL command-line prompt is called at the mysql command line prompt with <code>call score_report('report_procedure_name', 'score ID')</code>.
    The <code>score_view</code> is then queried for that score's <code>score_id</code>.
</div>

<div class="content">
    I've kept things simple by selecting an error message and returning when a score ID is not found or the report has already been run,
    instead of using proper error handling.
    That works well enough for my purposes here.
</div>

<div class="content">
The view contains the score, part, and music data IDs, as well as the <code>music_data_type</code> (<code>attribute</code>,
    <code>note</code>, <code>backup</code>, <code>forward</code>, etc.),
and for notes the <code>note_type_type</code> (<code>pitch</code>, <code>rest</code>, <code>unpitched</code>), step, alter, and octave
    in the order that they appear in the score.
We then iterate the view, and perform any processing as necessary.
</div>

<div class="content">
The loop's iteration logic:
<ul>
    <li>Keeps track of the current part and measure</li>
    <li>Keeps track of the current duration value within the current measure</li>
    <li>Keeps track of the current transposition value (only one transposition value at a time is handled)</li>
    <li>Stores the previous note's data for that voice in temporary table <code>report_previous_note</code> for reference (using a temp table saves
        state and simplifies data typing within the stored procedure)</li>
    <li>Calls a reports stored procedure</li>
</ul>
</div>

<div class="content">
    The called report procedure that generates the data has a single <code>score_id</code> argument.
</div>

<div class="content">
    With this approach, when a new report procedure is implemented, you only need store the report procedure
    and call <code>score_report</code> with the report procedure as the first argument.

</div>

<div class="content">
    The processing code in the <code>score_report</code> procedure will only need to be changed when the method of processing of scores changes.
    Score processing and data generation are thus decoupled; <code>score_report</code> processes the score, the reports procedures generate the score data.
</div>

<div class="content">
    On each iteration of the score view, the current data state is stored in temp table <code>report_current_music_data</code>,
    which the called procedure then queries.  I've chosen this approach because MySQL stored procedures don't have a hash map structure for passing data as an argument.
</div>

<div class="content">
Having all calls to individual reports made from within the <code>score_report</code> procedure keeps all common calculations like determining the note, transposition, and duration in one place in the
calling <code>score_report</code> procedure, rather than having these duplicated within the individual reports.
</div>

<div class="content">
If you want to improve how a score is processed, you can make all the improvements in the <code>score_report</code> procedure loop.
The sky's the limit.
</div>

<div class="content-section">Individual reports stored procedures</div>

<div class="content">
The individual reports stored procedures generate output tables with data.
The BI reports software then queries the generated reports data and creates a visualization of the data.
</div>

<div class="content">
The sample reports stored procedures included here are:
<ul>
    <li>Pitch count report: stores a count of each pitch class that occurs throughout the piece</li>
    <li>Interval count report: counts the number of instances of each interval between consecutive notes</li>
    <li>Measure notes report: stores all unique pitches that occur as the first note of each measure</li>
</ul>
</div>

<div class="content-section">Naming conventions</div>

<div class="content">
All table names used in the reports process begin with <code>report_</code> so that the tables can be identified and segregated from the rest of the tables in the MusicXML schema.
</div>

<div class="content">
Variable naming conventions for the procedures prevent name clash with select list column names:
<ul>
    <li>Variable: <code>v_</code></li>
    <li>Boolean: <code>is_</code></li>
    <li>Cursor: <code>c_</code></li>
    <li>Statement: <code>s_</code></li>
</ul>
</div>
