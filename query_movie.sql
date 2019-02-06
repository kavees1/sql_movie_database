--Question 1
--the query below list all movies with John Malkovich as an actor
select c.title
from Cast1 c, Person p
where  p.name = 'John Malkovich' and c.actor = p.pnum;


--Question 2
--the query below puts a contract on director in the movie table
-- which means that every movie must have a director or it will be rejected.
ALTER TABLE Movie 
DROP foreign key Movie_fk_Director;


ALTER TABLE Movie Add CONSTRAINT Movie_fk_Director 
 foreign key (director)
 REFERENCES Director(pnum);

-- the below statement would be rejected since in the director field is an invalid result.
--insert into Movie(title,studio,year,genre,director,movielength) values ('ScreenPLay1','FOX',2018,'HORROR',5,123);
 
--Question 3
 -- if a director is deleted from the databse then all the movies that director
 -- was associated with is also deleted.
 -- On delete casacade was used on every table that takes director as a foriegn key.
ALTER TABLE Movie 
DROP foreign key Movie_fk_Director;

ALTER TABLE Movie 
  ADD CONSTRAINT DELETE_MOVIE_CASACADE 
  FOREIGN KEY (director) 
  REFERENCES Director(pnum) 
  ON DELETE CASCADE; 
  

ALTER TABLE Cast1 
DROP foreign key Cast1_Movie;  

ALTER TABLE Cast1 
  ADD CONSTRAINT DELETE_Cast1_CASACADE 
 foreign key(title,studio,year) references Movie 
  ON DELETE CASCADE; 
  
ALTER TABLE Affiliated 
DROP foreign key Affiliated_Director;

ALTER TABLE Affiliated 
  ADD CONSTRAINT DELETE_Affiliated_CASACADE 
   foreign key(director) references Director
  ON DELETE CASCADE; 
-- the below statement would delete all director and the movies he was associated with.
-- DELETE FROM Director WHERE pnum = 4;
  
--Question 4
-- a trigger was created where when ever a movie is inserted that movie is 
-- produced by one studio and directed by a director affiliated with another studio is rejected.
-- THe below insert statement would work however the director is affliated with another studio.
--INSERT INTO Movie values ('ScreenPLay1','CTW',2018,'HORROR',1,123);

create TRIGGER TEST
After insert on Movie
Referencing NEW ROW AS NewTup
FOR EACH ROW
WHEN (NewTup.studio   NOt IN
   (select a.studio FROM Affiliated a
  where NewTup.director = a.director and
  NewTup.studio = a.studio))
insert into Movie(Studio)
  values(NewTup.studio)
;
-- the below insert stament would be rejected
--INSERT INTO Movie values ('ScreenPLay1','HBO',2018,'HORROR',1,123);
-- Question 5
-- the below triggers updates the director of that movie with the John Malkovich who is 
--inserted into actor table with pnum = 1 and if he is cast into a movie that director
-- of that movie gets updated to pnum = 1 which is John Malkovich.
-- the below  insert statement will insert the value into cast1 however since it is before
-- the trigger the movie table will not be updated.
--INSERT INTO Cast1(title, studio, year, role, actor, minutes) values ('ScreenPlay3', 'HBO', 2020, 'LEADrole', 1, 420);
create TRIGGER TEST1 
AFTER insert on Cast1 
Referencing new row as NewTup1 
FOR EACH ROW 
when(NewTup1.actor  in
    (select p.pnum FROM Person p
     where p.pnum = NewTup1.actor and p.name ='John Malkovich'))
 update movie old set director = NewTup1.actor 
 where NewTup1.title=old.title and NewTup1.studio=old.studio and NewTup1.year=old.year;
--the below insert statement insert JOhn Malkovich into cast and it will change the director of that movie from
-- 3 to 1.
--INSERT INTO Cast1(title, studio, year, role, actor, minutes) values ('ScreenPlay3', 'HBO', 2020, 'LEADrole', 1, 420);
