<div class="content-header">Windows Scripts</div>

<div class="content">
  Windows scripts have the following general features:
  <ul>
    <li>Scripts with file output can send their output to stdout which can also be piped to another script (<code>*2MusicXml</code> and
      <code>*2Ly</code> scripts)</li>
    <li><code>/h</code> and <code>--help</code> options</li>
  </ul>
</div>

<div class="content">
  The scripts are part of the installation, and are also available separately in a zip file <a href="/resources/scripts/windows_scripts.zip">here</a>.
</div>

<div class="content-section">XML Validation</div>

<div class="content">
  The <code>musicXmlValidate</code> script validates a MusicXML file against the MusicXml 3.1 schema.
  All of the <code>musicXml2*</code> conversion scripts validate the file before processing as well.
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
