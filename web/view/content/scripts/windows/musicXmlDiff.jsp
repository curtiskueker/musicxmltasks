<pre>
SYNOPSIS
       musicXmlDiff INPUT_FILE COMPARE_FILE

DESCRIPTION
       Compares two MusicXML files.

       Diff output is to stdout.

       The two MusicXML files are first standardized using xmllint before the diff is performed.

       Unlike Unix diff, all '<' lines appear before all '>' lines.

       INPUT_FILE: the MusicXML input filename.

       COMPARE_FILE: the filename of the MusicXML file that the INPUT_FILE is compared to.
</pre>

