<div class="content-header">Notation</div>

<div class="content">
Notations are stored in the notation table with a notation_type discriminator value of the lower case element name, with dashes replaced by spaces.
Examples: "tied", "accidental mark".
</div>

<div class="content">
Notation records each belong to a notations list that is referenced in the notations table (notations list records then join to a note record in the music_data table).
</div>

<div class="content-section">Tuplet</div>

<div class="content">
A tuplet's tuplet-actual and tuplet-normal values are each separate records in the tuplet_portion table, joined on foreign keys tuplet_actual_id and tuplet_normal_id in the notations record.
</div>

<div class="content-section">Dynamics</div>

<div class="content">
The MusicXML schema defines a dynamics object as both a notation and a direction type.
    In the database schema, dynamics are stored as direction_type records.
</div>

<div class="content">
A dynamics defined as a notation is stored as a notation record with discriminator value "dynamics",
and a joined record in the direction_type table (discriminator value "dynamics") containing the dynamics information.
</div>

<div class="image">
[notation image]
</div>
