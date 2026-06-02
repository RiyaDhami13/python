#--1. COMPILER VS INTERPRETER
#Interpreter : Executes the code line by line (Python's default mode)
#Compiler: Translates the entire code into machine code first
print("Python acts as an interpreter for us\n")

#--2. INPUT and OUTPUT 
persona = input("What is your name?")
print("Hello, " + persona + "!\n")

person_age = input("What is your age?")
print("You are " + person_age + " years old.\n")

print("Let's see about f string in python")
print(f"Hello, {persona}, you are {person_age} years old?\n")

#--3. VARIABLES AND KEYWORDS

import keyword
print(f"Total Python Keywords: {len(keyword.kwlist)}\n")
#print(f"\n{keyword.kwlist}") # Uncomment to see all reserved words

#Variables Rules: No starting with numbers, no spaces, case-sensitive.
name = "Honey Singh"
songs = 10
address = "India"

print(f"{name} has sung {songs}. He is from  {address}.\n")

print(songs)

#--4. DATA TYPES
# Numeric ones
integer_num = 10     #integer:whole numbers
float_num = 9.8      #float:decimal numbers
complex_num = 2 + 5j #complex:real and imaginary parts

print(f"This is integer:{integer_num} and this is float:{float_num} and this is complex number:{complex_num}")
print(f"Types: {type(integer_num)}, {type(float_num)}, {type(complex_num)}\n")

#--Sequential data types--
# String (str): Ordered sequence of characters. Immutable.
message = "Learning Data & AI"
print(f"String Indexing: first letter is '{message[0]}'")

#List: Ordered, mutable collection. Allows duplicates.
tech_stack = ["PostgresSQL","Python", "Docker"]
tech_stack.append("Git")
print(f"Tech Stack: {tech_stack}\n")

#Tuple: Ordered, immutable collection.Allow duplicates
coordinates = (28.96,80.18)
print(f"Coordinates in tuple form: {coordinates}\n")

#Set:Unordered collection of unique items. Mutable.Duplicates not allowed.
raw_ids = [101,106,102,103,103,104,108,105,101]
unique_ids = set(raw_ids)
print(f"Unique IDs: {unique_ids}\n")

#Dictionary: Unordered key-value pairs. Mutable.
student = {"name":"Riya Dhami",
          "age":19,
          "department":"Computer Engineering"}
print(f"Dictionary:{student}\n")
print(f"Student's name: {student['name']}")
print(f"Student's age: {student['age']}")
print(f"Student's department: {student['department']}")

#Binary sequence types:
byte_data = b"Hello"
print(f"Byte data is {byte_data}\n")

#Boolean type of data:
is_learning = True        # bool: True or False
empty_value = None        #None Type: repressents the absence of a value
print(f"Is Learning Active? {is_learning} | Missing Data marker: {empty_value}")
print("\n")

# --- 5. SWAPPING & DELETING ---
a, b = 10, 20
a, b = b, a # The 'Easy Python Way' to swap
print(f"Swapped: a={a}, b={b}")

temp_var = "I will be deleted"
del temp_var # Removes variable from memory

# --- 6. OPERATORS ---
# Arithmetic: +, -, *, /, // (floor), % (mod), ** (power)
x = 15, y = 3.5
c = x + y
print(c)
print(x/y)
print(x//y)
print(x**2)

# Comparison: ==, !=, >, <, >=, <=
# Logical: and, or, not
# Identity: is, is not (Checks memory location)
# Membership: in, not in (Checks existence in sequence)


