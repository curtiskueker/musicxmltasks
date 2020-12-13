<div class="content-header">Reports</div>

<div class="content">
The examples given here show how to set up data visualization reports using the BI reports software BIRT.
</div>

<div class="content">
The BIRT software can be downloaded <a href="http://download.eclipse.org/birt/downloads/" target="_blank">here</a>.
</div>

<div class="content">
The intent here is to give simple visualization examples as a jumping off point.
From there, users can decide for themselves how they want to use MusicXML relational data.
</div>

<div class="content">
The individual reports examples are on subpages of this page,
where the specifics of each report will be laid out.
</div>

<div class="content">
    Each report is run against the database records of Beethoven Symphony No. 4, 1st movement
    and J. S. Bach's Brandenburg Concerto No. 6.
    These two works are in the same key, and have approximately the same number of notes.
</div>

<div class="content">
The reports examples are:
    <ul>
        <li>Pitch count report: demonstrates a simple loop and count</li>
        <li>Interval count report: demonstrates comparing notes in relation</li>
        <li>Measure notes report: demonstrates note handling by location</li>
    </ul>
</div>

<div class="content-section">BIRT reports set up</div>

<div class="content">
First, set up a new project:
    <ul>
        <li>Select File -> New -> Project and select Business Intelligence and Reporting Tools -> Report Project</li>
        <li>Enter a project name</li>
    </ul>
</div>

<div class="content-subsection">Set up the database connection</div>

<div class="content">
    <ul>
        <li>Select the project in the Navigator pane and from the menu select File -> New -> Library and name the library
            <code>mysql</code></li>
        <li>Double click the mysql library and in the Data Explorer pane, right click Data Sources and select New Data Source</li>
        <li>Select JDBC Data Source and enter <code>mysql</code> for the Data Source Name</li>
        <li>The driver class is <code>com.mysql.jdbc.Driver</code></li>
        <li>Database URL: <code>jdbc:mysql://localhost/database_name</code></li>
        <li>Enter your database username and password</li>
        <li>Test the connection and finish</li>
    </ul>
</div>

<div class="content">
You now have a data source in a library that can be used by all of the reports in the project.
</div>

<div class="content-section">Writing individual reports procedures</div>

<div class="content">
Individual reports consist of two parts:
    <ul>
        <li>The reports stored procedure</li>
        <li>The BIRT report that queries the data generated by the stored procedure and then generates a visual representation of the data</li>
    </ul>
</div>

<div class="content-subsection">The reports stored procedure</div>

<div class="content">
    <ul>
        <li>The stored procedure takes a single score id argument</li>
        <li>Selects the current state from the temporary <code>report_current_music_data</code> table</li>
        <li>Tests whether the current <code>music_data</code> item in the score is eligible to generate data for this report</li>
        <li>Processes the <code>music_data</code> and stores data in the reports table</li>
    </ul>
</div>

<div class="content">
    Any data tables for the reports procedure output are created separately.
</div>

<div class="content">
The reports procedure is then called at the mysql command line as <code>call score_report('reports_procedure_name', score ID)</code>
</div>

<div class="content-subsection">The report visualization</div>

<div class="content">
    <ul>
        <li>Queries the database table(s) generated by the stored procedure</li>
        <li>Translates the result set from the query to visual representation</li>
    </ul>
</div>
