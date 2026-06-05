print("-------------------------")
print("---System Registration---")
print("-------------------------")

active = True

registered_users = []

while active:
  username = input("\nCreate a username.Or type 'exit' to quit: ").strip().lower()

  if username == "exit":
    print("Closing registration system")
    break     #Loop ends immediately.

  if len(username) < 4:
    print("⚠️ Error: Username must be at least 4 characters long.")
    continue   # skips the rest of the code, it goes to the top
  
  #only if the input passes validation above
  print(f"✅ Username '{username}' is available!")  

  #storing users into a list
  registered_users.append(username)

  current_count = len(registered_users)
  print(f"Total users registered till now are: {current_count}")

  #adding more users
  choice = input("Register another user?(yes/no): ").strip().lower()
  if choice != "yes":
    active = False  
    #since the while runs for the true so the loop will end if user puts anything beside yes

print("\nSystem shut down successfully.")
print("\n---Final Database Summary---")
print(f"Total successfull registrations: {len(registered_users)}")
print(f"Registered List: {registered_users}")