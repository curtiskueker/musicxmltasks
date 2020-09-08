<div class="content-header">Table Reference</div>

<div class="content">
    The table layout mirrors the MusicXML schema definition, so it's a good idea to have the schema at hand when looking at the table reference.
</div>

<div class="content">
    There are a large number of tables in the schema, so there isn't a single diagram that includes all of the tables.
    Each table in the schema has its own diagram in the subpages of this page.
    There's also a high-level layout on the subpages of "Database Layout".
</div>

<div class="content-section">Table names</div>

<div class="content">
    Table names are, generally speaking, the name of the element, group, or complex type defined in the MusicXML schema, unless a table name would be an SQL reserved word.
</div>

<div class="content">
    When a table represents something unnamed (an xs:choice block, for example), I've given the table a name of my own choice that I feel represents the structure.
</div>

<div class="content-section">Single-inheritance tables</div>

<div class="content">
    A number of tables hold data of several different types of objects, but have a common parent object type.
    These tables can be thought of as abstract tables whose common subtypes are all stored in the same table.
</div>

<div class="content">
    This relationship of an abstract parent type and concrete subtypes is implemented as a single-inheritance table,
    using a discriminator column whose value indicates the concrete subtype of that record in the table.
</div>

<div class="content-subsection">Discriminator column</div>

<div class="content">
    All discriminator columns have a column name beginning with the table name and ending in "_type".
</div>

<div class="content">
    The discriminator value stored in the column is the lower case element name with a space replacing any dash.
</div>

<div class="content-subsection">Music data</div>

<div class="content">
    A prominent discriminator column example is the music_data table whose music_data_type field has values such as "note", "direction", "barline" for elements note, direction, or barline, respectively.
    Tables with a discriminator column have fields that only one or some of the subclasses use, since all of the subclass definitions are combined into a single table.
    For example, the duration field in the music_data table is used by the note, backup, forward, and figured bass records stored in the table, but not by direction and attribute records.
</div>

<div class="content-section">Field names</div>

<div class="content">
    Field names are taken from the attribute or element name the field represents, unless a field name would be an SQL reserved word.
    Sometimes field names are renamed to avoid ambuguity.
</div>

<div class="content">
    Generally speaking, element text is stored in a field named "value".
    Often, if the element text is defined as an enumeration in the MusicXML schema, some variation of "type" is used for the field name,
    especially if the schema uses "type" as part of its defined name.
    Attribute "type" value is generally stored in field "type", unless there is a data type conflict or ambiguity.
</div>

<div class="content-subsection">Primary key</div>

<div class="content">
    All tables have a primary key column "id".
</div>

<div class="content">
    When the MusicXML schema defines an "id" attribute (other than optional-unique-id), the table field is named after the table and ends in _id.
</div>

<div class="content-subsection">Foreign keys</div>

<div class="content">
    The name of a foreign key (with the exception of a foreign key to a single-inheritance table), whether a one-to-one or one-to-many relationship,
    is the table name followed by "_id".
</div>

<div class="content">
    The name of a foreign key to a single-inheritance table uses the discriminator value of the joined record replacing spaces with underscores, followed by "_id".
    Examples:
    a foreign key to a note in the music_data table is note_id;
    a foreign key to a figured bass in the music_data table is figured_bass_id.
</div>

<div class="content-subsection">element_id field</div>

<div class="content">
    Many MusicXml elements are defined with the optional-unique-id attribute group that defines a unique "id" attribute for the element.
    These values are stored in the associated table's element_id field.
</div>

<div class="content-subsection">ordering</div>

<div class="content">
    Several tables have an "ordering" column.
</div>

<div class="content">
    XML elements that have a list of subelements of the same name rely on preserving the order of the subelements to preserve the correct data in the original MusicXML document.
    Notes in a measure, for example, have a different meaning when placed in the document in a different order.
</div>

<div class="content">
    The SQL standard does not guarantee a fetch order for a query unless one is given in an "order by" clause, hence the ordering column.
</div>

<div class="content">
    When a MusicXML file is converted to a database record in the tasks application,
    lists of same-name subelements are stored in tables that have an ordering column by incrementing a list index, and then storing the index value in the ordering column of the database record.
    When a MusicXML score is retrieved from the database, these records are retrieved ordered by the ordering column value.
</div>

<div class="content-section">Data Types</div>

<div class="content-subsection">Enumerations</div>

<div class="content">
    Enumeration values in the MusicXML schema are stored as upper-case strings with dashes and spaces replaced by underscores.  Example "double-sharp" is stored as "DOUBLE_SHARP".
</div>

<div class="content-subsection">Booleans</div>

<div class="content">
    Boolean values are stored in char(1) fields with values 'Y' or 'N'.
</div>

<div class="content">
    MusicXML schema "yes-no" type fields are stored as a boolean.
</div>

<div class="content">
    When a subelement is defined as an "empty" type, where the simple presence or absence of the element is checked, have have the presence or absence of the element stored as a boolean.
</div>
