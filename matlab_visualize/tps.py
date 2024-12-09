import matplotlib.pyplot as plt

# Data
time_interval = [
    90, 180, 270, 360, 450, 540, 630, 720, 810, 900,
    990, 1080, 1170, 1260, 1350, 1440, 1530, 1620, 1710, 1800,
    1890, 1980, 2070, 2160, 2250, 2340, 2430, 2520, 2610, 2700,
    2790, 2880, 2970, 3060, 3150, 3240, 3330, 3420, 3510, 3600,
]


inno_3GB = [
    341.16, 282.92, 202.21, 204.43, 234.84, 215.58, 220.63, 191.93, 
    223.68, 240.29, 221.72, 198.24, 241.56
]

inno_5GB = [
  391.33, 292.27, 282.26, 254.98, 212.33, 300.58, 280.63, 261.33,
  213.68, 220.29, 271.72, 208.24, 291.56
]

inno_7GB = [
  391.33, 292.27, 282.26, 254.98, 212.33, 300.58, 280.63, 261.33,
  213.68, 220.29, 271.72, 208.24, 291.56
]

myrocks_3GB = [
    503.15, 553.18, 530.34, 359.29, 436.12, 459.49, 405.73, 447.27, 
    429.31, 376.21, 434.52, 436.69, 429.67
]

myrocks_3GB = [
    503.15, 553.18, 530.34, 359.29, 436.12, 459.49, 405.73, 447.27, 
    429.31, 376.21, 434.52, 436.69, 429.67
]

myrocks_5GB = [
    503.15, 553.18, 530.34, 359.29, 436.12, 459.49, 405.73, 447.27, 
    429.31, 376.21, 434.52, 436.69, 429.67
]

myrocks_7GB = [
    503.15, 553.18, 530.34, 359.29, 436.12, 459.49, 405.73, 447.27, 
    429.31, 376.21, 434.52, 436.69, 429.67
]





# Plotting the data
plt.figure(figsize=(10, 6))

# Plot each dataset with labels and different markers
plt.plot(time_interval, innodb, "-o", label="InnoDB", linewidth=2)
plt.plot(time_interval, inno_cmp8k, "-s", label="InnoDB CMP 8K", linewidth=2)
plt.plot(time_interval, inno_cmp4k, "-^", label="InnoDB CMP 4K", linewidth=2)
plt.plot(time_interval, myrocks, "-d", label="MyRocks", linewidth=2)

# Formatting the graph
plt.xlabel("Time Interval (seconds)")
plt.ylabel("tps (Transactions per second)")
plt.title("Performance Comparison in Sysbench with TPC-C Scale 100")
plt.legend()
plt.grid(True)
plt.tight_layout()

# Show the plot
plt.show()
