# Power BI Dashboard Design Guide

## Sales Dashboard
**KPI cards:** Total Revenue, Total Profit, Orders, Average Order Value
**Charts:** monthly revenue line; category revenue bar; category profit bar; regional revenue/profit; top 10 products; payment method revenue mix
**Slicers:** date, category, region, payment method

Suggested DAX measures (adjust table name to your imported table):
```DAX
Total Revenue = SUM(sales_data[sales_amount])
Total Profit = SUM(sales_data[profit])
Total Orders = DISTINCTCOUNT(sales_data[order_id])
Average Order Value = DIVIDE([Total Revenue], [Total Orders])
Profit Margin = DIVIDE([Total Profit], [Total Revenue])
```

## Customer Dashboard
**KPI cards:** Total Customers, Total Revenue, Orders, Average Order Value, Repeat Customers
**Charts:** monthly revenue line; category revenue bar; segment distribution; repeat vs one-time customers; customer spending distribution
**Slicers:** date, category, region, age group

Suggested DAX measures:
```DAX
Total Customers = DISTINCTCOUNT(customer_transactions[customer_id])
Customer Revenue = SUM(customer_transactions[order_amount])
Customer Orders = DISTINCTCOUNT(customer_transactions[order_id])
Customer AOV = DIVIDE([Customer Revenue], [Customer Orders])
Repeat Customers = CALCULATE(
    DISTINCTCOUNT(customer_transactions[customer_id]),
    FILTER(
        VALUES(customer_transactions[customer_id]),
        CALCULATE(DISTINCTCOUNT(customer_transactions[order_id])) > 1
    )
)
```
