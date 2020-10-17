<div class="content-header">Attributes</div>

<div class="content">
An Attributes music data type record is stored in the <code>music_data</code> table with a discriminator value of <code>attributes</code>.
</div>

<div class="content">
The one-to-one part symbol association is stored in the <code>part_symbol</code> with the foreign key
    <code>part_symbol_id</code> in the <code>music_data</code> table.
</div>

<div class="content">
One-to-many associations store lists of attributes subelements of the same type, each in their own table having the foreign key
    <code>attributes_id</code> that joins to the primary key column <code>music_data.id</code>.
</div>

<div class="content">
The one-to-many tables are:
</div>

<ul class="discriminator-values">
    <li class="discriminator-value">key_signature</li>
    <li class="discriminator-value">time</li>
    <li class="discriminator-value">clef</li>
    <li class="discriminator-value">staff_details</li>
    <li class="discriminator-value">measure_style</li>
    <li class="discriminator-value">directive</li>
    <li class="discriminator-value">transpose</li>
</ul>

<div class="content-section">Time</div>

<div class="content">
The time table has a discriminator value of <code>time signature</code> or <code>senza misura</code>.
</div>

<div class="content">
The <code>time signature</code> record joins to a list of <code>time_signature_type</code> records and an <code>interchangeable</code> record.  The
    <code>interchangeable</code> record has its own list of <code>time_signature_type</code> records.
</div>

<img class="table-layout-image" src="images/table_layout/attributes.png" alt="attributes"/>
