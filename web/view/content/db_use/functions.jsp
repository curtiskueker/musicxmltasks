<div class="content-header">Functions</div>

<div class="content">
This page lists the stored functions I've used in the reports code shown here.
All of the functions code is included in the zip file of reports sql code <a href="/scripts/stored_procedures.zip" target="_blank">here</a>.
</div>

<div class="content">
char_to_boolean: A 'Y' database value is true, otherwise false
</div>

<div class="content">
<textarea class="example" readonly rows="13">
drop function if exists char_to_boolean;

delimiter //
create function char_to_boolean (
    boolean_value char(1)
)
returns boolean
deterministic
begin
    return boolean_value is not null and boolean_value = 'Y';
end //
delimiter ;
</textarea>
</div>

<div class="content">
is_tied_note.sql: Returns whether a note has a tie to the note
</div>

<div class="content">
<textarea class="example" readonly rows="33">
drop function if exists is_tied_note;

delimiter //
create function is_tied_note (
    v_note_id int
)
returns boolean
not deterministic
begin
    declare is_end_of_data boolean default false;
    declare v_type varchar(255);
    declare is_tied boolean default false;

    declare c_note_ties cursor for
        select type from tie where note_id = v_note_id;

    declare continue handler for not found set is_end_of_data = true;

    open c_note_ties;
    ties_loop: loop
        fetch c_note_ties into v_type;
        if is_end_of_data then leave ties_loop; end if;
        if v_type = 'stop' or v_type = 'continue' then
            set is_tied = true;
            leave ties_loop;
        end if;
    end loop;
    close c_note_ties;

    return is_tied;
end //
delimiter ;
</textarea>
</div>

<div class="content">
pitch_label.sql: Returns a pitch label for a pitch class number where C = 0
</div>

<div class="content">
    <textarea class="example" readonly rows="40">
drop function if exists pitch_label;

delimiter //
create function pitch_label (
    v_pitch_class int
)
returns varchar(255)
deterministic
begin
    case v_pitch_class
        when 0 then
            return 'C';
        when 1 then
            return 'C-sharp/D-flat';
        when 2 then
            return 'D';
        when 3 then
            return 'D-sharp/E-flat';
        when 4 then
            return 'E';
        when 5 then
            return 'F';
        when 6 then
            return 'F-sharp/G-flat';
        when 7 then
            return 'G';
        when 8 then
            return 'G-sharp/A-flat';
        when 9 then
            return 'A';
        when 10 then
            return 'A-sharp/B-flat';
        when 11 then
            return 'B';
        else
            return null;
    end case;
end //
delimiter ;
    </textarea>
</div>

<div class="content">
pitch_number.sql: Returns a pitch class number for a pitch, alter, and transpose value where C = 0
</div>

<div class="content">
    <textarea class="example" readonly rows="41">
drop function if exists pitch_number;

delimiter //
create function pitch_number (
	v_step varchar(255),
	v_pitch_alter int,
	v_transpose int
)
returns int
deterministic
begin
	declare v_pitch_number int default 0;
	declare v_mod_number int default 12;

	if v_step is null then return null; end if;

	case v_step
		when 'A' then
			set v_pitch_number = 9;
		when 'B' then
			set v_pitch_number = 11;
		when 'C' then
			set v_pitch_number = 0;
		when 'D' then
			set v_pitch_number = 2;
		when 'E' then
			set v_pitch_number = 4;
		when 'F' then
			set v_pitch_number = 5;
		when 'G' then
			set v_pitch_number = 7;
		else
			return null;
	end case;
	if v_pitch_alter is not null then set v_pitch_number = v_pitch_number + v_pitch_alter; end if;
	if v_transpose is not null then set v_pitch_number = v_pitch_number + v_transpose; end if;
	return (mod(v_pitch_number + v_mod_number, v_mod_number));
end //
delimiter ;
    </textarea>
</div>
