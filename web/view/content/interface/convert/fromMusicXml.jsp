<div id="convert-pane">
    <img class="convert-pane-image" src="images/interface/musicxml_from_box.png" alt="musicxml from box"/>
</div>

<div id="convert-content">
    <div class="content-header">From MusicXML</div>

    <div class="content">
Selecting this pane will convert a MusicXML file to Java beans which are then converted to the data type selected in the to-conversion pane.
    </div>

    <div class="content">
        Files can be compressed (.mxl) or uncompressed (.xml, .musicxml).
    </div>

    <div class="content">
        Files can be in either partwise or timewise format.
        When converting to a database record, the score record will store the format of the uploaded the MusicXML file,
        and when converted back to a MusicXML file, the result will be in the uploaded format.
    </div>

    <div class="content">
        Comments, processing instructions, and document declarations are included in the conversion.
    </div>

    <ul class="arrowed-list">
        <li class="padded-li"><span>Click on the "Choose MusicXML File" link to navigate to the MusicXML file, and select the XML file, or enter the fully-specified location (location including folder/directory name) in the text box.</span></li>
    </ul>

    <div class="content-subsection">MusicXML Validation</div>

    <div class="content">
        MusicXML conversion validates the file before processing.
        A validation failure will result in the conversion not being run.
    </div>

    <div class="content">
        Validation uses the encoding indicated by the encoding attribute of the XML declaration, by default <code>UTF-8</code>.
    </div>

    <div class="content">
        In some cases, validation will fail when the encoding is given as <code>UTF-8</code>,
        and issue an error of this type:
    </div>

    <div class="content">
        <code>Invalid byte 2 of 3-byte UTF-8 sequence</code>
    </div>

    <div class="content">
        Usually, manually changing the encoding attribute value to <code>ISO-8859-1</code> will result in a successful validation.
    </div>
</div>
