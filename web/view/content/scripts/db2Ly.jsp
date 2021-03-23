<pre>
DB2LY(1)                                                                                                              User Commands                                                                                                             DB2LY(1)

NAME
       db2Ly - manual page for db2Ly 1.0

SYNOPSIS
       db2Ly [OPTIONS] SCORE_ID|SCORE_NAME [OUTPUT_FILE]

DESCRIPTION
       Converts a MusicXML database record to LilyPond.

       SCORE_ID: the database record value in the score table, field id.

       SCORE_NAME: the database record value in the score table, field score_name.

       OUTPUT_FILE: the LilyPond output filename.

       If no OUTPUT_FILE argument is given, output is to stdout.

OPTIONS
       -b, --include-breaks
              include page and system breaks in the LilyPond output

       -v, --verbose
              displays processing output

SEE ALSO
       The full documentation for db2Ly is maintained as a Texinfo manual.  If the info and db2Ly programs are properly installed at your site, the command

              info db2Ly

       should give you access to the complete manual.

db2Ly 1.0                                                                                                              March 2021                                                                                                               DB2LY(1)
</pre>

