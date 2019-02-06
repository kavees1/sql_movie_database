create table Person(
pnum smallint not null ,
name varchar(20),
when timestamp,
nationality varchar(20),
gender varchar(20),
 primary key(pnum)
);

create table Actor(
aguild smallint not null,
pnum smallint not null,
 primary key(pnum),
 foreign key(pnum) references Person
);


create table Director(
dguild smallint,
pnum smallint not null,
 primary key(pnum),
 foreign key(pnum) references Person
);

create table Writer(
wguild smallint,
pnum smallint not null,
 primary key(pnum),
 foreign key(pnum) references Person
);



create table Studio(
name varchar(20) not null,

 primary key(name)
);

create table ScreenPlay(
title varchar(20) not null,
year smallint not null,

	primary key(title, year)
);


create table Authored(
title varchar(20) not null,
year smallint not null,
writer smallint not null,

 primary key(title, year, writer),

 foreign key(title,year) references ScreenPlay,

 foreign key (writer)references Writer
);



create table Movie(
title varchar(20) not null,
studio varchar(20) not null,
year smallint not null,
genre varchar(20),
director smallint not null,
movielength smallint,

  primary key(title,studio,year),

  foreign key(studio) references Studio,

  foreign key(title,year) references ScreenPlay,
   constraint Movie_fk_Director
   foreign key(director) references Director 

);

create table Cast1(
title varchar(20) not null,
studio varchar(20) not null ,
year smallint not null,
role varchar(20) not null,
actor smallint not null,
minutes smallint,
 primary key(title,studio,year,role,actor),
  constraint Cast1_Movie
 foreign key(title,studio,year) references Movie,
 foreign key(actor) references Actor
);


create table Affiliated(
director smallint not null,
studio varchar(20) not null,
 primary key(director, studio),
 constraint Affiliated_Director
 foreign key(director) references Director,
  foreign key(studio) references Studio
);

