print("-----Should I go to College?-(Bot)-----")

#The initialize scenario
today_status = {
  "is_raining": True,
  "is_assignment_due" :False,
  "is_practical_day": True
}

#Input from user
energy_level = int(input("How is the energy level today(1-10): "))
feeling_lazy = input("Are you feeling extra lazy today?(yes/no):").lower()=="yes"

#Let's make a decision
print("\n--Decision Making--")

if today_status["is_practical_day"] or today_status["is_assignment_due"]:
  print("Verdict! YOU MUST GO Practical marks and assignments are too important to skip!")

elif today_status["is_raining"] and feeling_lazy:
    print("Verdict: STAY HOME. It's raining and you're tired. Perfect day for self-study in VS Code.")

elif energy_level > 7 and not feeling_lazy:
    print("Verdict: GO TO CLASS. You have the energy, don't waste the day!")

else:
    print("Verdict: YOUR CHOICE. Maybe just join the theory session and come back early.")

print("\n==========================================")
