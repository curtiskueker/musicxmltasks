<pre>
SYNOPSIS
       db2MusicXml [OPTIONS] SCORE_ID|SCORE_NAME [OUTPUT_FILE]

       Converts a MusicXML database record to MusicXML.

       SCORE_ID: the database record value in the score table, field id.

       SCORE_NAME: the database record value in the score table, field score_name.

       OUTPUT_FILE: the XML output filename.

       If filename has .mxl extension, output file is zipped, and the /z|--zipped-file option is required.

       If no OUTPUT_FILE argument is given, output is to stdout.

OPTIONS
       /c, --skip-comments
              don't include XML comments and processing instructions in the XML output

       /v, --verbose
              displays processing output

       -z, --zipped-file ZIPPED_FILE_NAME
              name of XML file included in zipped .mxl output file
</pre>

