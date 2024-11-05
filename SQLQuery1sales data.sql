SELECT * FROM [dbo].[LITA_CapstoneDataset]

------- TOTAL SALE FOR EACH PRODUCT-------------
Select product, sum(quantity*unitprice)as totalsale
FROM [dbo].[LITA_CapstoneDataset]
group by Product 

---------NUMBER OF SALES TRANSACTION IN EACH REGION------------
SELECT Region, count(*) as 
NumberOfTransactions
FROM [dbo].[LITA_CapstoneDataset]
Group By Region;
----------HIGHEST SELLING PRODUCT BY TOTAL SALES VALUE----------
Select Top 1 product, sum(Quantity*UnitPrice) as TotalSales
FROM [dbo].[LITA_CapstoneDataset]
Group By Product
order  by TotalSales Desc;

------------TOTAL REVENUE PER PRODUCT------------
Select product, sum(Quantity*Unitprice) as TotalRevenue
FROM [dbo].[LITA_CapstoneDataset]
Group By product;

----------MONTHLY SALES TOTALS FOR THE CURRENT YEAR------------
Select Month(orderDate) as month, sum(Quantity*UnitPrice) AS MonthlySales
FROM [dbo].[LITA_CapstoneDataset]
Where Year(OrderDate) = YEAR(GetDate())
Group By MONTH(OrderDate)
Order By Month;
----------- TOP 5 CUSTOMERS BY TOTAL PURCHASE AMOUNT-------------
Select Top 5  Customer_Id, sum(Quantity*UnitPrice) as TotalPurchaseAmount
FROM [dbo].[LITA_CapstoneDataset]
Group by Customer_Id
Order by TotalPurchaseAmount Desc;
-----------PERCENTAGE OF TOTAL SALES CONTRIBUTED BY EACH REGION--------
 Select Region , sum(Quantity*UnitPrice) as RegionSales,
SUM(Quantity * UnitPrice)*1.0/(Select sum(Quantity*UnitPrice) from [dbo].[LITA_CapstoneDataset])*100 As PercentageContribution
FROM [dbo].[LITA_CapstoneDataset]
GROUP BY Region;

-----------PRODUCT WITH NO SALES IN THE LAST QUARTER---------
Select distinct product from [dbo].LITA_CapstoneDataset where product Not In (select product from [dbo].[LITA_CapstoneDataset]
where orderdate >=Dateadd(quarter, -1, Getdate()) and orderdate < GetDate())