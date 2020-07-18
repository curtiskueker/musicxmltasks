<div class="content-header">Ornaments</div>

<div class="content">
Lists of ornaments are a type of notation with a discriminator value of "ornaments" in the notation table.
Individual ornament records are stored in the ornament table, and joined on its ornaments_id field.
</div>

<div class="content">
The "ornaments" record in the notation also has a one-to-many self-join on notation.ornaments_id for the list of accidental marks (which are a type of notation) belonging to the ornaments list.
</div>

<div class="image">
[ornaments image]
</div>
