#Name: Riya Dhami
#the aprroach is to utilize python dunder method to implement operator overloading.
#overiding with eqns



print("-------Smart Wallet & Money Engine------\n")

class Money:
  def __init__(self, amount:float, currency: str = "Rs"):
    """Initializes a money object with a numeric value and currency type."""
    self.amount = amount
    self.currency = currency
  
  def __str__(self) -> str:
    """String representation: How normal human users see the object."""
    return f"{self.currency} {self.amount}"
  
  def __repr__(self) -> str:
    """Representation string: Precise blueprint view for developer debugging."""

  def __add__(self,other) -> 'Money':
    """Operator Overloading(+): Combines two money objects into a brand new one."""

  #Return NEW object, does not change self or other.
  def __eq__(self, other) -> bool:
    """Equality Operator (==): Compares if two money amounts match perfectly."""
  
  def __lt__(self, other) -> bool:
    """Less-Than Operator (<): Crucial for allowing python's native sorted() to function."""
    if isinstance(other,Money):
      return self.amount < other.amount
    return False

class Wallet:
  def __init__(self, notes_list: list = None):
    """Initializes a wallet containing a list of framework of Money Instances."""
    if notes_list is None:
      self.notes = []
    else:
      self.notes = notes_list

  def __len__(self) -> int:
    """Length dunder: Allows len(wallet) to pull total item count smoothly."""
    return len(self.notes)
  
  def total(self) -> Money:
    """Aggregates all independt notes into final structural money object."""
    running_sum = 0.0
    currency_type = "Rs"

    #simple loop accumulator to avoid integer summation conflicts
    for note in self.notes:
      running_sum += note.amount
      currency_type = note.currency

    return Money(running_sum, currency_type)
  

# TESTING IF  SYSTEM EXECUTION RUNS


print("--- RUN 1: TESTING MONEY OPERATIONS ---")
a = Money(500)
b = Money(300)

print(f"Addition Test (a + b):     {a + b}")       # Triggers __add__ then __str__
print(f"Equality Test (a == 500):  {a == Money(500)}") # Triggers __eq__
print(f"Comparison Test (b < a):   {b < a}")       # Triggers __lt__

print("\n--- RUN 2: SORTING NATIVE OBJECTS ---")
notes = [Money(100), Money(500), Money(50)]
print(f"Raw developer display:    {notes.__repr__()}")
print(f"Sorted human display:     {sorted(notes)}") # Uses __lt__ to sort!

print("\n--- RUN 3: WALLET CONTAINER SYSTEM ---")
w = Wallet(notes)
print(f"Total Notes in Wallet:    {len(w)}")        # Triggers __len__
print(f"Total Value in Wallet:    {w.total()}")    # Processes final summary object

