<pre>
SYNOPSIS
       db2Ly [OPTIONS] SCORE_ID|SCORE_NAME [OUTPUT_FILE]

       Converts a MusicXML database record to LilyPond.

       SCORE_ID: the database record value in the score table, field id.

       SCORE_NAME: the database record value in the score table, field score_name.

       OUTPUT_FILE: the LilyPond output filename.

       If no OUTPUT_FILE argument is given, output is to stdout.

OPTIONS
       /b, --include-breaks
              include page and system breaks in the LilyPond output

       /v, --verbose
              displays processing output
</pre>

