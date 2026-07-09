import mysql.connector
from tabulate import tabulate
import argparse

try:
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Abhishek@1809",
        database="ecommerce"
    )

    cursor = connection.cursor()

except mysql.connector.Error as err:
    print("Database Connection Error")
    print(err)
    exit()

# Create parser
parser = argparse.ArgumentParser()

# Add argument
parser.add_argument("--report", required=True)

# Read argument
args = parser.parse_args()

queries = {

"revenue": """
SELECT c.customer_name,
ROUND(SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)),2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY c.customer_name
ORDER BY revenue DESC;
""",

"top_customers": """
SELECT c.customer_name,
ROUND(SUM(oi.quantity*oi.unit_price*(1-oi.discount_percent/100)),2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 10;
"""

}

if args.report not in queries:
    print("Invalid Report!")
    print("Available reports: revenue, top_customers")
    exit()

cursor.execute(queries[args.report])

rows = cursor.fetchall()

if not rows:
    print("No records found.")
else:
    print(
        tabulate(
            rows,
            headers=[i[0] for i in cursor.description],
            tablefmt="grid"
        )
    )

cursor.close()
connection.close()
