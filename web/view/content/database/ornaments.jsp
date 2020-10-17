<div class="content-header">Ornaments</div>

<div class="content">
Lists of ornaments are a type of notation with a discriminator value of <code>ornaments</code> in the <code>notation</code> table.
Individual ornament records are stored in the <code>ornament</code> table, and joined on its <code>ornaments_id</code> field.
</div>

<div class="content">
The <code>ornaments</code> record in the <code>notation</code> table also has a one-to-many self-join on its <code>ornaments_id</code> field for the list of accidental marks (which are a type of notation) belonging to the ornaments list.
</div>

<img class="table-layout-image" src="images/table_layout/ornament.png" alt="ornament"/>
