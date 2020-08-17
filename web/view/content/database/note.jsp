<div class="content-header">Note</div>

<div class="content-section">Basic note layout</div>

<div class="content">
The basic data structure of a note is:
</div>

<ul class="arrowed-list">
    <li class="padded-li"><span>a music_data record with music_data_type value "note"</span></li>
    <li class="padded-li"><span>a list of notations lists, with the list record in the notations table and the notations themselves in the joined notation table.</span></li>
</ul>

<div class="content">
When the notation type is a list of articulations, technicals, or ornaments, the notation table notation_type values are "articulations", "technicals", and "ornaments", respectively.
These notation types are lists, with the individual articulations, technicals, and ornaments in the list stored as records in the joined articulation, technical, and ornament tables, respectively.
</div>

<img class="table-layout-image" src="images/table_layout/note_basic.png" alt="note basic"/>

<div class="content-section">Lyrics</div>

<div class="content">
Notes may have a list of lyrics in the lyric table.
</div>

<div class="content-subsection">Lyric item</div>

<div class="content">
The information specific to the type of lyric is stored in the joined lyric_item record.
</div>

<div class="content">
Table lyric_item is a single-inheritance table with discriminator column lyric_item_type whose values are "extend", "laughing", "humming", and "lyric text".
A lyric text record may have its own extend value, which is a self-join on the lyric_item table whose record is an "extend" type.
</div>

<div class="content-section">Fuller note layout</div>

<img class="table-layout-image" src="images/table_layout/note.png" alt="note"/>
