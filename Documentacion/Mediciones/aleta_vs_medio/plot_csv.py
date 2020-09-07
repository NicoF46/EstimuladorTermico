import matplotlib.pyplot as plt
import csv
import sys
from matplotlib.pyplot import figure

def plot_curves(time, t_wing, t_mid, output, max_dif, last_dif):
    
    dif = [t_mid[i] - t_wing[i] for i in range(len(t_mid)) ]

    plt.plot(time, t_wing, '-', label='Temperatura aleta')
    plt.plot(time, t_mid, '-', label='Temperatura peltier')
    plt.plot(time, dif, '-', label='Diferencia entre curvas')

    plt.xlabel('Tiempo')
    plt.ylabel('Temperatura')
    plt.title(f'Diferencia maxima = {max_dif} diferencia en estado estacionario = {last_dif}')

    plt.grid()
    plt.legend()
    fig = plt.gcf()
    fig.set_figheight(10)
    fig.set_figwidth(15)
    plt.savefig(output, dpi=100)


if __name__ == "__main__":
   
    if len(sys.argv) < 2:
        raise SyntaxError("No csv provided")
    
    output = f'{sys.argv[1].split(".")[0]}.png'

    time = []
    t_wing = []
    t_mid = []

    max_dif = 0
    last_dif = 0
    start_time = 0
    with open(sys.argv[1], 'r') as dataFile:
        reader = csv.reader(dataFile)
        header = True
        for row in reader:
            if header:
                header = False
            elif( row[3] != ''):
                time.append(float(row[0]) - start_time)
                t_wing.append(float(row[1]))
                t_mid.append(float(row[2]))
                dif = abs(t_wing[-1] - t_mid[-1])
                last_dif = dif
                if ( dif > max_dif ):
                    max_dif = dif
            else:
                start_time = float(row[0])


    plot_curves(time, t_wing, t_mid, output, max_dif, last_dif)