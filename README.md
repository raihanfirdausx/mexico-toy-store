# Mexico Toy Store Company

## Project at Glance
In this project, i will try to demonstrate an end-to-end data analyst/business intelligence project from  a Brazilian Logistics company. The user of this project is an Operations Manager who want to evaluate the company's operation for the e-commerce logistics business segment.

## Business Request & Demand Overview
In every data analytics/business inteliigence project, there must be a business request and demand overview from the user who will take advantage of the result/output. The user request for this project can be seen as below:

![](/images/bizreq.jpeg)

Hence, below is the business demand overview for the requested and additional information:

![](/images/bizdem1.jpeg)
![](/images/bizdem2.jpeg)

## Database ER Diagram
The database's entity-relationship (ER) from which the data is taken can be seen below:

![](/images/er.jpeg)

## Data Cleansing & Transformation
We must clean and transform the data required from database. Below is the SQL query for the data:

![](/images/sql1.jpeg)
![](/images/sql2.jpeg)

## Data Involved
The data involved for the input to Power BI can be seen as below:

![](/images/datamodel.jpeg)

## Dashboard Overview
The dasboard result:

*Sales Performance 1
![](/images/dash1.jpeg)

*Sales Performance 2
![](/images/dash2.jpeg)

Full Interactive Dashboard : [Dashboard](https://app.powerbi.com/reportEmbed?reportId=15bd1209-abfb-4e83-b2fc-16c057b861a1&autoAuth=true&ctid=fedd5298-8e66-45f1-b321-fd38ad0ff722&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly93YWJpLXNvdXRoLWVhc3QtYXNpYS1yZWRpcmVjdC5hbmFseXNpcy53aW5kb3dzLm5ldC8ifQ%3D%3D)

## Addition: Inventory Relocation
Every store has it's own best and worse selling product. In order to optimize the sales, we will relocate one store's worse sales product to other store which record better
sales for the product.

This is a list of 10 worse selling product from each store:
![](/images/low_sales_rank10.jpeg)

We will order to other store, the question is: to which one? Hence, we rank the 3 best selling stores per product, to give option for the store to where it will relocate
the bad selling product (logistic cost of relocation is not a consideration yet this time because we don't have the data). This is a list of 3 best selling stores per product:

![](/images/high_sales_rank3.jpeg)

After that, we could know from which to which store the bad selling products must be relocated.
![](/images/alt_store.jpeg)



[See All Files](https://github.com/raihanfirdausx/ecommerce-logistic)

[<--See other projects](https://raihanfirdausx.github.io/#[object%20Object])
