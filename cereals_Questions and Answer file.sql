# Exercise
# Database: cereals
drop database if exists cereals;
create database cereals;
use cereals;
select * from cereals_data;


# Queries
# 1. Add index name fast on name
alter table cereals_data modify name varchar(50);
create index Cereal_Name on cereals_data (name);
show index from cereals_data;

# 2. Describe the schema of table
describe cereals_data;

# 3. Create view name as see where users can not see type column [first run appropriate query then create view]
select * from cereals_data;
create view see as (select name,mfr,calories,protein,fat,sodium,fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating from cereals_data);

# 4. Rename the view as saw
rename table see to saw;
select * from saw;

# 5. Count how many are cold cereals
select * from cereals_data;
select type,count(*) as Count from cereals_data where type ='C';

# 6. Count how many cereals are kept in shelf 3
select shelf,count(*) as Count from cereals_data where shelf =3;

# 7. Arrange the table from high to low according to ratings
select * from cereals_data order by rating desc;

# 8. Suggest some column/s which can be Primary key
select name from cereals_data group by name having count(*)>1;  # You can see non of the data is duplicated so you can keep name as primary key
alter table cereals_data modify name varchar(50) primary key;

# 9. Find average of calories of hot cereal and cold cereal in one query
select * from cereals_data;
select type,round(avg(calories),0) Average_calories from cereals_data group by type;

# 10. Add new column as HL_Calories where more than average calories should be categorized as HIGH and less than average calories should be categorized as LOW
alter table cereals_data add column HL_Calories varchar(20);
select round(avg(calories),0) avg_calories from cereals_data;
update cereals_data set HL_Calories = case  when calories>107 then 'High' when calories<107 then 'Low' end ;
select * from cereals_data;

# 11. List only those cereals whose name begins with B
select * from cereals_data where name like 'B%';

# 12. List only those cereals whose name begins with F
select * from cereals_data where name like 'F%';

# 13. List only those cereals whose name ends with s
select * from cereals_data where name like '%s';

# 14. Select only those records which are HIGH in column HL_calories and mail to jeevan.raj@imarticus.com [save/name your file as <your first name_cereals_high>]
select * from cereals_data where HL_Calories = 'High';

# 15. Find maximum of ratings
select max(rating) Max_Rating from cereals_data;

# 16. Find average ratings of those were High and Low calories
select * from cereals_data;
select HL_calories,round(avg(rating),0) as Average_rating from cereals_data group by HL_calories;

# 17. Craete two examples of Sub Queries of your choice and give explanation in the script itself with remarks by using #
# Problem 1 :- Extract all the information from the cereals data whose calories is greater than average calories
select * from cereals_data where calories > (select avg(calories) from cereals_data);

# Problem 2:- Extract all the information from the cereals data whose sodium is greater than fruitful_bran
select * from cereals_data where sodium>(select sodium from cereals_data where name = 'fruitful_bran');

# 18. Remove column fat
alter table cereals_data drop fat;
select * from cereals_data;

# 19. Count records for each manufacturer [mfr]
select mfr,count(*) as Count from cereals_data group by mfr;
# 20. Select name, calories and ratings only
select name,calories,rating from cereals_data;