CREATE DATABASE TRAVELAGENCY;

CREATE TABLE Travel_Agency(
	travel_agency_id int NOT NULL UNIQUE ,
	travel_agency_name varchar(50) NOT NULL,

	CONSTRAINT Travel_Agency_PK PRIMARY KEY (travel_agency_id)
);

CREATE TABLE Booking_Outcome (
	outcome_id int NOT NULL UNIQUE,
	outcome_status varchar(100),

	CONSTRAINT Booking_Outcome_PK PRIMARY KEY (outcome_id)
);

CREATE TABLE Booking_Status (
	status_id int NOT NULL UNIQUE,
	status_description varchar(100),

	CONSTRAINT Booking_Status_PK PRIMARY KEY (status_id)
);

CREATE TABLE Customer(
	customer_id int NOT NULL UNIQUE IDENTITY (1,1),
	customer_name varchar(20),
	customer_surname varchar(20),
	customer_phone_number varchar(20),

	CONSTRAINT Customer_PK PRIMARY KEY (customer_id)
);

CREATE TABLE Booking (
	booking_id int NOT NULL UNIQUE IDENTITY (1,1),
	customer_id int,
	outcome_id int,
	status_id int,
	travel_agency_id int,
	date_of_booking DATETIME DEFAULT GETDATE(),
	booking_details varchar(100),


	CONSTRAINT Booking_PK PRIMARY KEY (booking_id),
	CONSTRAINT Booking_FK1 FOREIGN KEY (travel_agency_id) REFERENCES Travel_Agency (travel_agency_id),
	CONSTRAINT Booking_FK2 FOREIGN KEY (customer_id) REFERENCES Customer (customer_id),
	CONSTRAINT Booking_FK3 FOREIGN KEY (outcome_id) REFERENCES Booking_Outcome (outcome_id),
	CONSTRAINT Booking_FK4 FOREIGN KEY (status_id) REFERENCES Booking_Status (status_id),
);

CREATE TABLE Payment(
	payment_id int NOT NULL UNIQUE,
	booking_id int,
	payment_amount float,
	payment_date DATETIME DEFAULT GETDATE(),
	other_details varchar(100) DEFAULT NULL,
	
	CONSTRAINT Payment_PK PRIMARY KEY (payment_id),
	CONSTRAINT Payment_FK FOREIGN KEY (booking_id) REFERENCES Booking (booking_id)

);

CREATE TABLE Service(
	service_id int NOT NULL UNIQUE,
	service_details varchar(100),

	CONSTRAINT Service_PK PRIMARY KEY (service_id)
);

