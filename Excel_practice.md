# Excel Practice Checklist

For sales_data:
- Total revenue: `=SUM(sales_amount_range)`
- Category revenue: `=SUMIFS(sales_amount_range,category_range,category_cell)`
- Count orders: `=COUNTA(order_id_range)` (for line records; distinct order count is better in PivotTable/Data Model)
- Lookup product/category: XLOOKUP on product lookup table if you create one
- PivotTable: Rows=Region, Columns=Category, Values=Sum of Sales and Sum of Profit
- PivotChart: Monthly sales trend; category comparison

For customer_transactions:
- Customer spending: PivotTable Rows=customer_id, Values=Sum of order_amount
- Orders per customer: distinct count in Data Model, or use a PivotTable
- Category revenue: Rows=category, Values=Sum of order_amount
- Repeat customer flag: use a customer summary table and IF(order_count>1,...)
