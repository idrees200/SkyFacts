use SkyFactMain;
create table adminmanage(
userid varchar(25) ,
pw varchar(25)

);
select * from adminmanage

select DB_NAME()
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG='SkyFactMain'

	 
drop table countries
insert into adminmanage values ('idrees','1234');
select * from adminmanage
create table Countries (

						Name nvarchar(25) Primary Key  not null,
						ContID int UNIQUE not null Identity(1,1)	-- assign incrementing ID's starting from 1

						);
						select * from Countries

insert into Countries 
values  ('Pakistan'),		-- auto adds ID's
		('Saudi Arabia'),
		('United Arab Emirates'),
		('Sri Lanka'),
		('Turkey'),
		('Spain'),
		('United Kingdom'),
		('United States'),
		('Malaysia'),
		('Australia');
		
		insert into Countries 
values  ('India')


select * from Airliness


drop table Users
		select * from Users

 create table Users(

					UserID int Primary Key not null Identity(1,1),
					Username nvarchar(20) UNIQUE not null,
					Password nvarchar(50) not null, 
					FirstName nvarchar(50) not null, 
					LastName nvarchar(50) not null, 
					Age nvarchar(25) not null,
					Gender nvarchar(50) not null,
					Nationality nvarchar(25) not null ,
					PermAddress nvarchar(50) not null,
					Email nvarchar(25),
					PhoneNum nvarchar(25),
					SkyFactMembership nvarchar(50) not null,
                   VIPExclusive nvarchar(50)
					);

alter table Users

select  * from Users



insert into Users
values	
		('MrWyne','6900', 'Samee', 'Wyne', '20', 'Male', 'Pakistan', 'somewhere in lahore', NULL, '+92 309-488-8844', '1', '1'),
		('huSSnain','6900', 'Noor', 'Ul Hassan', '20', 'Male', 'Pakistan', 'somewhere in lahore', NULL, '+92 313-425-9390', '1', '1'),
		('KingTommy','6900', 'Idrees', 'Arshad', '20', 'Male', 'Pakistan', 'somewhere in lahore', NULL, '+92 345-499-3354', '1', '1'),
		('AbdulFaisal2006','1234567', 'Abdullah', 'Faisal', '17', 'Male', 'United States', 'Alabama, USA', NULL, '+1 863-000-1937', '0', '0'),
		('Junaidsleepy','487723hh', 'Junaid', 'Mustafa', '31', 'Male', 'Pakistan', '231H, hello colony, multam', 'junaid48@yahoo.com', '+92 466-653-6424', '1', '0'),
		('XxJavaidxX','hakeidnfvue77', 'Javaid', 'Mustafa', '29', 'Male', 'Pakistan', '231H, hello colony, multam', 'ihatelife@yahoo.com', '+92 377-579-8544', '1', '0');
		

		select * from Users




		select * from Airports



create table Airports (
					   
					   AirportID int Primary Key not null Identity(500,1238),
					   Name nvarchar(50) UNIQUE not null,
					   City nvarchar(50) not null,
					   Country nvarchar(20) not null 

					   );

insert into Airports
values  ('Allama Iqbal International Airport', 'Lahore', 'Pakistan'),
		('Jinnah International Airport', 'Karachi', 'Pakistan'),
		('Istanbul Airport', 'Istanbul', 'Turkey'),
		('Josep Tarradellas Barcelona-El Prat Airport', 'Barcelona', 'Spain'),
		('Abu Dhabi International Airport', 'Abu Dhabi', 'United Arab Emirates'),
		('Kuala Lumpur International Airport', 'Kuala Lumpur', 'Malaysia'),
		('Tullamarine Airport', 'Melbourne', 'Australia');


		select * from Airports











create table AircraftModels (

							 AM_ID int Primary Key not null Identity(1,1),
							 Model nvarchar(50) UNIQUE  not null,
							 Manufacturer nvarchar(50)  not null, 
							 ManufacturedDate nvarchar(50) not null, 
							 Capacity nvarchar(50) not null, 
							 HousesBusiness nvarchar(5) not null

							 );

