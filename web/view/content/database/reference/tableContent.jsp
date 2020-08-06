<div class="content-section">Table name: ${param.tableName}</div>

<div id="accidental" class="table-content">
    <div class="table-info">
    The accidental's note is in music_data, music_data_type "note".
    </div>
    <div class="table-info">
        accidental_type field contains the XML element's accidental-type enumeration value (see enumerations on the main Database Layout page).
    </div>
</div>

<div id="accord" class="table-content">
    <div class="table-info">
    Joins to the direction_type table which has the accord's scordatura.
    </div>
</div>

<div id="articulation" class="table-content">
    <div class="table-info">
    An articulation record is one of a list of articulations.  The articulations list is in table notation, notation_type "articulations", to which the articulation record joins.
    </div>
    <div class="table-info">
        Field articulation_type is the discriminator value that indicates the type of articulation.
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
        Lined articulations doit, falloff, plop, and scoop use the line table.
    </div>
    <div class="table-info">
        breath_mark_value and caesura_value are enumeration values for the breath mark and caesura, respectively.
    </div>
    <div class="table-info">
The value field is used to store an "other articulation" value.
    </div>
    </div>

<div id="barline_ending" class="table-content">
    <div class="table-info">
    Stores the MusicXML "ending" element data.
    </div>
    <div class="table-info">
        Field barline_type is the "type" attribute enumeration.
    </div>
    <div class="table-info">
        Field "value" contains the "ending" element's text value.
    </div>
    <div class="table-info">
        The barline record is in music_data, music_data_type value "barline", joined on field barline_ending_id.
    </div>
</div>

<div id="barline_repeat" class="table-content">
    <div class="table-info">
        Stores the MusicXML "repeat" element data.
    </div>
    <div class="table-info">
        The barline record is in music_data, music_data_type value "barline", joined on field barline_repeat_id.
    </div>
</div>

<div id="beam" class="table-content">
    <div class="table-info">
        The beam record joins to the note in music_data, music_data_type "note".
    </div>
    <div class="table-info">
        Field type contains the beam--type enumeration value.
    </div>
</div>

<div id="bend_sound" class="table-content">
    <div class="table-info">
        A bend sound belongs to either a slide or a bend.
    </div>
    <div class="table-info">
    When a bend sound is attached to a slide, the join is to table notation, since slide is a type of notation.  The notation table notation_type field value is "slide" in this case.
    </div>
    <div class="table-info">
        When a bend sound is attached to a bend, the join is to table technical, since bend is a type of technical.  The technical table technical_type field value is "bend" in this case.
    </div>
    <div class="table-info">
        Join field to the bend_sound record in each of these tables is bend_sound_id.
    </div>
</div>

<div id="bend_with_bar" class="table-content">
    <div class="table-info">
        Stores the bend element's "with-bar" subelement data.
    </div>
    <div class="table-info">
        Element text is stored in the "value" field.
    </div>
    <div class="table-info">
Other display attributes are stored in the joined display table.
    </div>
    <div class="table-info">
The bend record is in the technical table, technical_type "bend".
    </div>
</div>

<div id="bezier" class="table-content">
    <div class="table-info">
        Attached to either a slur or a tied.
    </div>
    <div class="table-info">
        Both slur and tied are notations whose records are in table notation, discriminator values "slur" and "tied", respectively, using foreign key bezier_id.
    </div>
</div>

<div id="clef" class="table-content">
    <div class="table-info">
        clef has a many-to-one relationship with the attributes record in table music_data, music_data_type value "attributes", join column attributes_id.
    </div>
</div>

<div id="credit" class="table-content">
    <div class="table-info">
        The list of credits in a score header join to table score_header on foreign key score_header_id.
    </div>
    <div class="table-info">
        credit-type subelements are stored in joined table credit_type.
    </div>
    <div class="table-info">
        "link", "bookmark", "credit-image", "credit-words", and "credit-symbol" subelements are processed and stored as credit_display records.
        See credit_display for more details.
    </div>
</div>

<div id="credit_display" class="table-content">
    <div class="table-info">
        The "credit" element's subelements "link", "bookmark", "credit-image", "credit-words", and "credit-symbol" are collectively implemented as the abstract class CreditDisplay.
    </div>
    <div class="table-info">
        A credit has a list of credit display items, joined on field credit_id.
    </div>
    <div class="table-info">
        The implemented classes of CreditDisplay, along with their credit_display_type field discriminator values, are:
        <ul class="discriminator-values">
            <li class="discriminator-value">CreditImage: "credit image"</li>
            <li class="discriminator-value">CreditWords: "credit words"</li>
            <li class="discriminator-value">CreditSymbol: "credit symbol"</li>
        </ul>
    </div>
    <div class="content-subsection">Links and bookmarks</div>
    <div class="table-info">
        Each type of credit display can have a list of links and bookmarks.
        Both link and bookmark are types of music data.  A link or bookmark record is in the music_data table, music_data_type "link" or "bookmark", and joined to credit display on field credit_display_id
    </div>
    <div class="content-subsection">CreditImage</div>
    <div class="table-info">
        CreditImage is a type of image which is a music data type, discriminator field music_data_type value "image".  The relationship is one-to-one with image and joins on credit_display field image_id.
    </div>
    <div class="content-subsection">CreditWords and CreditSymbol</div>
    <div class="table-info">
        Text, formatting, and display values are stored in tables text_format and display, as with any other formatted text types.
    </div>
</div>

