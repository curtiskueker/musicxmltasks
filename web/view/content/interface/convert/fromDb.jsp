<div id="convert-pane">
    <img class="convert-pane-image" src="images/interface/db_from_box.png" alt="db from box"/>
</div>

<div id="convert-content">
    <div class="content-header">From Database</div>

    <div class="content">
    Selecting this pane will convert a MusicXML file to Java beans which are then converted to the data type selected in the to-conversion pane.
    </div>

    <div class="content">
    This selection requires that some MusicXML file has already been converted to a database record.
    </div>

    <ul class="arrowed-list">
        <li class="padded-li"><span>Select a previously-stored score from the Score Name select list.</span></li>

    <div class="content">
If a database connection has not yet been established by the tool or if the database tables have not yet been created, there may be a delay when a Score Name is selected while the database performs these tasks.
    </div>

        <li class="padded-li"><span>Select the "Show SQL" checkbox to display the SQL queries that Hibernate executes.</span></li>

        <div class="content">
            NOTE: It's recommended that that SQL output be redirected to a file, as the amount of output may overwhelm the tool, requiring that it be restarted (do this under the "Output" tab in the tool).
        </div>
    </ul>
</div>
