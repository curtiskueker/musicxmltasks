<div class="content-header">Measure Notes Report</div>

<div class="content">
    The measure notes report demonstrates looping through the list of <code>music_data</code> records in a score,
    while saving data about the score according to pre-determined criteria.
</div>

<div class="content">
    The report procedure saves all non-tied notes at the beginning of each measure,
    including the measure number, and the measure's relative placement within the score.
    The report visualization lists all of the unique notes for each measure downbeat, in measure order.
</div>

<div class="content-section">Reports output</div>

<div class="content">
    Beethoven Symphony No. 4, 1st movement:
</div>

<div class="content">
    <img src="images/reports/measure_notes_beethoven.png" alt="measure notes beethoven">
</div>

<div class="content">
    J. S. Bach Brandenburg Concerto No. 6:
</div>

<div class="content">
    <img src="images/reports/measure_notes_bach.png" alt="measure notes bach">
</div>

<div class="content-section">Procedure <code>measure_notes_report</code></div>

<div class="content">
    <textarea class="example" readonly rows="7">
create table if not exists report_measure_notes (
    report_measure_id int,
    step varchar(255),
    pitch_alter int,
    transpose int
);
    </textarea>
</div>

<div class="content">
    <textarea class="example" readonly rows="33">
drop procedure if exists measure_notes_report;

delimiter //
create procedure measure_notes_report
	(in v_score_id int)
proc: begin
    declare v_music_data_type varchar(255);
    declare v_grace_id int;
    declare is_new_measure boolean;
    declare v_report_measure_id int;
    declare v_measure_number varchar(255);
	declare v_step varchar(255);
	declare v_pitch_alter int;
	declare v_current_transposition int;

    select music_data_type, grace_id, new_measure, measure_number, step, pitch_alter, transposition from report_current_music_data
    into v_music_data_type, v_grace_id, is_new_measure, v_measure_number, v_step, v_pitch_alter, v_current_transposition;

    if v_music_data_type != 'note' or v_grace_id is not null or not is_new_measure then leave proc; end if;

    select id from report_measure where score_id = v_score_id and measure_number = v_measure_number into v_report_measure_id;
    if v_report_measure_id is null then
        select concat('report_measure record not found for measure number ', v_measure_number) as message;
        leave proc;
    end if;

    if pitch_number(v_step, v_pitch_alter, v_current_transposition) is not null then
        insert into report_measure_notes (report_measure_id, step, pitch_alter, transpose)
        values (v_report_measure_id, v_step, v_pitch_alter, v_current_transposition);
    end if;
end //
delimiter ;
    </textarea>
</div>

<div class="content">
    The procedure queries the current <code>music_data</code> state in table <code>report_current_music_data</code>
    which includes the current note's pitch, alter, and transposition values,
    whether that note is the first note in a new measure, and whether the note is a grace note.
    If it's a non-grace note at the beginning of a measure, and a valid pitch class number is obtained from the function <code>pitch_number</code>,
    the pitch, alter, and transposition data is stored in table <code>report_measure_notes</code>.
</div>

<div class="content">
    To run the stored procedure:
    <ul>
        <li>At the mysql prompt, call the measure notes report; example <code>call score_report('measure_notes_report', 6)</code></li>
    </ul>
</div>

<div class="content-section">Report visualization</div>

<div class="content">
    For this report, I've chosen a table display that lists the unique pitches for each measure, in measure order.
</div>

<div class="content">
    To set up the report:
    <ul>
        <li>Right click the project in the Navigator pane, select New -> Report, and name the report in the File Name
            box</li>
    </ul>
</div>

<div class="content">
    To set up the data source:
    <ul>
        <li>Double click the library in the Navigator pane</li>
        <li>Select the mysql data source in the Resource Explorer pane</li>
        <li>Double click the measure notes report in the Navigator pane</li>
        <li>Right click the data source in the Resource Explorer pane and select Add to Report</li>
    </ul>
</div>

<div class="content">
    The visualization report is web-based and will have a prompt to enter the score ID.
</div>

<div class="content">
    To add the score ID prompt:
    <ul>
        <li>Right select Report Parameters in the Data Explorer pane, and select New Parameter</li>
        <li>Enter the name as <code>score_id</code>, the Prompt Text as <code>Score ID:</code>, and the Data Type as Integer</li>
        <li>Make sure Is Required is selected</li>
    </ul>
</div>

<div class="content">
    To set up the report query:
    <ul>
        <li>Right click Data Sets in the Data Explorer pane and select New Data Set</li>
        <li>Verify the JDBC Data Source, and name the data set in the Data Set Name box</li>
        <li>Paste the Query Text from below; the query selects from the reports table populated in the stored procedure
            above.</li>
    </ul>
</div>

<div class="content">
    <textarea class="example" readonly rows="9">
select m.measure_number, group_concat(distinct pitch_label(pitch_number(n.step, n.pitch_alter, n.transpose)) separator ', ') as pitch, m.ordering
	from report_measure m, report_measure_notes n
	where m.id = n.report_measure_id and m.score_id = ?
	group by m.measure_number, m.ordering
	order by m.ordering;
    </textarea>
</div>

<div class="content">
    The query string contains a <code>?</code> which is a query parameter.
</div>

<div class="content">
    <ul>
        <li>In the next window for creating the new data set, select Parameters</li>
        <li>Edit the listed parameter, giving the name <code>score_id</code>, Data Type Integer, Linked To Report Parameter
            <code>score_id</code></li>
    </ul>
</div>

<div class="content">
    To create the layout:
    <ul>
        <li>Click the empty layout in the layout area.  In the menu, select Insert -> Table</li>
        <li>Bind the columns in the table to <code>measure_number</code> and <code>pitch</code></li>
    </ul>
</div>

<div class="content">
    To run the report:
    <ul>
        <li>Select the report in the Navigator pane</li>
        <li>In the menu, select Run -> View Report -> In Web Viewer</li>
    </ul>
</div>
