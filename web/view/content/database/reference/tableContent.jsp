<div class="content-section">${param.tableName}</div>

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
        Field articulation_type is the discriminator column that indicates the type of articulation.
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
        The implemented classes of CreditDisplay, and their credit_display_type column values, are:
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
        direction_type_type is the discriminator column that distinguishes the direction type.
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

<div id="distance" class="table-content">
    <div class="table-info">
        All subelements of the appearance element have a one-to-many relationship to the defaults table, foreign key defaults_id.
    </div>
</div>

<div id="dot" class="table-content">
    <div class="table-info">
        Dots belong to a note in the music_data table, and have their own display data.
    </div>
</div>

<div id="dynamics_marking" class="table-content">
    <div class="table-info">
        All of the subelements of a "dynamics" element are stored in the dynamics_marking table, one record per subelement.
        The element name (e.g., "p", "ff") is in the dynamics_type field.
        The element text for the "other-dynamics" type is in field "value".
    </div>
    <div class="table-info">
        The enclosing "dynamics" element data is in table direction_type, and its one-to-many foreign key is dynamics_id.
    </div>
</div>

<div id="editorial" class="table-content">
    <div class="table-info">
        Editorial info can be attached to a wide variety of items:
    </div>
    <div class="table-info">
        music_data table records, music_data_type values "attributes", "barline", "harmony", "figured bass", and "backup"
    </div>
    <div class="table-info">
        part-group element data is found in table part_list_item, part_list_item_type value "part group".
    </div>
</div>

<div id="editorial_level" class="table-content">
    <div class="table-info">
    Table editorial_level corresponds to the "editorial" element's "level" subelement.
    </div>
</div>

<div id="elision" class="table-content">
    <div class="table-info">
        A lyric syllable consists of an elision/syllabic/text combination.  The elision table contains the elision element data.
    </div>
</div>

<div id="encoding" class="table-content">
    <div class="table-info">
        encoding is a single-table inheritance table with discriminator column encoding_type.
        Each record corresponds to an "encoding" subelement.
    </div>
    <div class="table-info">
        Depending upon the subelement name, the value in field encoding_type is one of the following:
        <ul class="discriminator-values">
            <li class="discriminator-value">encoding data</li>
            <li class="discriminator-value">encoder</li>
            <li class="discriminator-value">software</li>
            <li class="discriminator-value">encoding description</li>
            <li class="discriminator-value">supports</li>
        </ul>
    </div>
    <div class="table-info">
        If the encoding_type is "encoder", the record has a joined identification_type record, foreign key encoder_id.
        Its id_name value is "encoder", id_value is the element text, and id_type is the "type" attribute value.
    </div>
</div>

<div id="except_voice" class="table-content">
    <div class="table-info">
        A slash_group record stores the data for the MusicXML schema's "slash" group,
        which is a combination of "slash-type", "slash-dot", and "except-voice" elements.
        Each "except-voice" element has a separate record, with the element text in the value field.
    </div>
</div>

<div id="feature" class="table-content">
    <div class="table-info">
        The "grouping" element's "feature" subelements, one record per feature element.
        Foreign key for the grouping record in music_data is grouping_id.
    </div>
</div>

<div id="figure" class="table-content">
    <div class="table-info">
        Represents the MusicXML "figure" element.
        The figured bass record that a list of figures belongs to is in the music_data table, music_data_type "figured bass", foreign key figured_bass_id.
    </div>
    <div class="table-info">
        Subelements prefix, figure-number, and suffix are all figure_part records.
    </div>
    <div class="table-info">
        Subelement "extend" is a lyric_item record, lyric_item_type "extend", foreign key extend_id.
    </div>
</div>

<div id="figure_part" class="table-content">
    <div class="table-info">
        Holds the data for the prefix, figure-number, and suffix subelements of the figure element.
    </div>
</div>

<div id="font" class="table-content">
    <div class="table-info">
        For displayed items, a font record is created at the same time as the display record it belongs to, using foreign key font_id, when the displayed item has any font field defined.
    </div>
    <div class="table-info">
        Fonts defined in the defaults element of a score header (music-font and word-font) join directly to the font table.
        The list of lyric-font subelements of defaults are joined separately through the lyric_font table.
    </div>
</div>

<div id="footnote" class="table-content">
    <div class="table-info">
        The footnote type has both display and text format attribute definitions.  Those values are stored in the corresponding joined tables.
    </div>
</div>

<div id="frame" class="table-content">
    <div class="table-info">
        A frame belongs to a harmony object in the music_data table, music_data_type value "harmony".
    </div>
</div>

<div id="frame_note" class="table-content">
    <div class="table-info">
        Three subelements of frame-note are defined in the MusicXML schema as technical types.
        Data for these subelements are in the technical table as follows:
    </div>
    <div class="table-info">
        string: technical_type "string number", value in field string_number.
    </div>
    <div class="table-info">
        fret: technical_type "fret", value in field value.
    </div>
    <div class="table-info">
        fingering: technical_type "fingering", data in fields value, substitution, and alternate.
    </div>
</div>

<div id="glyph" class="table-content">
    <div class="table-info">
        glyph is a subelement of appearance, part of the defaults structure.
        All subelements of the appearance element have a one-to-many relationship to the defaults table, foreign key defaults_id.
    </div>
</div>

<div id="grace" class="table-content">
    <div class="table-info">
        A grace belongs to a note in the music_data table.
    </div>
</div>

<div id="group_barline" class="table-content">
    <div class="table-info">
        Belongs to a part group that is in the part_list_item table, foreign key group_barline_id.
    </div>
</div>

<div id="group_name" class="table-content">
    <div class="table-info">
        Stores both the group name and group abbreviation of a part group.  The part group record is in the part_list_item table.
        Foreign keys in part_list_item are group_name_id and group_abbreviation_id.
    </div>
</div>

<div id="group_symbol" class="table-content">
    <div class="table-info">
        Stores the group symbol of a part group.  The part group record is in the part_list_item table.
        Foreign key in part_list_item is group_symbol_id.
    </div>
</div>

<div id="harmony_chord" class="table-content">
    <div class="table-info">
        A list of harmony_chord records belongs to a harmony record in the music_data table, music_data_type "harmony", foreign key in harmony_chord is harmony_id.
    </div>
    <div class="table-info">
        The harmony_chord table is a single-inheritance table with discriminator field harmony_chord_type.
        harmony_chord_type values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">root</li>
            <li class="discriminator-value">function</li>
        </ul>
    </div>
    <div class="table-info">
        A harmony_chord_type "root" record has root_step and root_alter records, foreign keys root_step_id and root_alter_id.
    </div>
    <div class="table-info">
        A harmony_chord_type "function" record stores its element text data in the "value" field and its display info in the display table.
    </div>
</div>

<div id="identification" class="table-content">
    <div class="table-info">
        An identification belongs to either a score_header, or a "score part" part_list_item_type in table part_list_item.  Foreign key identification_id.
    </div>
    <div class="table-info">
        Subelements creator, rights, and relation are stored in table identification_type.
        Field id_name is the subelement name, field id_type is the "type" attribute of the subelement, and field id_value is the subelement text value.
    </div>
