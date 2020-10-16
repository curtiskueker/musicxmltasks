<div class="content-header">Tasks Output</div>

<div class="content">
Whenever a task execute button is pressed, output is sent to the tasks output console at the bottom of the tool.
The console runs in its own thread so that output doesn't interfere with task execution.
</div>

<div class="content-section">Task output form</div>

<div class="content">
    Task output takes the following form:

    <ul>
        <li>Task output beginning</li>
        <li>Task progress output (for some conversion tasks)</li>
        <li>Task output ending</li>
        <li>Task completion output indicating success or failure</li>
    </ul>

    Task output may optionally include:

    <ul>
        <li>Database connection attempt output</li>
        <li>SQL query output (when selected)</li>
    </ul>
</div>

<div class="content-section">Redirecting output</div>

<div class="content">
Output may be redirected to a file instead of to the tasks console.
</div>

<div class="content">
    Task output and SQL query output are handled separately.
    The user can choose to direct each of these two types of output to either console or file.
</div>

<div class="content">
SQL query output is only displayed when a "Show SQL" checkbox is selected for a database record conversion task.
</div>

<div class="content">
To redirect output to a file:

<ul>
    <li>Go to the Output tab</li>
    <li>Select the To File option from the Task Output and/or SQL Output select lists</li>
    <li>Choose or enter the output file location</li>
    <li>Press the Save Settings button to save the output selections</li>
</ul>
</div>

<div class="content-section">XML validation output</div>

<div class="content">
see Tasks Interface -> Tasks Pages -> Validate XML
</div>

<div class="content-section">Conversion output to and from a MusicXML file or a database record</div>

<div class="content-subsection">From MusicXML</div>

<div class="content">
<textarea class="console" readonly>
Converting XML file to Score...
</textarea>
</div>

<div class="content">
The XML file is first validated against the MusicXML 3.1 schema before the actual data conversion takes place.
If schema validation fails, the task exits with exception, and the validation errors are displayed.
See XML validation output for validation error output examples.
</div>

<div class="content-subsection">From a database record</div>

<div class="content">
<textarea class="console" readonly>
Converting database record to Score...
Converting Score to XML...
</textarea>
</div>

<div class="content">
If a database connection hasn't been established, a database connection attempt is made.
The connection attempt will cause a delay in the loading of the Database Record from-conversion pane.
Connection attempt output is sent to the output console or file.
</div>

<div class="content-subsection">To MusicXML</div>

<div class="content">
<textarea class="console" readonly>
Validating results...
Formatting results...
Inserting comments...
Creating Output File...
</textarea>
</div>

<div class="content-subsection">To a database record</div>

<div class="content">
<textarea class="console" readonly>
Creating database record...
</textarea>
</div>

<div class="content">
If a database connection hasn't been established, a database connection attempt will be made, and output from the connection attempt will be sent to the output console or file.
</div>

<div class="content-section">Output for conversion to a LilyPond file</div>

<div class="content">
<textarea class="console" readonly>
Creating Output File...
</textarea>
</div>

<div class="content">
    Any problems that the application's LilyPond conversion code encounters during conversion is output within the measure-by-measure progress output
    so that the user can isolate any corrections that they might need to make.
    Most commonly, these involve a measure's total duration amount, or problems handling slurs, ties, or wedges.
</div>

<div class="content-section">Output for conversion to PDF</div>

<div class="content">
    Conversion to PDF uses LilyPond ly to PDF conversion functionality, and output sent to console or fle is LilyPond's own output.
</div>

<div class="content">
    Example output:
</div>

<div class="content">
<textarea class="console" readonly>
Converting Lilypond notation to PDF File...
Changing working directory to: `/tmp'
Processing `-'
Parsing...
Interpreting music...[8]
Preprocessing graphical objects...
Finding the ideal number of pages...
Fitting music on 1 page...
Drawing systems...
Layout output to `output.ps'...
Converting to `./output.pdf'...
Success: compilation successfully completed
</textarea>
</div>

<div class="content-section">Progress output</div>

<div class="content">
Conversion progress output occurs when converting to or from a MusicXML file, or to a LilyPond file.
</div>

