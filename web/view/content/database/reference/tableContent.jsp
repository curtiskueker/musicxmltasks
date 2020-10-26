<div class="table-name">${param.tableName}</div>

<div id="accidental" class="table-content">
    <div class="table-info">
        Encapsulates an accidental belonging to a note.
    </div>
    <div class="table-info">
    The accidental's note is in <code>music_data</code>, <code>music_data_type</code> <code>note</code>.
    </div>
</div>

<div id="accord" class="table-content">
    <div class="table-info">
    Joins to the <code>direction_type</code> table which has the accord's scordatura.
    </div>
</div>

<div id="articulation" class="table-content">
    <div class="table-info">
    An <code>articulation</code> record is one of a list of articulations.  The articulations list is in table <code>notation</code>,
        <code>notation_type</code> <code>articulations</code>, to which the <code>articulation</code> record joins.
    </div>
    <div class="table-info">
        Field <code>articulation_type</code> is the discriminator column that indicates the type of articulation.
        Values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">accent</li>
            <li class="discriminator-value">breath mark</li>
            <li class="discriminator-value">caesura</li>
            <li class="discriminator-value">detached legato</li>
            <li class="discriminator-value">other articulation</li>
            <li class="discriminator-value">soft accent</li>
            <li class="discriminator-value">spiccato</li>
            <li class="discriminator-value">staccatissimo</li>
            <li class="discriminator-value">staccato</li>
            <li class="discriminator-value">stress</li>
            <li class="discriminator-value">strong accent</li>
            <li class="discriminator-value">tenuto</li>
            <li class="discriminator-value">unstress</li>
            <li class="discriminator-value">doit</li>
            <li class="discriminator-value">falloff</li>
            <li class="discriminator-value">plop</li>
            <li class="discriminator-value">scoop</li>
        </ul>
    </div>
    <div class="table-info">
        Lined articulations doit, falloff, plop, and scoop use the <code>line</code> table.
    </div>
    <div class="table-info">
        Field <code>value</code>: breath mark, caesura, and other articulation element text.
    </div>
    </div>

<div id="barline_ending" class="table-content">
    <div class="table-info">
    Stores the MusicXML <code>ending</code> element data.
    </div>
    <div class="table-info">
        Corresponding barline record is in <code>music_data</code>, <code>music_data_type</code> value <code>barline</code>, joined on field
        <code>barline_ending_id</code>.
    </div>
</div>

<div id="barline_repeat" class="table-content">
    <div class="table-info">
        Stores the MusicXML <code>repeat</code> element data.
    </div>
    <div class="table-info">
        The barline record is in <code>music_data</code>, <code>music_data_type</code> value <code>barline</code>, joined on field
        <code>barline_repeat_id</code>.
    </div>
</div>

<div id="beam" class="table-content">
    <div class="table-info">
        The <code>beam</code> record joins to its note in <code>music_data</code>, <code>music_data_type</code>
        <code>note</code>.
    </div>
</div>

<div id="bend_sound" class="table-content">
    <div class="table-info">
        A bend sound belongs to either a slide or a bend.
    </div>
    <div class="table-info">
    When a bend sound is attached to a slide, the join is to table <code>notation</code>, since slide is a type of notation.  The
        <code>notation</code> table <code>notation_type</code> field value is <code>slide</code> in this case.
    </div>
    <div class="table-info">
        When a bend sound is attached to a bend, the join is to table <code>technical</code>, since bend is a type of technical.  The
        <code>technical</code> table <code>technical_type</code> field value is <code>bend</code> in this case.
    </div>
    <div class="table-info">
        Join field to the <code>bend_sound</code> record in each of these tables is <code>bend_sound_id</code>.
    </div>
</div>

<div id="bend_with_bar" class="table-content">
    <div class="table-info">
        Stores the <code>bend</code> element's <code>with-bar</code> subelement data.
    </div>
    <div class="table-info">
Other display attributes are stored in the joined <code>display</code> table.
    </div>
    <div class="table-info">
The bend record is in the <code>technical</code> table, <code>technical_type</code> <code>bend</code>.
    </div>
</div>

<div id="bezier" class="table-content">
    <div class="table-info">
        Attached to either a slur or a tied.
    </div>
    <div class="table-info">
        Both slur and tied are notations whose records are in table <code>notation</code>, discriminator values
        <code>slur</code> and <code>tied</code>, respectively, using foreign key <code>bezier_id</code>.
    </div>
</div>

<div id="clef" class="table-content">
    <div class="table-info">
        <code>clef</code> has a many-to-one relationship with the attributes record in table <code>music_data</code>,
        <code>music_data_type</code> value <code>attributes</code>, join column <code>attributes_id</code>.
    </div>
</div>

<div id="credit" class="table-content">
    <div class="table-info">
        The list of credits in a score header join to table <code>score_header</code> on foreign key
        <code>score_header_id</code>.
    </div>
    <div class="table-info">
        <code>credit-type</code> subelements are stored in joined table <code>credit_type</code>.
    </div>
    <div class="table-info">
        <code>link</code>, <code>bookmark</code>, <code>credit-image</code>, <code>credit-words</code>, and <code>credit-symbol</code> subelements are processed and stored as
        <code>credit_display</code> records.
        See credit_display for more details.
    </div>
</div>

<div id="credit_display" class="table-content">
    <div class="table-info">
        The <code>credit</code> element's subelements <code>link</code>, <code>bookmark</code>, <code>credit-image</code>,
        <code>credit-words</code>, and <code>credit-symbol</code> are collectively implemented as <code>credit_display</code> records.
    </div>
    <div class="table-info">
        A credit has a list of credit display items, joined on field <code>credit_id</code>.
    </div>
    <div class="table-info">
        <code>credit_display</code> is a single-inheritance table, discriminator column <code>credit_display_type</code>.
    </div>
    <div class="table-info">
        Discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">credit image</li>
            <li class="discriminator-value">credit words</li>
            <li class="discriminator-value">credit symbol</li>
            <li class="discriminator-value">link</li>
            <li class="discriminator-value">bookmark</li>
        </ul>
    </div>
    <div class="content-subsection">Links and bookmarks</div>
    <div class="table-info">
        Both link and bookmark are types of music data.  A link or bookmark record is in the <code>music_data</code> table,
        <code>music_data_type</code> <code>link</code> or <code>bookmark</code>, and joined to <code>credit_display</code> on fields
        <code>link_id</code> or <code>bookmark_id</code>
    </div>
    <div class="content-subsection">Credit image</div>
    <div class="table-info">
        Credit image is a type of image, a direction type, discriminator field <code>direction_type_type</code> value
        <code>image</code>.  Foreign key in <code>credit_display</code> is <code>image_id</code>.
    </div>
    <div class="content-subsection">Credit words and credit symbol</div>
    <div class="table-info">
        Credit words and credit symbol are formatted text types,
        so text, formatting, and display values are stored in tables <code>text_format</code> and <code>display</code>.
    </div>
</div>

<div id="credit_type" class="table-content">
    <div class="table-info">
        Stores the list of <code>credit-type</code> element values of a <code>credit</code> element.
    </div>
</div>

<div id="dashed_formatting" class="table-content">
    <div class="table-info">
        Direction types and notations that have dashed formatting attributes join to the <code>dashed_formatting</code> table using foreign key
        <code>dashed_formatting_id</code>.
    </div>
    <div class="table-info">
        Lined articulations (scoop, plop, doit, falloff) join to the <code>line</code> table, foreign key <code>line_id</code>, which in turn joins to the
        <code>dashed_formatting</code> table, foreign key <code>dashed_formatting_id</code>.
    </div>
    <div class="table-info">
        All direction types, notations, and articulations stored their display information in the <code>display</code> table, joined directly using foreign key
        <code>display_id</code>.
    </div>
</div>

<div id="defaults" class="table-content">
    <div class="table-info">
        Defaults belongs to a score header, foreign key <code>defaults_id</code>.
    </div>
    <div class="table-info">
        <code>music-font</code> and <code>word-font</code> subelements are in table <code>font</code>, foreign keys <code>music_font_id</code> and
        <code>word_font_id</code>.
    </div>
    <div class="table-info">
        One-to-many <code>lyric-font</code> and <code>lyric-language</code> subelements are in tables <code>lyric_font</code> and
        <code>lyric_language</code>, foreign key <code>defaults_id</code>.
        The lyric font's font information is in table <code>font</code>, foreign key <code>font_id</code>.
    </div>
    <div class="table-info">
        <code>scaling</code> sublement values are in fields <code>scaling_millimeters</code> and <code>scaling_tenths</code>.
    </div>
    <div class="table-info">
        Subelements of <code>appearance</code> all have a one-to-many relationship and each of its subelement values are stored in tables
        <code>line_width</code>, <code>note_size</code>, <code>distance</code>, <code>glyph</code>, and <code>other_appearance</code>.
        Each table's foreign key to the <code>defaults</code> table is <code>defaults_id</code>.
    </div>
</div>

<div id="direction_offset" class="table-content">
    <div class="table-info">
        Stores <code>offset</code> subelement data for music data types sound, direction, and harmony.  Foreign key <code>offset_id</code>.
    </div>
</div>

<div id="direction_type" class="table-content">
    <div class="table-info">
        Direction type records correspond to subelements of element <code>direction-type</code>.
    </div>
    <div class="table-info">
        A <code>direction-type</code> element may have more than one subelement, so each <code>direction_type</code> record belongs to a
        <code>direction_type_list</code> record using foreign key <code>direction_type_list_id</code>.
    </div>
    <div class="content-subsection">Discriminator values</div>
    <div class="table-info">
        <code>direction_type_type</code> is the discriminator column that distinguishes the direction type.
        Values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">rehearsal</li>
            <li class="discriminator-value">segno</li>
            <li class="discriminator-value">coda</li>
            <li class="discriminator-value">words</li>
            <li class="discriminator-value">symbol</li>
            <li class="discriminator-value">wedge</li>
            <li class="discriminator-value">dynamics</li>
            <li class="discriminator-value">dashes</li>
            <li class="discriminator-value">bracket</li>
            <li class="discriminator-value">pedal</li>
            <li class="discriminator-value">beat metronome</li>
            <li class="discriminator-value">note metronome</li>
            <li class="discriminator-value">octave shift</li>
            <li class="discriminator-value">harp pedals</li>
            <li class="discriminator-value">damp</li>
            <li class="discriminator-value">damp all</li>
            <li class="discriminator-value">eyeglasses</li>
            <li class="discriminator-value">string mute</li>
            <li class="discriminator-value">scordatura</li>
            <li class="discriminator-value">image</li>
            <li class="discriminator-value">principal voice</li>
            <li class="discriminator-value">accordion registration</li>
            <li class="discriminator-value">staff divide</li>
            <li class="discriminator-value">other direction</li>
        </ul>
    </div>
    <div class="table-info">
        Additionally, all <code>percussion</code> element subelements are direction types.
        Their discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">glass</li>
            <li class="discriminator-value">metal</li>
            <li class="discriminator-value">wood</li>
            <li class="discriminator-value">pitched</li>
            <li class="discriminator-value">membrane</li>
            <li class="discriminator-value">effect</li>
            <li class="discriminator-value">timpani</li>
            <li class="discriminator-value">beater</li>
            <li class="discriminator-value">stick</li>
            <li class="discriminator-value">stick location</li>
            <li class="discriminator-value">other percussion</li>
        </ul>
    </div>
    <div class="content-subsection">Fields</div>
    <div class="table-info">
        As with any other table that uses single inheritance and a discriminator value, any particular type of direction type will only use some of the fields in the table.
    </div>
    <div class="table-info">
        All direction types join to <code>display</code>, foreign key <code>display_id</code>.  Direction types with text values join to
        <code>text_format</code>, foreign key <code>text_format_id</code>.
    </div>
    <div class="table-info">
        The <code>number</code> attribute value is stored in field <code>direction_type_number</code>.
    </div>
    <div class="table-info">
        Dynamics markings for dynamics are in table <code>dynamics_marking</code>, one-to-many foreign key join on <code>dynamics_id</code>.
    </div>
    <div class="table-info">
        A beat metronome has two foreign keys to <code>metronome_mark</code>: <code>metronome_mark_1_id</code> and <code>metronome_mark_2_id</code>.
    </div>
    <div class="table-info">
        A note metronome has two lists of <code>metronome_note</code> records.  The foreign keys in
        <code>metronome_note</code> to distinguish these two lists are <code>note_metronome_1_id</code> and <code>note_metronome_2_id</code>.
    </div>
    <div class="table-info">
        Pedal tunings for harp pedals are in <code>pedal_tuning</code>, foreign key <code>harp_pedals_id</code>.
    </div>
    <div class="table-info">
        Accords for scordatura are in table <code>accord</code>, foreign key <code>scordatura_id</code>.
    </div>
