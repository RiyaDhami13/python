#day 9

import math

print("-------DAY 9: ENGINEERING MATH FUNDAMENTAL--------\n")

#standard built in functions
negative_voltage = -12.5
clean_voltage = abs(negative_voltage)
print(f"Absolute voltage: {clean_voltage}V")

pi_estimate = 3.14159265
print(f"Rounded PI(2 decimal places):{round(pi_estimate,2)}")

#the math module for precision
gpa_raw = 3.12

#math.ceil() always round UP to the next integer
print(f"Ceiling Rounding (Upper Bound): {math.ceil(gpa_raw)}")

#math.floor() always round DOWN to the next integer
print(f"Floor Rounding (Lower Bound): {math.floor(gpa_raw)}")

#built in constants
radius = 5

#area of circle
circle_area = math.pi * (radius ** 2)
print(f"Calculated Area of Circle (r={radius}: {round(circle_area,4)})")
