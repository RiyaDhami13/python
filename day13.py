from functools import reduce

print("-----Data transformation Engine----------\n")

raw_voltages = [1.2,4.5,3.1,5,0.8,6.2,5.5]
print(f"Original Readings: {raw_voltages}")

#maginifying each voltage with map
magnified_voltages = list(map(lambda v:v * 10, raw_voltages))
print(f"Map Outcomes (10X Boost): {magnified_voltages}")

#filter voltages : keep onlt that are greater tahn 3.0
high_voltages = list(filter(lambda v: v > 3.0, raw_voltages))
print(f"2. Filter Output (Surge Check): {high_voltages}")

#reduce: sum all the voltages to get the total
#it adds by adding first two numbers then the sum to the next and then to the next
total_voltage_load = reduce(lambda total, v: total + v, raw_voltages)
print(f"3. Reduce Output (Total Combined Load): {total_voltage_load:.2f}V")