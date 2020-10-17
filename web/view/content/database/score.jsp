<div class="content-header">Score</div>

<div class="content">
    The basic structure of a score in the database is:
</div>

<ul class="arrowed-list">
    <li class="padded-li">&nbsp;A record in the <code>score</code> table</li>
    <li class="padded-li">&nbsp;A record in the <code>score_header</code> table joined to the <code>score</code> record</li>
    <li class="padded-li">&nbsp;A list of records in the <code>part</code> table joined to the <code>score</code> record</li>
    <li class="padded-li">&nbsp;A list of records in the <code>measure</code> table, each joined to a <code>part</code> record</li>
    <li class="padded-li">&nbsp;A list of records in the <code>music_data</code> table, each joined to a <code>measure</code> record</li>
</ul>

<img class="table-layout-image" src="images/table_layout/score.png" alt="score"/>
