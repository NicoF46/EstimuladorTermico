import math
import matplotlib.pyplot as plt

if __name__ == "__main__":
    plt.style.use('ggplot')
    plt.ion()
    fig = plt.figure()
    ax = fig.add_subplot(111)

    x = 0
    y = math.sin(x)

    x_vec = [x]
    y_vec = [y]

    line, = ax.plot(x,y)
    plt.show()

    x_len = math.pi*2
    x_margin = x_len/10
    plt.xlim([0,x_len])
    plt.ylim([-1.1,1.1])

    step = 0.05
    while(True):
        x += step
        if x > x_len-x_margin:
            plt.xlim([x+x_margin-x_len,x+x_margin])
        x_vec.append(x)
        y = math.sin(x)
        y_vec.append(y)
        line.set_data(x_vec,y_vec)
        plt.pause(0.001)
