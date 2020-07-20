<div class="content-header">Music Data</div>

<div class="content">
The music_data table stores records that are central to a score's structure.
</div>

<div class="content">
Every measure (whose record is in the measure table) contains a list of music data records.
Music data records collectively define a measure's contents.
</div>

<div class="content-section">Discriminator values</div>

<div class="content">
All music data records, of whatever type, are stored in the music_data table, and the music data types are distinguished by the value in the discriminator value field music_data_type.
</div>

<div class="content">
The music_data_type values are:
</div>

<ul class="arrowed-list">
    <li class="padded-li"><span>note</span></li>
    <li class="padded-li"><span>backup</span></li>
    <li class="padded-li"><span>forward</span></li>
    <li class="padded-li"><span>direction</span></li>
    <li class="padded-li"><span>attributes</span></li>
    <li class="padded-li"><span>harmony</span></li>
    <li class="padded-li"><span>figured-bass</span></li>
    <li class="padded-li"><span>print</span></li>
    <li class="padded-li"><span>sound</span></li>
    <li class="padded-li"><span>barline</span></li>
    <li class="padded-li"><span>grouping</span></li>
    <li class="padded-li"><span>link</span></li>
    <li class="padded-li"><span>bookmark</span></li>
</ul>

<div class="content-section">A table with many fields</div>

<div class="content">
Since all music data type definitions are combined into a single table using Hibernate single-table inheritance annotations,
all of the music_data fields are in a single table.
Thus, the music_data table itself has a long table description,
but each music data record individually only uses a subset of the music_data fields to store its data, depending on the music data type.
</div>

<div class="content">
The diagram below shows the music_data table fields, with its foreign keys shown in the second column.
</div>

<img class="table-layout-image" src="images/table_layout/music_data.png" alt="music data"/>