</div>

<div id="identification_type" class="table-content">
    <div class="table-info">
        An identification_type record can be either:
    </div>
    <div class="table-info">
        An identification element's creator, rights, and relation subelements.
    </div>
    <div class="table-info">
        An encoding element's encoder subelement.
    </div>
    <div class="table-info">
        In either case, the id_name is the subelement name, id_type is the subelement's "type" attribute value, and id_value is the subelement's text data.
    </div>
</div>

<div id="instrument_type" class="table-content">
    <div class="table-info">
        instrument_type is a single-inheritance table with discriminator field instrument_type, and stores the solo or ensemble subelement data of element score-instrument.
        Possible values of field instrument type are:
        <ul class="discriminator-values">
            <li class="discriminator-value">solo</li>
            <li class="discriminator-value">ensemble</li>
        </ul>
    </div>
</div>

<div id="interchangeable" class="table-content">
    <div class="table-info">
        Stores the interchangeable element data that is a subelement of the time element.  Foreign key interchangeable_id.
    </div>
    <div class="table-info">
        Any iterations of an interchangeable element's beats and beat-type subelements (group time-signature) are stored in table time_signature_type, foreign key interchangeable_id.
    </div>
</div>

<div id="key_octave" class="table-content">
    <div class="table-info">
        Stores the data of all key-octave subelements of a key element, one record per key-octave element, foreign key key_id.
    </div>
</div>

<div id="key_signature" class="table-content">
    <div class="table-info">
        A key_signature record represents the data of a MusicXML "key" element.
        One or more key elements may appear within an attributes element.
        All of the key_signature records within an attributes element join to table music_data, music_data_type "attributes", foreign key attributes_id.
    </div>
    <div class="table-info">
        The key_signature table is single-inheritance with discriminator column key_type.
        Possible values of key_type are:
        <ul class="discriminator-values">
            <li class="discriminator-value">traditional key</li>
            <li class="discriminator-value">non-traditional key</li>
        </ul>
        The key_type value depends on the presence of traditional-key or non-traditional-key elements.
    </div>
    <div class="table-info">
        Each key-octave subelement is a record in table key_octave, foreign key key_id.
    </div>
    <div class="table-info">
        A traditional key stores its element values in fields cancel_fifths, fifths, and key_mode for elements cancel, fifths, and mode, respectively.
    </div>
    <div class="table-info">
        Multiple non-traditional key element groups store their values in the non_traditional_key_type table.
        The key-step, key-alter, key-accidental element text values are stored in fields key_step, key_alter, and key_accidental, respectively.
        The key-accidental element's smufl attribute is stored in field key_accidental_smufl.
    </div>
</div>

<div id="layout" class="table-content">
    <div class="table-info">
        A layout consists of a page_layout record, a system_layout record, and a list of staff_layout records.
    </div>
    <div class="table-info">
        A layout can belong to a defaults record, or to a print record in the music_data table, music_data_type "print".
    </div>
</div>

<div id="level_display" class="table-content">
    <div class="table-info">
        The join to the notation table is for an accidental-mark which is a notation record, notation_type "accidental mark".
    </div>
</div>

<div id="line" class="table-content">
    <div class="table-info">
        The line table is used for lined articulations (doit, falloff, plop, scoop), MusicXML schema complexType empty-line.
    </div>
</div>

<div id="line_width" class="table-content">
    <div class="table-info">
        All subelements of the appearance element have a one-to-many relationship to the defaults table, foreign key defaults_id.
    </div>
</div>

<div id="link_attributes" class="table-content">
    A link_attributes record stores the data for a work element's opus subelement,
    or for a link element which is a music_data record, music_data_type "link".
</div>

<div id="lyric" class="table-content">
    <div class="table-info">
        A list of lyric records belongs to a note whose record is in the music_data table, foreign key note_id for each lyric in the list.
    </div>
    <div class="table-info">
        The lyric_item record for a lyric has the data for the xs:choice section of the lyric complexType in the MusicXML schema.
        See lyric_item for details.
    </div>
</div>

<div id="lyric_font" class="table-content">
    <div class="table-info">
        One-to-many relationship to defaults, foreign key defaults_id.
    </div>
</div>

<div id="lyric_item" class="table-content">
    <div class="table-info">
        A lyric_item record encapsulates the data definition of the xs:choice section of the lyric complexType in the MusicXML schema.
    </div>
    <div class="table-info">
        The lyric_item table is single-inheritance, discriminator column lyric_item_type.
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
        A lyric text record has a list of lyric syllables stored in the lyric_syllable table, foreign key lyric_text_id.
    </div>
    <div class="table-info">
        When the first subelement of a lyric element is either "syllabic" or "text", the lyric element's subelements are iterated,
        and when a "text" element is reached, the "elision", "syllabic", and "text" elements up to that point are aggregated into a lyric_syllable record.
        The iteration then continues, creating any other lyric syllable records until the lyric element's subelements are exhausted.
    </div>
    <div class="table-info">
        Finally, if there is a trailing extend element, an extend record is added to the lyric_item table, and self-joined to the lyric text using foreign key extend_id
        (both the extend and the lyric text are stored in the lyric_item table).
    </div>
    <div class="content-subsection">Display</div>
    <div class="table-info">
        Display info for an extend lyric item type is joined directly from the lyric_item table using foreign key display_id.
        Display info for a text is handled via the lyric_syllable table where the text data is stored.
    </div>
    <div class="content-subsection">figure</div>
    <div class="table-info">
        An extend record can also belong to a figure record.  The foreign key in the figure table is extend_id.
    </div>
</div>

<div id="lyric_syllable" class="table-content">
    <div class="table-info">
        A lyric_syllable record consists of a lyric element's subelement combination of syllabic/elision/text.
    </div>
    <div class="table-info">
        The record's encompassing structure is a lyric text record in table lyric_item, lyric_item_type value "lyric text".
        Foreign key to the lyric_item table is lyric_text_id.
        A lyric may have multiple syllabic/elision/text combinations, so the relation to the lyric_item table is many-to-one.
        See lyric_item for more information on a lyric text record.
    </div>
    <div class="table-info">
        elision and text element data are in separate elision and lyric_text_data tables because the two types have separate display values.
        Foreign keys to these two tables are elision_id and lyric_text_data_id.
    </div>
</div>

<div id="lyric_text_data" class="table-content">
    <div class="table-info">
        A lyric_text_data record stores a lyric element's "text" element data.
    </div>
    <div class="table-info">
        Lyric text data is part of a lyric syllable.
        The foreign key to lyric_text_data in lyric_syllable is lyric_text_data_id.
    </div>
    <div class="table-info">
        Lyric text data is a Formatted Display (has both a display and text_format record),
        and so the text value is stored in the text_format table's value column,
        and has an ordering column, even though it is unused because the lyric_text_data/lyric_syllable relation is one-to-one.
    </div>
</div>

