print("---------Day 4-----------\n")

print("-------------------------\n")
print("--CINEMA TICKET PRICING--\n")
print("-------------------------\n")

#Customer data
age = int(input("What is your age? :"))
day = input("\nWhich day is today? :").strip().title()

member_input = input("Are you a cinema member? (yes/no): ").strip().lower()
is_member = member_input = "yes"

BASE_PRICE = 500.00
weekdays_set = {"Monday", "Tuesday", "Thursday", "Friday"}

#price of the tickets is
if age < 5:
    category = "Toddler (Under 5)"
    discount_percentage = 100.0  # Free entry
elif age < 18:
    category = "Minor (Under 18)"
    discount_percentage = 50.0   # 50% off
elif age >= 60:
    category = "Senior (60+)"
    discount_percentage = 30.0   # 30% off
else:
    category = "Adult"
    discount_percentage = 0.0    # Full price

calculated_price = BASE_PRICE * (1-(discount_percentage)/100)

member_discount = 0.00
if is_member and (day in weekdays_set):
    member_discount = 10.0
    
    calculated_price = calculated_price * (1 - (member_discount / 100))

#Who gets the free popcorn?
popcorn_offer = "No Offer"
if member_discount > 0:  
    if is_member:
        popcorn_offer = "🍿 Large Free Popcorn Combo!"
    else:
        if age < 18:
            popcorn_offer = "🍿 Small Free Popcorn!"

closing_message = "Free entry! Have fun!" if calculated_price == 0 else "Enjoy the show! 🎬"

# 6. Summary Printout Card
print("\n" + "-"*40)
print("             TICKET SUMMARY             ")
print("-"*40)
print(f"Customer Category:  {category}")
print(f"Age / Day / Member: {age} / {day} / {is_member}")
print(f"Age Discount:       {discount_percentage}%")
print(f"Member Weekday Disc:{member_discount}%")
print(f"Popcorn Offer:      {popcorn_offer}")
print(f"Final Ticket Price: {calculated_price:.2f}")
print("-"*40)
print(closing_message)
print("="*40)