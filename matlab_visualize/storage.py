import matplotlib.pyplot as plt

# Data for the diagram
databases = ["InnoDB", "InnoDB (CMP8K)", "InnoDB (CMP4K)", "MyRocks"]
storage_sizes = [8.9, 4.5, 1.8, 1.6]

# Create the bar chart
plt.figure(figsize=(8, 6))
plt.bar(databases, storage_sizes, color=["blue", "green", "orange", "red"])

# Adding labels and title
plt.xlabel("Type")
plt.ylabel("Storage Size (GB)")
plt.title("Storage Efficiency Comparison using TPC-C Schema (Scale 100)")
plt.ylim(0, 10)

# Display the chart
plt.show()