</div>

<div id="direction_type_list" class="table-content">
    <div class="table-info">
        A <code>direction_type_list</code> record corresponds to the <code>direction-type</code> element.
        Individual <code>direction-type</code> subelements are stored in the <code>direction_type</code> table, referenced by foreign key
        <code>direction_type_list_id</code>.
    </div>
    <div class="table-info">
        Its <code>direction</code> element parent is a <code>music_data</code> record with <code>music_data_type</code> value
        <code>direction</code>.
    </div>
</div>

<div id="directive" class="table-content">
    <div class="table-info">
        The <code>directive</code> element is a list of subelenents of <code>attributes</code>.
    </div>
    <div class="table-info">
        The attributes record is stored in <code>music_data</code>, <code>music_data_type</code> value <code>attributes</code>.  Foreign key in the
        <code>directive</code> table is <code>attributes_id</code>.
    </div>
</div>

<div id="display" class="table-content">
    <div class="table-info">
        Several commonly-occurring display values are aggregated and stored in the <code>display</code> table and its companion
        <code>font</code> table.
        These display values are:
        <ul>
            <li>position, x-position, and y-position values: <code>default-x</code>, <code>default-y</code>, <code>relative-x</code>,
                <code>relative-y</code></li>
            <li><code>placement</code></li>
            <li><code>font</code></li>
            <li><code>color</code></li>
            <li><code>halign</code></li>
            <li><code>valign</code> and <code>valign-image</code></li>
        </ul>
        Exception: Defaults element fonts (<code>music-font</code>, <code>word-font</code>, <code>lyric-font</code>) are not directly displayed, so their
        <code>font</code> table records join directly to the <code>defaults</code> table.
    </div>
    <div class="table-info">
        If any of the values above are defined for a displayed element, a <code>display</code> record will be created for that displayed element.
        If none of the values above are defined, then no <code>display</code> record will be created for that displayed element.
    </div>
    <div class="table-info">
        All displayed element table definitions are identical:
        a foreign key <code>display_id</code> in the displayed element's table that joins to table <code>display</code> if any
        <code>display</code> field is defined,
        which itself joins to table <code>font</code> on foreign key <code>font_id</code> if any <code>font</code> field is defined.
    </div>
    <div class="table-info">
        The affected displayed element tables are:
        <ul class="discriminator-values">
            <li class="discriminator-value">accidental</li>
            <li class="discriminator-value">articulation</li>
            <li class="discriminator-value">barline_ending</li>
            <li class="discriminator-value">barre</li>
            <li class="discriminator-value">bass_alter</li>
            <li class="discriminator-value">bass_step</li>
            <li class="discriminator-value">beam</li>
            <li class="discriminator-value">bend_with_bar</li>
            <li class="discriminator-value">clef</li>
            <li class="discriminator-value">credit_display</li>
            <li class="discriminator-value">degree_alter</li>
            <li class="discriminator-value">degree_type</li>
            <li class="discriminator-value">degree_value</li>
            <li class="discriminator-value">direction_type</li>
            <li class="discriminator-value">directive</li>
            <li class="discriminator-value">dot</li>
            <li class="discriminator-value">elision</li>
            <li class="discriminator-value">figure_part</li>
            <li class="discriminator-value">footnote</li>
            <li class="discriminator-value">frame</li>
            <li class="discriminator-value">group_barline</li>
            <li class="discriminator-value">group_name</li>
            <li class="discriminator-value">group_symbol</li>
            <li class="discriminator-value">harmony_chord</li>
            <li class="discriminator-value">inversion</li>
            <li class="discriminator-value">key_signature</li>
            <li class="discriminator-value">kind</li>
            <li class="discriminator-value">lyric</li>
            <li class="discriminator-value">lyric_item</li>
            <li class="discriminator-value">lyric_text_data</li>
            <li class="discriminator-value">measure_style</li>
            <li class="discriminator-value">metronome_mark</li>
            <li class="discriminator-value">music_data</li>
            <li class="discriminator-value">notation</li>
            <li class="discriminator-value">notehead</li>
            <li class="discriminator-value">ornament</li>
            <li class="discriminator-value">part_name</li>
            <li class="discriminator-value">part_symbol</li>
            <li class="discriminator-value">root_alter</li>
            <li class="discriminator-value">root_step</li>
            <li class="discriminator-value">stem</li>
            <li class="discriminator-value">system_divider</li>
            <li class="discriminator-value">technical</li>
            <li class="discriminator-value">text_display</li>
            <li class="discriminator-value">time</li>
            <li class="discriminator-value">tuplet_dot</li>
            <li class="discriminator-value">tuplet_number</li>
            <li class="discriminator-value">tuplet_type</li>
        </ul>
    </div>
</div>

<div id="distance" class="table-content">
    <div class="table-info">
        The <code>distance</code> element is a subelement of the <code>appearance</code> element, and has a direct many-to-one join to the
        <code>defaults</code> table, foreign key <code>defaults_id</code>.
        There is no intermediate appearance table.
    </div>
</div>

<div id="dot" class="table-content">
    <div class="table-info">
        Dots belong to a note in the <code>music_data</code> table, and each <code>dot</code> has its own <code>display</code> data.
    </div>
</div>

<div id="dynamics_marking" class="table-content">
    <div class="table-info">
        All of the subelements of a <code>dynamics</code> element are stored in the <code>dynamics_marking</code> table, one record per subelement.
        The element name (for example, <code>p</code>, <code>ff</code>) is in the <code>dynamics_type</code> field.
    </div>
    <div class="table-info">
        The enclosing <code>dynamics</code> element data is in table <code>direction_type</code>, and its one-to-many foreign key is
        <code>dynamics_id</code>.
    </div>
</div>

<div id="editorial" class="table-content">
    <div class="table-info">
        Editorial info can be attached to a wide variety of items:
    </div>
    <div class="table-info">
        <code>music_data</code> table records, <code>music_data_type</code> values <code>attributes</code>,
        <code>barline</code>, <code>harmony</code>, <code>figured bass</code>, and <code>backup</code>
    </div>
    <div class="table-info">
        <code>part-group</code> element data is found in table <code>part_list_item</code>, <code>part_list_item_type</code> value
        <code>part group</code>.
    </div>
</div>

<div id="editorial_level" class="table-content">
    <div class="table-info">
    Table <code>editorial_level</code> corresponds to the <code>editorial</code> element's <code>level</code> subelement.
    </div>
</div>

<div id="elision" class="table-content">
    <div class="table-info">
        A lyric syllable consists of an elision/syllabic/text combination.  The <code>elision</code> table contains the
        <code>elision</code> element data.
    </div>
</div>

<div id="encoding" class="table-content">
    <div class="table-info">
        <code>encoding</code> is a single-table inheritance table with discriminator column <code>encoding_type</code>.
        Each record corresponds to an <code>encoding</code> subelement.
    </div>
    <div class="table-info">
        Depending upon the subelement name, the value in field <code>encoding_type</code> is one of the following:
        <ul class="discriminator-values">
            <li class="discriminator-value">encoding data</li>
            <li class="discriminator-value">encoder</li>
            <li class="discriminator-value">software</li>
            <li class="discriminator-value">encoding description</li>
            <li class="discriminator-value">supports</li>
        </ul>
    </div>
    <div class="table-info">
        If the <code>encoding_type</code> is <code>encoder</code>, the record has a joined <code>identification_type</code> record, foreign key
        <code>encoder_id</code>, whose <code>id_name</code> value is <code>encoder</code>, <code>id_value</code> is the element text, and
        <code>id_type</code> is the <code>type</code> attribute value.
    </div>
</div>

<div id="except_voice" class="table-content">
    <div class="table-info">
        A <code>slash_group</code> record stores the data for the MusicXML schema's <code>slash</code> group,
        which is a combination of <code>slash-type</code>, <code>slash-dot</code>, and <code>except-voice</code> elements.
        Each <code>except-voice</code> element has a separate record.
    </div>
</div>

<div id="feature" class="table-content">
    <div class="table-info">
        The <code>grouping</code> element's <code>feature</code> subelements, one record per <code>feature</code> element.
        Foreign key for the <code>grouping</code> record in <code>music_data</code> is <code>grouping_id</code>.
    </div>
</div>

<div id="figure" class="table-content">
    <div class="table-info">
        Represents the MusicXML <code>figure</code> element.
        The figured bass record that a list of figures belongs to is in the <code>music_data</code> table, <code>music_data_type</code>
        <code>figured bass</code>, foreign key <code>figured_bass_id</code>.
    </div>
    <div class="table-info">
        Subelements <code>prefix</code>, <code>figure-number</code>, and <code>suffix</code> are all <code>figure_part</code> records.
    </div>
    <div class="table-info">
        Subelement <code>extend</code> is a <code>lyric_item</code> record, <code>lyric_item_type</code> <code>extend</code>, foreign key
        <code>extend_id</code>.
    </div>
</div>

<div id="figure_part" class="table-content">
    <div class="table-info">
        Holds the data for the <code>prefix</code>, <code>figure-number</code>, and <code>suffix</code> subelements of the
        <code>figure</code> element.
    </div>
</div>

<div id="font" class="table-content">
    <div class="table-info">
        For displayed items, a <code>font</code> record is created at the same time as the <code>display</code> record it belongs to, using foreign key
        <code>font_id</code>, when the displayed item has any <code>font</code> field defined.
    </div>
    <div class="table-info">
        Fonts defined in the <code>defaults</code> element of a score header (<code>music-font</code> and
        <code>word-font</code>) join directly to the <code>font</code> table without an intermediate <code>display</code> record.
        The list of <code>lyric-font</code> subelements of <code>defaults</code> are joined separately through the <code>lyric_font</code> table.
    </div>
</div>

<div id="footnote" class="table-content">
    <div class="table-info">
        The footnote type has both display and text format attribute definitions.  Those values are stored in the corresponding joined tables.
    </div>
</div>

<div id="frame" class="table-content">
    <div class="table-info">
        A frame belongs to a harmony object in the <code>music_data</code> table, <code>music_data_type</code> value <code>harmony</code>.
    </div>
</div>

<div id="frame_note" class="table-content">
    <div class="table-info">
        Three subelements of <code>frame-note</code> are defined in the MusicXML schema as technical types.
        Data for these subelements are in the technical table as follows:
    </div>
    <div class="table-info">
        <code>string</code>: <code>technical_type</code> <code>string number</code>, value in field <code>string_number</code>.
    </div>
    <div class="table-info">
        <code>fret</code>: <code>technical_type</code> <code>fret</code>, value in field <code>value</code>.
    </div>
    <div class="table-info">
        <code>fingering</code>: <code>technical_type</code> <code>fingering</code>, data in fields <code>value</code>,
        <code>substitution</code>, and <code>alternate</code>.
    </div>
