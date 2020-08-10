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
        encoding is a single-table inheritance table with the discriminator value in field encoding_type.
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
        The lyric_item table is single-inheritance, discriminator value field lyric_item_type.
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
        The measure_style table is single-inheritance with discriminator value field measure_style_type.
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

<script type="text/javascript">
    var includeSection = '${param.tableName}';
</script>
<script type="text/javascript" src="js/tableContent.js"></script>
