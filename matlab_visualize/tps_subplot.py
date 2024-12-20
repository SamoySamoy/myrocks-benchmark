import matplotlib.pyplot as plt

# Data
time_interval = [
    90,
    180,
    270,
    360,
    450,
    540,
    630,
    720,
    810,
    900,
    990,
    1080,
    1170,
    1260,
    1350,
    1440,
    1530,
    1620,
    1710,
    1800,
    1890,
    1980,
    2070,
    2160,
    2250,
    2340,
    2430,
    2520,
    2610,
    2700,
    2790,
    2880,
    2970,
    3060,
    3150,
    3240,
    3330,
    3420,
    3510,
    3600,
]

innodb = [
    123.43,
    145.28,
    120.24,
    90.03,
    92.77,
    87.91,
    91.13,
    91.98,
    89.14,
    88.48,
    90.34,
    88.63,
    86.19,
    87.94,
    86.53,
    130.79,
    95.04,
    84.08,
    88.37,
    92.70,
    111.30,
    92.26,
    85.04,
    103.27,
    98.81,
    92.91,
    92.72,
    103.12,
    95.70,
    103.02,
    97.00,
    107.53,
    101.34,
    85.07,
    98.37,
    88.79,
    99.23,
    101.43,
    91.62,
    105.77,
]

inno_cmp8k = [
    141.09,
    147.81,
    121.51,
    96.08,
    95.23,
    94.79,
    92.64,
    95.94,
    96.71,
    133.26,
    96.47,
    84.69,
    84.58,
    104.55,
    87.82,
    90.50,
    87.96,
    86.73,
    91.62,
    92.41,
    89.06,
    85.10,
    88.37,
    83.17,
    85.27,
    87.02,
    83.23,
    86.24,
    84.32,
    81.61,
    86.18,
    84.63,
    82.41,
    81.69,
    82.02,
    84.00,
    81.94,
    83.97,
    83.67,
    83.36,
]

inno_cmp4k = [
    87.59,
    87.19,
    81.76,
    82.27,
    82.36,
    81.67,
    85.60,
    79.83,
    80.71,
    84.24,
    82.77,
    81.73,
    86.33,
    80.28,
    86.01,
    78.42,
    81.40,
    79.02,
    81.40,
    78.57,
    84.24,
    77.32,
    78.29,
    81.22,
    78.24,
    78.77,
    78.61,
    76.48,
    79.77,
    76.54,
    77.27,
    81.72,
    78.22,
    77.56,
    76.32,
    80.02,
    75.41,
    75.63,
    80.31,
    78.04,
]

myrocks = [
    489.69,
    511.15,
    385.38,
    428.20,
    430.21,
    428.96,
    424.78,
    406.54,
    453.90,
    418.61,
    480.42,
    379.02,
    449.60,
    399.42,
    438.87,
    465.56,
    410.17,
    451.45,
    414.21,
    474.22,
    428.08,
    420.84,
    416.00,
    419.42,
    419.93,
    457.79,
    402.70,
    434.46,
    459.88,
    399.17,
    439.08,
    431.60,
    445.39,
    409.26,
    444.80,
    411.42,
    424.48,
    422.46,
    453.62,
    406.33,
]

# Create subplots (rows, columns)
fig, axs = plt.subplots(2, 2, figsize=(12, 10))

# InnoDB plot
axs[0, 0].plot(time_interval, innodb, "-o", label="InnoDB", linewidth=2, color="b")
axs[0, 0].set_title("InnoDB", fontsize=14)
axs[0, 0].set_xlabel("Time Interval (seconds)", fontsize=12)
axs[0, 0].set_ylabel("tps (Transactions per second)", fontsize=12)
axs[0, 0].grid(True)
axs[0, 0].legend()

# InnoDB CMP 8K plot
axs[0, 1].plot(
    time_interval, inno_cmp8k, "-s", label="InnoDB CMP 8K", linewidth=2, color="g"
)
axs[0, 1].set_title("InnoDB CMP 8K", fontsize=14)
axs[0, 1].set_xlabel("Time Interval (seconds)", fontsize=12)
axs[0, 1].set_ylabel("tps (Transactions per second)", fontsize=12)
axs[0, 1].grid(True)
axs[0, 1].legend()

# InnoDB CMP 4K plot
axs[1, 0].plot(
    time_interval, inno_cmp4k, "-^", label="InnoDB CMP 4K", linewidth=2, color="r"
)
axs[1, 0].set_title("InnoDB CMP 4K", fontsize=14)
axs[1, 0].set_xlabel("Time Interval (seconds)", fontsize=12)
axs[1, 0].set_ylabel("tps (Transactions per second)", fontsize=12)
axs[1, 0].grid(True)
axs[1, 0].legend()

# MyRocks plot
axs[1, 1].plot(
    time_interval, myrocks, "-d", label="MyRocks", linewidth=2, color="purple"
)
axs[1, 1].set_title("MyRocks", fontsize=14)
axs[1, 1].set_xlabel("Time Interval (seconds)", fontsize=12)
axs[1, 1].set_ylabel("tps (Transactions per second)", fontsize=12)
axs[1, 1].grid(True)
axs[1, 1].legend()

# Adjust layout to prevent overlap
plt.tight_layout()
plt.show()
