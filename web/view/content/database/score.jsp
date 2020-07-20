<div class="content-header">Score</div>

<div class="content">
    The basic structure of a score in the database is:
</div>

<ul class="arrowed-list">
    <li class="padded-li"><span>A record in the score table</span></li>
    <li class="padded-li"><span>A record in the score_header table joined to the score record</span></li>
    <li class="padded-li"><span>A list of records in the part table joined to the score record</span></li>
    <li class="padded-li"><span>A list of records in the measure table, each joined to a part record</span></li>
    <li class="padded-li"><span>A list of records in the music_data table, each joined to a measure record</span></li>
</ul>

<img class="table-layout-image" src="images/table_layout/score.png" alt="score"/>
