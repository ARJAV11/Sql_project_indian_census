select * from dataset1;
select* from dataset2;
select count(*) from dataset1;
select count(*) from dataset2;
-- data set for bihar and jharkhand
 
 select* from dataset1
 where state in ('bihar','jharkhand');
 
 -- total population
 select sum(population) as total_population from dataset2;
 
 -- average growth in population
 select state , avg(growth)*100 as average_growth from dataset1 group by state;
 
 -- avergae sex_ratio(ascending order)
 select state , round(avg(Sex_Ratio),0) average_Sex_ratio from dataset1 group by state order by average_Sex_ratio ;
 
 -- average literacy rate
 select state,round(avg(literacy),0) avg_literacy_ratio from dataset1 group by state 
  having round(avg(literacy),0)>90  order by avg_literacy_ratio desc;

-- top three state showing highest avg_growth ratio
select state , round(avg(growth)*100,2) as avg_growth from dataset1 group by state order by avg(growth) desc
limit 3;

-- top three states showing the lowest sex_ratio
select state,round(avg(sex_ratio),0) as avg_sex_ratio from dataset1 group by state order by avg(sex_ratio)
limit 3;

select  state,round(avg(sex_ratio),0) avg_sex_ratio from dataset1 group by state order by avg(Sex_Ratio)
limit 3;

-- top and bottom 3 states in literacy state
drop table topstates;
create table topstates(
state varchar(255),
topstate float
)

insert into topstates(
select state,round(avg(literacy),0) avg_literacy_ratio from dataset1
group by state order by avg_literacy_ratio desc
);
select* from topstates
limit 3;

drop table if exists bottomstates;
create table bottomstates(
state varchar(255),
bottomstate float
)
insert into bottomstates(
select state,round(avg(literacy),0) avg_literacy_ratio from dataset1
group by state order by avg_literacy_ratio asc
);
select* from bottomstates
limit 3;


-- uninon operataor
select* from(
select* from topstates limit 3)a
UNION
select*from(
select* from bottomstates
limit 3)b;

-- state starting with letter a
select distinct state from dataset1 where lower(state) like 'a%';
-- states ending with a
select distinct state from dataset1 where lower(state) like '%a';