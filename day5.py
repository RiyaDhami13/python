age_input = "19"                   #here it is string data type

#age = age_input+1                  #ERROR: Can not add number to a string
#print(age)

#solution: type casting
age_input = int(age_input)        #type casted to integer

print(age_input + 1)

raw_score = "3.96"

#Casting string to float
final_score = float(raw_score)
print(f"Converted {raw_score} to float: {final_score}")


user_score = float(input("Enter your GPA score(0.00 - 4.00): "))

#Conditional decision making:
if user_score >= 3.60:
    print("Good Peformance | A Grade")
elif user_score >= 3.00:
    print("Solid work | B Grade")
elif user_score >= 2.00:
    print("Satisfactory | C Grade")
else:
    print("Needs Improvement | D Grade")

user_input = input("Enter any integer to check if it is even or odd:")

#checking using nested loops:
if user_input.isdigit():                 #checking if the input is a digit
    number = int(user_input)             #type casted to integer
    if number % 2 == 0:
        print(f"{number} is an even number.")
    else:
        print(f"{number} is an odd number.")