</div>

<div id="glyph" class="table-content">
    <div class="table-info">
        The <code>glyph</code> element is a subelement of the <code>appearance</code> element, and has a direct many-to-one join to the
        <code>defaults</code> table, foreign key <code>defaults_id</code>.
        There is no intermediate appearance table.
    </div>
</div>

<div id="grace" class="table-content">
    <div class="table-info">
        A grace belongs to a note in the <code>music_data</code> table.
    </div>
</div>

<div id="group_barline" class="table-content">
    <div class="table-info">
        Belongs to a part group that is in the <code>part_list_item</code> table, foreign key <code>group_barline_id</code>.
    </div>
</div>

<div id="group_name" class="table-content">
    <div class="table-info">
        Stores both the group name and group abbreviation of a part group.  The part group record is in the <code>part_list_item</code> table.
        Foreign keys in <code>part_list_item</code> are <code>group_name_id</code> and <code>group_abbreviation_id</code>.
    </div>
</div>

<div id="group_symbol" class="table-content">
    <div class="table-info">
        Stores the group symbol of a part group.  The part group record is in the <code>part_list_item</code> table.
        Foreign key in <code>part_list_item</code> is <code>group_symbol_id</code>.
    </div>
</div>

<div id="harmony_chord" class="table-content">
    <div class="table-info">
        A list of <code>harmony_chord</code> records belongs to a harmony record in the <code>music_data</code> table,
        <code>music_data_type</code> <code>harmony</code>, foreign key in <code>harmony_chord</code> is
        <code>harmony_id</code>.
    </div>
    <div class="table-info">
        The <code>harmony_chord</code> table is a single-inheritance table with discriminator field <code>harmony_chord_type</code>.
        <code>harmony_chord_type</code> values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">root</li>
            <li class="discriminator-value">function</li>
        </ul>
    </div>
    <div class="table-info">
        A <code>harmony_chord_type</code> <code>root</code> record has <code>root_step</code> and <code>root_alter</code> records, foreign keys
        <code>root_step_id</code> and <code>root_alter_id</code>.
    </div>
    <div class="table-info">
        A <code>harmony_chord_type</code> <code>function</code> record stores its display info in the <code>display</code> table.
    </div>
</div>

<div id="identification" class="table-content">
    <div class="table-info">
        An identification belongs to either a <code>score_header</code>, or a <code>score part</code> <code>part_list_item_type</code> in table
        <code>part_list_item</code>.  Foreign key <code>identification_id</code>.
    </div>
    <div class="table-info">
        Subelements <code>creator</code>, <code>rights</code>, and <code>relation</code> are stored in table <code>identification_type</code>.
        Field <code>id_name</code> is the subelement name, field <code>id_type</code> is the <code>type</code> attribute of the subelement, and field
        <code>id_value</code> is the subelement text value.
    </div>
</div>

<div id="identification_type" class="table-content">
    <div class="table-info">
        An <code>identification_type</code> record can be either:
    </div>
    <div class="table-info">
        An <code>identification</code> element's <code>creator</code>, <code>rights</code>, and <code>relation</code> subelements.
    </div>
    <div class="table-info">
        An <code>encoding</code> element's <code>encoder</code> subelement.
    </div>
    <div class="table-info">
        In either case, the <code>id_name</code> is the subelement name, <code>id_type</code> is the subelement's <code>type</code> attribute value, and
        <code>id_value</code> is the subelement's text data.
    </div>
</div>

<div id="instrument_type" class="table-content">
    <div class="table-info">
        <code>instrument_type</code> is a single-inheritance table with discriminator column <code>instrument_type</code>, and stores the
        <code>solo</code> or <code>ensemble</code> subelement data of element <code>score-instrument</code>.
    </div>
    <div class="table-info">
        Discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">solo</li>
            <li class="discriminator-value">ensemble</li>
        </ul>
    </div>
</div>

<div id="interchangeable" class="table-content">
    <div class="table-info">
        Stores the <code>interchangeable</code> element data that is a subelement of the <code>time</code> element.  Foreign key
        <code>interchangeable_id</code>.
    </div>
    <div class="table-info">
        Any iterations of an <code>interchangeable</code> element's <code>beats</code> and <code>beat-type</code> subelements (group
        <code>time-signature</code>) are stored in table <code>time_signature_type</code>, foreign key <code>interchangeable_id</code>.
    </div>
</div>

<div id="key_octave" class="table-content">
    <div class="table-info">
        Stores the data of all <code>key-octave</code> subelements of a <code>key</code> element, one record per <code>key-octave</code> element, foreign key
        <code>key_id</code>.
    </div>
</div>

<div id="key_signature" class="table-content">
    <div class="table-info">
        A <code>key_signature</code> record represents the data of a MusicXML <code>key</code> element.
        One or more <code>key</code> elements may appear within an <code>attributes</code> element.
        All of the <code>key_signature</code> records within an <code>attributes</code> element join to table <code>music_data</code>,
        <code>music_data_type</code> <code>attributes</code>, foreign key <code>attributes_id</code>.
    </div>
    <div class="table-info">
        The <code>key_signature</code> table is single-inheritance with discriminator column <code>key_signature_type</code>>.
        Possible values of <code>key_type</code> are:
        <ul class="discriminator-values">
            <li class="discriminator-value">traditional key</li>
            <li class="discriminator-value">non-traditional key</li>
        </ul>
        The <code>key_type</code> value depends on the presence of <code>traditional-key</code> or <code>non-traditional-key</code> elements.
    </div>
    <div class="table-info">
        Each <code>key-octave</code> subelement is a record in table <code>key_octave</code>, foreign key <code>key_id</code>.
    </div>
    <div class="table-info">
        A traditional key stores its element values in fields <code>cancel_fifths</code>, <code>fifths</code>, and <code>key_mode</code> for elements
        <code>cancel</code>, <code>fifths</code>, and <code>mode</code>, respectively.
    </div>
    <div class="table-info">
        Multiple non-traditional key element groups store their values in the <code>non_traditional_key_type</code> table.
        The <code>key-step</code>, <code>key-alter</code>, <code>key-accidental</code> element text values are stored in fields
        <code>key_step</code>, <code>key_alter</code>, and <code>key_accidental</code>, respectively.
        The <code>key-accidental</code> element's <code>smufl</code> attribute is stored in field <code>key_accidental_smufl</code>.
    </div>
</div>

<div id="kind" class="table-content">
    <div class="table-info">
        A kind object belongs to a harmony chord record, foreign key <code>kind_id</code>.
    </div>
</div>

<div id="layout" class="table-content">
    <div class="table-info">
        A layout consists of a <code>page_layout</code> record, a <code>system_layout</code> record, and a list of <code>staff_layout</code> records.
    </div>
    <div class="table-info">
        A layout can belong to a <code>defaults</code> record, or to a print record in the <code>music_data</code> table,
        <code>music_data_type</code> <code>print</code>.
    </div>
</div>

<div id="level_display" class="table-content">
    <div class="table-info">
        The join to the <code>notation</code> table is for an <code>accidental-mark</code> which is a <code>notation</code> record,
        <code>notation_type</code> <code>accidental mark</code>.
    </div>
</div>

<div id="line" class="table-content">
    <div class="table-info">
        The <code>line</code> table is used for lined articulations (doit, falloff, plop, scoop), MusicXML schema complexType
        <code>empty-line</code>.
    </div>
</div>

<div id="line_width" class="table-content">
    <div class="table-info">
        The <code>line-width</code> element is a subelement of the <code>appearance</code> element, and has a direct many-to-one join to the
        <code>defaults</code> table, foreign key <code>defaults_id</code>.
        There is no intermediate appearance table.
    </div>
</div>

<div id="link_attributes" class="table-content">
    A <code>link_attributes</code> record stores the data for a <code>work</code> element's <code>opus</code> subelement,
    or for a <code>link</code> element which is a <code>music_data</code> record, <code>music_data_type</code>
    <code>link</code>.
</div>

<div id="lyric" class="table-content">
    <div class="table-info">
        A list of <code>lyric</code> records belongs to a note whose record is in the <code>music_data</code> table, foreign key
        <code>note_id</code> for each lyric in the list.
    </div>
    <div class="table-info">
        The <code>lyric_item</code> record for a lyric has the data for the xs:choice section of the <code>lyric</code> complexType in the MusicXML schema.
        See <code>lyric_item</code> for details.
    </div>
</div>

<div id="lyric_font" class="table-content">
    <div class="table-info">
        One-to-many relationship to <code>defaults</code>, foreign key <code>defaults_id</code>.
    </div>
</div>

<div id="lyric_item" class="table-content">
    <div class="table-info">
        A <code>lyric_item</code> record encapsulates the data definition of the xs:choice section of the <code>lyric</code> complexType in the MusicXML schema.
    </div>
    <div class="table-info">
        The <code>lyric_item</code> table is single-inheritance, discriminator column <code>lyric_item_type</code>.
        Disciminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">lyric text</li>
            <li class="discriminator-value">extend</li>
            <li class="discriminator-value">laughing</li>
            <li class="discriminator-value">humming</li>
        </ul>
    </div>
    <div class="content-subsection">lyric text</div>
    <div class="table-info">
        A lyric text record has a list of lyric syllables stored in the <code>lyric_syllable</code> table, foreign key
        <code>lyric_text_id</code>.
    </div>
    <div class="table-info">
        When the first subelement of a <code>lyric</code> element is either <code>syllabic</code> or <code>text</code>, the
        <code>lyric</code> element's subelements are iterated,
        and when a <code>text</code> element is reached, the <code>elision</code>, <code>syllabic</code>, and
        <code>text</code> elements up to that point are aggregated into a <code>lyric_syllable</code> record.
        The iteration then continues, creating any other lyric syllable records until the <code>lyric</code> element's subelements are exhausted.
    </div>
    <div class="table-info">
        Finally, if there is a trailing <code>extend</code> element, an extend record is added to the <code>lyric_item</code> table, and self-joined to the lyric text using foreign key
        <code>extend_id</code>
        (both the extend and the lyric text are stored in the <code>lyric_item</code> table).
    </div>
    <div class="content-subsection">Display</div>
    <div class="table-info">
        Display info for an extend lyric item type is joined directly from the <code>lyric_item</code> table using foreign key
        <code>display_id</code>.
        Display info for a text is handled via the <code>lyric_syllable</code> table where the text data is stored.
    </div>
    <div class="content-subsection">figure</div>
    <div class="table-info">
        An extend record can also belong to a <code>figure</code> record.  The foreign key in the <code>figure</code> table is
        <code>extend_id</code>.
    </div>
</div>

<div id="lyric_syllable" class="table-content">
    <div class="table-info">
        A <code>lyric_syllable</code> record consists of a <code>lyric</code> element's subelement combination of <code>syllabic</code>/<code>elision</code>/<code>text</code>.
    </div>
    <div class="table-info">
        The record's encompassing structure is a lyric text record in table <code>lyric_item</code>,
        <code>lyric_item_type</code> value <code>lyric text</code>.
        Foreign key to the <code>lyric_item</code> table is <code>lyric_text_id</code>.
        A lyric may have multiple <code>syllabic</code>/<code>elision</code>/<code>text</code> combinations, so the relation to the
        <code>lyric_item</code> table is many-to-one.
        See <code>lyric_item</code> for more information on a lyric text record.
    </div>
    <div class="table-info">
        <code>elision</code> and <code>text</code> element data are in separate <code>elision</code> and <code>lyric_text_data</code> tables because the two types have separate display values.
        Foreign keys to these two tables are <code>elision_id</code> and <code>lyric_text_data_id</code>.
    </div>
</div>

