#------------------------------------------------------Netflix Data Analysis ------------------------------------------------------------

/*----------------------------------------------Task 1-------------- ----------------------------------------------------
<---Task.1) Is there any Duplicate Record in this dataset ? If yes, then remove the duplicate records-->
Query-  */
SELECT show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description, COUNT(*)
FROM netflix
GROUP BY show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description
HAVING COUNT(*) > 1;

/*----------------------------------------------Task 2 ----------------------------------------------------------------------
<-------Task. 2) Is there any Null Value present in any column ?------------------------------------------------------------>
Query-  */
SELECT show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description
FROM netflix
WHERE show_id IS NULL
   OR type IS NULL
   OR title IS NULL
   OR director IS NULL
   OR cast IS NULL
   OR country IS NULL
   OR date_added IS NULL
   OR release_year IS NULL
   OR rating IS NULL
   OR duration IS NULL
   OR listed_in IS NULL
   OR description IS NULL;
/*----------------------------------------- Question-1--------------------------------------------

<---Q. 1) For 'House of Cards', what is the Show Id and Who is the Director of this show ?------>
Query-  */

select show_id, director  from netflix
 where title = "House of Cards";

/*--------------------------------------------Question -2 --------------------------------------

<----Q. 2) In which year the highest number of TV Shows & Movies were released?-------------->
Query-
Maximum count of TV Show on the basis of year    */
select count(type) as count, release_year from netflix
where type='TV Show'
group by release_year 
order by count desc
limit 1;

#Maximum count of Movie per year
select count(type) as count, release_year from netflix
where type='Movie'
group by release_year 
order by count desc
limit 1;


/*--------------------------------------------Question -3 --------------------------------------

<--------------Q. 3) How many Movies & TV Shows are in the dataset ?-------------------------->
Query - 
Count of TV Show    */
select count(type) from netflix where
type='TV Show';

#Count of Movie Show
select count(type) from netflix where
type='Movie';

/*--------------------------------------------Question - 4 --------------------------------------

<---Q. 4) Show all the Movies that were released in the year 2000.-------------------------->
Query-   */
Select * from netflix
where type='Movie' and release_year=2000;

/*--------------------------------------------Question - 5 --------------------------------------

<-----Q. 5) Show only the Titles of all TV Shows that were released in India only------------->
Query-  */
select title from netflix
where type='TV Show' and country='India';

/*--------------------------------------------Question - 6 --------------------------------------

<--Q. 6) Show Top 10 Directors, who gave the highest number of TV Shows & Movies to Netflix ?-->
Query-   */
SELECT director, COUNT(title) AS number_of_TV_Show
FROM netflix
GROUP BY director
ORDER BY number_of_TV_Show DESC
LIMIT 10;

/*--------------------------------------------Question - 7 ------------------------------------------------------------
<--Q. 7) Show all the Records, where "Category is Movie and Type is Comedies" or "Country is United Kingdom".--->

Query -  */
select * from netflix 
where type='Movie' and listed_in like '%Comedies%' or country='United Kingdom';

/*---------------------------------------------------Question - 8 ----------------------------------------------------
<----Q. 8) In how many movies/shows, Tom Cruise was cast ?---->
Query -  */
select count(type) as number_movie_show from netflix
where cast like '%Tom Cruise%';

/*--------------------------------------------Question - 9------------------------------------------------------------

<----Q. 9) What are the different Ratings defined by Netflix ?
▪ Q. 9.1) How many Movies got the 'TV-14' rating, in Canada ?
▪ Q. 9.2) How many TV Shows got the 'R' rating, after year 2018 ? 

Query- 9.1 */
select count(type) as Movie_count from netflix
where type = 'Movie' and  rating ='TV-14' and country = 'Canada';

#Query 9.2-
select count(type) as TV_show_count from netflix
where type = 'TV Show' and rating = 'R' and release_year > 2018;

/*--------------------------------------------Question - 10--------------------------------
<--Q. 10) What is the maximum duration of a Movie/Show on Netflix ?.--->

Query -  */
SELECT type,duration
FROM netflix
WHERE duration = (SELECT MAX(duration) FROM netflix) 
limit 1;

/*--------------------------------------------Question - 11--------------------------------
<--------Q. 11) Which individual country has the Highest No. of TV Shows ?-------->

Query -  */
select country ,count(type) as TV_Show_count from netflix
where type='TV show'
group by country
order by TV_Show_count desc 
limit 1;

/*--------------------------------------------Question - 12--------------------------------
<--------Q. 12) How can we sort the dataset by Year ?-------->

Query -  */
select * from netflix 
order by release_year ;

/*-----------------------------------------------------Question - 13---------------------------------------------------------------------------
<--------Q. 13) Find all the instances where: Category is 'Movie' and Type is 'Dramas' or Category is 'TV Show' & Type is 'Kids' TV'.-------->

Query -  */
select * from netflix
where type = 'Movie' and listed_in like '%Dramas%' or type = 'TV Show' and listed_in like "%Kids' TV%";
