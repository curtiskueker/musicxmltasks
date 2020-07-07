<div class="content-header">MusicXML Tasks</div>

<div class="content">
MusicXML Tasks is a tool for validating MusicXML files, and for converting MusicXML files to and from a relational database.  It also converts to LilyPond and PDF.
</div>

<div class="content">
The tool has a JavaFX interface, and on Windows is bundled with is own Java JRE, allowing it to act as a standalone application.  Users can configure the tool to connect to a database which is set up and configured separately.
</div>

<div class="content">
The application is available for use on Windows or Linux.
</div>

<div class="content-section">Tasks</div>

<div class="content">
MusicXML Tasks can:
</div>

<div class="content">
    <table>
        <tr>
            <td colspan="4">* Validate a MusicXML file against the MusicXML 3.1 schema</td>
        </tr>
        <tr>
            <td colspan="4">* Perform conversions:</td>
        </tr>
        <tr>
            <td class="task-outline-1">&nbsp;</td>
            <td class="task-outline-2">MusicXML</td>
            <td class="task-outline-3">-></td>
            <td>Database</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>MusicXML</td>
            <td>-></td>
            <td>LilyPond</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>MusicXML</td>
            <td>-></td>
            <td>PDF</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Database</td>
            <td>-></td>
            <td>MusicXML</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Database</td>
            <td>-></td>
            <td>LilyPond</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>Database</td>
            <td>-></td>
            <td>PDF</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>LilyPond</td>
            <td>-></td>
            <td>PDF</td>
        </tr>
    </table>
</div>

<div class="content-section">Relational Database</div>

<div class="content">
    The relational database takes its definition from the MusicXML 3.1 schema.
</div>

<div class="content">
A database setup is required for any conversion to or from a database which users setup separately.  The tool is configured to use MySQL, PostgreSQL, and Oracle XE (Express Edition).
</div>

<div class="content">
On the first successful database connection test or successful database conversion attempt, all of the MusicXML database tables are created in the schema as set in the tool's DB Settings tab.  Connection properties are saved in a local Java properties file.
</div>

<div class="content">
A local LilyPond installation is required to convert to PDF, and a PDF reader installation is required if the user wants to open the PDF file when a conversion to PDF is completed.
</div>

<div class="content-section">Task Output</div>

<div class="content">
Task output is displayed in the console area at the bottom of the tool.  Users can optionally redirect console output to a file for separate viewing.  Users can also output all of the SQL queries used in a database conversion for reference.
</div>

<div class="content-section">LilyPond File Output</div>

<div class="content">
LilyPond is a computer program for creating engraved-quality music scores.  LilyPond files are stored in their own file format.
</div>

<div class="content">
The LilyPond conversion code is my own.
</div>

<div class="content">
The code is written to fail gracefully at the measure level, so that whenever a measure calculation fails, rather than having the entire script fail, a placeholder measure-length spacer is put in that measure instead, which the user can then change manually.
</div>

<div class="content">
Most major LilyPond features are implemented, but for those not implemented, the user will need to edit the file later.  Some unimplemented features are noted in the task output.
</div>

<div class="content-section">Format Conversions</div>

<div class="content">
The application uses Java beans based on the MusicXML schema as the common data structure.  Each bean maps to the relational database using the Hibernate framework for object-relational mapping.  All conversions at some point (other than LilyPond to PDF) load or create the Java objects which are then operated on by series of handlers, factories, and builders to perform each type of conversion.
</div>