<div id="lyric_text_data" class="table-content">
    <div class="table-info">
        A <code>lyric_text_data</code> record stores a <code>lyric</code> element's <code>text</code> element data.
    </div>
    <div class="table-info">
        Lyric text data is part of a lyric syllable.
        The foreign key to <code>lyric_text_data</code> in <code>lyric_syllable</code> is <code>lyric_text_data_id</code>.
    </div>
    <div class="table-info">
        Lyric text data is a Formatted Display (has both a <code>display</code> and <code>text_format</code> record),
        and so the text value is stored in the <code>text_format</code> table's <code>value</code> column,
        and has an <code>ordering</code> column, even though it is unused because the <code>lyric_text_data</code>/<code>lyric_syllable</code> relation is one-to-one.
    </div>
</div>

<div id="measure" class="table-content">
    <div class="table-info">
        A basic data relation in a score, a list of <code>measure</code> records belong to a part, foreign key <code>part_id</code>,
        and contains a list of <code>music_data</code> records, foreign key <code>measure_id</code>.
    </div>
</div>

<div id="measure_style" class="table-content">
    <div class="table-info">
        A list of <code>measure_style</code> records are part of an attributes record found in the <code>music_data</code> table,
        <code>music_data_type</code> <code>attributes</code>.
        The foreign key to <code>music_data</code> is <code>attributes_id</code>.
    </div>
    <div class="table-info">
        The <code>measure_style</code> table is single-inheritance with discriminator column <code>measure_style_type</code>.
        Discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">multiple rest</li>
            <li class="discriminator-value">measure repeat</li>
            <li class="discriminator-value">beat repeat</li>
            <li class="discriminator-value">slash</li>
        </ul>
    </div>
    <div class="table-info">
        <code>measure_style_type</code> <code>beat repeat</code> and <code>slash</code> join to a <code>slash_group</code> record whose data structure corresponds to the MusicXML schema's xs:group
        <code>slash</code>.
    </div>
</div>

<div id="metronome_beam" class="table-content">
    <div class="table-info">
        One-to-many relationship to table <code>metronome_note</code>, foreign key <code>metronome_note_id</code>.
        Attribute <code>number</code> in field <code>metronome_beam_number</code>.
    </div>
</div>

<div id="metronome_mark" class="table-content">
    <div class="table-info">
        The <code>metronome_mark</code> table represents the data structure of the first xs:sequence of the xs:choice in the
        <code>metronome</code> complexType definition in the MusicXML schema.
        This sequence includes the <code>beat-unit</code> group, and the <code>beat-unit-tied</code> and
        <code>per-minute</code> elements.
        The sequence as a whole defines a beat metronome.
    </div>
    <div class="table-info">
        The <code>metronome_mark</code> table is a single-inheritance table with the discriminator field <code>metronome_mark_type</code>.
        The values for the discriminator field are:
        <ul class="discriminator-values">
            <li class="discriminator-value">beat unit</li>
            <li class="discriminator-value">per minute</li>
        </ul>
    </div>
    <div class="content-subsection">beat unit</div>
    <div class="table-info">
        The <code>beat unit</code> type is the combination of the <code>beat-unit</code> group and its following list of
        <code>beat-unit-tied</code> elements, and is persisted as follows:
    </div>
    <div class="table-info">
        The count of the number of <code>beat-unit-dot</code> subelements is in field <code>beat_unit_dots</code>.
    </div>
    <div class="table-info">
        The list of <code>beat-unit-tied</code> elements are themselves of type <code>beat unit</code>, and so are stored in table
        <code>metronome_mark</code>, <code>metronome_mark_type</code> <code>beat unit</code>.
        The foreign key for the self-join from the <code>beat-unit-tied</code> subelements to the main <code>beat unit</code> record in table
        <code>metronome_mark</code> is <code>beat_unit_tied_id</code>.
    </div>
    <div class="content-subsection">per minute</div>
    <div class="table-info">
        The <code>per minute</code> type has a joined <code>display</code> table record for the font info.
    </div>
    <div class="content-subsection">Beat metronome structure</div>
    <div class="table-info">
        A beat metronome is a direction type in table <code>direction_type</code>, <code>direction_type_type</code> <code>beat
        metronome</code>, and has two metronome mark parts:
        <ul>
            <li>A <code>beat unit</code> record in <code>metronome_mark</code>, and its adjoining list of <code>beat-unit-tied</code> records in
                <code>metronome_mark</code>.</li>
            <li>A second <code>beat unit</code> type as above, or a <code>per minute</code> <code>metronome_mark</code> record type.</li>
        </ul>
        The two records are joined from the beat metronome record in <code>direction_type</code> by foreign keys <code>metronome_mark_1_id</code> and
        <code>metronome_mark_2_id</code>, respectively.
    </div>
</div>

<div id="metronome_note" class="table-content">
    <div class="table-info">
        The <code>metronome_note</code> table represents the data structure of the second xs:sequence of the xs:choice in the
        <code>metronome</code> complexType definition in the MusicXML schema.
        This sequence includes the <code>metronome-arrows</code>, <code>metronome-note</code>, and
        <code>metronome-relation</code> elements.
        The sequence as a whole defines a note metronome.
    </div>
    <div class="content-subsection">Note metronome structure</div>
    <div class="table-info">
        A note metronome is a direction type in table <code>direction_type</code>, <code>direction_type_type</code> <code>note
        metronome</code>, and persists as follows:
        <ul>
            <li>The presence or absence of the <code>metronome-arrows</code> element in boolean field <code>metronome_arrows</code>.</li>
            <li>The text value of element <code>metronome-relation</code> in field <code>metronome_relation</code>.</li>
            <li>
                Two lists of <code>metronome_note</code> records, corresponding to the two lists of
                <code>metronome-note</code> elements that are separated by the <code>metronome-relation</code> element.
                A <code>metronome_note</code> record in the first list joins to the note metronome in the <code>direction_type</code> table using foreign key
                <code>note_metronome_1_id</code>.
                A <code>metronome_note</code> record in the second list joins to the note metronome in the <code>direction_type</code> table using foreign key
                <code>note_metronome_2_id</code>.
            </li>
        </ul>
    </div>
    <div class="content-subsection"><code>metronome_note</code> record</div>
    <div class="table-info">
        A <code>metronome_note</code> record persists as follows:
        <ul>
            <li>The text value of subelement <code>metronome-type</code> in field <code>metronome_type</code>.</li>
            <li>The count of <code>metronome-dot</code> subelements in field <code>metronome_dots</code>.</li>
            <li>The list of <code>metronome-beat</code> subelements in table <code>metronome_beam</code>, foreign key
                <code>metronome_note_id</code>.</li>
            <li>The <code>type</code> attribute value of subelement <code>metronome-tied</code> in field <code>metronome_tied</code>.</li>
            <li>The <code>metronome-tuplet</code> subelement in table <code>metronome_tuplet</code>.</li>
        </ul>
    </div>
</div>

<div id="metronome_tuplet" class="table-content">
    <div class="table-info">
        Belongs to a <code>metronome_note</code>, foreign key <code>metronome_tuplet_id</code>.
    </div>
    <div class="table-info">
        Time modification data is in a separate <code>time_modification</code> table record, <code>time_modification_id</code>.
    </div>
</div>

<div id="midi_device" class="table-content">
    <div class="table-info">
        <code>midi-device</code> element <code>id</code> attribute value in field <code>midi_device_id</code>
    </div>
    <div class="table-info">
        Table joins:
        <ul>
            <li><code>score_midi</code> table, representing the <code>midi-device</code>/<code>midi-instrument</code> sequence in complexType
                <code>score-part</code></li>
            <li><code>sound_midi</code> table, representing the <code>midi-device</code>/<code>midi-instrument</code>/<code>play</code> sequence in complexType
                <code>sound</code></li>
        </ul>
    </div>
</div>

<div id="midi_instrument" class="table-content">
    <div class="table-info">
        <code>midi-instrument</code> element's <code>id</code> attribute is in field <code>midi_instrument_id</code>.
    </div>
    <div class="table-info">
        Table joins:
        <ul>
            <li><code>score_midi</code> table, representing the <code>midi-device</code>/<code>midi-instrument</code> sequence in complexType
                <code>score-part</code></li>
            <li><code>sound_midi</code> table, representing the <code>midi-device</code>/<code>midi-instrument</code>/<code>play</code> sequence in complexType
                <code>sound</code></li>
        </ul>
    </div>
</div>

<div id="music_data" class="table-content">
    <div class="table-info">
        The <code>music_data</code> table is single-inheritance with the discriminator column <code>music_data_type</code>.
    </div>
    <div class="table-info">
        All music data types are stored in the <code>music_data</code> table, and given the number and variety of music data types, the table has a large number of columns,
        although individual music data types use only a subset of the columns.
    </div>
    <div class="table-info">
        Music data records are ordered items, so all records use the <code>ordering</code> field.
        All music data items use the <code>measure_id</code> field, because they're all associated with a measure.
    </div>
    <div class="table-info">
        Each music data type is outlined individually on subpages of this page, showing only those fields used by that type.
    </div>
    <div class="table-info">
        Music data discriminator values are:
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
    </div>
</div>

<div id="note" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>note</code>.
    </div>
    <div class="table-info">
        One-to-one relationships:
        <ul class="discriminator-values">
            <li class="discriminator-value">note_type</li>
            <li class="discriminator-value">accidental</li>
            <li class="discriminator-value">grace</li>
            <li class="discriminator-value">notehead</li>
            <li class="discriminator-value">stem</li>
            <li class="discriminator-value">time_modification</li>
            <li class="discriminator-value">play</li>
            <li class="discriminator-value">display</li>
            <li class="discriminator-value">editorial</li>
            <li class="discriminator-value">printout</li>
        </ul>
        One-to-many relationships:
        <ul class="discriminator-values">
            <li class="discriminator-value">tie</li>
            <li class="discriminator-value">beam</li>
            <li class="discriminator-value">dot</li>
            <li class="discriminator-value">notations</li>
            <li class="discriminator-value">lyric</li>
            <li class="discriminator-value">text_display</li>
        </ul>
    </div>
</div>

<div id="backup" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>backup</code>.
    </div>
</div>

<div id="forward" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>forward</code>.
    </div>
</div>

<div id="direction" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>direction</code>.
    </div>
    <div class="table-info">
        Many-to-one join to <code>direction_type_list</code>, foreign key <code>direction_id</code>.
        Each <code>direction_type_list</code> record joins to a list of <code>direction_type</code> objects.
    </div>
    <div class="table-info">
        Thus, a <code>direction</code> <code>music_data_type</code> record in <code>music_data</code> represents a <code>direction</code> element,
        and a <code>direction_type_list</code> record represents a <code>direction-type</code> element.
        Individual subelements of <code>direction-type</code> are stored in the <code>direction_type</code> table.
    </div>
    <div class="table-info">
        Field <code>sound_id</code> is a join to a <code>sound</code> record, which is itself in the <code>music_data</code> table.
    </div>
</div>

<div id="attributes" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>attributes</code>.
    </div>
    <div class="table-info">
        Scalar values in the <code>music_data</code> table:
        <ul class="discriminator-values">
            <li class="discriminator-value">divisions</li>
            <li class="discriminator-value">instruments</li>
            <li class="discriminator-value">staves</li>
        </ul>
        One-to-one relationships to records in other tables:
        <ul class="discriminator-values">
            <li class="discriminator-value">editorial</li>
            <li class="discriminator-value">part_symbol</li>
        </ul>
        Many-to-one relationships, with foreign key <code>attributes_id</code>:
        <ul class="discriminator-values">
            <li class="discriminator-value">time</li>
            <li class="discriminator-value">key_signature</li>
            <li class="discriminator-value">clef</li>
            <li class="discriminator-value">staff_details</li>
            <li class="discriminator-value">directive</li>
            <li class="discriminator-value">transpose</li>
            <li class="discriminator-value">measure_style</li>
        </ul>
    </div>