<div class="content">
Display is by part and measure, with any errors, exceptions, or processing anomalies displayed within the measure they occur so that the user can isolate any changes they want to make.
</div>

<div class="content">
<textarea class="console" readonly>
Converting database record to Score...
Part P1
Part P1 Measure 11: Open wedge with another wedge already open
Part P1 Measure 11: Stop wedge without open wedge
Part P1 Measure 11: Stop wedge without open wedge
Part P1 Measure 13: Open wedge with another wedge already open
Part P1 Measure 13: Stop wedge without open wedge
Part P1 Measure 13: Stop wedge without open wedge
Part P1 Measure 28: Open wedge with another wedge already open
Part P1 Measure 28: Stop wedge without open wedge
Part P1 Measure 28: Stop wedge without open wedge
Part P1 Measure 43: Open wedge with another wedge already open
Part P1 Measure 43: Stop wedge without open wedge
Part P1 Measure 43: Stop wedge without open wedge
Part P1 Measure 45: Open wedge with another wedge already open
Part P1 Measure 45: Stop wedge without open wedge
Part P1 Measure 45: Stop wedge without open wedge
Part P1 Measure 56: Open wedge with another wedge already open
Part P1 Measure 56: Stop wedge without open wedge
Part P1 Measure 56: Stop wedge without open wedge
Measure 1
Measure 2
Measure 3
Measure 4
Measure 5
Measure 6
Measure 7
Measure 8
Measure 9
Measure 10
Measure 11
Wedge not handled
Wedge not handled
Wedge not handled
Measure 12
Measure 13
Wedge not handled
Wedge not handled
Wedge not handled
Measure 14
Measure 15
Measure 16
Measure 17
Measure 18
Measure 19
Measure 20
Measure 21
Measure 22
Measure 23
Measure 24
Measure 25
Measure 26
Measure 27
Measure 28
Wedge not handled
Wedge not handled
Wedge not handled
Measure 29
Measure 30
Measure 31
Measure 32
Measure 33
Measure 34
Measure 35
Measure 36
Measure 37
Measure 38
Measure 39
Measure 40
Measure 41
Measure 42
Measure 43
Wedge not handled
Wedge not handled
Wedge not handled
Measure 44
Measure 45
Wedge not handled
Wedge not handled
Wedge not handled
Measure 46
Measure 47
Measure 48
Measure 49
Measure 50
Measure 51
Measure 52
Measure 53
Measure 54
Measure 55
Measure 56
Wedge not handled
Wedge not handled
Wedge not handled
Measure 57
Measure 58
Measure 59
Measure 60
Measure 61
Measure 62
Measure 63
Measure 64
Measure 65
Measure 66
Measure 67
Measure 68
Part P2
Measure 1
Measure 2
Measure 3
Measure 4
Measure 5
Measure 6
Measure 7
Measure 8
Measure 9
Measure 10
Measure 11
Measure 12
Measure 13
Measure 14
Measure 15
Measure 16
Measure 17
Measure 18
Measure 19
Measure 20
Measure 21
Measure 22
Measure 23
Measure 24
Measure 25
Measure 26
Measure 27
Measure 28
Measure 29
Measure 30
Measure 31
Measure 32
Measure 33
Measure 34
Measure 35
Measure 36
Measure 37
Measure 38
Measure 39
Measure 40
Measure 41
Measure 42
Measure 43
Measure 44
Measure 45
Measure 46
Measure 47
Measure 48
Measure 49
Measure 50
Measure 51
Measure 52
Measure 53
Measure 54
Measure 55
Measure 56
Measure 57
Measure 58
Measure 59
Measure 60
Measure 61
Measure 62
Measure 63
Measure 64
Measure 65
Measure 66
Measure 67
Measure 68
</textarea>
</div>

<div class="content-section">Database connection output</div>

<div class="content">
An example of successful connection output:
</div>

