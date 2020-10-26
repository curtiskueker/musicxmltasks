<div class="content-header">Formatted Display</div>

<div class="content">
Many MusicXML elements have sets of attributes or element values referring to display and/or text formatting.
</div>

<div class="content-section">Display</div>

<div class="content">
Any element that has any of the following defined has its database record joined to a <code>display</code> table record using foreign key
    <code>display_id</code>.
The <code>display</code> record is created if any of these values are present.
</div>

<ul class="arrowed-list">
    <li class="padded-li"><span>position attributes: <code>default-x</code>, <code>default-y</code>, <code>relative-x</code>, <code>relative-y</code></span></li>
    <li class="padded-li"><span><code>placement</code></span></li>
    <li class="padded-li"><span><code>font</code></span></li>
    <li class="padded-li"><span><code>color</code></span></li>
    <li class="padded-li"><span><code>halign</code></span></li>
    <li class="padded-li"><span><code>valign</code></span></li>
</ul>

<div class="content">
    If any font attributes are present, a <code>font</code> table record is created, and joined from foreign key <code>font_id</code> in the
    <code>display</code> table.
</div>

<img class="table-layout-image" src="images/table_layout/display.png" alt="display"/>

<div class="content-section">Text formatting</div>

<div class="content">
Many elements are defined as having a text value and associated formatting information (for example, dynamics, rehearsal, words).
In these cases, the text value is stored in the <code>text_format</code> table's <code>value</code> field, joined by the foreign key
    <code>text_format_id</code>.
The other fields in the formatting record are shown in the diagram below.
</div>

<div class="content">
The <code>text_format</code> record is created if a text value or any other formatting value is present.
</div>

<img class="table-layout-image" src="images/table_layout/text_format.png" alt="text format"/>

<div class="content-section">Formatted Display</div>

<div class="content">
    Some elements have both display and text formatting.  These elements are implemented as a FormattedDisplay class in the Java code.
    FormattedDisplay classes are also implemented as an ordered item, so any mapped database table for a FormattedDisplay class will have an
    <code>ordering</code> column, whether or not it is used.
</div>

<div class="content">
    The FormattedDisplay tables are:
</div>

<ul class="arrowed-list">
    <li class="padded-li"><code>footnote</code></li>
    <li class="padded-li"><code>text_display</code></li>
    <li class="padded-li"><code>lyric_text_data</code></li>
    <li class="padded-li"><code>credit_display</code></li>
</ul>
