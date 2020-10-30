<div class="content-header">Database Persistence</div>

<div class="content">
Once the Java beans data structure has been created from a MusicXML file,
the beans are then persisted to the database using Hibernate object-relational mapping.
</div>

<div class="content">
Hibernate annotations added to the Java bean code in the tasks application:
    <ul>
        <li>Define and create the tables and columns of the MusicXML database layout</li>
        <li>Persist MusicXML score data to the database</li>
        <li>Fetch score data from the database, and create and populate Java beans representing the score's structure</li>
    </ul>
</div>

<div class="content">
As outlined on the Java Beans page in this section, the application's bean data structure is a translation
from the MusicXML schema definition.
Hibernate annotations are added to the beans individually to map the score data to the database schema definition.
</div>

<div class="content-section">Database mapping</div>

<div class="content-subsection">Entities and database tables</div>

<div class="content">
A bean that maps to a database table is declared as a Hibernate entity.
The table name for the bean is always declared, because MySQL table names are case-sensitive on some operating systems.
</div>

<div class="content">
    <textarea class="example" readonly rows="4">
@Entity
@Table(name = "part")
public class Part extends OrderedElement {
    </textarea>
</div>

<div class="content-subsection">Discriminator columns</div>

<div class="content">
Abstract classes that represent many different concrete subtypes are mapped as a single-inheritance entity with a discriminator column.
Each concrete subclass of the abstract superclass declares the value that is stored in the discriminator column.
On fetch, Hibernate recognizes the stored discriminator value and creates a populated bean of the correct subclass type.
</div>

<div class="content">
For example, DirectionType is annotated:
</div>

<div class="content">
    <textarea class="example" readonly rows="6">
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@Table(name = "direction_type")
@DiscriminatorColumn(name = "direction_type_type")
public abstract class DirectionType extends OrderedElement {
    </textarea>
</div>

<div class="content">
The Coda subclass of DirectionType is annotated with discriminator value <code>coda</code>:
</div>

<div class="content">
    <textarea class="example" readonly rows="4">
@Entity
@DiscriminatorValue("coda")
public class Coda extends DirectionType {
    </textarea>
</div>

<div class="content-subsection">Database columns and bean attributes</div>

<div class="content">
Scalar character values are annotated with their database table column name:
</div>

<div class="content">
        <textarea class="example" readonly rows="6">
@Entity
@Table(name = "measure")
public class Measure extends OrderedElement {
    @Column(name = "measure_number")
    private String number;
        </textarea>
</div>

<div class="content">
Scalar numeric values are annotated with <code>precision = 12</code> and <code>scale = 4</code>.
Numeric values in a MusicXML file beyond 4 places after the decimal point are truncated.
Position values (default and relative x/y) greater than 99999999 will display an exception during conversion and the numeric value is stored as
    <code>null</code>.
</div>

<div class="content">
        <textarea class="example" readonly rows="12">
@Entity
@Table(name = "display")
public class Display extends DatabaseItem {
    @Column(name = "default_x", precision = 12, scale = 4)
    private BigDecimal defaultX;
    @Column(name = "default_y", precision = 12, scale = 4)
    private BigDecimal defaultY;
    @Column(name = "relative_x", precision = 12, scale = 4)
    private BigDecimal relativeX;
    @Column(name = "relative_y", precision = 12, scale = 4)
    private BigDecimal relativeY;
        </textarea>
</div>

<div class="content-subsection">Enumerations</div>

<div class="content">
A collection of MusicXML enumeration values are implemented as a Java enum.
</div>

<div class="content">
Java enum naming convention is that values are upper-case with underscores separating words.
By default, the Hibernate <code>@Enumerated</code> annotation persists these upper-case values as is.
</div>

<div class="content">
Database users, however, would expect that the persisted value be the same as the enumeration value found in the MusicXML schema,
as this would be simpler and more intuitive.
</div>

<div class="content">
An attribute converter class translates between Java enum conventional notation and the MusicXML enumerated values.
Bean attributes of an enum are annotated with the <code>@Convert</code> annotation
that declares which implemented attribute converter class handles the translation.
</div>

<div class="content">
For example, a Slur (along with many other classes) has connection enumeration values which are implemented as the Java enum Connection:
</div>

<div class="content">
        <textarea class="example" readonly rows="9">
package org.curtis.musicxml.common;

public enum Connection {
    START,
    STOP,
    SINGLE,
    CONTINUE
}
        </textarea>
</div>

<div class="content">
The ConnectionConverter class converts the enum values to database values and back:
</div>

<div class="content">
        <textarea class="example" readonly rows="22">
package org.curtis.musicxml.converter;

import org.curtis.musicxml.common.Connection;

import javax.persistence.AttributeConverter;

public class ConnectionConverter extends BaseConverter implements AttributeConverter&lt;Connection, String> {
    public ConnectionConverter() {

    }

