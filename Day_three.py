#Day 3 
print("-------Student Bio Card Reader-----\n")

#input your name, age and height: basic details
name = str(input("Enter your name: \n"))
city = input("Enter your city: \n")

age = int(input("Enter your age: \n"))
height = float(input("Enter your height(in cm):  \n"))

student_input = input("Are you a student? (yes/no): ").strip().lower()
student = student_input == "yes"

#Birthdate into the tuple
print("Enter your Birthday: \n")
day = input("Enter your birth day: \n")
month = input("Enter  your birth month: \n")
year = input("Enter your birth year: \n")

birth_date = (day,month,year)

#inputting user habits
hobbies = []

# Fixed: Added a condition to break the infinite loop after 3 entries
while len(hobbies) < 3:
  hobby = input("Enter a hobbies: ")
  hobbies.append(hobby)

# Fixed: Added missing comma in print statement
print("Your h are,", hobbies)

#the languages
print("\nEnter the languages you know")

# Ask the user for three languages
lang1 = input("Enter your first language: ")
lang2 = input("Enter your second language: ")
lang3 = input("Enter your third language: ")

# Fixed: Initialized the set BEFORE adding items to it
languages_set = set()

#adding to the set
languages_set.add(lang1)
languages_set.add(lang2)
languages_set.add(lang3)

print(languages_set)

profile = {
    "full_name": name,
    "city": city,
    "age": age,
    "height": height,
    "is_student": student,
    "birthday": birth_date,
    "hobbies_list": hobbies,
    "unique_languages": languages_set
} # Fixed: Added missing closing bracket for the dictionary


print("\n" + "="*40)
print("             BIO-DATA CARD              ")
print("="*40)
print(f"First Initial: {profile['full_name'][0]}")
print(f"Name: {profile['full_name']} {type(profile['full_name'])}")
print(f"City: {profile['city']}")
print(f"Age: {profile['age']} years old {type(profile['age'])}")
print(f"Height: {profile['height']} cm {type(profile['height'])}")
print(f"Student Status: {profile['is_student']} {type(profile['is_student'])}")
print(f"Birth Date (Tuple): {profile['birthday']} {type(profile['birthday'])}")
print(f"Total Hobbies Logged: {len(profile['hobbies_list'])}")
print(f"Hobbies Details: {profile['hobbies_list']}")
print(f"Total Unique Languages: {len(profile['unique_languages'])}")
print(f"Languages Set Details: {profile['unique_languages']} {type(profile['unique_languages'])}")
print("="*40)