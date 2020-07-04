import matplotlib.pyplot as plt
import math

class Plotter:

    def __init__(self, x_lim, y_lim = [], style = 'ggplot', x_margin_factor = 0.1, pause_interval = 0.001):

        plt.style.use(style)
        plt.ion()
        self.fig = plt.figure()
        self.axes = self.fig.add_subplot(111)
        self.lines = {}
        plt.show()

        self.x_vecs = {}
        self.y_vecs = {}

        self.pause_interval = pause_interval

        self.x_margin = (x_lim[1] - x_lim[0])*x_margin_factor
        self.x_lim = x_lim
        self.x_len = x_lim[1] - x_lim[0]
        plt.xlim(self.x_lim)

        if len(y_lim) == 0:
            y_lim = [0, 1]
        self.y_lim = y_lim
        self.y_len = y_lim[1] - y_lim[0]
        plt.ylim(self.y_lim)

    def add_line(self, key):
        self.lines[key], = self.axes.plot([])
        self.x_vecs[key] = []
        self.y_vecs[key] = []

    def add_data(self, x_data, y_data, line_key):
        if x_data[-1] > self.x_lim[-1] - self.x_margin:
            self.x_lim = [x_data[-1] - self.x_len + self.x_margin, x_data[-1] + self.x_margin]
            plt.xlim(self.x_lim)

        self.x_vecs[line_key] +=  x_data
        self.y_vecs[line_key] +=  y_data
        self.lines[line_key].set_data(self.x_vecs[line_key], self.y_vecs[line_key])

        plt.pause(self.pause_interval)

    def ylim(self, y_lim):
        plt.ylim(self.y_lim)

    def close(self):
        plt.close('all')

    def  set_ticks(self, array, sticks):
        if array == 'x':
            plt.xticks(sticks)
        if array == 'y':
            plt.yticks(sticks)

if __name__ == "__main__":

    x_lim = [0, math.pi*2]
    y_lim = [0, 1]
    p = Plotter(x_lim, y_lim)
    p.add_line('red')
    p.add_line('blue')
    x = 0
    try:
        while True:
            if math.sin(x) < y_lim[0]:
                y_lim[0] = math.sin(x)
                p.ylim(y_lim)
            if math.sin(x) + 1 > y_lim[1]:
                y_lim[1] = math.sin(x) + 1
                p.ylim(y_lim)

            p.add_data([x], [math.sin(x)], 'red')
            p.add_data([x], [math.sin(x) + 1], 'blue')
            x += 0.1

    except KeyboardInterrupt: # Ctrl + C
        p.close()
        pass