<div id="measure" class="table-content">
    <div class="table-info">
        A basic data relation in a score, a list of measure records belong to a part, foreign key part_id,
        and contains a list of music_data records, foreign key measure_id.
    </div>
</div>

<div id="measure_style" class="table-content">
    <div class="table-info">
        A list of measure_style records are part of an attributes record found in the music_data table, music_data_type "attributes".
        The foreign key to music_data is attributes_id.
    </div>
    <div class="table-info">
        The measure_style table is single-inheritance with discriminator column measure_style_type.
        Discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">multiple rest</li>
            <li class="discriminator-value">measure repeat</li>
            <li class="discriminator-value">beat repeat</li>
            <li class="discriminator-value">slash</li>
        </ul>
    </div>
    <div class="table-info">
    For measure_style_type multiple rest and measure repeat, the element text in the value field.
    </div>
    <div class="table-info">
    measure_style_type beat repeat and slash join to a slash_group record whose data structure corresponds to the MusicXML schema's xs:group "slash".
    </div>
</div>

<div id="metronome_beam" class="table-content">
    <div class="table-info">
        One-to-many relationship to table metronome_note, foreign key metronome_note_id.
        Element text in field beam_type.
        Attribute number in field metronome_beam_number.
    </div>
</div>

<div id="metronome_mark" class="table-content">
    <div class="table-info">
        The metronome_mark table represents the data structure of the first xs:sequence of the xs:choice in the metronome complexType definition in the MusicXML schema.
        This sequence includes the "beat-unit" group, and the "beat-unit-tied" and "per-minute" elements.
        The sequence as a whole defines a beat metronome.
    </div>
    <div class="table-info">
        The metronome_mark table is a single-inheritance table with the discriminator field metronome_mark_type.
        The values for the discriminator field are:
        <ul class="discriminator-values">
            <li class="discriminator-value">beat unit</li>
            <li class="discriminator-value">per minute</li>
        </ul>
    </div>
    <div class="content-subsection">beat unit</div>
    <div class="table-info">
        The "beat unit" type is the combination of the "beat-unit" group and its following list of "beat-unit-tied" elements, and is persisted as follows:
    </div>
    <div class="table-info">
        The element text (type "note-type-value") is in field beat_unit.
    </div>
    <div class="table-info">
        The count of the number of "beat-unit-dot" subelements is in field beat_unit_dots.
    </div>
    <div class="table-info">
        The list of "beat-unit-tied" elements are themselves of type "beat unit", and so are stored in table metronome_mark, metronome_mark_type "beat unit".
        The foreign key for the self-join from the beat-unit-tied subelements to the main "beat unit' record in table metronome_mark is beat_unit_tied_id.
    </div>
    <div class="content-subsection">per minute</div>
    <div class="table-info">
        The "per minute" type stores its element text value in the per_minute field, and has a joined display table record for the font info.
    </div>
    <div class="content-subsection">Beat metronome structure</div>
    <div class="table-info">
        A beat metronome is a direction type in table direction_type, direction_type_type "beat metronome", and has two metronome mark parts:
        <ul>
            <li>A "beat unit" record in metronome_mark, and its adjoining list of beat-unit-tied records in metronome_mark.</li>
            <li>A second "beat unit" type as above, or a "per minute" metronome_mark record type.</li>
        </ul>
        The two records are joined from the beat metronome record in direction type by foreign keys metronome_mark_1_id and metronome_mark_2_id, respectively.
    </div>
</div>

<div id="metronome_note" class="table-content">
    <div class="table-info">
        The metronome_note table represents the data structure of the second xs:sequence of the xs:choice in the metronome complexType definition in the MusicXML schema.
        This sequence includes the "metronome-arrows", "metronome-note", and "metronome-relation" elements.
        The sequence as a whole defines a note metronome.
    </div>
    <div class="content-subsection">Note metronome structure</div>
    <div class="table-info">
        A note metronome is a direction type in table direction_type, direction_type_type "note metronome", and persists as follows:
        <ul>
            <li>The presence or absence of the "metronome-arrows" element in boolean field metronome_arrows.</li>
            <li>The text value of element "metronome-relation" in field metronome_relation.</li>
            <li>
                Two lists of metronome_note records, corresponding to the two lists of "metronome-note" elements that are separated by the "metronome-relation" element.
                A metronome_note record in the first list joins to the note metronome in the direction_type table using foreign key note_metronome_1_id.
                A metronome_note record in the second list joins to the note metronome in the direction_type table using foreign key note_metronome_2_id.
            </li>
        </ul>
    </div>
    <div class="content-subsection">metronome_note record</div>
    <div class="table-info">
        A metronome_note record persists as follows:
        <ul>
            <li>The text value of subelement metronome-type in field metronome_type.</li>
            <li>The count of metronome-dot subelements in field metronome_dots.</li>
            <li>The list of metronome-beat subelements in table metronoe_beam, foreign key metronome_note_id.</li>
            <li>The type attribute value of subelement metronome-tied in field metronome_tied.</li>
            <li>The metronome-tuplet subelement in table metronome_tuplet.</li>
        </ul>
    </div>
</div>

<div id="metronome_tuplet" class="table-content">
    <div class="table-info">
        Belongs to a metronome_note, foreign key metronome_tuplet_id.
    </div>
    <div class="table-info">
        Time modification data is in a separate time_modification table record, time_modification_id.
    </div>
</div>

<div id="midi_device" class="table-content">
    <div class="table-info">
        midi-device element data:
        <ul>
            <li>element text in field "value"</li>
            <li>"port" attribute value in field port</li>
            <li>"id" attribute value in field midi_device_id</li>
        </ul>
    </div>
    <div class="table-info">
        Table joins:
        <ul>
            <li>score_midi table, representing the midi-device/midi-instrument sequence in complexType score-part</li>
            <li>sound_midi table, representing the midi-device/midi-instrument/play sequence in complexType sound</li>
        </ul>
    </div>
</div>

<div id="midi_instrument" class="table-content">
    <div class="table-info">
        midi-instrument element's "id" attribute is in field midi_instrument_id.
    </div>
    <div class="table-info">
        Table joins:
        <ul>
            <li>score_midi table, representing the midi-device/midi-instrument sequence in complexType score-part</li>
            <li>sound_midi table, representing the midi-device/midi-instrument/play sequence in complexType sound</li>
        </ul>
    </div>
</div>

<div id="music_data" class="table-content">
    <div class="table-info">
        The music_data table is single-inheritance with the discriminator column "music_data_type".
    </div>
    <div class="table-info">
        All music data types are stored in the music_data table, and given the number and variety of music data types, the table has a large number of columns,
        although individual music data types use only a subset of the columns.
    </div>
    <div class="table-info">
        Music data records are ordered items, so all records use the ordering field.
        All music data items use the measure_id field, because they're all associated with a measure.
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
        music_data record, music_data_type "note'.
    </div>
    <div class="table-info">
        One-to-one relationships:
        <ul>
            <li>note_type</li>
            <li>accidental</li>
            <li>grace</li>
            <li>notehead</li>
            <li>stem</li>
            <li>time_modification</li>
            <li>play</li>
            <li>display</li>
            <li>editorial</li>
            <li>printout</li>
        </ul>
        One-to-many relationships:
        <ul>
            <li>tie</li>
            <li>beam</li>
            <li>dot</li>
            <li>notations</li>
            <li>lyric</li>
            <li>text_display</li>
        </ul>
    </div>
