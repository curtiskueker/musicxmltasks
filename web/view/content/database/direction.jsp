<div class="content-header">Direction</div>

<div class="content">
A direction is a <code>music_data</code> record with a discrminator value of <code>direction</code>.
</div>

<div class="content">
A direction consists of one or more direction type lists, each having its own <code>direction_type_list</code> record joined to the <code>music_data</code> table.
</div>

<img class="table-layout-image" src="images/table_layout/direction.png" alt="direction"/>

<div class="content-section">Direction Type</div>

<div class="content">
    The direction types themselves are in table <code>direction_type</code> with each record joined to its list in the <code>direction_type_list</code> table.
Table <code>direction_type</code> is a single-inheritance table with discriminator column <code>direction_type_type</code>.
</div>

<div class="content-subsection">Direction type discriminator values</div>

<div class="content">
Discriminator values are in most cases the lower-case name of the subelement of the direction-type element with spaces in the place of dashes.
    Examples: <code>segno</code> and <code>octave shift</code>.

    <ul class="arrowed-list">
        <div class="content">
Exceptions are:
        </div>
        <li class="padded-li"><span>Metronome discriminator values are <code>note metronome</code> and <code>beat metronome</code></span></li>
        <li class="padded-li"><span>Percussion discriminator values are
            the lower-case name of the subelement of the percussion element with spaces in the place of dashes.  Examples: <code>timpani</code> and <code>stick location</code>.</span></li>
        <div class="content">
        </div>
    </ul>
</div>

<div class="content-section">Metronome markings</div>

<div class="content">
Beat metronomes consist of a <code>music_data</code> record with discriminator value <code>beat metronome</code> joined to two
    <code>metronome_mark</code> records joined on columns <code>metronome_mark_1_id</code> and
    <code>metronome_mark_2_id</code>.
</div>

<div class="content">
Note metronomes consist of a <code>music_data</code> record with discrminator value <code>note metronome</code> joined to two lists of
    <code>metronome_note</code> records,
    the first list joined on <code>metronome_note.note_metronome_1_id</code>,
    and the second list joined on <code>metronome_note.note_metronome_2_id</code>.
    Beams, tuplet, and time modification relations are shown in the diagram below.
</div>

<img class="table-layout-image" src="images/table_layout/direction_type.png" alt="direction type"/>