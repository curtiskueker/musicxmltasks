<div class="content-header">Score Header</div>

<div class="content">
The score header contains metadata that is used by the score as a whole.
</div>

<div class="content-section">Part list</div>

<div class="content">
    The score's part list subelement data that define the score's parts and part groups are in table <code>part_list_item</code>,
    a single-inheritance table whose discriminator column is <code>part_list_item_type</code>,
    having discriminator values of <code>score part</code> or <code>part group</code>.
</div>

<img class="table-layout-image" src="images/table_layout/part_list_item.png" alt="part list item"/>

<div class="content-section">Defaults</div>

<div class="content">
The <code>defaults</code> element layout is shown in more detail below.
</div>

<img class="table-layout-image" src="images/table_layout/defaults.png" alt="defaults"/>

<div class="content-section">Other score header tables</div>

<div class="content">
    Other tables used by the score header are shown in the diagram below.
</div>

<img class="table-layout-image" src="images/table_layout/score_header.png" alt="score header"/>