</div>

<div id="backup" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "backup".
    </div>
</div>

<div id="forward" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "forward".
    </div>
</div>

<div id="direction" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "direction".
    </div>
    <div class="table-info">
        Many-to-one join to direction_type_list, foreign key direction_id.
        Each direction_type_list record joins to a list of direction_type objects.
    </div>
    <div class="table-info">
        Thus, a "direction" music_data_type record in music_data represents a "direction" element,
        and a direction_type_list record represents a "direction-type" element.
        Individual subelements of direction-type are stored in the direction_type table.
    </div>
    <div class="table-info">
        Field sound_id is a join to a sound record, which is itself in the music_data table.
    </div>
</div>

<div id="attributes" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "attributes".
    </div>
    <div class="table-info">
        Scalar values in the music_data table;
        <ul>
            <li>divisions</li>
            <li>instruments</li>
            <li>staves</li>
        </ul>
        One-to-one relationships to records in other tables:
        <ul>
            <li>editorial</li>
            <li>part_symbol</li>
        </ul>
        Many-to-one relationships, with foreign key attributes_id:
        <ul>
            <li>time</li>
            <li>key_signature</li>
            <li>clef</li>
            <li>staff_details</li>
            <li>directive</li>
            <li>transpose</li>
            <li>measure_style</li>
        </ul>
    </div>
</div>

<div id="harmony" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "harmony".
    </div>
    <div class="table-info">
        Scalar values in music_data table:
        <ul>
            <li>staff</li>
            <li>type</li>
            <li>print_object</li>
            <li>print_frame</li>
        </ul>
        One-to-one relationships to records in other tables:
        <ul>
            <li>frame</li>
            <li>direction_offset, foreign key offset_id.  Corresponds to "offset" element.</li>
            <li>editorial</li>
            <li>display</li>
        </ul>
        Many-to-one relationship, with foreign key harmony_id:
        <ul>
            <li>harmony_chord</li>
        </ul>
    </div>
</div>

<div id="figured-bass" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "figured bass".
    </div>
    <div class="table-info">
        Scalar values in music_data table:
        <ul>
            <li>duration</li>
            <li>parentheses</li>
        </ul>
        One-to-one relationships to records in other tables:
        <ul>
            <li>editorial</li>
            <li>display</li>
            <li>printout</li>
        </ul>
        Many-to-one relationship, with foreign key figured_bass_id:
        <ul>
            <li>figure</li>
        </ul>
    </div>
</div>

<div id="print" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "print".
    </div>
    <div class="table-info">
        The measure-layout and measure-numbering types, and the print-attributes attributeGroup are unique to the print complexType,
        and so their values are folded into the print record, and included in the music_data table,
        rather than using separate tables using table joins.
    </div>
    <div class="table-info">
        These values are handled as follows:
        <ul>
            <li>measure-layout element's measure-distance subelement text: field measure_distance</li>
            <li>measure-numbering element text: field measure_numbering_value</li>
            <li>measure-numbering element's display attributes: display table, foreign key display_id</li>
            <li>print-attributes attributeGroup values: fields staff_spacing, new_system, new_page, blank_page, page_number</li>
        </ul>
    </div>
    <div class="table-info">
        layout group values in layout table, foreign key layout_id.
    </div>
    <div class="table-info">
        part-name-display and part-abbreviation-display element data are in table name_display,
        foreign keys part_name_display_id and part_abbreviation_display_id.
    </div>
</div>

<div id="sound" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "sound".
    </div>
    <div class="table-info">
        The sequence of midi-device, midi-instrument, and play elements are combined into a Sound Midi object,
        and the each appearance of the this sequence is stored in the sound_midi table, foreign key sound_id.
    </div>
    <div class="table-info">
        The offset element data is in the direction_offset table, foreign key offset_id.
    </div>
    <div class="table-info">
        Attribute values are stored as part of the sound record in the music_data table.
    </div>
</div>

<div id="barline" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "barline"
    </div>
    <div class="table-info">
        The bar-style element text is in field bar_style.
        Its color info is stored in a display table record.
    </div>
    <div class="table-info">
        The "location" attribute is in field barline_location.
    </div>
    <div class="table-info">
        The segno and coda attributes are music_data fields segno and coda.
    </div>
    <div class="table-info">
        Other notable table associations are:
        <ul>
            <li>wavy-line is a record in table ornament, ornament_type "wavy line".</li>
            <li>segno and coda element data are in table direction_type, direction_type_type "segno" and "coda", respectively.</li>
            <li>The list of fermata elements are in the notation table, notation_type "fermata", foreign key barline_id.</li>
            <li>ending and repeat elements are in tables barline_ending and barline_repeat.</li>
        </ul>
    </div>
</div>

<div id="grouping" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "grouping"
    </div>
    <div class="table-info">
        "number" attribute value is in field grouping_number.
    </div>
</div>

<div id="link" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "link"
    </div>
    <div class="table-info">
        The "position" attribute scalar value is in music_data field "position".
    </div>
    <div class="table-info">
        The "position" attributeGroup values are display table fields, as with all other elements that have the position attributeGroup as part of their definition.
    </div>
</div>

<div id="bookmark" class="table-content">
    <div class="table-info">
        music_data record, music_data_type "bookmark"
    </div>
    <div class="table-info">
        id attribute value is in music_data field bookmark_id.
    </div>
</div>

<div id="name_display" class="table-content">
    <div class="table-info">
        A name display contains a list of text display objects (i.e., the list of display-text and accidental-text elements defined in the xs:choice block in complexType "name-display").
        Foreign key to name_display is name_display_id.
    </div>
    <div class="table-info">
        Name display objects are found in:
        <ul>
            <li>
                A score part or part group in table part_list_item, each of which has both a name and an abbreviation display.
                joined to the name_display table by pair of foreign keys, one for the name, one for the abbreviation.
                Score part and part group each use a different pair of foreign keys:
                <ul>
                    <li>score part foreign keys: part_name_display_id and part_abbreviation_display_id</li>
                    <li>part group foreign keys: group_name_display_id and group_abbreviation_display_id</li>
                </ul>
            </li>
            <li>
                A print object in the music_data table, having both a part name display and a part abbreviation display.
                Foreign keys to name_display are part_name_display_id and part_abbreviation_display_id.
            </li>
        </ul>
    </div>
</div>

<div id="non_traditional_key_type" class="table-content">
    <div class="table-info">
        When a key signature is a non-traditional key type (key_signature record, key_type value "non-traditional key"),
        each iteration of the non-traditional-key group (as defined in the MusicXML schema) is stored as a record in the
        non_traditional_key_type record, foreign key key_id.
    </div>
</div>

