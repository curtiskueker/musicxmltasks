<div class="content-header">Direction</div>

<div class="content">
A direction is a music_data record with a discrminator value of "direction".
</div>

<div class="content">
A direction consists of one or more direction type lists, each having its own direction_type_list record joined to the music_data table.
</div>

<img class="table-layout-image" src="images/table_layout/direction.png" alt="direction"/>

<div class="content-section">Direction Type</div>

<div class="content">
    The direction types themselves are in table direction_type with each record joined to its list in the direction_type_list table.
Table direction_type is a single-inheritance table with discriminator column direction_type_type.
</div>

<div class="content-subsection">Direction type discriminator values</div>

<div class="content">
Discriminator values are in most cases the lower-case name of the subelement of the direction-type element with spaces in the place of dashes.
    Examples: "segno" and "octave shift".

    <ul class="arrowed-list">
        <div class="content">
Exceptions are:
        </div>
        <li class="padded-li"><span>Metronome discriminator values are "note metronome" and "beat metronome"</span></li>
        <li class="padded-li"><span>Percussion discriminator values are
            the lower-case name of the subelement of the percussion element with spaces in the place of dashes.  Examples: "timpani" and "stick location".</span></li>
        <div class="content">
        </div>
    </ul>
</div>

<div class="content-section">Metronome markings</div>

<div class="content">
Beat metronomes consist of a music_data record with discriminator value "beat metronome" joined to two metronome_mark records joined on columns metronome_mark_1_id and metronome_mark_2_id.
</div>

<div class="content">
Note metronomes consist of a music_data record with discrminator value "note metronome" joined to two lists of metronome_note records,
    the first list joined on metronome_note.note_metronome_1_id,
    and the second list joined on metronome_note.note_metronome_2_id.
    Beams, tuplet, and time modification relations are shown in the diagram below.
</div>

<img class="table-layout-image" src="images/table_layout/direction_type.png" alt="direction type"/>