<div class="content-header">Using the Database</div>

<div class="content">
A relational database allows us to query data quickly and easily.
</div>

<div class="content">
To take an example, we can use a relational database in combination with business reports software,
    and obtain a visual representation of music data with a relatively small amount of additional programming.
The authors of the reports software will do the majority of work for us.
</div>

<div class="content">
I will present simple examples here that use the MySQL database and the BIRT business intelligence reporting software, both available for free.
The examples I include here are for presentation purposes, and aren't meant to represent any real-world examples that music theorists might be interested in.
The intent is here is to present simple examples to show what can be done.
With a bit more care, ingenuity, and attention to detail, we can expand on these examples on our own, or come up with other uses and applications.
</div>

<div class="content">
    I'm using the MySQL database in the examples here, but each of the database flavors handled by the application have their own versions of stored procedures,
    so the approach here is translatable.
</div>

<div class="content">
All of the MySQL procedure, function, and view code used in this section is available in a zip file <a href="/resources/scripts/stored_procedures.zip" target="_blank">here</a>.
</div>

<div class="content">
As a starting point, the basic structure of a score stored in the MusicXML schema is a partwise score with a list of parts each containing a list of measures,
with each measure having a list of music data records.
We start, then, with a view that will obtain the music data list in <code>part</code>, <code>measure</code>, and <code>music_data</code> order:
</div>

<div class="content">
<textarea class="example" readonly rows="17">
create or replace view score_view as
select
       s.id as score_id,
       p.id as part_id,
       m.measure_number,
       md.id as music_data_id, md.music_data_type, md.voice, md.duration, md.grace_id, char_to_boolean(md.chord) as chord,
       nt.note_type_type, nt.step, nt.pitch_alter, nt.octave,
       t.chromatic
from
     score s, part p, measure m, music_data md
left join note_type nt on nt.id = md.note_type_id
left join transpose t on t.attributes_id = md.id
where
      s.id = p.score_id
      and p.id = m.part_id and m.id = md.measure_id
order by p.ordering, m.ordering, md.ordering;
</textarea>
</div>

<div class="content">
By using a view we can create a reusable music data list that we can iterate in a loop in the order that it appears in a MusicXML file.
</div>

<div class="content">
The fields in the select list will be used to generate data that we store in various reports tables of our own creation.
We can then later query and display this generated data using the reports software.
</div>

<div class="content">
The processing of the results from the score view above and the generation of reports table output is done via stored procedures and functions.
</div>

<div class="content-section">Subpage content</div>

<div class="content">
The subpages of this page have the following content:
</div>

<div class="content-subsection">Stored Procedures</div>

<div class="content">
    Introduces the <code>score_report</code> stored procedure that calls all of the individual reports described in this section.
</div>

<div class="content-subsection">Functions</div>

<div class="content">
    Lists the code for all of the stored utility functions used by the reports procedures in this section.
</div>

<div class="content-subsection">Reports</div>

<div class="content">
    Outlines how to set up reports in BIRT,
    and how to set up and run the individual reports examples in this section.
    Shows the generated visualization charts.
</div>
