<div class="content-header">Music Data</div>

<div class="content">
The <code>music_data</code> table stores records that define a measure's contents.
</div>

<div class="content">
Every measure (whose record is in the <code></code>measure table) contains a list of music data records.
</div>

<div class="content-section">Discriminator values</div>

<div class="content">
All music data records, of whatever type, are stored in the <code>music_data</code> table, and the music data types are distinguished by the value in the discriminator column <code>music_data_type</code>.
</div>

<div class="content">
    The <code>music_data_type</code> discriminator values are:
</div>

<ul class="discriminator-values">
    <li class="discriminator-value">note</li>
    <li class="discriminator-value">backup</li>
    <li class="discriminator-value">forward</li>
    <li class="discriminator-value">direction</li>
    <li class="discriminator-value">attributes</li>
    <li class="discriminator-value">harmony</li>
    <li class="discriminator-value">figured bass</li>
    <li class="discriminator-value">print</li>
    <li class="discriminator-value">sound</li>
    <li class="discriminator-value">barline</li>
    <li class="discriminator-value">grouping</li>
    <li class="discriminator-value">link</li>
    <li class="discriminator-value">bookmark</li>
</ul>

<div class="content-section">A table with many fields</div>

<div class="content">
Since all music data type definitions are combined into a single table using Hibernate single-table inheritance annotations,
all of the <code>music_data</code> fields are in a single table.
Thus, the <code>music_data</code> table itself has a long table description,
but each music data record individually only uses a subset of the <code>music_data</code> fields to store its data, depending on the music data type.
</div>

<div class="content">
    Individual music data types are shown in the subpages of this page.
</div>

<div class="content">
The diagram below shows the <code>music_data</code> table fields, with its foreign keys shown in the second column.
</div>

<img class="table-layout-image" src="images/table_layout/music_data.png" alt="music data"/>
