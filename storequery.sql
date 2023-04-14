use Supreme_Store
select * from Customer
select * from Product
select * from Sales
select * from ModeOfPayment

---RETRIEVE THE CUSTOMER NAME AND STATE FOR ALL SALES MADE USING MODE OF PAYMENT "POS"----
select Customer.NAME,Customer.STATE
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join ModeOfPayment
on Sales.ModeOfPaymentID=ModeOfPayment.ID
inner join Product
on Sales.ProductID=Product.ID
where ModeOfPayment.PaymentType='POS'

---WHAT IS THE AVERAGE QUANTITY SOLD PER SALE FOR EACH MODE OF PAYMENT WHERE THE AVERAGE QUANTITY SOLD PER SALE IS GREATER THAN 1--
select ModeOfPayment.PaymentType,avg(Sales.QuantitySold)Quantity
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join ModeOfPayment
on Sales.ModeOfPaymentID=ModeOfPayment.ID
inner join Product
on Sales.ProductID=Product.ID
group by ModeOfPayment.PaymentType
having avg(Sales.QuantitySold) >1


---HOW MANY SALES WERE MADE FOR EACH MODE OF PAYMENT TYPE IN THE DATABASE---
select count(Sales.QuantitySold)Quantity ,(ModeOfPayment.PaymentType)
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join ModeOfPayment
on Sales.ModeOfPaymentID=ModeOfPayment.ID
inner join Product
on Sales.ProductID=Product.ID
group by ModeOfPayment.PaymentType

---WHICH CUSTOMER(S) MADE A PURCHASE USING MODE OF PAYMENT TYPE "CASH" AND BOUGHT MORE THAN 1 PRODUCTS---
select Customer.NAME,count(Sales.QuantitySold) Quantity
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join ModeOfPayment
on Sales.ModeOfPaymentID=ModeOfPayment.ID
inner join Product
on Sales.ProductID=Product.ID
where ModeOfPayment.PaymentType='POS'
group by Customer.NAME
having count(Sales.QuantitySold) >= 1

---WHAT IS THE TOTAL REVENUE GENERATED FROM SALES MADE USING THE MODE OF PAYMENT TYPE "TRANSFER"---

select sum(Sales.QuantitySold*Product.Price)Revenue
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join ModeOfPayment
on Sales.ModeOfPaymentID=ModeOfPayment.ID
inner join Product
on Sales.ProductID=Product.ID
where ModeOfPayment.PaymentType='Transfer'

----HOW MANY SALES WERE MADE IN EACH STATE, AND WHAT WAS THE TOTAL REVENUE GENERATED IN EACH STATE---
select count(Customer.STATE) STATE,sum(Sales.QuantitySold*Product.Price)Revenue
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join Product
on Sales.ProductID=Product.ID

---WHAT IS THE AVERAGE PRICE OF PRODUCT SOLD TO CUSTOMER IN EACH STATE---
select Customer.NAME,count(Customer.STATE)State,avg(Product.Price)ProductPrice
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join Product
on Sales.ProductID=Product.ID
group by Customer.NAME

---WHAT PRODUCTS WERE SOLD TO FEMALE CUSTOMERS IN LAGOS STATE USING A MODE OF PAYMENT 'POS'---
select Product.ProductName
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join Product
on Sales.ProductID=Product.ID
inner join ModeOfPayment
on Sales.ModeOfPaymentID=ModeOfPayment.ID
where Customer.GENDER='Female' and Customer.STATE='Lagos' and ModeOfPayment.PaymentType='POS'

---WHICH MODE OF PAYMENT TYPE HAS THE HIGHEST TOTAL REVENUE AND WHAT IS THE TOTAL REVENUE FOR THAT MODE OF PAYMENT TYPE--
select ModeOfPayment.PaymentType,sum(Product.Price * Sales.QuantitySold)REVENUE
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join Product
on Sales.ProductID=Product.ID
inner join ModeOfPayment
on Sales.ModeOfPaymentID=ModeOfPayment.ID
group by ModeOfPayment.PaymentType
order by REVENUE desc

---HOW MANY CUSTOMERS MADE A PURCHASE USING A MODE OF PAYMENT TYPE "POS" AND BOUGHT AT LEAST ONE PRODUCT WITH A PRICE GREATER THAN 15,000---
select Customer.NAME,count(Sales.QuantitySold)Quantity
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join Product
on Sales.ProductID=Product.ID
inner join ModeOfPayment
on Sales.ModeOfPaymentID=ModeOfPayment.ID
where ModeOfPayment.PaymentType='POS' and Product.Price > 15000
group by Customer.NAME
having sum(Product.Price) >15000


----DISPLAY THE PRODUCT TYPE SELLING MORE---
select Customer.NAME,sum(Sales.QuantitySold) Quantity,sum(Product.Price)Price,count(Product.ProductType) ProductType,
	case 
		when sum(Product.Price) >=10000 then 'Goodsales'
		else 'badsales'
		end performance
from Customer
inner join Sales
on Sales.CusID=Customer.ID
inner join Product
on Sales.ProductID=Product.ID
inner join ModeOfPayment
on Sales.ModeOfPaymentID=ModeOfPayment.ID
group by Customer.NAME