</div>

<div id="harmony" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>harmony</code>.
    </div>
    <div class="table-info">
        Scalar values in <code>music_data</code> table:
        <ul class="discriminator-values">
            <li class="discriminator-value">staff</li>
            <li class="discriminator-value">type</li>
            <li class="discriminator-value">print_object</li>
            <li class="discriminator-value">print_frame</li>
        </ul>
        One-to-one relationships to records in other tables:
        <ul class="discriminator-values">
            <li class="discriminator-value">frame</li>
            <li><code>direction_offset</code>, foreign key <code>offset_id</code>.  Corresponds to <code>offset</code> element.</li>
            <li class="discriminator-value">editorial</li>
            <li class="discriminator-value">display</li>
        </ul>
        Many-to-one relationship, with foreign key <code>harmony_id</code>:
        <ul class="discriminator-values">
            <li class="discriminator-value">harmony_chord</li>
        </ul>
    </div>
</div>

<div id="figured-bass" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>figured bass</code>.
    </div>
    <div class="table-info">
        Scalar values in <code>music_data</code> table:
        <ul class="discriminator-values">
            <li class="discriminator-value">duration</li>
            <li class="discriminator-value">parentheses</li>
        </ul>
        One-to-one relationships to records in other tables:
        <ul class="discriminator-values">
            <li class="discriminator-value">editorial</li>
            <li class="discriminator-value">display</li>
            <li class="discriminator-value">printout</li>
        </ul>
        Many-to-one relationship, with foreign key <code>figured_bass_id</code>:
        <ul class="discriminator-values">
            <li class="discriminator-value">figure</li>
        </ul>
    </div>
</div>

<div id="print" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>print</code>.
    </div>
    <div class="table-info">
        The <code>measure-layout</code> and <code>measure-numbering</code> types, and the <code>print-attributes</code> attributeGroup are unique to the
        <code>print</code> complexType,
        and so their values are folded into the <code>print</code> record, and included in the <code>music_data</code> table,
        rather than using separate tables using table joins.
    </div>
    <div class="table-info">
        These values are handled as follows:
        <ul>
            <li><code>measure-layout</code> element's <code>measure-distance</code> subelement text: field <code>measure_distance</code></li>
            <li><code>measure-numbering</code> element text: field <code>measure_numbering_value</code></li>
            <li><code>measure-numbering</code> element's display attributes: <code>display</code> table, foreign key <code>display_id</code></li>
            <li><code>print-attributes</code> attributeGroup values: fields <code>staff_spacing</code>,
                <code>new_system</code>, <code>new_page</code>, <code>blank_page</code>, <code>page_number</code></li>
        </ul>
    </div>
    <div class="table-info">
        <code>layout</code> group values in <code>layout</code> table, foreign key <code>layout_id</code>.
    </div>
    <div class="table-info">
        <code>part-name-display</code> and <code>part-abbreviation-display</code> element data are in table <code>name_display</code>,
        foreign keys <code>name_display_id</code> and <code>abbreviation_display_id</code>.
    </div>
</div>

<div id="sound" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>sound</code>.
    </div>
    <div class="table-info">
        The sequence of <code>midi-device</code>, <code>midi-instrument</code>, and <code>play</code> elements are combined into a Sound Midi object,
        and each appearance of the this sequence is stored in the <code>sound_midi</code> table, foreign key
        <code>sound_id</code>.
    </div>
    <div class="table-info">
        The <code>offset</code> element data is in the <code>direction_offset</code> table, foreign key <code>offset_id</code>.
    </div>
    <div class="table-info">
        Attribute values are stored as part of the <code>sound</code> record in the <code>music_data</code> table.
    </div>
</div>

<div id="barline" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>barline</code>
    </div>
    <div class="table-info">
        The <code>bar-style</code> subelement text is in field <code>bar_style</code>.
        Its color info is stored in a <code>display</code> table record.
    </div>
    <div class="table-info">
        The <code>location</code> attribute is in field <code>barline_location</code>.
    </div>
    <div class="table-info">
        The <code>segno</code> and <code>coda</code> attributes are <code>music_data</code> fields <code>segno</code> and
        <code>coda</code>.
    </div>
    <div class="table-info">
        Other notable table associations are:
        <ul>
            <li><code>wavy-line</code> is a record in table <code>ornament</code>, <code>ornament_type</code> <code>wavy
                line</code>.</li>
            <li><code>segno</code> and <code>coda</code> subelement data are in table <code>direction_type</code>, <code>direction_type_type</code>
                <code>segno</code> and <code>coda</code>, respectively.</li>
            <li>The list of <code>fermata</code> subelements are in the <code>notation</code> table, <code>notation_type</code>
                <code>fermata</code>, foreign key <code>barline_id</code>.</li>
            <li><code>ending</code> and <code>repeat</code> subelements are in tables <code>barline_ending</code> and <code>barline_repeat</code>.</li>
        </ul>
    </div>
</div>

<div id="grouping" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>grouping</code>
    </div>
    <div class="table-info">
        <code>number</code> attribute value is in field <code>grouping_number</code>.
    </div>
</div>

<div id="link" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>link</code>
    </div>
    <div class="table-info">
        The <code>position</code> attribute scalar value is in <code>music_data</code> field <code>position</code>.
    </div>
    <div class="table-info">
        The <code>position</code> attributeGroup values are <code>display</code> table fields, as with all other elements that have the
        <code>position</code> attributeGroup as part of their definition.
    </div>
</div>

<div id="bookmark" class="table-content">
    <div class="table-info">
        <code>music_data</code> record, <code>music_data_type</code> <code>bookmark</code>
    </div>
    <div class="table-info">
        <code>id</code> attribute value is in <code>music_data</code> field <code>bookmark_id</code>.
    </div>
</div>

<div id="name_display" class="table-content">
    <div class="table-info">
        A name display contains a list of text display objects: the list of <code>display-text</code> and <code>accidental-text</code> elements defined in the xs:choice block in complexType
        <code>name-display</code>.
        Foreign key to <code>name_display</code> is <code>name_display_id</code>.
    </div>
    <div class="table-info">
        Name display objects are found in:
        <ul>
            <li>
                A score part or part group in table <code>part_list_item</code>, each of which has both a name and an abbreviation display,
                joined to the <code>name_display</code> table by pair of foreign keys, one for the name, one for the abbreviation:
                <code>name_display_id</code> and <code>abbreviation_display_id</code>
            </li>
            <li>
                A print object in the <code>music_data</code> table, having both a part name display and a part abbreviation display.
                Foreign keys to <code>name_display</code> are <code>name_display_id</code> and <code>abbreviation_display_id</code>.
            </li>
        </ul>
    </div>
</div>

<div id="non_traditional_key_type" class="table-content">
    <div class="table-info">
        When a key signature is a non-traditional key type (<code>key_signature</code> record, <code>key_type</code> value
        <code>non-traditional key</code>),
        each iteration of the <code>non-traditional-key</code> group (as defined in the MusicXML schema) is stored as a record in the
        <code>non_traditional_key_type</code> table, foreign key <code>key_id</code>.
    </div>
</div>

<div id="notation" class="table-content">
    <div class="table-info">
        Each subelement of a <code>notations</code> element is stored as a record in the <code>notation</code> table.
        The data for the <code>notations</code> element is in table <code>notations</code>,
        and this many-to-one relationship uses foreign key <code>notations_id</code> in the <code>notation</code> table.
    </div>
    <div class="table-info">
        A list of notation type fermata can also belong to a barline, which is a <code>music_data</code> record.
        The foreign key in <code>notation</code> to the <code>music_data</code> record is <code>barline_id</code>.
    </div>
    <div class="table-info">
        <code>notation</code> is a single-inheritance table with discriminator field <code>notation_type</code>.
        The <code>notation_type</code> discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">tied</li>
            <li class="discriminator-value">slur</li>
            <li class="discriminator-value">tuplet</li>
            <li class="discriminator-value">glissando</li>
            <li class="discriminator-value">slide</li>
            <li class="discriminator-value">ornaments</li>
            <li class="discriminator-value">technicals</li>
            <li class="discriminator-value">articulations</li>
            <li class="discriminator-value">dynamics</li>
            <li class="discriminator-value">fermata</li>
            <li class="discriminator-value">arpeggiate</li>
            <li class="discriminator-value">non arpeggiate</li>
            <li class="discriminator-value">accidental mark</li>
            <li class="discriminator-value">other notation</li>
        </ul>
    </div>
    <div class="table-info">
        Since many different object types are stored in the <code>notation</code> table,
        each notation type individually only use some fields to store their records.
        Notable data definitions are below:
    </div>
    <div class="content-subsection">tied and slur</div>
    <div class="table-info">
        <ul>
            <li><code>number</code> attribute in field <code>notation_number</code></li>
            <li>Joins to a record each in tables <code>dashed_formatting</code> and <code>bezier</code></li>
        </ul>
    </div>
    <div class="content-subsection">tuplet</div>
    <div class="table-info">
        <ul>
            <li>Has two <code>tuplet_portion</code> records, one for <code>tuplet-actual</code> and the other for <code>tuplet-normal</code>.  Foreign keys
                <code>tuplet_actual_id</code> and <code>tuplet_normal_id</code></li>
        </ul>
    </div>
    <div class="content-subsection">glissando</div>
    <div class="table-info">
        <ul>
            <li>Joins to a record in table <code>dashed_formatting</code></li>
        </ul>
    </div>
    <div class="content-subsection">slide</div>
    <div class="table-info">
        <ul>
            <li>Joins to a record each in tables <code>dashed_formatting</code> and <code>bend_sound</code></li>
        </ul>
    </div>
    <div class="content-subsection">ornaments</div>
    <div class="table-info">
        <ul>
            <li>Represents a list of ornaments whose records are in the <code>ornament</code> table, foreign key <code>ornaments_id</code></li>
            <li>The ornaments list also has a list of accidental marks, whose records are also in the <code>notation</code> table.  Self-join to the parent ornaments list on field
                <code>ornaments_id</code>.</li>
        </ul>
    </div>
    <div class="content-subsection">technicals</div>
    <div class="table-info">
            Represents a list of technicals whose records are in the <code>technical</code> table, foreign key <code>technicals_id</code>
    </div>
    <div class="content-subsection">articulations</div>
    <div class="table-info">
            Represents a list of articulations whose records are in the <code>articulation</code> table, foreign key <code>articulations_id</code>
    </div>
    <div class="content-subsection">dynamics</div>
    <div class="table-info">
        Implemented as a direction type, so when a <code>dynamics</code> element is a subelement of a <code>notations</code> element,
        the data is stored in the <code>direction_type</code> table and joined from <code>notations</code> using foreign key
        <code>dynamics_id</code>
    </div>
    <div class="content-subsection">accidental mark</div>
    <div class="table-info">
        <ul>
            <li>Joins to a record in table <code>level_display</code></li>
        </ul>
    </div>
    <div class="content-subsection">other notation</div>
    <div class="table-info">
        <ul>
            <li>attribute <code>number</code> is in field <code>notation_number</code></li>
        </ul>
    </div>
</div>

<div id="notations" class="table-content">
    <div class="table-info">
        A <code>notations</code> record represents a <code>notations</code> element.
    </div>
    <div class="table-info">
        Notations subelements are stored in table <code>notation</code>, with the foreign key <code>notations_id</code> to the notations list in the
        <code>notations</code> table.
    </div>
    <div class="table-info">
        Notations belongs to a note, which is in <code>music_data</code>, <code>music_data_type</code> <code>note</code>.
        Many-to-one foreign key in notations is <code>note_id</code>.
    </div>