<div id="notation" class="table-content">
    <div class="table-info">
        Each subelement of a notations element is stored as a record in the notation table.
        The data for the notations element is in table notations,
        and this many-to-one relationship uses foreign key notations_id in the notation table.
    </div>
    <div class="table-info">
        A list of notation type fermata can also belong to a barline, which is a music_data record.
        The foreign key in notation to the music_data record is barline_id.
    </div>
    <div class="table-info">
        notation is a single-inheritance table with discriminator field notation_type.
        The notation_type discriminator values are:
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
        Since many different object types are stored in the notation table,
        each notation type individually only use some fields to store their records.
        Notable data definitions are below:
    </div>
    <div class="content-subsection">tied and slur</div>
    <div class="table-info">
        <ul>
            <li>tied record: "type" attribute in field tied_type</li>
            <li>slur record "type" attribute in field connection_type</li>
            <li>"number" attribute in field notation_number</li>
            <li>Joins to a record each in tables dashed_formatting and bezier</li>
        </ul>
    </div>
    <div class="content-subsection">tuplet</div>
    <div class="table-info">
        <ul>
            <li>Has two tuplet_portion records, one for tuplet-actual and the other for tuplet-normal.  Foreign keys tuplet_actual_id and tuplet_normal_id</li>
            <li>"type" attribute in field type_value</li>
        </ul>
    </div>
    <div class="content-subsection">glissando</div>
    <div class="table-info">
        <ul>
            <li>Element text in field "value"</li>
            <li>"type" attribute in field type_value</li>
            <li>Joins to a record in table dashed_formatting</li>
        </ul>
    </div>
    <div class="content-subsection">slide</div>
    <div class="table-info">
        <ul>
            <li>Element text in field "value"</li>
            <li>"type" attribute in field type_value</li>
            <li>Joins to a record each in tables dashed_formatting and bend_sound</li>
        </ul>
    </div>
    <div class="content-subsection">ornaments</div>
    <div class="table-info">
        <ul>
            <li>Represents a list of ornaments whose records are in the ornament table, foreign key ornaments_id</li>
            <li>ornaments also has a list of accidental marks, whose records are also in the notation table.  Self-join to the parent ornaments list on field ornaments_id.</li>
        </ul>
    </div>
    <div class="content-subsection">technicals</div>
    <div class="table-info">
            Represents a list of technicals whose records are in the technical table, foreign key technicals_id
    </div>
    <div class="content-subsection">articulations</div>
    <div class="table-info">
            Represents a list of articulations whose records are in the articulation table, foreign key articulations_id
    </div>
    <div class="content-subsection">dynamics</div>
    <div class="table-info">
        dynamics is implemented as a direction type, so when a dynamics element is a subelement of a notations element,
        the data is stored in the direction_type table and joined from notations using foreign key dynamics_id
    </div>
    <div class="content-subsection">accidental mark</div>
    <div class="table-info">
        <ul>
            <li>Element text value is in accidental_value field</li>
            <li>Joins to a record in table level_display</li>
        </ul>
    </div>
    <div class="content-subsection">other notation</div>
    <div class="table-info">
        <ul>
            <li>Element text in field value</li>
            <li>attribute "type" is in field type_value</li>
            <li>attribute "number" in field notation_number</li>
        </ul>
    </div>
</div>

<div id="notations" class="table-content">
    <div class="table-info">
        A notations record represents a notations element.
    </div>
    <div class="table-info">
        Notations subelements are stored in table notation, with the foreign key notations_id to the list in the notations table.
    </div>
    <div class="table-info">
        Notations belongs to a note, which is in music_data, music_data_type "note".
        Many-to-one foreign key in notations is note_id.
    </div>
</div>

<div id="notehead" class="table-content">
    <div class="table-info">
        A notehead belongs to a note, which is in music_data, music_data_type "note", foreign key notehead_id.
    </div>
    <div class="table-info">
        The notehead element text is in field "type".
    </div>
</div>

<div id="note_size" class="table-content">
    <div class="table-info">
        All subelements of the appearance element have a one-to-many relationship to the defaults table, foreign key defaults_id.
    </div>
</div>

<div id="note_type" class="table-content">
    <div class="table-info">
        Represents the xs:choice section of the "full-note" group in the MusicXML schema.
    </div>
    <div class="table-info">
        The chord element's presence or absence as defined in the "full-note" group is stored as a boolean value in the "chord" field of the note record in the music_data table.
    </div>
    <div class="table-info">
        note_type is a single-inheritance table with discriminator column note_type_type.
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
        ornament table records represent the elements defined in the xs:choice section of the "ornaments" complexType in the MusicXML schema.
    </div>
    <div class="table-info">
        A barline (music_data table, music_data_type "barline") also stores its wavy-line element data in this table.
    </div>
    <div class="table-info">
        ornament is a single-inheritance table, discriminator column ornament_type.
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
        The enclosing "ornaments" element that defines the list of ornament records is a notation record, notation_type "ornaments".
        The foreign key to this record in ornament is ornaments_id.
    </div>
    <div class="table-info">
        "other ornament" element text is in field "value".
    </div>
    <div class="table-info">
        "tremolo" element "type" attribute value is in field tremolo_type.  Element text is in field tremolo_marks.
    </div>
    <div class="table-info">
        "wavy line" element "type" attribute value is in field connection_type.  Attribute "number" is in field wavy_line_number.
    </div>
    <div class="table-info">
        Elements with trill-sound values have their data stored in table trill_sound, foreign key trill_sound_id.
    </div>
    <div class="table-info">
        mordent type elements stored their "long" attribute value in the long_mordent boolean field.
    </div>
</div>

<div id="other_appearance" class="table-content">
    <div class="table-info">
        All subelements of the appearance element have a one-to-many relationship to the defaults table, foreign key defaults_id.
    </div>
</div>

<div id="page_layout" class="table-content">
    <div class="table-info">
        Part of a layout, foreign key page_layout_id.
        Has multiple page_margins records, foreign key page_layout_id.
    </div>
</div>

<div id="page_margins" class="table-content">
    <div class="table-info">
        Many-to-one relation with table page_layout, foreign key page_layout_id.
    </div>
    <div class="table-info">
        Field page_margin_key has identical value to field "type", which contains the value of the page-margins "type" attribute.
        The key is used to construct odd, even, or both page margin types for alternate or fixed page layouts.
    </div>
</div>

<div id="part" class="table-content">
    <div class="table-info">
        A part record belongs to a score, foreign key score_id.
    </div>
    <div class="table-info">
        A part has multiple measure records, foreign key in the measure table is part_id.
    </div>
    <div class="table-info">
        The part element's "id" attribute value is in the part table, field part_id.
    </div>
</div>

