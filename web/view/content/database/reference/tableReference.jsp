<div class="content-header">Table Reference</div>

<div class="content">
    The table layout mirrors the MusicXML schema definition, so it's a good idea to have the schema at hand when looking at the table reference.
</div>

<div class="content">
    There are a large number of tables in the schema, so there isn't a single diagram that includes all of the tables.
    Each table in the schema has its own diagram in the subpages of this page.
    There's also a high-level layout on the subpages of "Database Layout".
</div>

<div class="content-section">Table diagrams</div>

<div class="content">
    The table diagrams were made using MySQL Workbench.
</div>

<div class="content">
    Many one-to-one foreign key relationships in the MusicXML schema are shown in the diagrams as one-to-many relationships which MySQL Workbench draws by default.
    I haven't changed any of these relationships in the diagram, and instead have left the relationships as Workbench has drawn them.
    Refer to the MusicXML schema definition for the correct relationships.
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
    All discriminator columns have a column name of the table name plus <code>_type</code>.
</div>

<div class="content">
    The discriminator value stored in the column is the lower case element name with a space replacing any dash.
</div>

<div class="content-subsection">Music data</div>

<div class="content">
    A prominent discriminator column example is the <code>music_data</code> table whose <code>music_data_type</code> field has values
    <code>note</code>, <code>direction</code>, <code>barline</code> for elements <code>note</code>, <code>direction</code>,
    <code>barline</code>, respectively.
</div>

<div class="content">
    Tables with a discriminator column have fields that only one or some of the subclasses use, since all of the subclass definitions are combined into a single table.
    For example, the <code>duration</code> field in the <code>music_data</code> table is used by note, backup, forward, and figured bass records, but not by direction and attribute records.
</div>

<div class="content-section">Field names</div>

<div class="content">
    Field names are taken from the attribute or element name the field represents, unless a field name would be an SQL reserved word.
    Some field names are renamed to avoid ambiguity.
</div>

<div class="content">
    Generally speaking, element text is stored in a field named <code>value</code>,
    and an element's <code>type</code> attribute is in field <code>type</code>, unless there is a data type conflict or ambiguity.
</div>

<div class="content-subsection">Primary key</div>

<div class="content">
    All tables have a primary key column <code>id</code>.
</div>

<div class="content">
    When the MusicXML schema defines an <code>id</code> attribute (except for the <code>optional-unique-id</code> attribute group), the field is the table name plus
    <code>_id</code>.
</div>

<div class="content-subsection">Foreign keys</div>

<div class="content">
    The name of a foreign key (with the exception of a foreign key to a single-inheritance table)
    is the table name plus <code>_id</code>.
</div>

<div class="content">
    The name of a foreign key to a single-inheritance table uses the discriminator value of the joined record, with underscores replacing spaces, plus
    <code>_id</code>.
    Examples:
    a foreign key to a note in the <code>music_data</code> table is <code>note_id</code>;
    a foreign key to a figured bass in the <code>music_data</code> table is <code>figured_bass_id</code>.
</div>

<div class="content-subsection">element_id field</div>

<div class="content">
    Many MusicXml elements include the <code>optional-unique-id</code> attribute group that defines a unique <code>id</code> attribute for the element.
    These values are stored in the table's <code>element_id</code> field.
</div>

<div class="content-subsection">ordering</div>

<div class="content">
    Several tables have an <code>ordering</code> column.
</div>

<div class="content">
    XML elements that have a list of subelements of the same name rely on preserving the order of the subelements to preserve the correct data in the original MusicXML document.
    Notes in a measure, for example, have a different meaning when placed in the document in a different order.
</div>

<div class="content">
    The SQL standard does not guarantee a fetch order for a query unless one is given in an "order by" clause, hence the
    <code>ordering</code> column.
</div>

<div class="content">
    When a MusicXML file is converted to a database record in the tasks application,
    lists of same-name subelements are stored in tables that have an <code>ordering</code> column using an incrementing index with an initial value of 1,
    and then storing the index value in the <code>ordering</code> column of the database record.
    When a MusicXML score is retrieved from the database, these records are retrieved ordered by the <code>ordering</code> column value.
</div>

<div class="content-section">Booleans</div>

<div class="content">
    Boolean values are stored in char(1) fields with values <code>Y</code> or <code>N</code>.
</div>

<div class="content">
    MusicXML schema <code>yes-no</code> attribute types are stored as a boolean: <code>Y</code> for <code>yes</code>,
    <code>N</code> for <code>no</code>, and <code>null</code> when the attribute is not present in the element.
</div>

<div class="content">
    When a subelement is defined as an <code>empty</code> type, the presence or absence of the element is stored as a boolean value
    <code>Y</code> or <code>N</code>.
</div>