insert into AircraftModels
values  ('A320', 'Airbus', '2012-01-01', 170, 1),
		('777', 'Boeing', '1995-6-01', 340, 1),
		('A330', 'Airbus', '2014-7-14', 230, 1);

		select * from AircraftModels
		











		
create table Airliness (

					   AirlineID int UNIQUE not null Identity(1,1),
					   Name nvarchar(60) Primary Key  not null,
					   BaseCity nvarchar(50), 
					   BaseCountry nvarchar(50) not null ,
					   OfferedFlightsCount nvarchar

					   );

insert into Airliness
values  ('Pakistan International Airlines (PIA)', 'Karachi', 'Pakistan', 4),
		('AirBlue', 'Islamabad', 'Pakistan', 4),
		('Etihad Airways', 'Abu Dhabi', 'United Arab Emirates', 2),
		('Emirates', 'Dubai', 'United Arab Emirates', 1);














create table AirlinesOffices (

							  AO_ID int Primary Key not null Identity(1,1),
							  AirlineName nvarchar(60), 
							  City nvarchar(25) not null, 
							  Country nvarchar(25) not null, 
							  Address nvarchar(100) not null

							  );
insert into AirlinesOffices
values  ('Pakistan International Airlines (PIA)', 'Karachi', 'Pakistan', 'Customer Services Division, 2nd Floor, Safety Building, PIA Head office'),
		('AirBlue', 'Islamabad', 'Pakistan', '12th & 1st Floor, ISE Towers, 55-B Jinnah Avenue'),
		('Emirates', 'Dubai', 'United Arab Emirates', 'Khalifa City'),
		('Etihad Airways', 'Abu Dhabi', 'United Arab Emirates', 'Customer Services Division, 2nd Floor, Safety Building, PIA Head office')
		













create table Routes (

					 RouteID int Primary Key not null Identity(1,1), 
					 From_City nvarchar(25) not null, 
					 From_Country nvarchar(25) not null, 
					 To_City nvarchar(25) not null, 
					 To_Country nvarchar(25) not null , 
					 DepartureAirport nvarchar(80) not null, 
					 ArrivalAirport nvarchar(80) not null,

					 NumberOfStops int,

					 FirstStopCity nvarchar(25),
					 FirstStopCountry nvarchar(25) ,

					 SecondStopCity nvarchar(25),
					 SecondStopCountry nvarchar(25) ,

					 ThirdStopCity nvarchar(25),
					 ThirdStopCountry nvarchar(25) 
					 );

insert into Routes
values	('Lahore', 'Pakistan', 'Abu Dhabi', 'United Arab Emirates', 'Allama Iqbal International Airport', 'Abu Dhabi International Airport', 0, null,null,null,null,null,null),
		('Lahore', 'Pakistan', 'Melbourne', 'Australia', 'Allama Iqbal International Airport', 'Tullamarine Airport ', 1, 'Kuala Lumpur', 'Malaysia',null,null,null,null);







		select * from routes




		drop table Flights
create table Flights (

					  FlightID int Primary Key not null Identity (1,1),
					  RouteID  int,		
					  Airline nvarchar(60) , 
					  AircraftModel nvarchar(20) not null, 
					  DepartingDate nvarchar(20) not null, 
					  DepartingTime nvarchar(20) not null, 
					  ArrivalDate nvarchar(20) not null, 
					  ArrivalTime nvarchar(20) not null	,			 
					   FareEconomy int not null, 
						   FareBusiness int,
						   Currency varchar(10) not null,
						   imglink nvarchar(50)
					  );

insert into Flights
values	(1, 'Etihad Airways', 'A320', '2023-3-24', '04:30:00', '2023-3-24', '06:55:00', 242540, 310000, 'PKR',null),
		(2, 'Pakistan International Airlines (PIA)', '777', '2023-3-23', '01:05:00', '2023-3-24', '08:00:00', 465087, 605000, 'PKR',null);











		drop table FlightPrices

