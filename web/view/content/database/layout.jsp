<div class="content-header">Database Layout</div>

<div class="content">
The database layout is defined by a Java beans architecture modelled on the MusicXML schema.
Each bean has Hibernate annotations which map the bean itself to a database table and its data members to the table's columns.
</div>

<div class="content">
These Hibernate annotations include one-to-one associations to tables that are used by more than one bean (display, for example),
and one-to-many associations for beans that contain lists of other beans (a part has a list of measures, for example) using Hibernate subselect annotations to make foreign-key associations.
</div>

<div class="content">
The application's database factory class is configured so that on the first successful connection, the Hibernate annotations are read, and from these the tables are created
in the database, as named in the connection properties that the user has set in the tool.
</div>

<div class="content-section">Discriminator Values</div>

<div class="content">
A number of mapped Java beans are abstract superclasses whose descendants all map to the same table.
These classes all use Hibernate single-table inheritance where one field in the table, called a "discriminator value" denotes the type of subclass.
All discriminator value fields have a column name beginning with the table name and ending in "_type".
</div>

<div class="content">
    The discriminator value stored in the column is the lower case element name with a space replacing any dash.
</div>

<div class="content-subsection">Music Data</div>

<div class="content">
A prominent discriminator value example is the music_data table whose music_data_type field has values such as "note", "direction", "barline" for bean subclasses Note, Direction, or Barline, respectively.
Tables with a discriminator value have fields that only one or some of the subclasses use, since all of the subclass definitions are combined into a single table.
For example, the duration field in the music_data table is used by the note, backup, forward, and figured bass records stored in the table, but not by direction and attribute records.
</div>

<div class="content-section">Ordering</div>

<div class="content">
    Several tables have an "ordering" column.  XML elements that have a list of subelements of the same name rely on preserving the order of the subelements to preserve the correct data
    in the original MusicXML document.  Notes in a measure, for example, have a different meaning when placed in the document in a different order.
</div>

<div class="content">
    When a MusicXML document is converted to database records, subelement lists are stored in table records using the ordering column by incrementing a list index, and then storing the index value
    in the database record.  When a MusicXML score is retrieved from the database, these records are retrieved ordered by the ordering column.
</div>

<div class="content-section">Datatypes</div>

<div class="content-subsection">Enumerations</div>

<div class="content">
    Enumeration values in the MusicXML schema are stored as upper-case strings with dashes and spaces replaced by undescores.  Example "double-sharp" is stored as "DOUBLE_SHARP".
</div>

<div class="content-subsection">Booleans</div>

<div class="content">
    Boolean values are stored in char(1) fields with values 'Y' or 'N'.
</div>