CREATE TABLE Service_Booking(
	service_id int NOT NULL UNIQUE,
	booking_id int NOT NULL UNIQUE,
	booking_start_date DATE,
	booking_end_date DATE,

	CHECK (booking_end_date >= booking_start_date),

	CONSTRAINT Service_Booking_PK PRIMARY KEY (service_id, booking_id ),
	CONSTRAINT Service_Booking_FK1 FOREIGN KEY (service_id) REFERENCES Service(service_id),
	CONSTRAINT Service_Booking_FK2 FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Address(
	address_id int NOT NULL UNIQUE,
	address_details varchar(100),

	CONSTRAINT Address_PK PRIMARY KEY (address_id)
);

CREATE TABLE Customer_Address(
	customer_address_id int NOT NULL UNIQUE,
	customer_id int,
	address_id int,
	date_from DATETIME,
	date_to DATETIME,

	CONSTRAINT Customer_Address_PK PRIMARY KEY (customer_address_id),
	CONSTRAINT Customer_Address_FK1 FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
	CONSTRAINT Customer_Address_FK2 FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

CREATE TABLE Hotel(
	hotel_id int NOT NULL UNIQUE,
	hotel_name varchar(60),
	hotel_address varchar(100),
	hotel_price float,

	CONSTRAINT Hotel_PK PRIMARY KEY (hotel_id),
	CONSTRAINT Hotel_FK FOREIGN KEY (hotel_id) REFERENCES Service(service_id)
);



CREATE TABLE Railway(
	railway_id int NOT NULL UNIQUE,
	railway_name varchar(60),
	railway_ticket_price float,

	CONSTRAINT Railway_PK PRIMARY KEY (railway_id),
	CONSTRAINT Railway_FK FOREIGN KEY (railway_id) REFERENCES Service(service_id)
);
CREATE TABLE Car(
	car_id int NOT NULL UNIQUE,
	car_model varchar(60),
	car_type varchar(60),
	car_rent_price float,

	CONSTRAINT Car_PK PRIMARY KEY (car_id),
    CONSTRAINT Car_FK FOREIGN KEY (car_id) REFERENCES Service(service_id)
	);

	

CREATE TABLE Airlines(
	airline_id int NOT NULL UNIQUE,
	airline_name varchar(100),
	airline_ticket_price float,

	CONSTRAINT Airline_PK PRIMARY KEY (airline_id),
	CONSTRAINT Airline_FK FOREIGN KEY (airline_id) REFERENCES Service(service_id)
);


-- Log Table to keep booking actions
CREATE TABLE Booking_Log(
	booking_id varchar(8) NOT NULL,
	performed_action varchar(10),
	action_date DATETIME
);




INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (1, 'Booking.com' );
INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (2, 'Skyscanner' );
INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (3, 'Travelcations' );
INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (4, 'The Travel Connections' );
INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (5, 'Fox Travels' );
INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (6, 'Seven Seas Travel Agent' );
INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (7, 'TAG Group' );
INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (8, 'Stellar Travel' );
INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (9, 'Travel Tech' );
INSERT INTO dbo.Travel_Agency(travel_agency_id, travel_agency_name) VALUES (10, 'Travel Express' );



INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (11, 'OK' );
INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (12, 'OK' );
INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (13, 'OK' );
INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (14, 'Canceled' );
INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (15, 'OK' );
INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (16, 'OK' );
INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (17, 'Canceled' );
INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (18, 'OK' );
INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (19, 'Canceled' );
INSERT INTO dbo.Booking_Outcome(outcome_id, outcome_status) VALUES (20, 'OK' );


INSERT dbo.Booking_Status(status_id, status_description) VALUES (21, 'Accepted');
INSERT dbo.Booking_Status(status_id, status_description) VALUES (22, 'Accepted');
INSERT dbo.Booking_Status(status_id, status_description) VALUES (23, 'Accepted');
INSERT dbo.Booking_Status(status_id, status_description) VALUES (24, 'Accepted');
INSERT dbo.Booking_Status(status_id, status_description) VALUES (25, 'Accepted');
INSERT dbo.Booking_Status(status_id, status_description) VALUES (26, 'Accepted');
INSERT dbo.Booking_Status(status_id, status_description) VALUES (27, 'Accepted');
INSERT dbo.Booking_Status(status_id, status_description) VALUES (28, 'Accepted');
INSERT dbo.Booking_Status(status_id, status_description) VALUES (29, 'Accepted');
INSERT dbo.Booking_Status(status_id, status_description) VALUES (30, 'Accepted');

INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('Adria', 'Russell', '5167454496');
INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('Hilda', 'Haynes', '4569821457');
INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('Rebecca','Chambers','5353374113');
INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('Edward', 'Nieves', '4361239678');
INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('Chester', 'Bennett', '6045698452');
INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('David', 'Mathews', '7094715687');
INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('Daniel', 'Bernard', '05074457125');
INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('Lee', 'Preston', '30371568927');
INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('Cara', 'Whitehead', '4046514732');
INSERT dbo.Customer(customer_name, customer_surname, customer_phone_number) VALUES ('Kim', 'Fletcher', '5341584263');

-- 101 102 103
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (2, 11, 21, 3,'2019/10/10', 'Reserved' );
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (5, 12, 22, 1,'2019/10/10', 'Reserved' );
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (1, 13, 23, 4,'2019/10/10', 'Reserved' );
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (7, 14, 24, 10,'2019/10/11', 'Reserved' );
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (9, 15, 25, 1,'2019/10/12', 'Reserved' );
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (3, 16, 26, 5,'2019/10/13', 'Reserved' );
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (4, 17, 27, 4,'2019/10/13', 'Reserved' );
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (6, 18, 28, 9,'2019/10/17', 'Reserved' );
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (10, 19, 29, 2,'2019/10/18', 'Reserved' );
INSERT dbo.Booking(customer_id, outcome_id, status_id, travel_agency_id, date_of_booking, booking_details) VALUES (8, 20, 30, 3,'2019/10/19', 'Reserved' );


INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (111, 1, '100.0', '2019/10/10', 'Paid' );
INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (222, 2, '275.5', '2019/10/10', 'Paid' );
INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (333, 3, '150.0', '2019/10/10', 'Paid' );
INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (444, 4, '399.9', '2019/10/11', 'Paid' );
INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (555, 5, '245.5', '2019/10/12', 'Paid' );
INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (666, 6, '85.0', '2019/10/13', 'Paid' );
INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (777, 7, '114.5', '2019/10/13', 'Paid' );
INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (888, 8, '800.0', '2019/10/17', 'Paid' );
INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (999, 9, '565.9', '2019/10/18', 'Paid' );
INSERT dbo.Payment(payment_id, booking_id, payment_amount, payment_date, other_details) VALUES (1111, 10, '370.0', '2019/10/19', 'Paid' );


INSERT dbo.Service(service_id, service_details) VALUES (31, NULL);
INSERT dbo.Service(service_id, service_details) VALUES (32, NULL);
INSERT dbo.Service(service_id, service_details) VALUES (33, NULL);
INSERT dbo.Service(service_id, service_details) VALUES (34, NULL);
INSERT dbo.Service(service_id, service_details) VALUES (35, NULL);
INSERT dbo.Service(service_id, service_details) VALUES (36, NULL);
INSERT dbo.Service(service_id, service_details) VALUES (37, NULL);
INSERT dbo.Service(service_id, service_details) VALUES (38, NULL);
INSERT dbo.Service(service_id, service_details) VALUES (39, NULL);
INSERT dbo.Service(service_id, service_details) VALUES (40, NULL);


INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (31, 2, '2020/01/22', '2020/01/23');
INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (32, 5, '2019/11/10', '2019/11/11');
INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (33, 3, '2019/11/14', '2019/11/15');
INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (34, 1, '2019/12/21', '2019/12/22');
INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (35, 9, '2019/12/07', '2019/12/11');
INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (36, 4, '2019/12/25', '2019/12/29');
INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (37, 6, '2020/01/01', '2020/01/02');
INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (38, 10, '2019/11/17', '2019/11/19');
INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (39, 7, '2019/11/20', '2019/11/24');
INSERT dbo.Service_Booking(service_id, booking_id, booking_start_date, booking_end_date) VALUES (40, 8, '2020/02/15', '2020/02/20');



INSERT dbo.Address(address_id, address_details ) VALUES (41,'711-2880 Nulla St.Mankato Mississippi 96522' );
INSERT dbo.Address(address_id, address_details ) VALUES (42,'935-9940 Tortor. Street Santa Rosa MN 98804' );
INSERT dbo.Address(address_id, address_details ) VALUES (43,'5587 Nunc. Avenue Erie Rhode Island 24975' );
INSERT dbo.Address(address_id, address_details ) VALUES (44,'P.O. Box 132 1599 Curabitur Rd. Bandera South Dakota 45149' );
INSERT dbo.Address(address_id, address_details ) VALUES (45,'347-7666 Iaculis St.Woodruff SC 49854' );
INSERT dbo.Address(address_id, address_details ) VALUES (46,'557-6308 Lacinia Road San Bernardino ND 09289' );
INSERT dbo.Address(address_id, address_details ) VALUES (47,'5543 Aliquet St.Fort Dodge GA 20783' );
INSERT dbo.Address(address_id, address_details ) VALUES (48,'5037 Diam Rd. Daly City Ohio 90255' );
INSERT dbo.Address(address_id, address_details ) VALUES (49,'935-1670 Neque. St.Centennial Delaware 48432' );
INSERT dbo.Address(address_id, address_details ) VALUES (50,'414-7533 Non Rd. Miami Beach North Dakota 58563' );

INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (51, 1, 41, '2019/10/10', '2020/04/10' );
INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (52, 2, 46, '2019/10/10', '2020/04/10' );
INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (53, 3, 49, '2019/10/10', '2020/04/10' );
INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (54, 4, 45, '2019/10/11', '2020/04/11' );
INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (55, 5, 43, '2019/10/12', '2020/04/12' );
INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (56, 6, 42, '2019/10/13', '2020/04/13' );
INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (57, 7, 48, '2019/10/13', '2020/04/13' );
INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (58, 8, 44, '2019/10/17', '2020/04/17' );
INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (59, 9, 50, '2019/10/18', '2020/04/18' );
INSERT dbo.Customer_Address(customer_address_id, customer_id, address_id, date_from, date_to ) VALUES (60, 10, 47, '2019/10/19', '2020/04/19' );


INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price) VALUES (31, 'The Langham', '282-8351 Tincidunt Ave Sedalia Utah 53700', 100 );
INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES (32, 'Mandarin Oriental', '343-6527 Purus. Avenue Logan NV 12657',120 );
INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES (33, 'Grand Hyatt', '1964 Facilisis Avenue Bell Gardens Texas 87065',150 );
INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES (34, 'Ace Hotel', '430-985 Eleifend St. Duluth Washington 92611', 90 );
INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES (35, 'The Harbor Hotel', 'P.O. Box 399 4275 Amet Street West Allis NC 36734',125 );
INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES (36, 'Grand Hotel', '3415 Lobortis. Avenue Rocky Mount WA 48580', 200 );
INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES (37, 'The Bristol Hotel', '7709 Justo. Ave Princeton TX 77987', 85 );
INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES (38, 'Radisson Hotel', '1293 Tincidunt Street Atwater Pennsylvania 76865', 175 );
INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES (39, 'Wentworth Mansion', '427-5827 Ac St. Schaumburg Arkansas 84872', 130 );
INSERT dbo.Hotel(hotel_id, hotel_name, hotel_address, hotel_price ) VALUES (40, 'The Lowell', '6059 Sollicitudin Road Burlingame Colorado 26278', 450 );


INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (31, 'National Rail', 10 );
INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (32, 'EuroStar', 15 );
INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (33, 'British Rail', 12 );
INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (34, 'Network Rail', 14 );
INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (35, 'Alsa', 9 );
INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (36, 'American Express', 17 );
INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (37, 'LNER', 6 );
INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (38, 'Italia Rail', 11 );
INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (39, 'Blue Train', 8 );
INSERT dbo.Railway(railway_id, railway_name, railway_ticket_price ) VALUES (40, 'Orient Express', 12 );


INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (31, 'Mercedes-Benz', 'Coupe', 55 );
INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (32, 'BMW', 'Sedan', 50 );
INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (33, 'Audi', 'Hatchback', 45 );
INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (34, 'Honda', 'SUV', 36 );
INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (35, 'Jeep', 'SUV', 41 );
INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (36, 'Volkswagen', 'Hatchback', 39 );
INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (37, 'Volvo' , 'Crossover', 35);
INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (38, 'Opel', 'Sedan', 40 );
INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (39, 'Ford', 'Hatchback', 35 );
INSERT dbo.Car(car_id, car_model, car_type, car_rent_price ) VALUES (40, 'Chevrolet', 'Sedan', 42 );



INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (31, 'Turkish Airlines', 45 );
INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (32, 'Pegasus Airlines', 35 );
INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (33, 'SunExpress', 40 );
INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (34, 'Air France', 42 );
INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (35, 'British Airways', 40 );
INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (36, 'Lufthansa', 45 );
INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (37, 'Emirates', 50 );
INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (38, 'Swiss', 40 );
INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (39, 'Ryanair', 25);
INSERT dbo.Airlines(airline_id, airline_name, airline_ticket_price) VALUES (40, 'Delta Airlines', 35 );

-- Computed Column
ALTER TABLE dbo.Service_Booking ADD number_of_days AS DATEDIFF(day , booking_start_date, booking_end_date);

-- Name index
CREATE INDEX index_fullname
ON Customer (customer_name, customer_surname);