<div id="part_list_item" class="table-content">
    <div class="table-info">
        The part_list_item table stores the data from the part-list complexType in the MusicXML schema, elements part-group and score-part.
        The list as a whole belongs to a score_header record, foreign key score_header_id.
    </div>
    <div class="table-info">
        Since the part_list_item table stores multiple data types, the table is single-inheritance.  Discriminator column part_list_item_type.
    </div>
    <div class="table-info">
        Discriminator values are:
        <ul class="discriminator-values">
            <li class="discriminator-value">part group</li>
            <li class="discriminator-value">score part</li>
        </ul>
    </div>
    <div class="table-info">
        part_list_item records are stored in the order they are encountered in the part-list element, using the ordering field.
    </div>
    <div class="content-subsection">part group</div>
    <div class="table-info">
        Name and abbreviation displays are in tables group_name and name_display.
        Foreign keys are:
        <ul>
            <li>group_name_id</li>
            <li>group_name_display_id</li>
            <li>group_abbreviation_id</li>
            <li>group_abbreviation_display_id</li>
        </ul>
    </div>
    <div class="table-info">
        group-symbol, group-barline, and editorial data are stored in associated tables group_symbol, group_barline, editorial.
    </div>
    <div class="table-info">
        Attributes "type" and "number" are stored in fields part_group_type and part_group_number.
    </div>
    <div class="content-subsection">score part</div>
    <div class="table-info">
        Name and abbreviation displays are in tables part_name and name_display.
        Foreign keys are:
        <ul>
            <li>part_name_id</li>
            <li>part_name_display_id</li>
            <li>part_abbreviation_id</li>
            <li>part_abbreviation_display_id</li>
        </ul>
    </div>
    <div class="table-info">
        Each subelement "group" text data is stored as a record in table score_part_group, with the text data in field group_name.
    </div>
    <div class="table-info">
        Each subelement score-instrument data is a record in table score_instrument.
    </div>
    <div class="table-info">
        Each midi-device/midi-instrument element sequence is stored in table score_midi.
    </div>
    <div class="table-info">
        The "id" attribute value is stored in field score_part_id.
    </div>
</div>

<div id="part_name" class="table-content">
    <div class="table-info">
        Stores the part name and part abbreviation of a score part.
        Foreign keys for the score part record in the part_list_item table are part_name_id and part_abbreviation_id.
    </div>
    <div class="table-info">
        The part-name element text is stored in field part_name.
    </div>
</div>

<div id="part_symbol" class="table-content">
    <div class="table-info">
        part_symbol is part of an attributes record in the music_data table, foreign key part_symbol_id.
    </div>
    <div class="table-info">
        The part-symbol element text is in field group_symbol_type.
    </div>
</div>

<div id="pedal_tuning" class="table-content">
    <div class="table-info">
        A list of pedal-tuning elements belongs to a harp pedals record which is a direction_type record.
        Foreign key harp_pedals_id.
    </div>
</div>

<div id="play" class="table-content">
    <div class="table-info">
        The part table stores "play" element data.
    </div>
    <div class="table-info">
        A part record belongs to either:
        <ul>
            <li>A sound record's midi-device/midi-instrument/play sequence.  This sequence is stored as a sound_midi record, foreign key play_id.</li>
            <li>A note stored in the music_data table, foreign key play_id.</li>
        </ul>
    </div>
    <div class="table-info">
        The "id" attribute value is in field play_id.
    </div>
    <div class="table-info">
        A play has a list of subelements listed in the xs:choice section of the "play" complexType in the MusicXML schema.
        Each of these subelements is a play_type record, foreign key play_id.
    </div>
</div>

<div id="play_type" class="table-content">
    <div class="table-info">
        Represents the list of elements in the xs:choice section of the "play" complexType in the MusicXML schema.
    </div>
    <div class="table-info">
        A play record has a list of play_type records, each of which join to the play table using foreign key play_id in the play_type table.
    </div>
    <div class="table-info">
        play_type is a single-inheritance table, with discriminator column play_type_type.
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
    <div class="table-info">
        Element text value is in field "value".
        The "type" attribute of other-play is in field "type".
    </div>
</div>

<div id="printout" class="table-content">
    <div class="table-info">
        A printout record record belongs to either a note or a figured bass, each of which are in the music_data table, foreign key printout_id.
    </div>
</div>

<div id="root_alter" class="table-content">
    <div class="table-info">
        A root_alter record belongs to a harmony_chord, type "root".  Foreign key root_alter_id.
    </div>
    <div class="table-info">
        root-alter element text in field semitones.
    </div>
</div>

<div id="root_step" class="table-content">
    <div class="table-info">
        A root_step record belongs to a harmony_chord, type "root".  Foreign key root_step_id.
    </div>
    <div class="table-info">
        root-step element text in field "text".
    </div>
</div>

<div id="score" class="table-content">
    <div class="table-info">
        The score table is the parent table of the schema.
    </div>
    <div class="table-info">
        A score consists of a score header and a list of parts.
        Foreign key to score_header is score_header_id.
        The foreign key from part to score is score_id.
    </div>
    <div class="table-info">
        The score_name field is not part of the MusicXML definition.
        The field has a unique constraint, and is assigned when a score is converted from a MusicXML file to a database record using the tasks interface.
    </div>
    <div class="table-info">
        The xml_comment table holds comment and processing instruction data found within a MusicXML file.
        Records are created when a MusicXML file is converted to a database record using the tasks interface.
        When a database record is converted to a MusicXML file in the tasks interface, the comments and processing instructions are re-inserted into the file in their original locations.
        The xml_comment table is not part of the MusicXML definition.
    </div>
</div>

<div id="score_header" class="table-content">
    <div class="table-info">
        A score_header belongs to a score.  Foreign key in score is score_header_id.
    </div>
    <div class="table-info">
        Metadata records for a score header are in the work, identification, defaults, and credit tables.
        credit table relation is many-to-one, foreign key score_header_id.
    </div>
    <div class="table-info">
        Table part_list_item holds the part group and score part records found in a part-list element.
        Records in part_list_item are stored in the order they are listed in the part-list element using the ordering field.
        Foreign key in part_list_item to the score header is score_header_id.
    </div>
</div>

<div id="score_instrument" class="table-content">
    <div class="table-info">
        A list of score_instrument records belongs to a score part record stored in the part_list_item table.
        Foreign key is part_list_item_id.
    </div>
    <div class="table-info">
        Attribute "id" value is in field score_instrument_id.
    </div>
</div>

<div id="score_midi" class="table-content">
    <div class="table-info">
        A score_midi record represents the midi-device/midi-instrument element sequence in the score-part complexType in the MusicXML schema.
    </div>
    <div class="table-info">
        A list of score_midi records belongs to a score part record in the part_list_item table.
        The foreign key in score_midi is part_list_item_id.
    </div>
</div>

<div id="score_part_group" class="table-content">
    <div class="table-info">
        Stores the data of the "group" subelements of the score-part element.
        The score-part data is in table part_list_item.
        Foreign key in score_part_group is part_list_item_id.
    </div>
    <div class="table-info">
        The "group" element's text data is in field group_name.
    </div>
</div>

