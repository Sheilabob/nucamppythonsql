# %%
import numpy as np
import matplotlib.pyplot as plt

# %%
x = np.linspace(0, 2 * np.pi, 10)
print(x)

# %%
y = np.sin(x)
print(y)

# %%
plt.plot(x, y)
# %%
resolution = 100
frequency = 2
x = np.linspace(0, 2 * np.pi, resolution)
y = np.sin(x*frequency)
plt.plot(x, y)

# %%
y1 = np.sin(x*6)
y2 = np.sin(x*9)
plt.plot(x, y1+y2)

# %%
