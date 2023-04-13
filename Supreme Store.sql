create database Supreme_Store
create table Customer(ID int primary key identity(1,2), NAME varchar(50) not null, STATE varchar(50) not null, GENDER varchar(10) not null, 
PHONE_NUMBER varchar(50) not null)
Insert into Customer(NAME,STATE,GENDER,PHONE_NUMBER)
values('Success Adaeze', 'Imo', 'Female', '08105630352'),
 ('Ogodo Chibuike', 'Lagos', 'male', '08056330952'),
 ('Jerry Emeka', 'Ogun', 'male', '09056303412'),
 ('Chinwe Victory', 'Kano', 'Female', '07056303542'),
 ('Joseph Olu', 'Osun', 'male', '08154530376'),
  ('Agu Micheal', 'Lagos', 'male', '08126330142'),
 ('Mabel Nmeso', 'Ogun', 'Female', '09066303752'),
 ('Agu Ike', 'Kogi', 'male', '07056233556'),
 ('Olu Jacob', 'Abia', 'male', '08047630389')

 select * from Customer

 create table Product(ID int primary key  identity(101,2),ProductName varchar(50) not null,Price money not null, ProductType varchar(50) not null)
 insert into Product(ProductName,Price,ProductType)
 values('Slippers','5000','Footwears'),
 ('Laptop','500000','Electronics'),
 ('Body Cream','9000','Cosmetics'),
 ('Soap','500','Cosmetics'),
 ('Dano Milk','10000','Beverages'),
  ('Iphone 11','400000','Electronics'),
 ('10kg bag of Rice','35000','Foodstuffs'),
 ('Celling Fan','20000','Home Aplliances'),
 ('Aircondition','10000','Home Appliances'),
 ('Foundations','10000','Makeup Items')
 select * from Product
  select * from Customer
  select * from Sales
  select * from ModeOfPayment

  create table ModeOfPayment(ID int primary key identity(1,1), PaymentType Varchar(50) not null)
  insert into ModeOfPayment
  values('POS'),
  ('Transfer'),
  ('Cash')
 create table Sales(ID int primary key identity (100,8),CusID INT foreign key references Customer(ID) not null,
 ProductID int foreign key references Product(ID) not null,ModeOfPaymentID int foreign key references ModeOfPayment(ID),QuantitySold int not null) 
 insert into Sales(CusID,ProductID,ModeOfPaymentID,QuantitySold)
 values(17,103,1,5),
 (5,105,2,10),
 (3,107,3,2),
 (7,109,1,1),
 (9,111,2,3),
 (11,113,2,15),
 (13,115,3,2),
  (15,117,3,2),
   (11,119,1,2)

---List the names,total amount----
select Customer.NAME,sum(Product.Price) TotalPrice,sum(Sales.QuantitySold)  quantity, count(Sales.QuantitySold) Sold from Customer
inner join Sales
on Customer.ID= Sales.CusID
inner join Product
on Sales.ProductID=Product.ID
group by Customer.NAME
order by TotalPrice desc

----Total Revenue----
select Customer.NAME,sum(Sales.QuantitySold*Product.Price)Revenue from Customer
inner join Sales
on Sales.CusID= Customer.ID
inner join Product
on Sales.ProductID=Product.ID
group by Customer.NAME
order by Revenue desc

----Highest Revenue by Mode Of Payment----
select ModeOfPayment.PaymentType,sum(Sales.QuantitySold* Product.Price)Revenue from ModeOfPayment
inner join Sales
on Sales.ModeOfPaymentID=ModeOfPayment.ID
inner join Product
on Sales.ProductID=Product.ID
group by ModeOfPayment.PaymentType
order by Revenue desc

---number of the mode of payment----
select ModeOfPayment.PaymentType,count(Sales.QuantitySold* Product.Price)Revenue from ModeOfPayment
inner join Sales
on Sales.ModeOfPaymentID=ModeOfPayment.ID
inner join Product
on Sales.ProductID=Product.ID
group by ModeOfPayment.PaymentType
order by Revenue desc




