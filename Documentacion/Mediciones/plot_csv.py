import matplotlib.pyplot as plt
import csv
import sys

def csv_read(file_name):
    with open(file_name) as f:
        reader = csv.reader(f)
        return [r for r in reader]

def plot_csv(file_name):
    time, temp = csv_read(file_name)
    time = list(map(float,time))
    temp = list(map(float,temp))

    plt.style.use('ggplot')
    plt.plot(time,temp)
    ax = plt.gca()
    ax.locator_params(which="both", tight=True, nbins=10)
    plt.show()



if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("CSV file missing")
        sys.exit()
    plot_csv(sys.argv[1])
