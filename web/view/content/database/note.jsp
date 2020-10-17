<div class="content-header">Note</div>

<div class="content-section">Basic note layout</div>

<div class="content">
The basic data structure of a note is:
</div>

<ul class="arrowed-list">
    <li class="padded-li">&nbsp;a <code>music_data</code> record with <code>music_data_type</code> value <code>note</code></li>
    <li class="padded-li">&nbsp;a list of notations lists, with the list record in the <code>notations</code> table and the notations themselves in the joined <code>notation</code> table.</li>
</ul>

<div class="content">
When the notation type is a list of articulations, technicals, or ornaments,
    the <code>notation</code> table <code>notation_type</code> values are <code>articulations</code>, <code>technicals</code>, and <code>ornaments</code>, respectively.
These notation types are lists, with the individual articulations, technicals, and ornaments in the list stored as records in the joined <code>articulation</code>, <code>technical</code>, and <code>ornament</code> tables, respectively.
</div>

<img class="table-layout-image" src="images/table_layout/note_basic.png" alt="note basic"/>

<div class="content-section">Lyrics</div>

<div class="content">
Notes may have a list of lyrics in the <code>lyric</code> table.
</div>

<div class="content-subsection">Lyric item</div>

<div class="content">
The information specific to the type of lyric is stored in the joined <code>lyric_item</code> record.
</div>

<div class="content">
Table <code>lyric_item</code> is a single-inheritance table with discriminator column <code>lyric_item_type</code> whose values are <code>extend</code>, <code>laughing</code>, <code>humming</code>, and <code>lyric text</code>.
A lyric text record may have its own extend value, which is a self-join on the <code>lyric_item</code> table whose record is an <code>extend</code> type.
</div>

<div class="content-section">Fuller note layout</div>

<img class="table-layout-image" src="images/table_layout/note.png" alt="note"/>
