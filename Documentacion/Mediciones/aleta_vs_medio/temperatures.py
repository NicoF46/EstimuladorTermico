import matplotlib.pyplot as plt
import numpy as np


temps = [5, 10, 15, 20, 25, 30, 35]

# SIN MANO

sin_mano_tamb = 20.850067138671875
sin_mano_t_aleta = [4.898590087890625, 9.89202880859375, 14.9425048828125, 20.157562255859375, 24.949432373046875, 30.11065673828125, 34.9976806640625]
sin_mano_t_medio = [3.004119873046875, 8.787384033203125, 13.958251953125, 20.25640869140625, 25.4560546875, 31.17327880859375, 37.0400390625]
sin_mano_stationary_time = [138.96070194244385, 125.5390510559082, 88.69094038009644, 81.92460179328918, 186.33234786987305, 162.4831624031067, 142.93091988563538]
sin_mano_t_dif = [sin_mano_t_aleta[i]-sin_mano_t_medio[i] for i in range(len(temps))]

# CON MANO

con_mano_tamb = 21.4449462890625
con_mano_t_aleta = [4.79437255859375, 9.6917724609375, 14.844146728515625, 20.157562255859375, 24.848297119140625, 29.6888427734375, 35.109649658203125]
con_mano_t_medio = [2.363189697265625, 8.383697509765625, 14.155242919921875, 20.25640869140625, 25.4560546875, 30.428192138671875, 36.925018310546875]
con_mano_stationary_time = [158.40250945091248, 138.6662676334381, 100.50865173339844, 66.44651579856873, 137.37458968162537, 125.0976779460907, 145.35991024971008]
con_mano_t_dif = [con_mano_t_aleta[i]-con_mano_t_medio[i] for i in range(len(temps))]

fig, ax = plt.subplots()
fig.suptitle('Aleta vs Medio')
ax.plot(temps, sin_mano_t_aleta, 'o-', label='Temperatura aleta sin mano')
ax.plot(temps, sin_mano_t_medio, 'o-', label='Temperatura medio sin mano')
ax.plot(temps, con_mano_t_aleta, 'o-', label='Temperatura aleta con mano')
ax.plot(temps, con_mano_t_medio, 'o-', label='Temperatura medio con mano')
ax.set(xlabel='Temperatura deseada [°C]', ylabel='Temperatura medida [°C]')
ax.grid()
ax.yaxis.set_ticks(np.arange(0, 40, 1.0))
fig.legend()
fig.set_figheight(10)
fig.set_figwidth(15)
plt.savefig("aleta_vs_medio_temps.png", dpi=300)

fig, ax = plt.subplots()
ax.plot(temps, sin_mano_t_dif, 'o-', label='Sin mano')
ax.plot(temps, con_mano_t_dif, 'o-', label='Con mano')
ax.set(xlabel='Temperatura deseada [°C]', ylabel='Diferencia de temperatura [°C]')
ax.grid()
fig.legend()
fig.set_figheight(10)
fig.set_figwidth(15)
plt.savefig("aleta_vs_medio_difs.png", dpi=300)

fig, ax = plt.subplots()
ax.plot(temps, sin_mano_stationary_time, 'o-', label='Sin mano')
ax.plot(temps, con_mano_stationary_time, 'o-', label='Con mano')
ax.set(xlabel='Temperatura deseada [°C]', ylabel='Tiempo en llegar a estado estacionario [seg.]')
ax.grid()
fig.legend()
fig.set_figheight(10)
fig.set_figwidth(15)
plt.savefig("aleta_vs_medio_times.png", dpi=300)