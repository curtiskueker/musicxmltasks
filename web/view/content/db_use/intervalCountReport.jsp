<div class="content-header">Interval Count Report</div>

<div class="content">
    The interval count report demonstrates looping through the list of <code>music_data</code> records in a score,
    while saving state to make comparisons between notes.
</div>

<div class="content">
    Only the first note of each chord, as it appears in the MusicXML file, is compared.
    The report procedure counts the number of each interval in a piece, where positive numbers are upward intervals,
    and negative numbers are downward intervals.
    The report visualization displays each interval and its count, from the highest count to the lowest.
</div>

<div class="content-section">Reports output</div>

<div class="content">
    Beethoven Symphony No. 4, 1st movement:
</div>

<div class="content">
    <img src="images/reports/interval_count_beethoven.png" alt="interval count beethoven">
</div>

<div class="content">
    J. S. Bach Brandenburg Concerto No. 6:
</div>

<div class="content">
    <img src="images/reports/interval_count_bach.png" alt="interval count bach">
</div>

<div class="content-section">Procedure <code>interval_count_report</code></div>

<div class="content">
    <textarea class="example" readonly rows="6">
create table if not exists report_interval_counts (
    score_id int,
    pitch_interval int,
    interval_count int
);
    </textarea>
</div>

<div class="content">
    <textarea class="example" readonly rows="42">
drop procedure if exists interval_count_report;

delimiter //
create procedure interval_count_report
(in v_score_id int)
proc: begin
    declare v_interval_count int;
    declare v_interval_number int;
    declare v_music_data_type varchar(255);
    declare v_note_type_type varchar(255);
    declare is_tied boolean;
    declare is_chord boolean;
    declare v_step varchar(255);
    declare v_previous_step varchar(255);
    declare v_pitch_alter int;
    declare v_previous_pitch_alter int;
    declare v_octave int;
    declare v_previous_octave int;

    select music_data_type, note_type_type, tied, chord, step, previous_step, pitch_alter, previous_pitch_alter, octave, previous_octave from report_current_music_data
    into v_music_data_type, v_note_type_type, is_tied, is_chord, v_step, v_previous_step, v_pitch_alter, v_previous_pitch_alter, v_octave, v_previous_octave;

    if v_music_data_type != 'note' and v_note_type_type != 'pitch' then leave proc; end if;
    if is_tied then leave proc; end if;
    if is_chord then leave proc; end if;

    if v_step is null or v_previous_step is null then leave proc; end if;

    set v_interval_number = pitch_number(v_step, v_pitch_alter, null) - pitch_number(v_previous_step, v_previous_pitch_alter, null);
    if v_octave is not null and v_previous_octave is not null then
        set v_interval_number = v_interval_number + ((v_octave * 12) - (v_previous_octave * 12));
    end if;
    select interval_count into v_interval_count from report_interval_counts where score_id = v_score_id and pitch_interval = v_interval_number;
    if v_interval_count is null then
        insert into report_interval_counts (score_id, pitch_interval, interval_count) values (v_score_id, v_interval_number, 1);
    else
        set v_interval_count = v_interval_count + 1;
        update report_interval_counts set interval_count = v_interval_count where score_id = v_score_id and pitch_interval = v_interval_number;
    end if;
end //
delimiter ;
    </textarea>
</div>

<div class="content">
    The procedure queries the current <code>music_data</code> state in table <code>report_current_music_data</code>
    which includes that voice's previous pitch, alter, and octave values.
    If it's a pitched note, it obtains the current and previous note's pitch class number from the function <code>pitch_number</code>.
</div>

<div class="content">
    The data table <code>report_interval_counts</code> is updated with the interval count for the score.
</div>

<div class="content">
    To run the stored procedure:
    <ul>
        <li>At the mysql prompt, call the pitch count report; example <code>call score_report('pitch_count_report', 6)</code></li>
    </ul>
</div>

<div class="content-section">Report visualization</div>

<div class="content">
    I've chosen a pie chart visualization for the interval count display.
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
        <li>Double click the interval count report in the Navigator pane</li>
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
select
    pitch_interval, cast(pitch_interval as char(5)) as interval_name, interval_count
from
    report_interval_counts
where
    score_id = ?
order by
	interval_count desc
    </textarea>
</div>

<div class="content">
    I've cast the <code>pitch_interval</code> column to a char type because BIRT has difficulty with negative numbers as a category name.
    The sort order of the interval names in the report is in interval count order.
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
        <li>Click the empty layout in the layout area.  In the menu, select Insert -> Chart</li>
        <li>Select Chart Type: Pie</li>
        <li>Select Data: Slice Size Definition: <code>row["interval_count"]</code>, Category Definition: <code>row["pitch_interval"]</code>, Use Data
            From: the Data Set you've created</li>
        <li>Format Chart: Chart Area: set the Title</li>
    </ul>
</div>

<div class="content">
    To run the report:
    <ul>
        <li>Select the report in the Navigator pane</li>
        <li>In the menu, select Run -> View Report -> In Web Viewer</li>
    </ul>
</div>
