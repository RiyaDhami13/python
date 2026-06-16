#Name: Riya Dhami
#Using Object-Oriented Programming (OOP) principles to enforce strict data isolation.
print("----------Kanchanpur Bank Digital Engine--------")

class BankAccount:
  def __init__(self, owner:str, opening_balance: float = 0.0):
    """Initializes the bank account with an owner and a heavily protected bank balance"""
    self.owner = owner
    #Encapsulation
    self.__balance = opening_balance

  def get_balance(self) -> float:
    """Greater method: The only safe window to view the balance from outside."""
    return self.__balance
  
  def _update_balance(self, amount : float):
    """A protected helper method allowing internal child classes to adjust the private valut."""
    self.__balance += amount

  def deposit(self, amount : float):
    """Validates and processes incoming funds safely."""
    if amount > 0:
      self._update_balance(amount)
      print(f"✅ Deposited: {amount:.2f} | Current Balance: {self.get_balance():.2f}")
    else:
      print("⚠️ Transcation Rejected: Deposit amount must be positive.")

  def withdraw(self, amount: float):
    """Standard Base Withdrawal: Can not pull out more than the current balance."""
    if amount <= 0:
      print("⚠️ Transcation Rejected: Withdrawal must positive.")
    elif amount > self.__balance:
      print(f"⚠️ Transcation Rejected: Not enough balance! (Attempted: {amount} | Available: {self.__balance})")
    else:
      self._update_balance(-amount)
      print(f"💸 Withdrew: {amount:.2f} | Current Balance: {self.get_balance():.2f}")

class SavingsAccount(BankAccount):
  def __init__(self, owner:str, opening_balance:float):
    super().__init__(owner,opening_balance)
  
  def add_interest(self, rate:float):
    """Calculates the interest and utilizes the parent modifier to add funds safely."""
    if rate > 0:
      interest_accrued = self.get_balance() * (rate / 100)
      self._update_balance(interest_accrued)
      print(f"📈 Interest applied (+{rate}%): Added {interest_accrued}:.2f")
    else:
      print("⚠️ Rejected: Interest rate must be positive.")

class CurrentAccount(BankAccount):
  def __init__(self, owner:str, opening_balance:float = 0.0, overdraft_limit: float=0.0):
    super().__init__(owner, opening_balance)
    self.overdraft_limit = overdraft_limit

  def withdraw(self, amount:float):
    """Overriding: Replaces parent rules to allow balance to dip into the negative zone."""
    if amount <= 0:
      print(f"⚠️ Transcation Rejected: Withdrawal must be positive.")
    elif self.get_balance() - amount < -self.overdraft_limit:
      print(f"⚠️ Transcation Rejected: Overdraft limit reached.(Limit: {self.overdraft_limit})")
    else:
      self._update_balance(-amount)
      print(f"💸 Overdraft Withdrew: {amount: .2f} | Current Balance: self.get_balance():.2f")

print("---------------------------------------")
print("*****Testing System Executions*********")
print("---------------------------------------")

print("--RUN 1: Test Saving Account (RIYA)---")
s = SavingsAccount("Riya", 1000)
s.deposit(500)
s.add_interest(10) 
print(f"Final Balance Check: {s.get_balance()}") 
s.withdraw(5000)

print("\n---RUN 2: Tesing Current Account (KISHOR)---")
c = CurrentAccount("Kishor", 200, overdraft_limit=500)
c.withdraw(600) 
print(f"Final Balance Check: {c.get_balance()}") 
c.withdraw(200)
      
    

#----------Kanchanpur Bank Digital Engine--------
# *****Testing System Executions*********
#---------------------------------------
#--RUN 1: Test Saving Account (RIYA)---
#✅ Deposited: 500.00 | Current Balance: 1500.00
#📈 Interest applied (+10%): Added 150.0:.2f
#Final Balance Check: 1650.0
#⚠️ Transcation Rejected: Not enough balance! (Attempted: 5000 | Available: 1650.0)

#---RUN 2: Tesing Current Account (KISHOR)---
#💸 Overdraft Withdrew:  600.00 | Current Balance: self.get_balance():.2f
#Final Balance Check: -400
#⚠️ Transcation Rejected: Overdraft limit reached.(Limit: 500)#---------------------------------------