    @Override
    public String convertToDatabaseColumn(Connection enumValue) {
        return enumToDbValue(enumValue);
    }

    @Override
    public Connection convertToEntityAttribute(String value) {
        return (Connection) dbValueToEnum(value, Connection.class);
    }
}
        </textarea>
</div>

<div class="content">
        <textarea class="example" readonly rows="21">
package org.curtis.musicxml.converter;

public abstract class BaseConverter {
    protected String enumToDbValue(Enum enumValue) {
        if (enumValue == null) return null;

        String dbValue = enumValue.toString();
        if (dbValue.startsWith("_")) dbValue = dbValue.replaceFirst("_", "");

        return dbValue.toLowerCase().replace("_", "-");
    }

    protected &lt;E extends Enum&lt;E>> Enum dbValueToEnum(String value, Class&lt;E> enumClass) {
        if (value == null) return null;

        if (Character.isDigit(value.charAt(0))) value = "_" + value;

        return Enum.valueOf(enumClass, value.toUpperCase().replace(" ", "_").replace("-", "_"));
    }
}
        </textarea>
</div>

<div class="content">
The connection attribute in the Slur class is then annotated with the ConnectionConverter:
</div>

<div class="content">
        <textarea class="example" readonly rows="7">
@Entity
@DiscriminatorValue("slur")
public class Slur extends Notation {
    @Convert(converter = ConnectionConverter.class)
    @Column
    private Connection type;
        </textarea>
</div>

<div class="content">
The database user can then construct queries using connection values <code>'start'</code>, <code>'stop'</code>, and <code>'continue'</code>,
while at the same time the Java enum preserves its naming convention.
</div>

<div class="content">
Any MusicXML enumerated values that aren't satisfied by the standard conversion process above (they contain capital letters, for example)
are handled as special cases within their individual AttributeConverter class implementations.
</div>

<div class="content-subsection">Foreign keys</div>

<div class="content">
An association between tables is made by a foreign key column in one table that references the other table.
</div>

<div class="content">
One-to-one relationships are annotated with the foreign key in the table of the declaring class.
For example, the <code>score</code> table has a foreign key <code>score_header_id</code> to the <code>score_header</code> table:
</div>

<div class="content">
        <textarea class="example" readonly rows="7">
@Entity
@Table(name = "score", uniqueConstraints = @UniqueConstraint(columnNames = "score_name"))
public class Score extends DatabaseItem {
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "score_header_id")
    private ScoreHeader scoreHeader = new ScoreHeader();
        </textarea>
</div>

<div class="content">
One-to-many relationships are annotated with the foreign key in the table of the referenced class.
They are always annotated with the subselect <code>@Fetch</code> annotation, and declare their ordering on the referenced table's
    <code>ordering</code> column.
For example, a part has a list of measures, so the foreign key <code>part_id</code> is in the <code>measure</code> table that is mapped by the Measure class.
</div>

<div class="content">
        <textarea class="example" readonly rows="10">
@Entity
@Table(name = "part")
public class Part extends OrderedElement {
    [...]
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @Fetch(FetchMode.SUBSELECT)
    @JoinColumn(name = "part_id", nullable = false)
    @OrderBy("ordering")
    private List&lt;Measure> measures = new ArrayList&lt;>();
        </textarea>
</div>

<div class="content-subsection">Transient columns</div>

<div class="content">
Various columns are annotated as transient.
These are columns that are not used in the MusicXML database mapping, and are not persisted in the database.
</div>

<div class="content">
All attributes in a bean entity are required to have an annotation.
When an attribute is only used for building LilyPond output, the attribute is annotated as transient.
</div>

<div class="content">
For example, during LilyPond processing, directions are queued and assigned to the next note,
staff changes are marked, and a note's placement within a chord is noted.
These are temporary processing values and are not persistent, so these attributes get the transient annotation:
</div>

<div class="content">
        <textarea class="example" readonly rows="14">
@Entity
@DiscriminatorValue("note")
public class Note extends MusicDataElement {
    [...]
    @Transient
    // used by lilypond
    private List&lt;Direction> directions = new ArrayList<>();
    @Transient
    // used by lilypond
    private boolean changeStaff = false;
    @Transient
    // used by lilypond
    private OrderedGroup chordType;
        </textarea>
</div>

<div class="content-section">Special case: MusicData and MeasureItem</div>

<div class="content">
The hierarchical Java bean structure reflects the hierarchical structure of an XML document.
As a result, all beans mapped to the database are connected in a hierarchical fashion.
The Score class is at the top of the hierarchy, and so fetching a score from the database can theoretically be done in one query.
This query generated by Hibernate, however, will most likely be unnecessarily large,
and will most likely violate the constraint on the number of tables in a single query in MySQL.
</div>

<div class="content">
To get around this problem, there's a break point in the data model annotation:
<ul>
    <li>The first annotation segment starts at the score level and ends at the measure level, and includes the primary keys of the measure's
        <code>music_data</code> records.</li>
    <li>The second annotation segment begins with the <code>music_data</code> record annotated in full, and includes everything that occurs within all the music data types.</li>
</ul>
</div>

<div class="content">
When a score is fetched, the first query segment includes all of the tables within the score header, the parts, the measures, and the primary keys of the
    <code>music_data</code> records.
</div>

<div class="content">
Then the full <code>music_data</code> records are fetched individually by the primary keys obtained in the first query segment,
and each music data bean is added to the list of music data beans in its enclosing measure.
</div>

<div class="content">
    Likewise, when saving Java beans to the database,
    first the Score up to the measure level is saved,
    and then each MusicData object in each of the measures is saved individually.
</div>

<div class="content">
This approach requires two separate mappings to the <code>music_data</code> table: one that maps the primary key and music data type of the <code>music_data</code> record,
and one that maps the entire music data definition.
</div>

<div class="content">
Java class MusicData represents the <code>choice</code> element in the <code>music-data</code> group, and maps the full
    <code>music_data</code> table definition.
Java class MeasureItem has the partial mapping.
</div>

<div class="content">
In class Measure, there's a mapped list of MeasureItem beans, and a transient attribute for the List of MusicData beans.
</div>

<div class="content">
The annotation for Measure is:
</div>

<div class="content">
        <textarea class="example" readonly rows="12">
    @Entity
    @Table(name = "measure")
    public class Measure extends OrderedElement {
    [...]
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @Fetch(FetchMode.SUBSELECT)
    @JoinColumn(name = "measure_id")
    @OrderBy("ordering")
    private List&lt;MeasureItem> measureItems = new ArrayList<>();
    @Transient
    private List&lt;MusicData> musicDataList = new ArrayList<>();
        </textarea>
</div>

<div class="content">
The MeasureItem class partial mapping:
</div>

<div class="content">
        <textarea class="example" readonly rows="27">
package org.curtis.musicxml.score;

import org.curtis.database.OrderedItem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "music_data")
public class MeasureItem extends OrderedItem {
    @Column(name = "music_data_type")
    private String musicDataType;

    public MeasureItem() {

    }

    public String getMusicDataType() {
        return musicDataType;
    }

    public void setMusicDataType(String musicDataType) {
        this.musicDataType = musicDataType;
    }
}
        </textarea>
</div>

<div class="content">
The MusicData class complete mapping includes its role as an abstract superclass of MusicData types, and the <code>music_data</code> table's role
as a single-inheritance table with a discriminator column.
</div>

<div class="content">
        <textarea class="example" readonly rows="31">
package org.curtis.musicxml.score;

import org.curtis.database.OrderedItem;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@Table(name = "music_data")
@DiscriminatorColumn(name = "music_data_type")
public abstract class MusicData extends OrderedItem {
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "measure_id")
    private Measure measure;

    public Measure getMeasure() {
        return measure;
    }

    public void setMeasure(Measure measure) {
        this.measure = measure;
    }
}
        </textarea>
</div>
