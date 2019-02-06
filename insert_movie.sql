
insert into Person ( pnum, name, when, nationality,gender) values
(1,'John Malkovich','2001-12-1-11.59.00','black','M'),
(2,'Tracy','2001-12-1-11.59.00','black','F'),
(3,'NEW','2011-12-1-11.59.00','white','F'),
(4, 'John Mal', '2011-12-1-11.59.00','gray','M'),
(5, 'John', '2011-12-1-11.59.00','gray','M')
;

insert into Actor (aguild, pnum) values
(3,1),
(53,2),
(69,3),
(40,4)
;

insert into Director (dguild, pnum) values
(5,1),
(23,2),
(56,3),
(569,4)
;

insert into Writer(wguild,pnum) values
(123,1),
(342,2),
(256,3),
(232,4)
;

insert into Studio (name) values
('FOX'),
('CTW'),
('HBO')
;

insert into ScreenPlay(title,year) values
('ScreenPLay1',2018),
('ScreenPlay2',2019),
('ScreenPlay3',2020),
('ScreenPlay3',2021),
('John Mal',2021);

insert  into Authored(title,year,writer) values
('ScreenPLay1',2018,1),
('ScreenPlay2',2019,2),
('ScreenPlay3',2020,3),
('ScreenPlay3',2021,4),
('John Mal',2021,4)
;

insert into Movie(title,studio,year,genre,director,movielength) values
('ScreenPLay1','FOX',2018,'HORROR',1,123),
('ScreenPlay2','CTW',2019,'FANTASY',2,669),
('ScreenPlay3','HBO',2020,'DOCMENTARY',3,58),
('ScreenPlay3','FOX',2021,'DOCMENTARY',4,58),
('John Mal','FOX',2021,'TESTING',4,69)
;

insert into Cast1 (title,studio,year,role,actor,minutes) values
('ScreenPLay1','FOX',2018,'LEAD ACTOR',1,12),
('ScreenPlay3','HBO',2020,'Secondary actor',1,58),
('John Mal','FOX',2021,'TESTING role',1,69)
;


insert into Affiliated(director,studio) values
(1,'FOX'),
(2,'CTW'),
(3,'HBO'),
(4,'CTW'),
(4,'HBO');




