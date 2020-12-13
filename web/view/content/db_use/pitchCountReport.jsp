<div class="content-header">Pitch Count Report</div>

<div class="content">
    The pitch count report demonstrates working with a simple loop through the list of <code>music_data</code> records in a score.
</div>

<div class="content">
    The report procedure counts the number of occurrences of each unique pitch (pitch class) in a piece.
    The report visualization displays the count for each pitch.
</div>

<div class="content-section">Reports output</div>

<div class="content">
    Beethoven Symphony No. 4, 1st movement:
</div>

<div class="content">
    <img src="images/reports/pitch_count_beethoven.png" alt="pitch class beethoven">
</div>

<div class="content">
    J. S. Bach Brandenburg Concerto No. 6:
</div>

<div class="content">
    <img src="images/reports/pitch_count_bach.png" alt="pitch class bach">
</div>

<div class="content-section">Procedure <code>pitch_count_report</code></div>

<div class="content">
    <textarea class="example" readonly rows="6">
create table if not exists report_pitch_counts (
    score_id int,
    pitch int,
    pitch_count int
);
    </textarea>
</div>

<div class="content">
    <textarea class="example" readonly rows="32">
drop procedure if exists pitch_count_report;

delimiter //
create procedure pitch_count_report
	(in v_score_id int)
proc: begin
	declare v_pitch_count int;
	declare v_pitch_number int;
	declare v_music_data_type varchar(255);
	declare v_step varchar(255);
	declare v_pitch_alter int;
	declare v_transposition int;
	declare is_tied boolean;

	select music_data_type, step, pitch_alter, transposition, tied from report_current_music_data into v_music_data_type, v_step, v_pitch_alter, v_transposition, is_tied;

	if v_music_data_type != 'note' then leave proc; end if;
	if is_tied then leave proc; end if;

    set v_pitch_number = pitch_number(v_step, v_pitch_alter, v_transposition);
    if v_pitch_number is null then leave proc; end if;

    select pitch_count into v_pitch_count from report_pitch_counts where score_id = v_score_id and pitch = v_pitch_number;
    if v_pitch_count is null then
        insert into report_pitch_counts (score_id, pitch, pitch_count) values (v_score_id, v_pitch_number, 1);
    else
        set v_pitch_count = v_pitch_count + 1;
        update report_pitch_counts set pitch_count = v_pitch_count where score_id = v_score_id and pitch = v_pitch_number;
    end if;
end //
delimiter ;
    </textarea>
</div>

<div class="content">
The procedure queries the current <code>music_data</code> state in table <code>report_current_music_data</code>,
and if it's a note, obtains the note's pitch class number from the function <code>pitch_number</code>.
</div>

<div class="content">
The data table <code>report_pitch_counts</code> is updated with the pitch count for the score.
</div>

<div class="content">
    To run the stored procedure:
    <ul>
        <li>At the mysql prompt, call the pitch count report; example <code>call score_report('pitch_count_report', 6)</code></li>
    </ul>
</div>

<div class="content-section">Report visualization</div>

<div class="content">
I've chosen a pie chart visualization for the pitch count display.
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
        <li>Double click the pitch count report in the Navigator pane</li>
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
    <textarea class="example" readonly rows="4">
select pitch_label(pitch) as pitch_label, pitch_count
from report_pitch_counts
where score_id = ?
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
        <li>Click the empty layout in the layout area.  In the menu, select Insert -> Chart</li>
        <li>Select Chart Type: Pie</li>
        <li>Select Data: Slice Size Definition: <code>row["pitch_count"]</code>, Category Definition: <code>row["pitch_label"]</code>, Use Data
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
