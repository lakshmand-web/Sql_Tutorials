-- Q. write a SQL query to split a full name column into frist name and last name. Assume the names are separated by a single space. 

create table names(                                 -- create a table
	id serial ,
    full_name varchar(195)
    );
    
insert into names (full_name)                         -- insert a values
value('manjunath reddy'),
	 ('Arjun Verma'),
	 ('Aditya Kiran'),
	 ('Dhanush Subramanian'),
     ('Siddarth Shetty'),
	 ('Karthik Nithin Iyer');
     
select * from names                                            -- to show the table columns which is created and a datatypes


select full_name,
	SUBSTRING_INDEX(full_name, ' ',1) as first_name,           -- (full_name, ' ', 1) → returns everything before the first space
    SUBSTRING_INDEX(full_name, ' ',2) as last_name            -- (full_name, ' ', -1) returns everything after the last space
    from names;

-- SUBSTRING_INDEX(string, delimiter, count) (string → text you want to) [splitdelimiter → the character to split by (e.g., space ' ' )] {count:positive number,negative numbe}





    
SELECT 
    full_name,
    SUBSTRING_INDEX(full_name, ' ', 1) AS first_name,
    SUBSTRING_INDEX(full_name, ' ', -1) AS last_name,
  TRIM(
    REPLACE(
        REPLACE(full_name,SUBSTRING_INDEX(full_name, ' ', 1), ''),   -- remove first name
        SUBSTRING_INDEX(full_name, ' ', -1), '' ))as middle_name       -- remove last name 
        FROM names;

-- Inner REPLACE (Removes First Name): It replaces the first name (obtained by SUBSTRING_INDEX(full_name, ' ', 1)) with an empty string ('').
-- ​Result for 'John David Smith': ' David Smith' (Note the leading space).
-- ​Outer REPLACE (Removes Last Name): It then takes the result from Step 1 and replaces the last name (obtained by SUBSTRING_INDEX(full_name, ' ', -1)) with an empty string ('').
-- ​Result: ' David '
-- ​TRIM(): The final TRIM() function removes any leading or trailing spaces remaining from the replacements.
-- ​Final Result: 'David' (the middle name)