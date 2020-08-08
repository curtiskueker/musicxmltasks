<div class="content-header">Display and Formatting</div>

<div class="content">
Many MusicXML elements have sets of attributes or element values referring to display and/or text formatting.
</div>

<div class="content-section">Display</div>

<div class="content">
Any element that has any of the following defined has its database record joined to a display table record using foreign key display_id.
The display record is created if any of these values are present.
</div>

<ul class="arrowed-list">
    <li class="padded-li"><span>position attributes: default-x, default-y, relative-x, relative-y</span></li>
    <li class="padded-li"><span>placement</span></li>
    <li class="padded-li"><span>font</span></li>
    <li class="padded-li"><span>color</span></li>
    <li class="padded-li"><span>halign</span></li>
    <li class="padded-li"><span>valign</span></li>
</ul>

<img class="table-layout-image" src="images/table_layout/display.png" alt="display"/>

<div class="content-section">Text formatting</div>

<div class="content">
Many elements are defined as having a text value and associated formatting information (e.g., dynamics, rehearsal, words).
In these cases, the text value is stored in the text_format table's value field, joined by the foreign key text_format_id.
The other fields in the formatting record are shown in the diagram below.
</div>

<div class="content">
The text_format record is created if a text value or any other formatting value is present.
</div>

<div class="content-section">Formatted Display</div>

<div class="content">
    Some elements have both display and text formatting.  These elements are implemented as a FormattedDisplay class in the Java code.
    A FormattedDisplay is also implemented as an ordered element, so a mapped database table for a FormattedDisplay class will have an ordering column, whether or not it is used.
</div>

<img class="table-layout-image" src="images/table_layout/text_format.png" alt="text format"/>
