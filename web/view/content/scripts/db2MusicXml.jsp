<pre>
DB2MUSICXML(1)                                                                                                        User Commands                                                                                                       DB2MUSICXML(1)

NAME
       db2MusicXml - manual page for db2MusicXml 1.0

SYNOPSIS
       db2MusicXml [OPTIONS] SCORE_ID|SCORE_NAME [OUTPUT_FILE]

DESCRIPTION
       Converts a MusicXML database record to MusicXML.

       SCORE_ID: the database record value in the score table, field id.

       SCORE_NAME: the database record value in the score table, field score_name.

       OUTPUT_FILE: the XML output filename.

       If filename has .mxl extension, output file is zipped, and the -z|--zipped-file option is required.

       If no OUTPUT_FILE argument is given, output is to stdout.

OPTIONS
       -c, --skip-comments
              don't include XML comments and processing instructions in the XML output

       -v, --verbose
              displays processing output

       -z ZIPPED_FILE_NAME, --zipped-file=ZIPPED_FILE_NAME
              name of XML file included in zipped .mxl output file

SEE ALSO
       The full documentation for db2MusicXml is maintained as a Texinfo manual.  If the info and db2MusicXml programs are properly installed at your site, the command

              info db2MusicXml

       should give you access to the complete manual.

db2MusicXml 1.0                                                                                                        March 2021                                                                                                         DB2MUSICXML(1)
</pre>

