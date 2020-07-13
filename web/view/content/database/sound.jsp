<div class="content-header">Sound</div>

<div class="content">
Discriminator value "sound" in the music_data table.
Has a list of sound_midi records with foreign key sound_id to the music_data table.
</div>

<div class="content">
Column play.play_id contains the id attribute of the play element.
</div>

<div class="content">
The subelements of the play element are stored in the single-inheritance table play_type whose discriminator values are "ipa", "mute", "other play", and "semi pitched".
</div>

<div class="image">
[sound image]
</div>