<div id="slash_group" class="table-content">
    <div class="table-info">
        Represents the data defined in xs:group "slash" in the MusicXML schema.
    </div>
    <div class="table-info">
        When a measure-style element has a "slash" subelement, its slash group subelements are stored in table slash_group.
        The measure style data is stored in table measure_style, measure_style_type "slash", and joined to slash_group using foreign key slash_group_id.
    </div>
    <div class="table-info">
        The slash_dots field has the slash-dot subelement count.
    </div>
    <div class="table-info">
        Data of the except-voice subelements are stored in table except_voice, foreign key slash_group_id.
    </div>
</div>

<div id="sound_midi" class="table-content">
    <div class="table-info">
        Represents the midi-device/midi-instrument/play subelement sequence of the "sound" element.
    </div>
    <div class="table-info">
        A sound element can have a list of these sequences, and each subelement sequence is stored as a record in sound_midi.
    </div>
    <div class="table-info">
        The data of each subelement in the sequencez is stored in tables midi_device, midi_instrument, and play, respectively, with the foreign keys to these tables in the soound_midi table.
    </div>
    <div class="table-info">
        The owning "sound" record is in table music_data, music_data_type "sound", foreign key sound_id.
    </div>
</div>

<div id="staff_details" class="table-content">
    <div class="table-info">
        Stores the data of a staff-details subelement of attributes.
    </div>
    <div class="table-info">
        Each record in the list of staff_details records has foreign key attributes_id to table music_data where the attributes record is stored.
    </div>
    <div class="table-info">
        The "number" attribute value is in field staff_details_number.
    </div>
</div>

<div id="staff_layout" class="table-content">
    <div class="table-info">
        Stores the staff-layout element data.
    </div>
    <div class="table-info">
        Attribute "number" is in field staff_layout_number.
    </div>
    <div class="table-info">
        The list of staff_layout records joins to the layout table using foreign key layout_id.
    </div>
</div>

<div id="staff_tuning" class="table-content">
    <div class="table-info">
        Stores the staff-tuning element data.
    </div>
    <div class="table-info">
        "tuning" group element data is in table tuning, foreign key tuning_id.
    </div>
    <div class="table-info">
        The staff_tuning records each join to its staff_details record using foreign key staff_details_id.
    </div>
</div>

<div id="stem" class="table-content">
    <div class="table-info">
        Stores stem element data.
    </div>
    <div class="table-info">
        A stem belongs to a note, which is in the music_data table, and joins to stem using foreign key stem_id.
    </div>
    <div class="table-info">
        stem element text is in field "type".
    </div>
</div>

<div id="system_divider" class="table-content">
    <div class="table-info">
        Stores the left-divider and right-divider element data of a system-layout element,
        one record for each divider element,
        and joined from the system_layout table to the systemm_divider table using foreign keys left_system_divider_id and right_system_divider_id.
    </div>
</div>

<div id="system_layout" class="table-content">
    <div class="table-info">
        Stores system-layout element data.
    </div>
    <div class="table-info">
        left-divider and right-divider subelement data are in table system_divider foreign keys left_system_divider_id and right_system_divider_id.
    </div>
    <div class="table-info">
        The owning layout record joins to system_layout using foreign key system_layout_id.
    </div>
</div>

<div id="technical" class="table-content">
    <div class="table-info">
        The technical table stores data for all subelements of the "technical" element.
    </div>
    <div class="table-info">
        A technical list is a type of notation, so each record in technical joins to the notation table, foreign key technicals_id,
        where the technicals list record is stored, notation_type "technicals".
    </div>
    <div class="table-info">
        The technical table is single-inheritance with discriminator column technical_type.
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
        The "string number" discriminator value is used by the "string" element.
    </div>
    <div class="table-info">
        technical table fields:
        <ul>
            <li>harmonic_type: stores the subelement name, either "natural" or "artificial", as an enum value</li>
            <li>harmonic_pitch: stores the subelement name, either "base-pitch", "touching-pitch", or "sounding-pitch", as an enum value</li>
            <li>string_number: "string" element text</li>
            <li>value: fingering, pluck, fret, hammer-on, pull-off, tap, other-technical element text; harmon-mute element's harmon-closed subelement text</li>
            <li>notation_type: hammer-on, pull-off "type" attribute</li>
            <li>notation_number: hammer-on, pull-off "number" attribute</li>
            <li>bend_type: stores the bend subelement name, either pre-bend or release, as an enum value</li>
            <li>tap_hand: "hand" attribute value for a tap</li>
            <li>hole_closed_type: a hole's hole-closed subelement text</li>
            <li>hole_closed_location: a hole's hole-closed subelement's location attribute</li>
            <li>handbell_type: handbell element text value</li>
            <li>location: harmon-mute element's harmon-closed subelement's location attribute</li>
        </ul>
    </div>
    <div class="table-info">
        techcnical table joins:
        <ul>
            <li>bend_with_bar: stores the with-bar subelement data for a bend</li>
            <li>bend_sound: stores the bend-sound attributeGroup data for a bend</li>
        </ul>
    </div>
    <div class="table-info">
        Additionally a frame note has three types of technical as data members: string number, fret, and fingering.
        These data members join to the technical table with foreign keys string_id, fret_id, and fingering_id.
    </div>
</div>

<div id="text_display" class="table-content">
    <div class="table-info">
        A text_display record represents the display-text/accidental-text choice that appears in both the notehead-text and name-display complexType.
    </div>
    <div class="table-info">
        text_display is a single-inheritance table with discriminator column text_display_type.
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
        That is, they have both an associated display record and an associated text_format record.
        Foreign keys are display_id and text_format_id.
    </div>
    <div class="table-info">
        The text value is in text_format, field "value", as with all formatted display objects.
    </div>
    <div class="content-subsection">accidental text</div>
    <div class="table-info">
        Field accidental_type stores the accidental-text element value as an enum.
    </div>
    <div class="content-subsection">Text display as data member</div>
    <div class="table-info">
        The notehead-text element of a note has a list of text display records
        that join from text_display (foreign key note_id) to the note record in music_data.
    </div>
    <div class="table-info">
        A name display type has a list of text display records
        that join from text_display (foreign key name_display_id) to the name_display record.
    </div>
</div>

<div id="text_format" class="table-content">
    <div class="table-info">
        Any object type that includes attributeGroup text-formatting, or whose definition includes any attributes defined in the attributeGroup text-formatting in the MusicXML schema
        stores its text data in the text_format table.
    </div>
    <div class="table-info">
        Element text is stored in field "value".
    </div>
    <div class="table-info">
        All attributes in the text-formatting attributeGroup in the MusicXML schema are stored in the text_format table,
        except for attributeGroup print-style-align which are display table fields.
    </div>
    <div class="content-subsection">Direction types</div>
    <div class="table-info">
        Direction types dynamics, rehearsal, symbol, and words in the direction_type table have a text_format record, foreign key text_format_id.
    </div>
    <div class="content-subsection">Formatted display types</div>
    <div class="table-info">
        Data types footnote, text_display, lyric_text_data, and credit_display are all of formatted display type which uses the text_format and display tables to store their data.
        See the Formatted Display page, and these tables in the table reference for more information.
    </div>
</div>

<div id="tie" class="table-content">
    <div class="table-info">
        A list of ties belongs to a note, which is in the music_data table.  Foreign key note_id.
    </div>
