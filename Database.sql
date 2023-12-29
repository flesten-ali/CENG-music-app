create table artists(
artistId integer,
artistName varchar(15),
primary key (artistId)
);

 create table albums (
 albumId integer , 
 albumName varchar(20),
 description varchar(30),
 releaseDate date,
 artistId integer not null,
 primary key (albumId),
 foreign key (artistId) references artists on delete cascade 
 );
 

 create table songs (
 songId integer , 
 songName varchar(20),
 genre varchar(10),
 releaseDate date,
 albumId integer not null ,
 primary key (songId),
 foreign key (albumId) references albums on delete cascade 
 );
 
 create table playList (
 playlistId integer , 
 playListName varchar(20),
 primary key (playlistId)
  );

 create table PlayListContainSongs (
 playlistId integer , 
 songId integer , 
 primary key (playlistId , songId),
 foreign key (playlistId) references playList on delete cascade, 
 foreign key (songId) references songs on delete cascade 

 );
 
 create table customers (
 customerId integer,
 customerName varchar(20),
 email varchar(20),
 primary key (customerId)
 );

 create table customer_basic (
 customerId integer,
 numSongsLeftForAd integer check(numSongsLeftForAd <= 5),
 primary key (customerId),
 foreign key (customerId) references customers on delete cascade
 );
 
 create table CustomersOwnPlayLists (
 playlistId integer not null , 
 customerId integer , 
 primary key (playlistId , customerId),
 foreign key (playlistId) references playList on delete cascade, 
 foreign key (customerId) references customers on delete cascade 

  );
  
  create table Customer_premium (
  customerId integer , 
  creditCardNumber varchar(16), 
  expiryDate date,
  cvv varchar(3),
  primary key (customerId),
  foreign key (customerId) references customers on delete cascade

  );
 