<div id="credit_type" class="table-content">
    <div class="table-info">
        Stores the list of "credit-type" element values of a "credit" element.
        The text is stored in field "type".
    </div>
</div>

<div id="dashed_formatting" class="table-content">
    <div class="table-info">
        Direction types and notations that have dashed formatting attributes join to the dashed_formatting table using foreign key dashed_formatting_id.
    </div>
    <div class="table-info">
        Lined articulations (scoop, plop, doit, falloff) join to the line table, foreign key line_id, which in turn joins to the dashed_formatting table, foreign key dashed_formatting_id.
    </div>
    <div class="table-info">
        All direction types, notations, and articulations stored their display information in the display table, joined directly using foreign key display_id.
    </div>
</div>

<div id="defaults" class="table-content">
    <div class="table-info">
        Defaults belongs to a score header, foreign key defaults_id.
    </div>
    <div class="table-info">
        music-font and word-font subelements are in table font, foreign keys music_font_id and word_font_id.
    </div>
    <div class="table-info">
        One-to-many lyric-font and lyric-language subelements are in tables lyric_font and lyric_language, foreign key defaults_id.
        The lyric font's font information is in table font, foreign key font_id.
    </div>
    <div class="table-info">
        scaling sublement values are in fields scaling_millimeters and scaling_tenths.
    </div>
    <div class="table-info">
        Subelements of appearance all have a one-to-many relationship and each of its subelement values are stored in tables line_width, note_size, distance, glyph, and other_appearance.
        Each table's foreign key to the defaults table is defaults_id.
    </div>
</div>

<div id="direction_offset" class="table-content">
    <div class="table-info">
        Stores "offset" subelement data for music data types sound, direction, and harmony.  Foreign key offset_id.
    </div>
</div>

<div id="direction_type" class="table-content">
    <div class="table-info">
        The direction_type table stores every kind of direction type as defined by the MusicXML schema's complexType "direction-type".
        Direction type records correspond to subelements of element "direction-type".
    </div>
    <div class="table-info">
        A direction-type element may have more than one subelement, so each direction_type record belongs to a direction_type_list record using foreign key direction_type_list_id.
    </div>
    <div class="content-subsection">Discriminator values</div>
    <div class="table-info">
        direction_type_type is the discriminator value field that distinguishes the type of direction type.
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
        Additionally, all percussion element subelements are treated as direction types.
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
        All direction types join to display, foreign key display_id.  Direction types with text values join to text_format, foreign key text_format_id.
    </div>
    <div class="table-info">
        The "type" attribute value is stored in field direction_type.
    </div>
    <div class="table-info">
        The "number" attribute value is stored in field direction_type_number.
    </div>
    <div class="table-info">
        Dynamics markings for dynamics are in table dynamics_marking, one-to-many foreign key join on dynamics_id.
    </div>
    <div class="table-info">
        A beat metronome has two foreign keys to metronome_mark, metronome_mark_1_id and metronome_mark_2_id.
    </div>
    <div class="table-info">
        A note metronome has two lists of metronome_note records.  The foreign keys in metronome_note to distinguish these two lists are note_metronome_1_id and note_metronome_2_id.
    </div>
    <div class="table-info">
        Pedal tunings for harp pedals are in pedal_tuning, foreign key harp_pedals_id.
    </div>
    <div class="table-info">
        Accords for scordatura are in table accord, foreign key scordatura_id.
    </div>
    <div class="table-info">
        The text element value for the other-direction and other-percussion elements is stored in field "value".
    </div>
    <div class="table-info">
        Percussion elements that have their text element value defined in the MusicXML schema as an enumeration value store that value in the direction_type field:
        glass, metal, wood, pitched, membrane, effect, beater, and stick location.
    </div>
</div>

<div id="direction_type_list" class="table-content">
    <div class="table-info">
        A direction_type_list record corresponds to the direction-type element.
        Individual direction-type subelements are stored in the direction_type table, referenced by foreign key direction_type_list_id.
    </div>
    <div class="table-info">
        Its direction element parent is a music_data record with music_data_type value "direction".
    </div>
</div>

<div id="directive" class="table-content">
    <div class="table-info">
        The directive element is a list of subelenents of attributes.
    </div>
    <div class="table-info">
        The attributes record is stored in music_data, music_data_type value "attributes".  Foreign key in the directive table is attributes_id.
    </div>
    <div class="table-info">
        The directive element's text data is stored in field "value".
    </div>
</div>

<div id="display" class="table-content">
    <div class="table-info">
        Several commonly-occurring display values are aggregated and stored in the display table and its companion font table.
        These display values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">position, x-position, and y-position values: default-x, default-y, relative-x, relative-y</li>
            <li class="discriminator-value">placement</li>
            <li class="discriminator-value">font</li>
            <li class="discriminator-value">color</li>
            <li class="discriminator-value">halign</li>
            <li class="discriminator-value">valign and valign-image</li>
        </ul>
        Exception: Defaults element fonts (music-font, word-font, lyric-font) are not directly displayed, so their font table records join directly to the defaults table.
    </div>
    <div class="table-info">
        If any of the values above are defined for a displayed element, a display record will be created for that displayed element.
        If none of the values above are defined, then no display record will be created for that displayed element.
    </div>
    <div class="table-info">
        All displayed element table definitions are identical:
        a foreign key display_id in the displayed element's table that joins to table "display" if any display field is defined,
        which itself joins to table "font" on foreign key font_id if any font field is defined.
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

<script type="text/javascript">
    var includeSection = '${param.tableName}';
</script>
<script type="text/javascript" src="js/tableContent.js"></script>
