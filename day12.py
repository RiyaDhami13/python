#Day 12: Lambda Functions
print("-----Lambda Processing----------\n")

#standard function
def standard_square(x):
    return x ** 2

#in lambda function
lambda_square = lambda x:x ** 2

print(f"Standard Function Result: {standard_square(6)}")
print(f"Lambda Function Result: {lambda_square(6)}")

#a list of tuples
laboratory_components = [
    ("Resistor_A", 220),
    ("Resistor_B", 47),
    ("Resistor_C", 1000),
    ("Resistor_D", 330),
    ("Resistor_E", 100)
]

#sort list by the resistance value
laboratory_components.sort(key = lambda x: x[1])

print("\nSorted Hardware Components (Lowest to Highest Resistance):")
print(laboratory_components)