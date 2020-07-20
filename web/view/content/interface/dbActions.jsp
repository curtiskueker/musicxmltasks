<div class="content-header">DB Actions</div>

<div class="content">
There are two optional miscellaneous selections under the DB Actions tab, one for creating the MusicXML database tables, and one for generating the MusicXML schema file.
</div>

<div class="content">
These actions aren't required for tool operation, and are included for convenience.
</div>

<img class="interface-box-image" src="images/interface/tables_box.png" alt="tables box"/>

<div class="content-section">Create Database Tables</div>

<div class="content">
This option creates the MusicXML database tables.
</div>

<div class="content">
Normally, the MusicXML tables are created transparently when the first successful connection is made to the database using the connection information as set under the DB Settings tab.  However, if the user drops and then recreates the MusicXML database while the tool remains open and the database connection established, the user can manually recreate the tables using this selection.
</div>

<div class="content-section">Generate Schema File</div>

<div class="content">
The schema file contains all of the database definitions, primary and foreign key relations, and sequences according to the type of database setup by the user.
</div>

<div class="content">
The file is generated as defined by the Hibernate annotations included in the Java class files of the application.  This SQL file is also included under the Downloads section, but the user can generate their own to run at an SQL prompt, or for study purposes.
</div>

<div class="content">
When the checkbox is selected, choose the fully-specified location for the schema definition file which has an .sql file extension.
</div>

<div class="content">
The schema file doesn't include statements for creating the database.  This task is performed separately by the user.
</div>
