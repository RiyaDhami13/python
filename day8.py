print("---------------------------------")
print("--- Day 8: Weekly Fundamentals ---")
print("---------------------------------")

# Day 4 & Day 7: List container initialized to log our database data
student_database = []
active = True

# Day 7: While loop for continuous execution
while active:
    # Day 6: Input gathering with string sanitization methods
    name = input("\nEnter student name (or type 'quit' to exit): ").strip().title()
    
    # Day 7: Break control gate
    if name.lower() == 'quit':
        print("Exiting system tracking pipeline...")
        break
        
    # Day 5 & Day 6: Input and validation logic
    department = input("Enter department (CSE/CE/AR): ").strip().upper()
    
    # Day 5: Type casting raw string input into an integer metric
    score = int(input("Enter previous exam score percentage: "))
    
    # Day 5: Conditional logic pathway evaluation
    if score >= 40:
        status = "Passed"
    else:
        status = "Needs Improvement"
        
    # Day 4: Grouping related properties into a single dictionary profile record
    student_profile = {
        "name": name,
        "dept": department,
        "score": score,
        "status": status
    }
    
    # Day 6 & Day 7: Storing data structures dynamically inside a list stack
    student_database.append(student_profile)
    print(f"✅ Logged profile for {name}. Current total: {len(student_database)}")
    
    # Day 7: Flow control validation to determine loop state continuity
    choice = input("\nWould you like to log another student? (yes/no): ").strip().lower()
    if choice != "yes":
        active = False # Safely turns off the loop conditional state

# Final output block demonstrating week-one data retrieval 
print("\n--- Final Generated Database Summary ---")
print(f"Total Registered Student Profiles: {len(student_database)}")
print(f"Database Matrix State: {student_database}")
print("\nSystem shut down successfully. Week 1 foundations complete!")