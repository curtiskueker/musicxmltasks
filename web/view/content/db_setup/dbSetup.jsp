<div class="content-header">Database Setup</div>

<div class="content">
A database setup is required for any conversion from and to a database record.
The tasks application does not check for a valid database setup before attempting the conversion,
but will issue an exception if a database connection cannot be established.
</div>

<div class="content">
A database is not required for validating a MusicXML document, or for conversion from MusicXML to LilyPond.
These features can be used without a database setup.
</div>

<div class="content">
The MusicXML Tasks application permits interaction with the following database types:
<ul>
    <li>MySQL</li>
    <li>PostgreSQL</li>
    <li>Oracle Express Edition (Oracle XE)</li>
</ul>
</div>

<div class="content">
The application has been tested on Windows 10 and Linux.
</div>

<div class="content-section">Installation</div>

<div class="content">
The application user is expected to download and install their own database that the tasks application will use.
No database is included with the application.
</div>

<div class="content">
Information about downloading and installing each type of database are at the links below:
<ul>
    <li><a href="https://www.mysql.com/downloads/" target="_blank">MySQL</a></li>
    <li><a href="https://www.postgresql.org/download/" target="_blank">PostgreSQL</a></li>
    <li><a href="https://www.oracle.com/database/technologies/appdev/xe.html" target="_blank">Oracle XE</a></li>
</ul>
</div>

<div class="content-section">Creating a database and a database user</div>

<div class="content">
Once a database has been installed, it's required to create a database with a name, and a database user with a password.
These values are then entered in the tasks interface under the DB Settings tab.
</div>

<div class="content">
The database user must have "grant all" privileges on the database.
</div>

<div class="content">
A database installation may include a web-based admin interface for performing these tasks.
</div>

<div class="content">
It's also possible to administer the database using a command line tool provided with the database.
Statements for each database type are given below for the default connection values.
</div>

<div class="content-subsection">MySQL: <code>mysql</code></div>

<div class="content">
For the MySQL command-line tool <code>mysql</code>,
</div>

<div class="content">
Create database:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="3">
drop database if exists musicxml;
create database if not exists musicxml;
</textarea>
</div>

<div class="content">
Create database user ("identified by" clause contains the password):
</div>

<div class="content">
<textarea class="db-connection" readonly rows="3">
create user 'musicxml' identified by 'musicxml';
grant all on musicxml.* to 'musicxml';
</textarea>
</div>

<div class="content">
Switch to database at prompt:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="2">
use musicxml;
</textarea>
</div>

<div class="content-subsection">PostgreSQL: <code>psql</code></div>

<div class="content">
For the PostgreSQL command-line tool <code>psql</code>,
</div>

<div class="content">
Create database:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="3">
drop database musicxml;
create database musicxml;
</textarea>
</div>

<div class="content">
Create database user:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="3">
create role musicxml with login password 'musicxml';
grant all on database musicxml to musicxml;
</textarea>
</div>

<div class="content">
Switch to the database by logging into <code>psql</code> at the command line:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="2">
psql musicxml
</textarea>
</div>

<div class="content-subsection">Oracle XE: <code>sqlplus</code></div>

<div class="content">
For the Oracle XE command-line tool <code>sqlplus</code>,
</div>

<div class="content">
Login in as sys user:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="2">
sqlplus system
</textarea>
</div>

<div class="content">
On initial setup, use the command:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="2">
alter session set container = cdb$root;
</textarea>
</div>

<div class="content">
after the initial setup, use the command:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="2">
connect sys as sysdba
</textarea>
</div>

<div class="content">
Drop database:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="3">
alter pluggable database musicxml close;
drop pluggable database musicxml including datafiles;
</textarea>
</div>

<div class="content">
To create the database, find the directory where Oracle XE is installed, and replace <code>ORACLE_INSTALL</code> below with that directory name:
</div>

<div class="content">
<textarea class="db-connection" readonly rows="5">
create pluggable database musicxml admin user musicxml identified by musicxml FILE_NAME_CONVERT = ('ORACLE_INSTALL/oradata/XE/pdbseed', 'ORACLE_INSTALL/oradata/XE/musicxml');
alter pluggable database musicxml open;
alter session set container = musicxml;
grant all privileges to musicxml;
</textarea>
</div>

<div class="content">
Switch to the database by logging into <code>sqlplus</code> at the command line.
The connection argument to <code>sqlplus</code> has the form <code>username/password@hostname/dbname</code>
</div>

<div class="content">
<textarea class="db-connection" readonly rows="2">
sqlplus musicxml/musicxml@localhost/musicxml
</textarea>
</div>

<div class="content">
On linux, it may be necessary to include the port number in any connect string.  For example, <code>localhost:1539</code>
</div>

<div class="content-section">Setting connection info in the interface</div>

<div class="content">
Once the database has been set up, save the connection info in the tasks interface.
For instructions on how to do this, see Tasks Interface -> Tasks Tabs -> DB Settings in this guide.
</div>

<div class="content-section">Creating tables</div>

<div class="content">
The database tables will automatically be created in the schema by the tasks application on the first successful connection attempt.
</div>

<div class="content">
You can create the schema tables separately, or generate the sql file to create the database tables under the DB Actions tab in the interface.
</div>

<div class="content">
The table creation scripts for MySQL, MySQL Inno DB, PostgreSQL, and Oracle XE are also available in a zip file
<a href="/resources/scripts/schema_files.zip">here</a>.
</div>