</div>

<div id="notehead" class="table-content">
    <div class="table-info">
        A notehead belongs to a note, which is in <code>music_data</code>, <code>music_data_type</code> <code>note</code>, foreign key
        <code>notehead_id</code>.
    </div>
</div>

<div id="note_size" class="table-content">
    <div class="table-info">
        The <code>note-size</code> element is a subelement of the <code>appearance</code> element, and has a direct many-to-one join to the
        <code>defaults</code> table, foreign key <code>defaults_id</code>.
        There is no intermediate appearance table.
    </div>
</div>

<div id="note_type" class="table-content">
    <div class="table-info">
        Represents the xs:choice section of the <code>full-note</code> group in the MusicXML schema.
    </div>
    <div class="table-info">
        The <code>chord</code> element's presence or absence as defined in the <code>full-note</code> group is stored as a boolean value in the
        <code>chord</code> field of the note record in the <code>music_data</code> table.
    </div>
    <div class="table-info">
        <code>note_type</code> is a single-inheritance table with discriminator column <code>note_type_type</code>.
        The discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">pitch</li>
            <li class="discriminator-value">unpitched</li>
            <li class="discriminator-value">rest</li>
        </ul>
    </div>
    An "alter" element value is stored in field pitch_alter.
</div>

<div id="ornament" class="table-content">
    <div class="table-info">
        <code>ornament</code> table records represent the elements defined in the xs:choice section of the
        <code>ornaments</code> complexType in the MusicXML schema.
    </div>
    <div class="table-info">
        A barline (<code>music_data</code> table, <code>music_data_type</code> <code>barline</code>) also stores its <code>wavy-line</code> element data in this table.
    </div>
    <div class="table-info">
        <code>ornament</code> is a single-inheritance table, discriminator column <code>ornament_type</code>.
    </div>
    <div class="table-info">
        ornament discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">trill mark</li>
            <li class="discriminator-value">turn</li>
            <li class="discriminator-value">delayed turn</li>
            <li class="discriminator-value">inverted turn</li>
            <li class="discriminator-value">delayed inverted turn</li>
            <li class="discriminator-value">vertical turn</li>
            <li class="discriminator-value">inverted vertical turn</li>
            <li class="discriminator-value">shake</li>
            <li class="discriminator-value">wavy line</li>
            <li class="discriminator-value">mordent</li>
            <li class="discriminator-value">inverted mordent</li>
            <li class="discriminator-value">schleifer</li>
            <li class="discriminator-value">tremolo</li>
            <li class="discriminator-value">haydn</li>
            <li class="discriminator-value">other ornament</li>
        </ul>
    </div>
    <div class="table-info">
        The enclosing <code>ornaments</code> element that defines the list of <code>ornament</code> records is a <code>notation</code> record,
        <code>notation_type</code> <code>ornaments</code>.
        The foreign key to this record in <code>ornament</code> is <code>ornaments_id</code>.
    </div>
    <div class="table-info">
        <code>tremolo</code> element text is in field <code>tremolo_marks</code>.
    </div>
    <div class="table-info">
        <code>wavy-line</code> element attribute <code>number</code> is in field <code>wavy_line_number</code>.
    </div>
    <div class="table-info">
        Elements with <code>trill-sound</code> values have their data stored in table <code>trill_sound</code>, foreign key
        <code>trill_sound_id</code>.
    </div>
    <div class="table-info">
        <code>mordent</code> type elements stored their <code>long</code> attribute value in the <code>long_mordent</code> boolean field.
    </div>
</div>

<div id="other_appearance" class="table-content">
    <div class="table-info">
        The <code>other-appearance</code> element is a subelement of the <code>appearance</code> element, and has a direct many-to-one join to the
        <code>defaults</code> table, foreign key <code>defaults_id</code>.
        There is no intermediate appearance table.
    </div>
</div>

<div id="page_layout" class="table-content">
    <div class="table-info">
        Part of a layout, foreign key <code>page_layout_id</code>.
        Has multiple <code>page_margins</code> records, foreign key <code>page_layout_id</code>.
    </div>
</div>

<div id="page_margins" class="table-content">
    <div class="table-info">
        Many-to-one relation with table <code>page_layout</code>, foreign key <code>page_layout_id</code>.
    </div>
    <div class="table-info">
        The <code>type</code> attribute values of the <code>page-margin</code> elements within a <code>page-layout</code> element must be unique.
        If duplicate <code>type</code> values are found during conversion from a MusicXML file to a database record, a warning is issued, and only one of the
        <code>page-margins</code> type is persisted.
    </div>
</div>

<div id="part" class="table-content">
    <div class="table-info">
        A <code>part</code> record belongs to a score, foreign key <code>score_id</code>.
    </div>
    <div class="table-info">
        A part has multiple <code>measure</code> records, foreign key in the <code>measure</code> table is
        <code>part_id</code>.
    </div>
    <div class="table-info">
        The <code>part</code> element's <code>id</code> attribute value is in the <code>part</code> table, field <code>part_id</code>.
    </div>
</div>

<div id="part_list_item" class="table-content">
    <div class="table-info">
        The <code>part_list_item</code> table stores the data from the <code>part-list</code> complexType in the MusicXML schema, elements
        <code>part-group</code> and <code>score-part</code>.
        The list as a whole belongs to a <code>score_header</code> record, foreign key <code>score_header_id</code>.
    </div>
    <div class="table-info">
        Since the <code>part_list_item</code> table stores multiple data types, the table is single-inheritance.  Discriminator column
        <code>part_list_item_type</code>.
    </div>
    <div class="table-info">
        Discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">part group</li>
            <li class="discriminator-value">score part</li>
        </ul>
    </div>
    <div class="table-info">
        <code>part_list_item</code> records are stored in the order they are encountered in the <code>part-list</code> element, using the
        <code>ordering</code> field.
    </div>
    <div class="content-subsection">part group</div>
    <div class="table-info">
        Foreign keys to table <code>group_name</code> are:
        <ul class="discriminator-values">
            <li class="discriminator-value">group_name_id</li>
            <li class="discriminator-value">group_abbreviation_id</li>
        </ul>
        Foreign keys to table <code>name_display</code> are:
        <ul class="discriminator-values">
            <li class="discriminator-value">name_display_id</li>
            <li class="discriminator-value">abbreviation_display_id</li>
        </ul>
    </div>
    <div class="table-info">
        <code>group-symbol</code>, <code>group-barline</code>, and <code>editorial</code> data are stored in associated tables
        <code>group_symbol</code>, <code>group_barline</code>, <code>editorial</code>.
    </div>
    <div class="table-info">
        Attribute <code>number</code> is stored in field <code>part_group_number</code>.
    </div>
    <div class="content-subsection">score part</div>
    <div class="table-info">
        Foreign keys to table <code>part_name</code> are:
        <ul class="discriminator-values">
            <li class="discriminator-value">part_name_id</li>
            <li class="discriminator-value">part_abbreviation_id</li>
        </ul>
        Foreign keys to table <code>name_display</code> are:
        <ul class="discriminator-values">
            <li class="discriminator-value">name_display_id</li>
            <li class="discriminator-value">abbreviation_display_id</li>
        </ul>
    </div>
    <div class="table-info">
        Each subelement <code>score-instrument</code> data is a record in table <code>score_instrument</code>.
    </div>
    <div class="table-info">
        Each <code>midi-device</code>/<code>midi-instrument</code> element sequence is stored in table <code>score_midi</code>.
    </div>
    <div class="table-info">
        The <code>id</code> attribute value is stored in field <code>score_part_id</code>.
    </div>
</div>

<div id="part_name" class="table-content">
    <div class="table-info">
        Stores the part name and part abbreviation of a score part.
        Foreign keys for the score part record in the <code>part_list_item</code> table are <code>part_name_id</code> and
        <code>part_abbreviation_id</code>.
    </div>
    <div class="table-info">
        The <code>part-name</code> element text is stored in field <code>part_name</code>.
    </div>
</div>

<div id="part_symbol" class="table-content">
    <div class="table-info">
        <code>part_symbol</code> is part of an <code>attributes</code> record in the <code>music_data</code> table, foreign key
        <code>part_symbol_id</code>.
    </div>
</div>

<div id="pedal_tuning" class="table-content">
    <div class="table-info">
        A list of <code>pedal-tuning</code> elements belongs to a harp pedals which is a <code>direction_type</code> record.
        Foreign key <code>harp_pedals_id</code>.
    </div>
</div>

<div id="play" class="table-content">
    <div class="table-info">
        The <code>play</code> table stores <code>play</code> element data.
    </div>
    <div class="table-info">
        A <code>play</code> record belongs to either:
        <ul>
            <li>A <code>sound</code> record's <code>midi-device</code>/<code>midi-instrument</code>/<code>play</code> sequence.  This sequence is stored as a
                <code>sound_midi</code> record, foreign key <code>play_id</code>.</li>
            <li>A note stored in the <code>music_data</code> table, foreign key <code>play_id</code>.</li>
        </ul>
    </div>
    <div class="table-info">
        The <code>id</code> attribute value is in field <code>play_id</code>.
    </div>
    <div class="table-info">
        A play has a list of subelements as shown in the xs:choice section of the <code>play</code> complexType in the MusicXML schema.
        Each of these subelements is a <code>play_type</code> record with foreign key <code>play_id</code>.
    </div>
</div>

<div id="play_type" class="table-content">
    <div class="table-info">
        Represents the list of elements in the xs:choice section of the <code>play</code> complexType in the MusicXML schema.
    </div>
    <div class="table-info">
        A <code>play</code> record has a list of <code>play_type</code> records, each of which join to the <code>play</code> table using foreign key
        <code>play_id</code> in the <code>play_type</code> table.
    </div>
    <div class="table-info">
        <code>play_type</code> is a single-inheritance table, with discriminator column <code>play_type_type</code>.
    </div>
    <div class="table-info">
        Disriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">ipa</li>
            <li class="discriminator-value">mute</li>
            <li class="discriminator-value">semi pitched</li>
            <li class="discriminator-value">other play</li>
        </ul>
    </div>
</div>

<div id="printout" class="table-content">
    <div class="table-info">
        A <code>printout</code> record belongs to either a note or a figured bass, each of which are in the <code>music_data</code> table, foreign key
        <code>printout_id</code>.
    </div>
</div>

<div id="root_alter" class="table-content">
    <div class="table-info">
        A <code>root_alter</code> record belongs to a <code>harmony_chord</code>, type <code>root</code>.  Foreign key
        <code>root_alter_id</code>.
    </div>
</div>

<div id="root_step" class="table-content">
    <div class="table-info">
        A <code>root_step</code> record belongs to a <code>harmony_chord</code>, type <code>root</code>.  Foreign key
        <code>root_step_id</code>.
    </div>
</div>

<div id="score" class="table-content">
    <div class="table-info">
        The <code>score</code> table is the parent table of the schema.
    </div>
    <div class="table-info">
        A score consists of a score header and a list of parts.
        Foreign key to <code>score_header</code> is <code>score_header_id</code>.
        The foreign key from <code>part</code> to <code>score</code> is <code>score_id</code>.
    </div>
    <div class="table-info">
        The <code>score_name</code> field is not part of the MusicXML definition.
        The field has a unique constraint, and is assigned when a score is converted from a MusicXML file to a database record using the tasks interface.
    </div>
    <div class="table-info">
        The <code>xml_comment</code> table holds comment and processing instruction data found within a MusicXML file.
        Records are created when a MusicXML file is converted to a database record using the tasks interface.
        When converting from a database record to a MusicXML file in the tasks interface, the comments and processing instructions are re-inserted into the output file in their original locations.
        The <code>xml_comment</code> table is not part of the MusicXML definition.
    </div>
