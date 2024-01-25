<code>
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
</code>
