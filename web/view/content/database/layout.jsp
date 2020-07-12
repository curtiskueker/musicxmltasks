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
A prominent discriminator value example is the music_data table whose music_data_type field has values such as "note", "direction", "barline" indicating that bean subclass for that record is Note, Direction, or Barline, respectively.
Tables with a discriminator value have fields that only one or some of the subclasses use, since all of the subclass definitions are combined into a single table.
For example, the duration field in the music_data table is used by the note, backup, forward, and figured bass records stored in the table, but not by direction and attribute records.
</div>
