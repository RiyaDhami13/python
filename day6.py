#DAY 6

# input
raw_name = input("Enter your full name: ")

# Cleaning the data
clean_name = raw_name.strip().title()

# Using the data in a logical check
department = input("Enter your department (CSE/CE/AR): ").strip().upper()

print(f"\n--- Student Profile Created ---")
print(f"Name: {clean_name}")
print(f"Department: {department}")

# 4. Checking content within strings
email = input("Enter your email address: ").strip().lower()

if "@" in email and email.endswith(".com"):
    print("Email Status: Valid format.")
else:
    print("Email Status: Invalid. Please check your email entry.")