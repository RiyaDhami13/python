
print(" Day 2: Student Report Card Generator Initialization \n")

# Reading inputs 
name = input("Enter Student Name: ")
roll_number = input("Enter Roll Number: ")
maths = float(input("Enter marks for Mathematics: "))
science = float(input("Enter marks for Science: "))
english = float(input("Enter marks for English: "))

# Storing records inside a dictionary
student_profile = {
    "name": name,
    "roll_no": roll_number,
    "marks": {"Mathematics": maths, "Science": science, "English": english}
}

# Calculations
total_marks = maths + science + english
percentage = (total_marks / 300) * 100

#  Pass check (all subjects must be >= 40)
all_subjects_passed = maths >= 40 and science >= 40 and english >= 40

# Assigning letter grades using if-elif-else chain
if percentage >= 90:
    grade = "A+"
elif percentage >= 80:
    grade = "A"
elif percentage >= 70:
    grade = "B"
elif percentage >= 60:
    grade = "C"
elif percentage >= 40:
    grade = "D"
else:
    grade = "F"

# Nested conditional check with set membership for distinction remarks
remark = "Good Effort"
if all_subjects_passed:
    if grade in {"A+", "A"}:
        remark = "Distinction Earned!"

# Ternary expression to set ultimate operational status
status = "PASS" if all_subjects_passed else "FAIL"

# Formatted Output Display
print("\n" + "="*45)
print(f"{'ACADEMIC PERFORMANCE REPORT CARD':^45}")
print("="*45)
print(f"Student Name : {student_profile['name']}")
print(f"Roll Number  : {student_profile['roll_no']}")
print("-"*45)
print(f"Mathematics  : {student_profile['marks']['Mathematics']}/100")
print(f"Science      : {student_profile['marks']['Science']}/100")
print(f"English      : {student_profile['marks']['English']}/100")
print("-"*45)
print(f"Total Marks  : {total_marks:.2f} / 300.00")
print(f"Percentage   : {percentage:.2f}%")
print(f"Final Grade  : {grade}")
print(f"Remarks      : {remark}")
print("-"*45)
print(f"FINAL STATUS : {status}")
print("="*45)