<div class="content">
<textarea class="console" readonly>
Testing database connection ...
Initializing database connection...
Oct 14, 2020 3:50:43 PM org.hibernate.jpa.internal.util.LogHelper logPersistenceUnitInformation
INFO: HHH000204: Processing PersistenceUnitInfo [name: musicxml]
Oct 14, 2020 3:50:47 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl configure
WARN: HHH10001002: Using Hibernate built-in connection pool (not for production use!)
Oct 14, 2020 3:50:47 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl buildCreator
INFO: HHH10001005: using driver [com.mysql.jdbc.Driver] at URL [jdbc:mysql://localhost/mymusicxmldb?serverTimezone=UTC]
Oct 14, 2020 3:50:47 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl buildCreator
INFO: HHH10001001: Connection properties: {password=****, user=mymusicxmluser}
Oct 14, 2020 3:50:47 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl buildCreator
INFO: HHH10001003: Autocommit mode: false
Oct 14, 2020 3:50:47 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl$PooledConnections &lt;init>
INFO: HHH000115: Hibernate connection pool size: 20 (min=1)
Oct 14, 2020 3:50:51 PM org.hibernate.dialect.Dialect &lt;init>
INFO: HHH000400: Using dialect: org.hibernate.dialect.MySQL5Dialect
Oct 14, 2020 3:50:51 PM org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator initiateService
INFO: HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
Database initialized.
</textarea>
</div>

<div class="content">
An unsuccessful connection attempt (incorrect login info):
</div>

<div class="content">
<textarea class="console" readonly>
Testing database connection ...
Initializing database connection...
Oct 14, 2020 4:02:38 PM org.hibernate.jpa.internal.util.LogHelper logPersistenceUnitInformation
INFO: HHH000204: Processing PersistenceUnitInfo [name: musicxml]
Oct 14, 2020 4:02:39 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl configure
WARN: HHH10001002: Using Hibernate built-in connection pool (not for production use!)
Oct 14, 2020 4:02:39 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl buildCreator
INFO: HHH10001005: using driver [com.mysql.jdbc.Driver] at URL [jdbc:mysql://localhost/mymusicxmldb?serverTimezone=UTC]
Oct 14, 2020 4:02:39 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl buildCreator
INFO: HHH10001001: Connection properties: {password=****, user=mymusicxmluse}
Oct 14, 2020 4:02:39 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl buildCreator
INFO: HHH10001003: Autocommit mode: false
Oct 14, 2020 4:02:39 PM org.hibernate.engine.jdbc.connections.internal.DriverManagerConnectionProviderImpl$PooledConnections &lt;init>
INFO: HHH000115: Hibernate connection pool size: 20 (min=1)
Oct 14, 2020 4:02:39 PM org.hibernate.engine.jdbc.env.internal.JdbcEnvironmentInitiator initiateService
WARN: HHH000342: Could not obtain connection to query metadata : null
Oct 14, 2020 4:02:39 PM org.hibernate.dialect.Dialect &lt;init>
INFO: HHH000400: Using dialect: org.hibernate.dialect.MySQL5Dialect
Oct 14, 2020 4:02:39 PM org.hibernate.engine.jdbc.spi.SqlExceptionHelper logExceptions
WARN: SQL Error: 1045, SQLState: 28000
Oct 14, 2020 4:02:39 PM org.hibernate.engine.jdbc.spi.SqlExceptionHelper logExceptions
ERROR: Access denied for user 'mymusicxmluse'@'localhost' (using password: YES)
Task exited with exception
</textarea>
</div>

<div class="content-section">Task output on completion</div>

<div class="content">
Successful completion:
</div>

<div class="content">
<textarea class="console" readonly>
Task finished successfully
</textarea>
</div>

<div class="content">
Completion with errors:
</div>

<div class="content">
<textarea class="console" readonly>
Task exited with exception
</textarea>
</div>

<div class="content">
followed by the exception message.
</div>

<div class="content-section">SQL output</div>

<div class="content">
    SQL query output is generated by Hibernate.
    For example:
</div>

<div class="content">
<textarea class="console" readonly>
Hibernate:
select
score0_.id as id1_100_,
score0_.score_header_id as score_he4_100_,
score0_.score_name as score_na2_100_,
score0_.version as version3_100_
from
score score0_
where
score0_.score_name=?
</textarea>
</div>

<div class="content">
    Because of the volume of query output for many scores, it's recommended that SQL output be redirected to file (see above).
</div>