</div>

<div id="score_header" class="table-content">
    <div class="table-info">
        A <code>score_header</code> belongs to a score.  Foreign key in <code>score</code> is <code>score_header_id</code>.
    </div>
    <div class="table-info">
        Metadata records for a score header are in the <code>work</code>, <code>identification</code>, <code>defaults</code>, and
        <code>credit</code> tables.
        <code>credit</code> table relation is many-to-one, foreign key <code>score_header_id</code>.
    </div>
    <div class="table-info">
        Table <code>part_list_item</code> holds the part group and score part records found in a <code>part-list</code> element.
        Records in <code>part_list_item</code> are stored in the order they are listed in the <code>part-list</code> element using the
        <code>ordering</code> field.
        Foreign key in <code>part_list_item</code> to the score header is <code>score_header_id</code>.
    </div>
</div>

<div id="score_instrument" class="table-content">
    <div class="table-info">
        A list of <code>score_instrument</code> records belongs to a score part record stored in the
        <code>part_list_item</code> table.
        Foreign key is <code>score_part_id</code>.
    </div>
    <div class="table-info">
        Attribute <code>id</code> value is in field <code>score_instrument_id</code>.
    </div>
</div>

<div id="score_midi" class="table-content">
    <div class="table-info">
        A <code>score_midi</code> record represents the <code>midi-device</code>/<code>midi-instrument</code> element sequence in the
        <code>score-part</code> complexType in the MusicXML schema.
    </div>
    <div class="table-info">
        A list of <code>score_midi</code> records belongs to a score part record in the <code>part_list_item</code> table.
        The foreign key in <code>score_midi</code> is <code>score_part_id</code>.
    </div>
</div>

<div id="score_part_group" class="table-content">
    <div class="table-info">
        Stores the data of the <code>group</code> subelements of the <code>score-part</code> element.
        The <code>score-part</code> data is in table <code>part_list_item</code>.
        Foreign key in <code>score_part_group</code> is <code>score_part_id</code>.
    </div>
</div>

<div id="slash_group" class="table-content">
    <div class="table-info">
        Represents the data defined in xs:group <code>slash</code> in the MusicXML schema.
    </div>
    <div class="table-info">
        When a <code>measure-style</code> element has a <code>slash</code> subelement, its <code>slash</code> group subelements are stored in table
        <code>slash_group</code>.
        The measure style data is stored in table <code>measure_style</code>, <code>measure_style_type</code>
        <code>slash</code>, and joined to <code>slash_group</code> using foreign key <code>slash_group_id</code>.
    </div>
    <div class="table-info">
        The <code>slash_dots</code> field has the <code>slash-dot</code> subelement count.
    </div>
    <div class="table-info">
        Data of the <code>except-voice</code> subelements are stored in table <code>except_voice</code>, foreign key <code>slash_group_id</code>.
    </div>
</div>

<div id="sound_midi" class="table-content">
    <div class="table-info">
        Represents the <code>midi-device</code>/<code>midi-instrument</code>/<code>play</code> subelement sequence of the
        <code>sound</code> element.
    </div>
    <div class="table-info">
        A <code>sound</code> element can have a list of these sequences, and each subelement sequence is stored as a record in
        <code>sound_midi</code>.
    </div>
    <div class="table-info">
        The data of each subelement in the sequence is stored in tables <code>midi_device</code>, <code>midi_instrument</code>, and
        <code>play</code>, respectively, with the foreign keys to these tables in the <code>sound_midi</code> table.
    </div>
    <div class="table-info">
        The owning <code>sound</code> record is in table <code>music_data</code>, <code>music_data_type</code>
        <code>sound</code>, foreign key <code>sound_id</code>.
    </div>
</div>

<div id="staff_details" class="table-content">
    <div class="table-info">
        Stores the data of a <code>staff-details</code> subelement of <code>attributes</code>.
    </div>
    <div class="table-info">
        Each record in the list of <code>staff_details</code> records has foreign key <code>attributes_id</code> to table
        <code>music_data</code> where the attributes record is stored.
    </div>
    <div class="table-info">
        The "number" attribute value is in field <code>staff_details_number</code>.
    </div>
</div>

<div id="staff_layout" class="table-content">
    <div class="table-info">
        Stores the <code>staff-layout</code> element data.
    </div>
    <div class="table-info">
        Attribute <code>number</code> is in field <code>staff_layout_number</code>.
    </div>
    <div class="table-info">
        The list of <code>staff_layout</code> records joins to the <code>layout</code> table using foreign key <code>layout_id</code>.
    </div>
</div>

<div id="staff_tuning" class="table-content">
    <div class="table-info">
        Stores the <code>staff-tuning</code> element data.
    </div>
    <div class="table-info">
        <code>tuning</code> group element data is in table <code>tuning</code>, foreign key <code>tuning_id</code>.
    </div>
    <div class="table-info">
        The <code>staff_tuning</code> records each join to its <code>staff_details</code> record using foreign key <code>staff_details_id</code>.
    </div>
</div>

<div id="stem" class="table-content">
    <div class="table-info">
        Stores <code>stem</code> element data.
    </div>
    <div class="table-info">
        A stem belongs to a note, which is in the <code>music_data</code> table, and joins to <code>stem</code> using foreign key
        <code>stem_id</code>.
    </div>
</div>

<div id="system_divider" class="table-content">
    <div class="table-info">
        Stores the <code>left-divider</code> and <code>right-divider</code> element data of a <code>system-layout</code> element,
        one record for each divider element,
        and joined from the <code>system_layout</code> table to the <code>system_divider</code> table using foreign keys
        <code>left_system_divider_id</code> and <code>right_system_divider_id</code>.
    </div>
</div>

<div id="system_layout" class="table-content">
    <div class="table-info">
        Stores <code>system-layout</code> element data.
    </div>
    <div class="table-info">
        <code>left-divider</code> and <code>right-divider</code> subelement data are in table <code>system_divider</code> foreign keys
        <code>left_system_divider_id</code> and <code>right_system_divider_id</code>.
    </div>
    <div class="table-info">
        The owning <code>layout</code> record joins to <code>system_layout</code> using foreign key
        <code>system_layout_id</code>.
    </div>
</div>

<div id="technical" class="table-content">
    <div class="table-info">
        The <code>technical</code> table stores data for all subelements of the <code>technical</code> element.
    </div>
    <div class="table-info">
        A technical list is a type of notation, so each record in <code>technical</code> joins to the notation table where the technicals list record is stored,
        foreign key <code>technicals_id</code>, <code>notation_type</code> <code>technicals</code>.
    </div>
    <div class="table-info">
        The <code>technical</code> table is single-inheritance with discriminator column <code>technical_type</code>.
    </div>
    <div class="table-info">
        Discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">up bow</li>
            <li class="discriminator-value">down bow</li>
            <li class="discriminator-value">harmonic</li>
            <li class="discriminator-value">open string</li>
            <li class="discriminator-value">thumb position</li>
            <li class="discriminator-value">fingering</li>
            <li class="discriminator-value">pluck</li>
            <li class="discriminator-value">double tongue</li>
            <li class="discriminator-value">triple tongue</li>
            <li class="discriminator-value">stopped</li>
            <li class="discriminator-value">snap pizzicato</li>
            <li class="discriminator-value">fret</li>
            <li class="discriminator-value">string number</li>
            <li class="discriminator-value">hammer on</li>
            <li class="discriminator-value">pull off</li>
            <li class="discriminator-value">bend</li>
            <li class="discriminator-value">tap</li>
            <li class="discriminator-value">heel</li>
            <li class="discriminator-value">toe</li>
            <li class="discriminator-value">fingernails</li>
            <li class="discriminator-value">hole</li>
            <li class="discriminator-value">arrow</li>
            <li class="discriminator-value">handbell</li>
            <li class="discriminator-value">brass bend</li>
            <li class="discriminator-value">flip</li>
            <li class="discriminator-value">smear</li>
            <li class="discriminator-value">open</li>
            <li class="discriminator-value">half muted</li>
            <li class="discriminator-value">harmon mute</li>
            <li class="discriminator-value">golpe</li>
            <li class="discriminator-value">other technical</li>
        </ul>
    </div>
    <div class="table-info">
        The <code>string number</code> discriminator value is used by the <code>string</code> element.
    </div>
    <div class="table-info">
        <code>technical</code> table fields:
        <ul>
            <li>
                <code>type</code>:
                <code>harmonic</code> subelement name <code>natural</code> or <code>artificial</code>;
                <code>hammer-on</code> and <code>pull-off</code> <code>type</code> attribute;
                <code>bend</code> subelement name <code>pre-bend</code> or <code>release</code>;
                <code>hole-type</code> element text
            </li>
            <li><code>harmonic_pitch</code>: stores the subelement name <code>base-pitch</code>, <code>touching-pitch</code>, or
                <code>sounding-pitch</code></li>
            <li><code>string_number</code>: <code>string</code> element text</li>
            <li><code>value</code>: <code>fingering</code>, <code>pluck</code>, <code>fret</code>, <code>hammer-on</code>,
                <code>pull-off</code>, <code>tap</code>, <code>handbell</code>, <code>other-technical</code> element text;
                <code>harmon-mute</code> element's <code>harmon-closed</code> subelement text</li>
            <li><code>notation_number</code>: <code>hammer-on</code>, <code>pull-off</code> <code>number</code> attribute</li>
            <li><code>tap_hand</code>: <code>hand</code> attribute value for a tap</li>
            <li><code>hole_closed</code>: a hole's <code>hole-closed</code> subelement text</li>
            <li>
                location:
                <code>hole-closed</code> element's <code>location</code> attribute;
                <code>harmon-closed</code> element's <code>location</code> attribute
            </li>
        </ul>
    </div>
    <div class="table-info">
        <code>techcnical</code> table joins:
        <ul>
            <li><code>bend_with_bar</code>: <code>with-bar</code> subelement data for a bend</li>
            <li><code>bend_sound</code>: <code>bend-sound</code> attributeGroup data for a bend</li>
        </ul>
    </div>
    <div class="table-info">
        Additionally a frame note has three types of technical as data members: string number, fret, and fingering.
        These data members join to the <code>technical</code> table with foreign keys <code>string_id</code>,
        <code>fret_id</code>, and <code>fingering_id</code>.
    </div>
</div>

<div id="text_display" class="table-content">
    <div class="table-info">
        A <code>text_display</code> record represents the <code>display-text</code>/<code>accidental-text</code> choice that appears in both the
        <code>notehead-text</code> and <code>name-display</code> complexType.
    </div>
    <div class="table-info">
        <code>text_display</code> is a single-inheritance table with discriminator column <code>text_display_type</code>.
    </div>
    <div class="table-info">
        Discriminator values are;
        <ul class="discriminator-values">
            <li class="discriminator-value">display text</li>
            <li class="discriminator-value">accidental text</li>
        </ul>
    </div>
    <div class="content-subsection">Formatted Display</div>
    <div class="table-info">
        Both text display types are implemented as formatted display types.
        That is, they have both an associated <code>display</code> record and an associated <code>text_format</code> record.
        Foreign keys are <code>display_id</code> and <code>text_format_id</code>.
    </div>
    <div class="table-info">
        The text value is in <code>text_format</code>, field <code>value</code>, as with all formatted display objects.
    </div>
    <div class="content-subsection">accidental text</div>
    <div class="table-info">
        Field <code>accidental_type</code> stores the <code>accidental-text</code> element value.
    </div>
    <div class="content-subsection">Text display as data member</div>
    <div class="table-info">
        The <code>notehead-text</code> element of a note has a list of text display records
        that join from <code>text_display</code> (foreign key <code>note_id</code>) to the note record in
        <code>music_data</code>.
    </div>
    <div class="table-info">
        A name display type has a list of text display records
        that join from <code>text_display</code> (foreign key <code>name_display_id</code>) to the <code>name_display</code> record.
    </div>
