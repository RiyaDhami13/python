#Day 10: Introduction to Reusable Functions

print("--------SYSTEM FUNCTION TESTER --------\n")

#a simple greeting function without inputs
def show_welcome_message():
    
    print("Welcome to the Day 10 Terminal Engine")
  

#  a function with inputs (Parameters) and a return value
def calculate_grade_status(student_name, score_percentage):
    
    formatted_name = student_name.strip().title()
    
    if score_percentage >= 40:
        message = f"✅ {formatted_name} has passed the evaluation gate."
    else:
        message = f"⚠️ {formatted_name} needs optimization review."
        
    return message  



# Calling first function
show_welcome_message()

# Calling the second function with specific arguments and storing the result
result_one = calculate_grade_status("riya ", 85)
result_two = calculate_grade_status("  xyz", 35)

# Printing the returned values
print(result_one)
print(result_two)