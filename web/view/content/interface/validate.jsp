<div class="content-header">Validating a MusicXML file</div>

<div class="content">
MusicXML Tasks validates any locally-stored MusicXML file against the MusicXML 3.1 schema.  The MusicXML schema used for validation is included in the application, so the user only needs to have the MusicXML file available and enter its location in the tool.
</div>

<div class="content">
XML validation verifies that an XML document is well-formed (i.e., it is syntactically correct), and that the document conforms to the rules defined in the MusicXML schema.
</div>

<div class="content">
When validation is performed, the XML file is first read and then loaded as an XML document.  The document is then validated using a SAX (Simple API for XML) parser.
</div>

<div class="content">
The XML parser is included in the application, and validation error messages are those of the parser.
</div>

<div class="content">
Validation doesn't use the database, so no prior database setup is required to validate a MusicXML file.
</div>

<div class="content-section">Validation Steps</div>

<div class="content">
    To validate a MusicXML file:
    <ul class="arrowed-list">
        <li class="padded-li"><span>Select the "Validate XML" tab at the top of the tool.</span></li>

        <div class="image">
        [image of validate tab page]
        </div>

        <li class="padded-li"><span>Click on the "Choose MusicXML file" link, navigate to the MusicXML file you want to validate, and select it.</span></li>

        <div class="content">
            You can also enter the XML file name directly in the text box.  The file name must be fully-specified (i.e., the file name must include the full directory path where the file is located).
        </div>

        <li class="padded-li"><span>Press "Validate".</span></li>
    </ul>
    Validation results will appear in the console area at the bottom of the tool.
</div>

<div class="content-section">Output examples</div>

<div class="content">
Here a some common examples of validation output:
</div>

<div class="content">
Successful validation:
</div>

<div class="image">
[image of output]
</div>

<div class="content">
Ill-formed XML document:
</div>

<div class="image">
[image of sample error output]
</div>

<div class="content">
Missing a required element:
</div>

<div class="image">
[image of sample output]
</div>

<div class="content">
Missing a required attribute:
</div>

<div class="image">
[output image]
</div>

<div class="content">
Extraneous or misspelled element:
</div>

<div class="image">
[output]
</div>
