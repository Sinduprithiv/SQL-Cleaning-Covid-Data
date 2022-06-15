select * from c_case where location='Canada';
select location, row_date, total_case, new_Case, population, (total_Case/population*100) as AFFECTED_PERCENTAGE from c_case where location='Canada';

//affected percentage - round off to 3 decimal
select location, row_date, total_case, new_Case, population, (Round((total_Case/population*100),4)) as AFFECTED_PERCENTAGE from c_case 
where location='Canada' order by row_date;

//death percentage
select location, row_date, total_case, total_Death, population, (Round((total_death/population*100),4)) as DEATH_PERCENTAGE from c_case 
where location='Canada' order by row_date;

//fully_vaccinated percentage
select location, row_date, population, PEOPLE_FULLY_VACCINATED, (Round((PEOPLE_FULLY_VACCINATED/population*100),4)) as 
FULLYVACCINATED_PERCENTAGE from c_case 
where location='Canada' order by row_date;

//Query to Identify incorrect values (dates with lower vaccinated percentage than the previous day)
select a1.location, a1.row_date, a1.PEOPLE_FULLY_VACCINATED, (Round((a1.PEOPLE_FULLY_VACCINATED/a1.population*100),4)) as FULLY_VACCINATED_PERCENTAGE 
from c_case a1 join c_case a2
on a1.row_date = a2.row_date-1
where a1.location='Canada' and a2.location='Canada' and (Round((a1.PEOPLE_FULLY_VACCINATED/a1.population*100),4)) > (Round((a2.PEOPLE_FULLY_VACCINATED/a2.population*100),4))
order by a1.row_date;

//To view the join table data 
select a1.row_date, a1.Total_Death, (Round((a1.total_death/a1.population*100),4)) as DEATH_PERCENTAGE, a2.*,
(Round((a2.total_death/a2.population*100),4)) as DEATH_PERCENTAGE2
from c_case a1 join c_case a2
on a1.row_date = a2.row_date-1
where a1.location='Canada' and a2.location='Canada'
order by a1.row_date;

//Query to Identify incorrect values in total_death column
select a1.location, a1.row_date, a1.Total_Death, (Round((a1.total_death/a1.population*100),4)) as DEATH_PERCENTAGE 
from c_case a1 join c_case a2
on a1.row_date = a2.row_date-1
where a1.location='Canada' and a2.location='Canada' and (Round((a1.total_death/a1.population*100),4)) > (Round((a2.total_death/a2.population*100),4)) 
order by a1.row_date;

//Select queries I expect to see null records
  //check on median_age field
  select count(location), location from (select distinct median_age, location from c_case group by location, median_Age) 
  group by location having count(location)>1;

  //check on population_density field
  select count(location), location from (select distinct population_density, location from c_case group by location, population_density) 
  group by location having count(location)>1;

  select * from c_Case where row_date is null;

  // Incorrect "Location" value- continent value where country value is expected
  select distinct location from c_Case where continent is null;