create table FlightPrices (

						   FP_ID int Primary Key not null Identity (1,1), 
						   FlightID int , 
						   FareEconomy money not null, 
						   FareBusiness money,
						   Currency varchar(10) not null
						   
						   );
insert into FlightPrices
values  (1, '242,540', '310,000', 'PKR'),
		(2, '465,087', '605,000', 'PKR');












create table AdditionalCharges (

								AC_ID int Primary Key not null Identity (1,1), 
								Name varchar(60) UNIQUE not null,		
								Amount money not null, 
								Currency varchar(25) not null, 
								Description varchar(100),				

								);
insert into AdditionalCharges
values  ('Wheelchair Assistance', '15,000', 'PKR', 'Wheelchair w/ assistance personel'),
		('Extra Baggage (10kg)', '5000', 'PKR', null),
		('Extra Baggage (20kg)', '10,000', 'PKR', null),
		('Special Dietary Requirements', '0', 'PKR', 'Any specific medical requirements. Free of charge.');
		











create table DiscountsAndDeals (

								DiscountID int Primary Key not null Identity (1,1),
								Name varchar(65) not null,
								Amount money not null, 
								Currency varchar(25) not null, 
								Description varchar(100), 
								MembershipExclusiveDeal bit not null,
								VIPExclusice bit not null
							  );

insert into DiscountsAndDeals
values  ('Free Flights During 1st Year of Launch! (only for VIP)', '0', 'PKR', 'Just for the founders (Saim,Samee,Noor,Idrees) rest can **** off', 1, 1),
		('Independence Day Offer', '150,000', 'PKR', 'Flat 25% off for next 5 flights! Only available for 1 day can you guess when??', 0, 0),			-- if membership free discounts, if not then paid discounts
		('Istanbul Special Deal!!!!!!', '0', 'PKR', '15% off on your next flight to Istanbul! Only for SkyFact membership subscribers', 1, 0);













create table Bookings (

					   TicketID int Primary Key not null Identity (1,1),
					   UserID int Foreign Key References Users (UserID) not null,
					   Cancelled int, 

					   PsgnrFirstName varchar(25) not null, 
					   PsgnrLastName varchar(25) not null, 

					   FlightID int , 
					   Class varchar(25) not null, 

					  


					   TotalPrice int not null,

				   	   );

insert into Bookings
values  (1, null, 'Saim', 'Maroof', 1, 'Business', 0),
		(7, null, 'Samee', 'Wyne', 1, 'Business',  0),
		(8, null, 'Noor', 'Ul Hassan', 1, 'Business', 0)
		
		select * from Users
		select * from bookings











create table FlightPassengersCount (

									FlightID int Foreign Key References Flights (FlightID) not null, 
									TotalPsgnrs	int not null,		
									EconomyCount int not null, 
									BusinessCount int not null			
									
									);


insert into FlightPassengersCount
values  (1, 4, 0, 4),					-- counts how many seats taken until day of flight
		(2, 0, 0, 0);











create table RefundableTicket (

							   TicketID int Foreign Key References Bookings (TicketID) not null, 
							   DaysUntilFlight int not null,
							   Charges money not null, 
							   Allowed bit not null
							   
							   );
insert into RefundableTicket
values  (1, 13, 0, 1),
		(2, 13, 0, 1),		-- free cancel since free ticket lol
		(3, 13, 0, 1),
		(4, 13, 0, 1);














create table OnlineCheckIn (

							TicketID int Foreign Key References Bookings (TicketID) not null,
							FlightID int Foreign Key References Flights (FlightID) not null,
							UserID int Foreign Key References Users (UserID) not null,

							CheckedIn bit

							);
insert into OnlineCheckIn
values  (1, 1, 7, 0),
		(2, 1, 8, 0),
		(3, 1, 9, 0),
		(4, 1, 10, 0);















		select * from Ratings

create table Ratings (
					  
					  UserID int ,
					  FlightID int ,
					  Airline varchar(60) ,

					  FlightRating int,
					  AirlineRating int,
					  SkyFactRating int

					  );

insert into Ratings
values (7, 1, 'Etihad Airways', 8, 10, 10);
					  