</div>

<div id="time" class="table-content">
    <div class="table-info">
        A record in the time table stores the data as defined in the "time" complexType in the MusicXML schema.
        A list of time records belongs to an attributes record in the music_data table, foreign key attributes_id.
    </div>
    <div class="table-info">
        The time table is single-inheritance, with discriminator column time_type.
        The discriminator value depends on the choice employed in the xs:choice section of the "time" complexType.
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
            <li>The "number" attribute is in field time_number</li>
            <li>The "separator" attribute is in field time_separator</li>
        </ul>
    </div>
    <div class="content-subsection">time signature</div>
    <div class="table-info">
        A time signature consists of a list of beats/beat-type elements in sequence,
        followed by an optional interchangeable element.
    </div>
    <div class="table-info">
        Each beats/beat-type element sequence is a record in the time_signature_type table.
        The text of elements beats and beat-type is stored in fields beats and beat_type, respectively.
        Foreign key for the record is time_signature_id.
    </div>
    <div class="content-subsection">interchangeable</div>
    <div class="table-info">
        The foreign key for a time signature's interchangeable record is interchangeable_id in the time table.
    </div>
    <div class="table-info">
        Attribute "separator" value is in field time_separator.
    </div>
    <div class="table-info">
        An interchangeable has itself a list of time_signature_type records.
        The foreign key for this list in the time_signature_type table is interchangeable_id.
    </div>
    <div class="content-subsection">senza misura</div>
    <div class="table-info">
        The senza-misura element text is in time table field "value".
    </div>
</div>

<div id="time_modification" class="table-content">
    <div class="table-info">
        A time_modification record belongs either to a note in the music_data table,
        or a  metronome_tuplet record.
        Foreign key in either case is time_modification_id.
    </div>
    <div class="table-info">
        Field normal_dots contains the number of normal-dot subelements.
    </div>
</div>

<div id="time_signature_type" class="table-content">
    <div class="table-info">
        A time_signature_type record holds the data for the xs:group time-signature in the MusicXML schema.
    </div>
    <div class="table-info">
        A list of time_signature_type records belongs to a time table record when the time_type is "time signature".
        The foreign key in time_signature_type is time_signature_id.
    </div>
    <div class="table-info">
        An interchangeable type can also have a list of time_signature_type records.
        The foreign key in time_signature_type is interchangeable_id.
    </div>
</div>

<div id="transpose" class="table-content">
    <div class="table-info">
        transpose has a many-to-one relationship with an attributes record in the music_data table, foreign key attributes_id.
    </div>
    <div class="table-info">
        The presence or absence of a "double" subelement is in boolean field "doubled".
    </div>
    <div class="table-info">
        Attribute "number" value is in field staff_number.
    </div>
</div>

<div id="trill_sound" class="table-content">
    A trill_sound record belongs to the following types of ornaments, whose records are in the ornaments table, and joined using foreign key trill_sound_id:
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
        A tuning record belongs to either an accord or staff_tuning record, foreign key tuning_id.
    </div>
</div>

<div id="tuplet_dot" class="table-content">
    <div class="table-info">
        tuplet_dot has a one-to-many relationship to tuplet_portion.
    </div>
    <div class="table-info">
        The tuplet-dot element has its own display attributes, which necessitates moving the tuplet-dot data to its own table.
    </div>
</div>

<div id="tuplet_number" class="table-content">
    <div class="table-info">
        A tuplet_number record belongs to a tuplet_portion.
        The foreign key in tuplet_portion is tuplet_number_id.
    </div>
    <div class="table-info">
        Element text is in field "value".
    </div>
</div>

<div id="tuplet_portion" class="table-content">
    <div class="table-info">
        A "tuplet" notation table record has two tuplet_portion records, one each for tuplet-actual and tuplet-normal subelement data.
        The foreign keys to these two records in the notation table are tuplet_actual_id and tuplet_normal_id, respectively.
    </div>
    <div class="table-info">
        A tuplet_portion record has:
        <ul>
            <li>tuplet-number element data in table tuplet_number, foreign key tuplet_number_id</li>
            <li>tuplet-type element data in table tuplet_type, foreign key tuplet_type_id</li>
            <li>a list of tuplet-dot element data records in table tuplet_dot; foreign key in tuplet_dot is tuplet_portion_id</li>
        </ul>
    </div>
</div>

<div id="tuplet_type" class="table-content">
    <div class="table-info">
        Stores the data for complexType tuplet-type in the MusicXML schema.
    </div>
    <div class="table-info">
        Belongs to a tuplet_portion record, foreign key tuplet_type_id.
    </div>
    <div class="table-info">
        Element text is in field note_type_value.
    </div>
</div>

<div id="virtual_instrument" class="table-content">
    <div class="table-info">
        Belongs to score instrument, which belongs to a score part.
        Foreign key in score_instrument is virtual_instrument_id.
    </div>
</div>

<div id="work" class="table-content">
    <div class="table-info">
        A work record belongs to a score header, foreign key work_id.
    </div>
    <div class="table-info">
        The opus subelement data is in table link_attributes, foreign key opus_id.
    </div>
</div>

<div id="xml_comment" class="table-content">
    <div class="table-info">
        One xml_comment record is created for each comment and processing instruction in a MusicXML file during a conversion from a MusicXML file to a database record
        using the tasks interface.
    </div>
    <div class="table-info">
        The xml_comment table is not part of the MusicXML schema definition.
        Its an additional feature table that stores comment data so that when a user converts a database record back to a MusicXML file,
        the content and placement of comments are preserved as in the original file.
    </div>
    <div class="table-info">
        Users can optionally select to not include comments in a MusicXML file to database conversion.
    </div>
    <div class="content-subsection">data and target fields</div>
    <div class="table-info">
        data and target field values are taken from the Java DOM implementation.
    </div>
    <div class="table-info">
        For an xml comment, the data field value is the comment string minus the leading &lt;!-- and trailing --&gt;
    </div>
    <div class="table-info">
        For a processing instrucution the data and target values are as shown below:
    </div>
    <div class="table-info">
        &lt;?target data?&gt;
    </div>
    <div class="content-subsection">parent and next_sibling fields</div>
    <div class="table-info">
        The parent and next_sibling field values are taken from XPath.
    </div>
    <div class="table-info">
        Values are always a fully-specified path with predicates.
    </div>
    <div class="table-info">
        Examples:
    </div>
    <div class="table-info">
        For a comment in the score header's defaults section, and before the appearance element the parent and next_sibling field values are:
        <ul>
            <li>parent: /score-partwise[1]/defaults[1]</li>
            <li>next_sibling: appearance[1]</li>
        </ul>
    </div>
    <div class="table-info">
        next_sibling is null when the comment appears after every subelement of the parent element.
    </div>
    <div class="table-info">
        parent is an empty string when the comment appears before the first element in the file.
    </div>
</div>

<script type="text/javascript">
    var includeSection = '${param.tableName}';
</script>
<script type="text/javascript" src="js/tableContent.js"></script>
