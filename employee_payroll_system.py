#Nmae: Riya Dhami
#OOP concept: Abstractuion, abstraction methods and polymorphism.
from abc import ABC, abstractmethod

print("------------Kanchanpur Payroll Engine-------------")

#abstract parent class
class Employee(ABC):
  def __init__(self, name:str):
    self.name = name
  
  @abstractmethod
  def calculated_pay(self) -> float:
    """Abstract Method: Every class must implement this math."""
    pass

  def payslip(self):
    """Normal Method: Inherited by all children. Use polymorphism."""
    pay = self.calculated_pay()
    print(f"📄 Payslip for {self.name} | Amount Earned: Rs. {pay:.2f}")

# the child classes
class FullTimeEmployee(Employee):
  def __init__(self, name:str,monthly_salary: float):
    super().__init__(name)
    self.monthly_salary = monthly_salary

  def calculated_pay(self) -> float:
    return self.monthly_salary
  
  def __str__(self) -> str:
    return f"FullTimeEmployee({self.name})"
  
class PartTimeEmployee(Employee):
  def __init__(self, name: str, hourly_rate: float,hours_worked:float):
    super().__init__(name)
    self.hourly_rate = hourly_rate
    self.hours_worked = hours_worked

  def calculated_pay(self) -> float:
    return self.hourly_rate * self.hours_worked
  
  def __str__(self) -> float:
    return f"PartTimeEmployee({self.name})"
  
class  Contractor(Employee):
    def __init__(self, name: str, project_fee: float, projects: int):
      super().__init__(name)
      self.project_fee = project_fee
      self.projects = projects

    def __str__(self) -> float:
      return f"Contractor({self.name})"
    
    def calculated_pay(self) -> float:
        return self.project_fee * self.projects
    



  
#TESTING FOR THE SYSTEM FOR RUN

print("--------------------------------")
print("*****System Execution test******")
print("--------------------------------")

#mixed list of employees

staff = [
    FullTimeEmployee("Riya", 60000),
    PartTimeEmployee("Kishor", 500, 80), 
    Contractor("Seema", 15000, 3)
]

total_payroll = 0.0

#polymorphism in action
for worker in staff:
  print(f"System Label: {worker}")
  worker.payslip()
  total_payroll += worker.calculated_pay()
  print("-"*10)

print(f"💰 Total Monthly Company Payroll: Rs {total_payroll:.2f}")


 
