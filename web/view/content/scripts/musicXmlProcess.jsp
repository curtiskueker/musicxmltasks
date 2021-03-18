<pre>
MUSICXMLPROCESS(1)                                                                                                    User Commands                                                                                                   MUSICXMLPROCESS(1)

NAME
       musicXmlProcess - manual page for musicXmlProcess 1.0

SYNOPSIS
       musicXmlProcess [OPTIONS] SCRIPT_NAME [OUTPUT_DIRECTORY] INPUT_LIST

DESCRIPTION
       Runs SCRIPT_NAME for each item in an INPUT_LIST.

       An OUTPUT_DIRECTORY argument is required for some values of SCRIPT_NAME.

       SCRIPT_NAME: One of the following values: musicXmlValidate musicXmlCompress musicXml2Db musicXml2Ly musicXml2Pdf db2MusicXml db2Ly db2Pdf ly2Pdf

       OUTPUT_DIRECTORY:   Required  for  SCRIPT_NAME values that generate output: musicXmlCompress:  Output filenames are same as the MusicXML input filenames, but with a .mxl extension musicXml2Ly:  Output filenames are same as the MusicXML input
       filenames, but with a .ly extension musicXml2Pdf:  Output filenames are same as the MusicXML input filenames, but with a .pdf extension db2MusicXml:  Output filenames are the Score IDs or score names passed  as  arguments,  with  underscores
       replacing spaces, and a .xml extension db2Ly:  Output filenames are the Score IDs or score names passed as arguments, with underscores replacing spaces, and a .ly extension db2Pdf:  Output filenames are the Score IDs or score names passed as
       arguments, with underscores replacing spaces, and a .pdf extension ly2Pdf:  Output filenames are same as the LilyPond input filenames, but with a .pdf extension

       INPUT_LIST: For scripts that take file input (scripts musicXml* and ly2Pdf), the input list is a space-separated list of file names and directories, including wildcards.  Examples: For a single file: files/jsbach/Invention_1.xml

       For all files matching a pattern: files/jsbach/Invention_*.xml

       For all files in a directory: files/jsbach/*

       For scripts that take database record input (scripts db2*), the input list is a space-separated list of score names, score IDs, and score ID ranges.  Comma-separated score name lists are not processed as lists of score  names  because  score
       names may contain commas.  Score ID lists and ranges can be comma-separated lists of ID numbers with dashes indicating score ranges.  Example: 3,18-20,39 will execute score IDs 3, 18, 19, 20, and 39.

OPTIONS
       -v, --verbose
              displays processing output

EXAMPLES
       Output Score ID database records 1 to 50 as MusicXML to directory /tmp/output: musicXmlProcess db2MusicXml /tmp/output 1-50

       Output database records with score names "movement 1", "movement 2", "movement 3", and "movement 4" as LilyPond files and output to directory /tmp/output: musicXmlProcess db2Ly /tmp/output "movement 1" "movement 2" "movement 3" "movement 4"

       Load all MusicXML files in directory files/jsbach into the database with verbose output: musicXmlProcess -v musicXml2Db files/jsbach/*

SEE ALSO
       The full documentation for musicXmlProcess is maintained as a Texinfo manual.  If the info and musicXmlProcess programs are properly installed at your site, the command

              info musicXmlProcess

       should give you access to the complete manual.

musicXmlProcess 1.0                                                                                                    March 2021                                                                                                     MUSICXMLPROCESS(1)
</pre>

