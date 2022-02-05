create table if not exists artists(id serial primary key, name_of_artist varchar(40) not null, alias_artist varchar(40));
create table if not exists genre(id serial primary key, name_of_genre varchar(40) not null);
create table if not exists artist_genre(artist_id integer references artists(id), genre_id integer references genre(id),
	constraint pk primary key (artist_id, genre_id));
	

create table if not exists albums(id serial primary key, title_album varchar(40) not null, year_production integer not null);
create table if not exists artist_albums(artist_id integer references artists(id), album_id integer references albums(id),
	constraint pk_album primary key (artist_id, album_id));

create table if not exists tracks(id serial primary key, name_track varchar(40), duration integer constraint ch_600 check(duration<600),
	name_album integer references albums(id))

create table if not exists collection(id serial primary key, name_collection varchar(40) not null, release_date integer not null);
alter table tracks alter column name_track set not null;

create table if not exists collection_track(collection_id integer references collection(id), track_id integer references tracks(id), 
	constraint col_pk primary key (collection_id, track_id));

alter table artists rename column alias_artist to artist_genre;
alter table artists drop column artist_genre;
alter table artists add column artist_genre integer;
alter table artists drop column artist_genre;


insert into genre values(1, 'Pop');
insert into genre values(2, 'Rap');
insert into genre values(3, 'Rock');
insert into genre values(4, 'Metall');
select * from genre

insert into artists values(1, 'Scooter');
insert into artists values(2, 'Eminem');
insert into artists values(3, 'Nickelback');
insert into artists values(4, 'Rammstein');
select * from artists; 

insert into artist_genre values (1, 1);
insert into artist_genre values (1, 2);
insert into artist_genre values (3, 3);
insert into artist_genre values (3, 4);
insert into artist_genre values (4, 4);
select artist_id from artist_genre where genre_id=4;

insert into albums values (1, 'Mutter with Rammstein and Nickelback', 1999);
insert into albums values (2, 'Alliluya with Eminem and Scooter', 2010);
insert into artist_albums values (4, 1);
insert into artist_albums values (3, 1);
insert into artist_albums values (2, 2);
insert into artist_albums values (1, 2);
select * from artist_albums;

insert into tracks values (1, 'Track1 from Mutter(R and N)', 599, 1);
insert into tracks values (2, 'Track2 from Mutter(R and N)', 599, 1);
insert into tracks values (3, 'Track1 from Alliluya(E and S)', 400, 2);
insert into tracks values (4, 'Track2 from Alliluya(E and S)', 450, 2);
select name_track, duration  from tracks where name_album = 1;

insert into collection values (1, 'My favorite tracks', 2021);
insert into collection values (2, 'New tracks', 2022);
select * from collection 

insert into collection_track values (1, 1);
insert into collection_track values (1, 4);
insert into collection_track values (2, 2);
insert into collection_track values (2, 3);
insert into collection_track values (2, 4);
select * from collection_track


