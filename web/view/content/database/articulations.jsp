<div class="content-header">Articulations</div>

<div class="content">
    A list of articulations is a type of <code>notation</code> record with discriminator value <code>articulations</code>.
    Individual articulation records are in the <code>articulation</code> table, joined to the list on field <code>articulations_id</code>.
</div>

<div class="content">
Lined articulations (discriminator values <code>doit</code>, <code>falloff</code>, <code>plop</code>, <code>scoop</code> in the
    <code>articulation</code> table) have their line information in the <code>line</code> table using foreign key <code>line_id</code>.
</div>

<img class="table-layout-image" src="images/table_layout/articulation.png" alt="articulation"/>
