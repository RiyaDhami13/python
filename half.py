#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      DELL
#
# Created:     28/04/2022
# Copyright:   (c) DELL 2022
# Licence:     <your licence>
#-------------------------------------------------------------------------------
first=input("enter first number:")
operator=input("enter operator(+,-,*,/,%):")
second=input("enter second number:")
first=int(first)
second=int(second)
if operator=="+":
 print (first+second)


elif operator == "-":
 print(first-second)


elif operator == "*":
 print(first*second)





elif operator =="/":
 print(first/second)



elif operator =="%":
 print (first%second)




else:
 print("invalid operation")

