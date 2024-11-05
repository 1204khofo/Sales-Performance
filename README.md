# Capstone Project

### Project Topic: Sales Performance

[Project Overview](#project-overview)

[Tools Used](#tools-Used)

[Data Cleaning and Preparations](#data-cleaning-and-preparation)

[Exploratory Data Analysis](#exploratory-data-analysis)

[Data Analysis](#data-analysis)

 [Data Visualization](#data-visualization)
 
 [Report](#report)
 
[Recommendation](#recommendation)

---
### Project Overview:
---
The main objective of this project is to analyse the sales performance of a retail  store using specific key metrics and generate actionable insights. This includes identifying top-selling products, assessing regional performance developing effective strategies, and improving operational efficiency. Additionally, we aim to craft compelling narratives around our data based on the insights gained 

### Data Sources 
---
The main source of data utilized in this analysis is a Sales.csv file, which is an open-source dataset that can be freely downloaded from various online platforms.

### Tools Used
---
- Microsoft Excel [Download Here](https://www.microsoft.com)
   - for Data Cleaning, Analysis and Visualization 
- SQL- Structured Query Language for  Querying of Data 
- Power BI for Visualization
- GitHub for Portfolio Building

### Data Cleaning and Preparations 
---
In tha inital phase of the Data cleaning and Preparations, we perform the following actions;
 1. Data loading and Inspection
 2. Handling missing Variables
 3. Removing Duplicates 
 4. Data Cleaning and Formatting

### Exploratory Data Analysis
---
EDA involves the exploring of the data to answer some questions about the Data such as;
 - What is the overall sales trend 
 - Which products are top selling products 
 - What are the Regional Performances

### Data Analysis 
---
This is where we include basic lines of code or queries used during analysis 
```SQL
----------Number Of Sales Transctions In Each Region--------------
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

-----------PERCENTAGE OF TOTAL SALES CONTRIBUTED BY EACH REGION--------
 Select Region , sum(Quantity*UnitPrice) as RegionSales,
SUM(Quantity * UnitPrice)*1.0/(Select sum(Quantity*UnitPrice) from [dbo].[LITA_CapstoneDataset])*100 As PercentageContribution
FROM [dbo].[LITA_CapstoneDataset]
GROUP BY Region;
```

### Data Visualization
---
![Sales Pivot](https://github.com/user-attachments/assets/ee1c246a-5e0b-41d0-ad1b-47792a70f7f3)

![Sales Performance Report](https://github.com/user-attachments/assets/9f515678-dd11-4097-a152-59ff31b9eeba)


### Report 
---
Our sales data analysis reveals some compelling insights into customer preferences and shopping behaviors. Shoes have emerged as the standout product, with over 600,000 units sold, making them our best-selling item. In contrast, socks, while still popular, lagged behind with approximately 180,000 units sold.

Regionally, the South leads our sales distribution, accounting for 44% of total sales, followed by the East at 23%, the North at 18%, and the West at 14%. Each region contributes uniquely to our overall performance, but the West presents an opportunity for growth. Notably, we found that higher-priced items tend to perform better, suggesting that customers are willing to spend more for perceived quality. Overall, our average sales rate stands at an impressive 211.78%, reflecting strong customer interest throughout the year. Moving forward, we should consider targeted strategies to address the sales decline in the fourth quarter and enhance performance in the West region.

Analyzing monthly trends, February was our peak month for sales, indicating a seasonal spike that we could leverage in future campaigns. The data also shows that the first and second quarters had strong sales performance, but we observed a significant decline as summer transitioned into fall, with fourth-quarter sales dropping by over 50%. This trend highlights the need to develop strategies to sustain sales momentum during these slower months.


Recommendations 
---

1. Targeted Marketing Campaigns: Since February showed the highest sales, consider running targeted promotions or campaigns leading up to that month to capitalize on the seasonal interest. Additionally, develop strategies to boost sales during the slower months, particularly in the fourth quarter.

2. Regional Focus: With the South performing the best, consider creating localized marketing efforts to further engage customers in that region. For the West, analyze customer preferences and tailor promotions or product offerings to increase market share there.

3. Data-Driven Decisions: Continuously analyze customer satisfaction and retention metrics to refine strategies and improve overall customer experience. This will help in making informed decisions that align with customer expectations.
