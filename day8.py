print("---------------------------------")
print("--- Day 8: Weekly Fundamentals ---")
print("---------------------------------")

#List container
student_database = []
active = True

#While loop function 
while active:
  name = input("\nEnter student name or 'quit' to exit:").strip().title()

  #break control gate
  if name.lower() == 'quit':
    print("Exiting the system pipeline......")
    break

  department = input("Enter department(CSE,CE,AR)").strip().upper()

  score = int(input("Enter previous exam score or percentage: "))

  if score >= 40:
    status = "Passed"
  else:
    status = "Needs Improvement"

    student_profile = {
      "name":name,
      "dept":department,
      "score":score,
      "status":status
    }

    #storing data structures
    student_database.append(student_profile)
    print(f"Logged profile for {name}. Current total: {len(student_database)}")

    choice = input("\nWould you like to log another student? (yes/no)").strip().lower()
    if choice != "yes":
      active = False

print("\n--- Final Generated Database Summary ---")
print(f"Total Registered Student Profiles: {len(student_database)}")
print(f"Database Matrix State: {student_database}")
print("\nSystem shut down successfully. Week 1 foundations complete!")