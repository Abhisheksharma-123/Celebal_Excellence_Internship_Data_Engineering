import pandas as pd
from datetime import datetime

# -----------------------------
# Test Case 1: Invalid order_id
# -----------------------------
def test_invalid_order_id():
    orders = pd.read_csv("../notebook/data/cleaned/orders_clean.csv")
    order_items = pd.read_csv("../notebook/data/cleaned/order_items_clean.csv")

    invalid = order_items[
        ~order_items["order_id"].isin(orders["order_id"])
    ]

    if invalid.empty:
        print("PASS: No invalid order_id found.")
    else:
        print("FAIL: Invalid order_id exists.")
        print(invalid)


# ------------------------------------
# Test Case 2: Discount Greater Than 100
# ------------------------------------
def test_discount():
    order_items = pd.read_csv("../notebook/data/cleaned/order_items_clean.csv")

    invalid = order_items[
        order_items["discount_percent"] > 100
    ]

    if invalid.empty:
        print("PASS: All discounts are valid.")
    else:
        print("FAIL: Discount greater than 100 found.")
        print(invalid)


# -----------------------------
# Test Case 3: Quantity = 0
# -----------------------------
def test_quantity():
    order_items = pd.read_csv("../notebook/data/cleaned/order_items_clean.csv")

    invalid = order_items[
        order_items["quantity"] == 0
    ]

    if invalid.empty:
        print("PASS: No zero quantity found.")
    else:
        print("FAIL: Zero quantity found.")
        print(invalid)


# -----------------------------
# Test Case 4: Future Order Date
# -----------------------------
def test_future_date():
    orders = pd.read_csv("../notebook/data/cleaned/orders_clean.csv")

    orders["order_date"] = pd.to_datetime(orders["order_date"])

    future = orders[
        orders["order_date"] > pd.Timestamp.today()
    ]

    if future.empty:
        print("PASS: No future order dates found.")
    else:
        print("FAIL: Future order dates found.")
        print(future)


# -----------------------------
# Run All Tests
# -----------------------------
print("Running Edge Case Tests...\n")

test_invalid_order_id()
test_discount()
test_quantity()
test_future_date()

print("\nAll Tests Completed.")
