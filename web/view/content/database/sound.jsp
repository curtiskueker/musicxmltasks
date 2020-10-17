<div class="content-header">Sound</div>

<div class="content">
Discriminator value <code>sound</code> in the <code>music_data</code> table.
Has a list of <code>sound_midi</code> records with foreign key <code>sound_id</code> to the <code>music_data</code> table.
</div>

<div class="content">
Column <code>play.play_id</code> contains the <code>id</code> attribute of the <code>play</code> element.
</div>

<div class="content">
The subelements of the <code>play</code> element are stored in the single-inheritance table <code>play_type</code> whose discriminator values are
    <code>ipa</code>, <code>mute</code>, <code>other play</code>, and <code>semi pitched</code>.
</div>

<img class="table-layout-image" src="images/table_layout/sound.png" alt="sound"/>
