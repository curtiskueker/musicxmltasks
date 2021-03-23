<div class="content-header">Command-line Scripts</div>

<div class="content">
    Most of the tasks interface can be run at the command line.
    The scripts included here include the following functionality:
    <ul>
        <li>Data conversion</li>
        <li>MusicXML validation</li>
        <li>MusicXML file compression</li>
        <li>Displaying diff between MusicXML files</li>
        <li>Bulk processing of files</li>
    </ul>
</div>

<div class="content-section">The scripts</div>

<div class="content">
    These are the names of the scripts included with the installation.
    Note the naming convention using capital letters.
    Specifically, this distinguishes <code>musicXml2Ly</code> included here, from LilyPond's packaged executable <code>musicxml2ly</code>.
</div>

<div class="content">
    <ul class="arrowed-list">
        <li class="padded-li"><span><code>db2Ly</code>: converts a MusicXML database record to a LilyPond file.</span></li>
        <li class="padded-li"><span><code>db2MusicXml</code>: converts a MusicXML database record to a MusicXML file.</span></li>
        <li class="padded-li"><span><code>db2Pdf</code>: converts a MusicXML database record to a PDF file.</span></li>
        <li class="padded-li"><span><code>ly2Pdf</code>: converts a LilyPond file to a PDF file.</span></li>
        <li class="padded-li"><span><code>musicXml2Db</code>: converts a MusicXML file to a MusicXML database record.</span></li>
        <li class="padded-li"><span><code>musicXml2Ly</code>: converts a MusicXML file to a LilyPond file.</span></li>
        <li class="padded-li"><span><code>musicXml2Pdf</code>: converts a MusicXML file to a PDF file.</span></li>
        <li class="padded-li"><span><code>musicXmlCompress</code>: compresses and packages an uncompressed MusicXML file as a .mxl file.</span></li>
        <li class="padded-li"><span><code>musicXmlDiff</code>: displays the difference between two MusicXML file.</span></li>
        <li class="padded-li"><span><code>musicXmlProcess</code>: bulk runs the other scripts in this list.</span></li>
        <li class="padded-li"><span><code>musicXmlValidate</code>: validates a MusicXML file against the MusicXML 3.1. schema.</span></li>
    </ul>
</div>

<div class="content-section">Interface settings requirements</div>

<div class="content">
    <ul class="arrowed-list">
        <li class="padded-li"><span>Conversion scripts that use the database (scripts db2* and *2Db)
        require that database connection info first be set in the tasks interface under the "DB Settings" tab.</span></li>
        <li class="padded-li"><span>Converting to PDF uses LilyPond for the conversion,
        and so requires both a LilyPond installation, and setting the LilyPond location in the tasks interface under the "LilyPond/PDF" tab.</span></li>
    </ul>
</div>

<div class="content">
    The scripts are installed as part of the installation process, and are also available separately in a zip file <a href="/resources/scripts/command_line_scripts.zip">here</a>.
</div>
