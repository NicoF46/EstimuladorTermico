import matplotlib.pyplot as plt
import math


class Plotter:

    def __init__(self, x_lim, y_lim = [], style = 'ggplot', x_margin_factor = 0.1, pause_interval = 0.001):

        plt.style.use(style)
        plt.ion()
        self.fig = plt.figure()
        self.axes = self.fig.add_subplot(111)
        self.line, = self.axes.plot([])
        plt.show()

        self.x_vec = []
        self.y_vec = []

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

    def add_data(self, x_data, y_data):
        if x_data[-1] > self.x_lim[-1] - self.x_margin:
            plt.xlim([x_data[-1] - self.x_len + self.x_margin, x_data[-1] + self.x_margin])

        self.x_vec = self.x_vec + x_data
        self.y_vec = self.y_vec + y_data
        self.line.set_data(self.x_vec, self.y_vec)
        plt.pause(self.pause_interval)


if __name__ == "__main__":

    x_lim = [0, math.pi*2]
    p = Plotter(x_lim, [-1.1, 1.1])
    x = [x/20 for x in range(200)]
    max = 0
    min = 0
    for t in x:
        # if math.sin(t) > max:
        #     max = math.sin(t)
        #     plt.ylim([min,max])
        # if math.sin(t) < min:
        #     min = math.sin(t)
        #     plt.ylim([min,max])

        p.add_data([t], [math.sin(t)])
