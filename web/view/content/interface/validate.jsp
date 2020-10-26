<div class="content-header">Validating a MusicXML file</div>

<div class="content">
MusicXML Tasks validates any locally-stored MusicXML file against the MusicXML 3.1 schema.  The MusicXML schema used for validation is included in the application, so the user only needs to have the MusicXML file available and enter its location in the tool.
</div>

<div class="content">
XML validation verifies that an XML document is well-formed (syntactically correct), and that the document conforms to the rules defined in the MusicXML schema.
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

<img class="interface-box-image" src="images/interface/validate_box.png" alt="validate box"/>

<div class="content-section">Validation Steps</div>

<div class="content">
    To validate a MusicXML file:
    <ul class="arrowed-list">
        <li class="padded-li"><span>Select the "Validate XML" tab at the top of the tool.</span></li>
        <li class="padded-li"><span>Click on the "Choose MusicXML file" link, navigate to the MusicXML file you want to validate, and select it.</span></li>

        <div class="content">
            You can also enter the XML file name directly in the text box.  The file name must be fully-specified (it includes the full directory path where the file is located).
        </div>

        <li class="padded-li"><span>Press "Validate".</span></li>
    </ul>
    Validation results will appear in the console area at the bottom of the tool.
</div>

<div class="content-section">Output examples</div>

<div class="content">
Successful validation:
</div>

<img class="image" src="images/interface/validate_success.png" alt="validate success"/>

<div class="content">
Ill-formed XML document:
</div>

<img class="image" src="images/interface/validate_ill_formed.png" alt="validate ill formed"/>

<div class="content">
Missing a required element:
</div>

<img class="image" src="images/interface/validate_missing_element.png" alt="validate missing element"/>

<div class="content">
Missing a required attribute:
</div>

<img class="image" src="images/interface/validate_missing_attribute.png" alt="validate missing attribute"/>

<div class="content">
Extraneous or misspelled element:
</div>

<img class="image" src="images/interface/validate_bad_attribute.png" alt="validate bad attribute"/>
