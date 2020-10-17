<div class="content-header">Notation</div>

<div class="content">
Notations are stored in the <code>notation</code> table with a <code>notation_type</code> discriminator value of the lower case element name, with dashes replaced by spaces.
Examples: <code>tied</code>, <code>accidental mark</code>.
</div>

<div class="content">
Notation records each belong to a notations list that is referenced in the <code>notations</code> table (notations list records then join to a note record in the
    <code>music_data</code> table).
</div>

<div class="content-section">Tuplet</div>

<div class="content">
A tuplet's <code>tuplet-actual</code> and <code>tuplet-normal</code> values are each separate records in the <code>tuplet_portion</code> table, joined on foreign keys
    <code>tuplet_actual_id</code> and <code>tuplet_normal_id</code> in the <code>notations</code> record.
</div>

<div class="content-section">Dynamics</div>

<div class="content">
The MusicXML schema allows a dynamics object to be used as either a notation or a direction type.
    In the database schema, dynamics data are stored as <code>direction_type</code> records.
</div>

<div class="content">
A dynamics defined as a notation in a MusicXML file is stored as a <code>notation</code> record with discriminator value
    <code>dynamics</code>,
and a joined record in the <code>direction_type</code> table (discriminator value <code>dynamics</code>) contains the dynamics data.
</div>

<img class="table-layout-image" src="images/table_layout/notation.png" alt="notation"/>