</div>

<div id="text_format" class="table-content">
    <div class="table-info">
        Any object type that includes attributeGroup <code>text-formatting</code>, or whose definition includes any attributes defined in the attributeGroup
        <code>text-formatting</code> in the MusicXML schema
        stores its text data in the <code>text_format</code> table.
    </div>
    <div class="table-info">
        Element text is stored in field <code>value</code>.
    </div>
    <div class="table-info">
        All attributes in the <code>text-formatting</code> attributeGroup in the MusicXML schema are stored in the <code>text_format</code> table,
        except for attributeGroup <code>print-style-align</code> which are <code>display</code> table fields.
    </div>
    <div class="table-info">
        Exceptions:
    </div>
    <div class="table-info">
        Some database record types have a single scalar value found in attributeGroup <code>text-formatting</code>, and these single values are stored with the main record:
        <ul>
            <li><code>justify</code>: metronome, lyric, <code>part-name-text</code>, and <code>group-name-text</code></li>
            <li><code>xml:lang</code>: directive and lyric language</li>
            <li><code>enclosure</code>: percussion</li>
        </ul>
    </div>
    <div class="content-subsection">Direction types</div>
    <div class="table-info">
        Direction types <code>dynamics</code>, <code>rehearsal</code>, <code>symbol</code>, and <code>words</code> in the <code>direction_type</code> table have a <code>text_format</code> record, foreign key
        <code>text_format_id</code>.
    </div>
    <div class="content-subsection">Formatted display types</div>
    <div class="table-info">
        Data types <code>footnote</code>, <code>text_display</code>, <code>lyric_text_data</code>, and
        <code>credit_display</code> are all of formatted display type which uses the <code>text_format</code> and <code>display</code> tables to store their data.
        See the Formatted Display page, and these tables in the table reference for more information.
    </div>
</div>

<div id="tie" class="table-content">
    <div class="table-info">
        A list of ties belongs to a note, which is in the <code>music_data</code> table.  Foreign key <code>note_id</code>.
    </div>
</div>

<div id="time" class="table-content">
    <div class="table-info">
        A record in the <code>time</code> table stores the data as defined in the <code>time</code> complexType in the MusicXML schema.
        A list of <code>time</code> records belongs to an <code>attributes</code> record in the <code>music_data</code> table, foreign key
        <code>attributes_id</code>.
    </div>
    <div class="table-info">
        The <code>time</code> table is single-inheritance, with discriminator column <code>time_type</code>.
        The discriminator value depends on the choice employed in the xs:choice section of the <code>time</code> complexType.
    </div>
    <div class="table-info">
        Discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">time signature</li>
            <li class="discriminator-value">senza misura</li>
        </ul>
    </div>
    <div class="table-info">
        For either disriminator value:
        <ul>
            <li>The <code>number</code> attribute is in field <code>time_number</code></li>
            <li>The <code>separator</code> attribute is in field <code>time_separator</code></li>
        </ul>
    </div>
    <div class="content-subsection">time signature</div>
    <div class="table-info">
        A time signature consists of a list of <code>beats</code>/<code>beat-type</code> elements in sequence,
        followed by an optional <code>interchangeable</code> element.
    </div>
    <div class="table-info">
        Each <code>beats</code>/<code>beat-type</code> element sequence is a record in the <code>time_signature_type</code> table.
        The text of elements <code>beats</code> and <code>beat-type</code> is stored in fields <code>beats</code> and
        <code>beat_type</code>, respectively.
        Foreign key for the record is <code>time_signature_id</code>.
    </div>
    <div class="content-subsection">interchangeable</div>
    <div class="table-info">
        The foreign key for a time signature's <code>interchangeable</code> record is <code>interchangeable_id</code> in the
        <code>time</code> table.
    </div>
    <div class="table-info">
        Attribute <code>separator</code> value is in field <code>time_separator</code>.
    </div>
    <div class="table-info">
        An <code>interchangeable</code> has itself a list of <code>time_signature_type</code> records.
        The foreign key for this list in the <code>time_signature_type</code> table is <code>interchangeable_id</code>.
    </div>
    <div class="content-subsection">senza misura</div>
    <div class="table-info">
        The <code>senza-misura</code> element text is in <code>time</code> table field <code>value</code>.
    </div>
</div>

<div id="time_modification" class="table-content">
    <div class="table-info">
        A <code>time_modification</code> record belongs either to a note in the <code>music_data</code> table,
        or a <code>metronome_tuplet</code> record.
        Foreign key in either case is <code>time_modification_id</code>.
    </div>
    <div class="table-info">
        Field <code>normal_dots</code> contains the count of the <code>normal-dot</code> subelements.
    </div>
</div>

<div id="time_signature_type" class="table-content">
    <div class="table-info">
        A <code>time_signature_type</code> record holds the data for the xs:group <code>time-signature</code> in the MusicXML schema.
    </div>
    <div class="table-info">
        A list of <code>time_signature_type</code> records belongs to a <code>time</code> table record when the <code>time_type</code> is
        <code>time signature</code>.
        The foreign key in <code>time_signature_type</code> is <code>time_signature_id</code>.
    </div>
    <div class="table-info">
        An interchangeable type can also have a list of <code>time_signature_type</code> records.
        The foreign key in <code>time_signature_type</code> is <code>interchangeable_id</code>.
    </div>
</div>

<div id="transpose" class="table-content">
    <div class="table-info">
        <code>transpose</code> has a many-to-one relationship with an attributes record in the <code>music_data</code> table, foreign key
        <code>attributes_id</code>.
    </div>
    <div class="table-info">
        The presence or absence of a <code>double</code> subelement is in boolean field <code>doubled</code>.
    </div>
    <div class="table-info">
        Attribute <code>number</code> value is in field <code>staff_number</code>.
    </div>
</div>

<div id="trill_sound" class="table-content">
    A <code>trill_sound</code> record belongs to the following types of ornaments, whose records are in the
    <code>ornaments</code> table, and joined using foreign key <code>trill_sound_id</code>:
    <ul>
        <li>wavy line</li>
        <li>
            placed trill sounds:
            <ul>
                <li>
                    mordent types:
                    <ul>
                        <li>mordent</li>
                        <li>inverted mordent</li>
                    </ul>
                </li>
                <li>trill mark</li>
                <li>vertical turn</li>
                <li>inverted vertical turn</li>
                <li>shake</li>
                <li>haydn</li>
            </ul>
        </li>
        <li>
            horizontal turn types:
            <ul>
                <li>turn</li>
                <li>delayed turn</li>
                <li>inverted turn</li>
                <li>delayed inverted turn</li>
            </ul>
        </li>
    </ul>
</div>

<div id="tuning" class="table-content">
    <div class="table-info">
        A <code>tuning</code> record belongs to either an <code>accord</code> or <code>staff_tuning</code> record, foreign key
        <code>tuning_id</code>.
    </div>
</div>

<div id="tuplet_dot" class="table-content">
    <div class="table-info">
        <code>tuplet_dot</code> has a one-to-many relationship to <code>tuplet_portion</code>.
    </div>
    <div class="table-info">
        The <code>tuplet-dot</code> element has its own <code>display</code> attributes, which necessitates moving the
        <code>tuplet-dot</code> data to its own table.
    </div>
</div>

<div id="tuplet_number" class="table-content">
    <div class="table-info">
        A <code>tuplet_number</code> record belongs to a <code>tuplet_portion</code>.
        The foreign key in <code>tuplet_portion</code> is <code>tuplet_number_id</code>.
    </div>
</div>

<div id="tuplet_portion" class="table-content">
    <div class="table-info">
        A <code>tuplet</code> notation table record has two <code>tuplet_portion</code> records, one each for <code>tuplet-actual</code> and
        <code>tuplet-normal</code> subelement data.
        The foreign keys to these two records in the <code>notation</code> table are <code>tuplet_actual_id</code> and
        <code>tuplet_normal_id</code>, respectively.
    </div>
    <div class="table-info">
        A <code>tuplet_portion</code> record has:
        <ul>
            <li><code>tuplet-number</code> element data in table <code>tuplet_number</code>, foreign key <code>tuplet_number_id</code></li>
            <li><code>tuplet-type</code> element data in table <code>tuplet_type</code>, foreign key
                <code>tuplet_type_id</code></li>
            <li>a list of <code>tuplet-dot</code> element data records in table <code>tuplet_dot</code>; foreign key in
                <code>tuplet_dot</code> is <code>tuplet_portion_id</code></li>
        </ul>
    </div>
</div>

<div id="tuplet_type" class="table-content">
    <div class="table-info">
        Stores the data for complexType <code>tuplet-type</code> in the MusicXML schema.
    </div>
    <div class="table-info">
        Belongs to a <code>tuplet_portion</code> record, foreign key <code>tuplet_type_id</code>.
    </div>
</div>

<div id="virtual_instrument" class="table-content">
    <div class="table-info">
        Belongs to score instrument, which belongs to a score part.
        Foreign key in <code>score_instrument</code> is <code>virtual_instrument_id</code>.
    </div>
</div>

<div id="work" class="table-content">
    <div class="table-info">
        A <code>work</code> record belongs to a score header, foreign key <code>work_id</code>.
    </div>
    <div class="table-info">
        The <code>opus</code> subelement data is in table <code>link_attributes</code>, foreign key <code>opus_id</code>.
    </div>
</div>

<div id="xml_comment" class="table-content">
    <div class="table-info">
        One <code>xml_comment</code> record is created for each comment and processing instruction in a MusicXML file during a conversion from a MusicXML file to a database record
        using the tasks interface.
    </div>
    <div class="table-info">
        The <code>xml_comment</code> table is not part of the MusicXML schema definition.
        It's an additional feature table that stores comment data so that when a user converts a database record back to a MusicXML file,
        the content and placement of comments are preserved as in the original file.
    </div>
    <div class="table-info">
        Users can optionally select to not include comments in a MusicXML file to database conversion.
    </div>
    <div class="content-subsection"><code>data</code> and <code>target</code> fields</div>
    <div class="table-info">
        <code>data</code> and <code>target</code> field values are taken from the Java DOM implementation.
    </div>
    <div class="table-info">
        For an xml comment, the <code>data</code> field value is the comment string minus the leading <code>&lt;!--</code> and trailing
        <code>--&gt;</code>
    </div>
    <div class="table-info">
        For a processing instrucution the <code>data</code> and <code>target</code> values are as shown below:
    </div>
    <div class="table-info">
        <code>&lt;?target data?&gt;</code>
    </div>
    <div class="content-subsection"><code>parent</code> and <code>next_sibling</code> fields</div>
    <div class="table-info">
        The <code>parent</code> and <code>next_sibling</code> field values are taken from XPath.
    </div>
    <div class="table-info">
        Values are always a fully-specified path with predicates.
    </div>
    <div class="table-info">
        Examples:
    </div>
    <div class="table-info">
        For a comment in the score header's defaults section, and before the appearance element the <code>parent</code> and
        <code>next_sibling</code> field values are:
        <ul>
            <li><code>parent</code>: <code>/score-partwise[1]/defaults[1]</code></li>
            <li><code>next_sibling</code>: <code>appearance[1]</code></li>
        </ul>
    </div>
    <div class="table-info">
        <code>next_sibling</code> is null when the comment appears after every subelement of the parent element.
    </div>
    <div class="table-info">
        parent is an empty string when the comment appears before the first element in the file.
    </div>
</div>

<script type="text/javascript">
    var includeSection = '${param.tableName}';
</script>
<script type="text/javascript" src="js/tableContent.js"></script>
