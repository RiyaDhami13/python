

print(" Day 1: Operator Precedence & Associativity\n")

# 1. Multiplicative (*, /) is done before Additive (+, -); 
expr1 = 10 + 5 * 2
print(f"Result of 10 + 5 * 2: {expr1}")  # Expected: 20 

expr2 = (10 + 5) * 2
print(f"Result of (10 + 5) * 2: {expr2}")  # Expected: 30 


# 2. Exponentiation (**) is right-associative is  binded tighter than unary minus (-)
expr3 = 2 ** 3 ** 2
print(f"Result of 2 ** 3 ** 2: {expr3}")  # Expected: 512 

expr4 = -3 ** 2
print(f"Result of -3 ** 2: {expr4}")  # Expected: -9 


# 3. Left-to-right associativity for equal precedence operations
expr5 = 100 / 5 * 2
print(f"Result of 100 / 5 * 2: {expr5}")  # Expected: 40.0 

expr6 = 10 - 5 - 2
print(f"Result of 10 - 5 - 2: {expr6}")  # Expected: 3 


# 4. Mixed expression: Arithmetic -> Comparison -> Logical (not -> and -> or)
# Step-by-step breakdown:
# Arithmetic: (5 + 2 * 3) -> (5 + 6) -> 11
# Comparison: (11 > 10) -> True; (20 == 20) -> True
# Logical: (not False) -> True; then (True and True) -> True; finally (True or True) -> True
expr7 = 5 + 2 * 3 > 10 or not False and 20 == 20
print(f"Result of mixed expression: {expr7}")  # Expected: True 