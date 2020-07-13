<div class="content-header">Attributes</div>

<div class="content">
An Attributes music data type record is stored in the music_data table with a discriminator value of "attributes".
</div>

<div class="content">
The one-to-one part symbol association is stored in the part_symbol with the foreign key part_symbol_id in the music_data table.
</div>

<div class="content">
One-to-many associations store lists of attributes subelements of the same type, each in their own table having the foreign key attributes_id that joins to the primary key column music_data.id.
</div>

<div class="content">
The one-to-many tables are:
</div>

<ul class="arrowed-list">
    <li class="padded-li"><span>key_signature</span></li>
    <li class="padded-li"><span>time</span></li>
    <li class="padded-li"><span>clef</span></li>
    <li class="padded-li"><span>staff_details</span></li>
    <li class="padded-li"><span>measure_style</span></li>
    <li class="padded-li"><span>directive</span></li>
    <li class="padded-li"><span>transpose</span></li>
</ul>

<div class="content-section">Time</div>

<div class="content">
The time table has a discriminator value of "time signature" or "senza misura".
</div>

<div class="content">
The "time signature" record joins to a list of time_signature_type records and an interchangeable record.  The interchangeable record has its own list of time_signature_type records.
</div>

<div class="image">
[attributes image]
</div>
