CREATE DATABASE MusicArtistAlbum
USE MusicArtistAlbum
CREATE TABLE Artists(
ID int primary key identity,
[Name] nvarchar (50) not null
)
CREATE TABLE Albums(
ID int primary key identity,
[Name] nvarchar (50) not null,
TotalSongs int,
ArtistId int references Artists(ID)
)
CREATE TABLE Musics(
Id int primary key identity,
[Name] nvarchar(50) not null,
TotalSeconds decimal(18,2),
AlbumId int references Albums(ID)
)
CREATE TABLE ArtistMusic(
ID int primary key identity,
MusicId int references Musics(ID),
ArtistId int references Artists(ID) 
)
--DROP TABLE Artists
--DROP TABLE Albums
--DROP TABLE ArtistMusic
--DROP TABLE Musics
CREATE VIEW v_MusicName
AS
SELECT m1.Name, m1.TotalSeconds, ar1.Name AS ArtistName, al1.Name AlbumName FROM Musics m1, Artists ar1, Albums al1
where al1.ArtistId= ar1.ID 

SELECT * FROM v_MusicName

CREATE VIEW v_AlbumName
AS
SELECT a.Name 'AlbumName', a.TotalSongs From Albums a

SELECT al1.Name From Albums al1
SELECT Count(m1.Id) 'Mahninin sayi' From Musics m1, Albums al1
where m1.AlbumId= al1.ID