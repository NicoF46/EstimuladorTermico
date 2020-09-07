import matplotlib.pyplot as plt
import pdb
def plotear():
	# pdb.set_trace()
	plt.plot(temp, temp_diff_empty, 'o-', label='Sin mano')
	plt.plot(temp, temp_diff_hand, 'o-', label='Con mano')

	plt.xlabel('Temperatura aleta')
	plt.ylabel('Temperatura peltier')

	plt.title('Diferencia de temperatura entre aleta y borde del peltier')
	plt.grid()
	plt.legend()
	plt.show()

tamb = 20

cold_temp = [19, 18, 17, 16, 15, 14, 13, 12, 11, 10]

cold_dif_empty = [
	0.196990966796875, 
	0.295013427734375, 
	0.393035888671875,
	0.4913330078125,
	0.491851806640625,
	0.492828369140625,
	0.593109130859375,
	0.59527587890625,
	0.698150634765625,
	0.601593017578125
]

cold_dif_hand = [
	0.29547119140625, 
	0.393341064453125,
	0.49127197265625,
	0.58966064453125,
	0.787261962890625,
	1.084808349609375,
	0.98919677734375,
	1.191619873046875,
	1.39825439453125,
	1.0032958984375
]

hot_temp = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]

hot_dif_empty = [
	0.0,
	0.0,
	0.0,
	0.0,
	0.100616455078125,
	0.101165771484375,
    0.20391845703125,
    0.3084716796875,
    0.311187744140625,
    0.6287841796875,
    0.8392333984375
]

hot_dif_hand = [
	0.0,
	0.0,
	0.0,
	0.0,
	0.10052490234375,
	0.202423095703125,
    0.408477783203125,
    0.5145263671875,
    0.623291015625,
    0.8392333984375,
    0.954742431640625
]

cold_temp.reverse()
cold_dif_empty.reverse()
cold_dif_hand.reverse()

cold_dif_empty = [ -1*i for i in cold_dif_empty]
cold_dif_hand = [ -1*i for i in cold_dif_hand]

temp = cold_temp + hot_temp
temp_diff_empty = cold_dif_empty + hot_dif_empty
temp_diff_hand = cold_dif_hand + hot_dif_hand

temp_diff_empty = [temp_diff_empty[i] + temp[i] for i in range(len(temp_diff_empty))]
temp_diff_hand = [temp_diff_hand[i] + temp[i] for i in range(len(temp_diff_hand))]

if __name__ == '__main__':
    plotear()