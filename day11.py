
print("------REAL-TIME METRIC TRACKING ENGINE --------\n")

# Outer Factory Function
def create_sensor_monitor(sensor_name: str, safety_threshold: float):
    """
    Generates a custom monitoring function bound to a specific hardware node.
    Demonstrates Enclosing Scope and Functional Closures.
    """
    # Local scope variable tracking state across multiple executions
    reading_count = 0 
    
    # Inner Nested Function
    def track_reading(current_value: float) -> str:
        # nonlocal keyword allows us to modify a variable in the enclosing scope
        nonlocal reading_count 
        reading_count += 1
        
        # Accessing outer parameters (sensor_name, safety_threshold) via Closure
        status = "NORMAL" if current_value <= safety_threshold else "⚠️ CRITICAL OVERLOAD"
        
        return f"[{sensor_name} | Run #{reading_count}] Val: {current_value} -> Status: {status}"
        
    return track_reading # Returning the inner function object itself

# --- (The Factory in Action) ---

# Step 1: Generate custom, isolated tracking functions
lcr_monitor = create_sensor_monitor("LCR_Resonance_Circuit", 50.0)
thermal_monitor = create_sensor_monitor("Transformer_Core_B", 120.5)

# Step 2: Execute the closures (They remember their unique internal memory states!)
print(lcr_monitor(42.3))  # Run #1 for LCR
print(lcr_monitor(55.1))  # Run #2 for LCR (State persists!)

print(thermal_monitor(98.0))   # Run #1 for Thermal (Completely isolated memory)
print(lcr_monitor(48.7))  # Run #3 for LCR (Count keeps updating!)