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
<textarea class="example" readonly rows="121">
drop procedure if exists score_report;

delimiter //
create procedure score_report
(in v_report_name varchar(255), in v_score_id int)
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
        report_name varchar(255)
    );

    create table if not exists report_previous_note (
        voice varchar(255),
        octave int,
        step varchar(255),
        pitch_alter int
    );

    if exists (select score_id from report_run where score_id = v_score_id and report_name = v_report_name) then leave proc; end if;

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
            delete from report_previous_note;
        end if;
        if v_measure_number != v_current_measure_number then
            set v_current_measure_number = v_measure_number;
            set v_current_measure_duration = 0;
        end if;
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
                        if exists (select voice from report_previous_note where voice = v_voice) then
                            select octave, step, pitch_alter into v_previous_octave, v_previous_step, v_previous_pitch_alter
                            from report_previous_note where voice = v_voice;
                        else
                            set v_previous_octave = null;
                            set v_previous_step = null;
                            set v_previous_pitch_alter = null;
                        end if;
                        if v_report_name = 'interval count' then
                            call interval_count_report(v_score_id, v_step, v_previous_step, v_pitch_alter, v_previous_pitch_alter, v_octave, v_previous_octave);
                            set is_report_run = true;
                        end if;
                        if exists (select voice from report_previous_note where voice = v_voice) then
                            update report_previous_note set octave = v_octave, step = v_step, pitch_alter = v_pitch_alter where voice = v_voice;
                        else
                            insert into report_previous_note (voice, octave, step, pitch_alter) values (v_voice, v_octave, v_step, v_pitch_alter);
                        end if;
                    end if;
                elseif v_note_type_type = 'rest' then
                    delete from report_previous_note where voice = v_voice;
                end if;
                if is_chord then set v_current_measure_duration = v_current_measure_duration - v_previous_duration; end if;
                if v_report_name = 'measure notes' then
                    if v_grace_id is null and v_current_measure_duration = 0 then
                        call measure_notes_report(v_score_id, v_measure_number, v_step, v_pitch_alter, v_current_transposition);
                        set is_report_run = true;
                    end if;
                elseif v_report_name = 'pitch count' then
                    call pitch_count_report(v_score_id, v_step, v_pitch_alter, v_current_transposition);
                    set is_report_run = true;
                end if;
                set v_current_measure_duration = v_current_measure_duration + v_duration;
                set v_previous_duration = v_duration;
            else begin end;
            end case;
    end loop;
    close c_score_items;

    if is_report_run then insert into report_run (score_id, report_name) values (v_score_id, v_report_name); end if;
    drop table report_previous_note;
end //
delimiter ;
</textarea>
</div>

<div class="content">
The referenced utility function <code>is_tied_note</code> is defined as:
</div>

<div class="content">
<textarea class="example" readonly rows="33">
drop function if exists is_tied_note;

delimiter //
create function is_tied_note (
    v_note_id int
)
returns boolean
not deterministic
begin
    declare is_end_of_data boolean default false;
    declare v_type varchar(255);
    declare is_tied boolean default false;

    declare c_note_ties cursor for
        select type from tie where note_id = v_note_id;

    declare continue handler for not found set is_end_of_data = true;

    open c_note_ties;
    ties_loop: loop
        fetch c_note_ties into v_type;
        if is_end_of_data then leave ties_loop; end if;
        if v_type = 'stop' or v_type = 'continue' then
            set is_tied = true;
            leave ties_loop;
        end if;
    end loop;
    close c_note_ties;

    return is_tied;
end //
delimiter ;
</textarea>
</div>

<div class="content">
The report name and score id are passed in as arguments.
The <code>score_view</code> is then queried for that <code>score_id</code>.
</div>

<div class="content">
The view contains the score, part, and music data IDs, as well as the <code>music_data_type</code> (<code>attribute</code>,
    <code>note</code>, <code>backup</code>, <code>forward</code>, etc.),
and for notes the <code>note_type_type</code> (<code>pitch</code>, <code>rest</code>, <code>unpitched</code>), step, alter, and octave.
We then iterate the view, and perform any processing as necessary.
</div>

<div class="content">
The loop's iteration logic:
<ul>
    <li>Keeps track of the current part and measure</li>
    <li>Keeps track of the current duration value within the current measure</li>
    <li>Keeps track of the current transposition value (only one transposition value at a time is handled)</li>
    <li>Stores the previous note's data in temporary table <code>report_previous_note</code> for reference (using a temp table saves
        state and simplifies data typing within the stored procedure)</li>
    <li>Calls a reports stored procedure under eligible conditions</li>
</ul>
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
</ul>
</div>
