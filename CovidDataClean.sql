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