<div class="content-header">Database Layout</div>

<div class="content">
The database layout is defined by a Java beans architecture modelled on the MusicXML schema.
Each bean has a Hibernate annotation which maps the bean to a database table, and annotations that map its data members to the table's columns.
</div>

<div class="content">
These Hibernate annotations include one-to-one associations to tables that are used by more than one bean (<code>display</code>, for example),
and one-to-many associations for beans that contain lists of other beans (a part has a list of measures, for example) using Hibernate subselect annotations to make foreign-key associations.
</div>

<div class="content-section">Table creation</div>

<div class="content">
The application's database factory class is configured so that on the first successful connection, the Hibernate annotations are read, and from these the tables are created
in the database, as named in the connection properties that the user has set in the tool.
</div>

<div class="content-section">Score fetch</div>

<div class="content">
    Fetching an entire score from the database in one query could result in many objects residing in memory at one time, and may violate the maximum allowable table joins for some databases.
    To take this into account, when a score is fetched, the initial query fetches up to the measure level for all of the parts,
    and the primary keys only of the music data records in the measures.
    Then the measures are iterated, and the full records of the music data records are fetched individually by their primary keys.
</div>

<div class="content-section">Single-inheritance tables</div>

<div class="content">
A number of mapped Java beans are abstract superclasses whose descendants all map to the same table.
These classes all use Hibernate single-table inheritance where one field in the table, called a "discriminator column", has a value that denotes the type of subclass.
</div>

<div class="content-section">High-level layout</div>

<div class="content">
    A high-level layout of the database schema can be found on the Score, Score Header, Music Data, Notation, and Formatted Display subpages of this page.
</div>

<div class="content-section">Table reference</div>

<div class="content">
    Additional information about the tables themselves, including table and field names, data types, and data is available on the "Table Reference" page.
</div>
