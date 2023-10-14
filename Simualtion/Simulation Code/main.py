import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import random

def genGaussianList():
  x1 = [random.randint(0,80) for i in range(5)]
  x2 = [random.randint(0,80) for i in range(5)]
  x1.sort()
  x2.sort()
  x2.reverse()
  x1.extend(x2)
  return x1

def genGaussianListWithLimit(num: int):
  lst = []
  sum = num
  for i in range(9):
    lst.append(random.randint(0, int(sum/2)))
    sum -= lst[-1]
  lst.append(sum)
  x1 = lst[:5]
  x2 = lst[5:]
  x1.sort()
  x2.sort()
  x2.reverse()
  x1.extend(x2)
  return x1

def createList(r1, r2):
    return list(range(r1, r2+1))

def seatPassengers(cmp_list, pass_num): #variable 1: compartments list, variable 2: passenger number
  cmp_list.sort()
  summ = sum(cmp_list)
  ratio_list = [((cmp_list[i]/summ)) for i in range(10)]
  ratio_list.reverse()
  for i in range(10):
    cmp_list[i] += int(pass_num * ratio_list[i])
    if i == 0:
      max_time = int(pass_num * ratio_list[i]) * 10
  return max_time

#number of people at the train station
#x = createList(0, 80)
x = [*range(0,81,5)]

train_starting_point = [random.randint(0,40) for i in range(10)]

y1 = []
#compute the time -
for k in x:
  tmp_train = train_starting_point
  y1.append(seatPassengers(tmp_train, k))


max_items = []
for i in range(0, 81, 5):
    item = genGaussianListWithLimit(i)
    max_items.append(max(genGaussianListWithLimit(i)))

y2 = []
for i in max_items:
    y2.append(i * 10)

plt.plot(x, y1, color = 'blue')
plt.plot(x, y2, color='black')
plt.plot()

plt.xlabel("Number of people at the station")
plt.ylabel("Time it takes - seconds")
plt.title("without the project")
plt.legend()
plt.show()


####part2#####


new_x = [*range(1, 11)]

# time without project
y3 = []
for i in range(10):
    y3.append(max(genGaussianListWithLimit(50)) * 10)

compartment = [random.randint(0, 20) for i in range(10)]
print(compartment)

# time with project and compartments initialized to random
y4 = []
for i in range(10):
    minimum = min(compartment)
    seatPassengers(compartment, 50)
    y4.append((compartment[-1] - minimum) * 10)
    print(compartment)

plt.bar(new_x, y3, color='blue', label='without')
plt.bar(new_x, y4, color='purple', label='with')
plt.plot()

plt.xlabel("Number of station")
plt.ylabel("Time it takes - seconds")
plt.title("without the project")
plt.legend()
plt.show()

# show the data as a dataframe
# initialize list of lists
data1 = []
data2 = []



# Create the pandas DataFrame with column name is provided explicitly
df = pd.DataFrame(data1)
df['Number of people'] = x
df['seconds - with'] = y1
df['seconds - without'] = y2

df2 = pd.DataFrame(data2)
df2['Number of stations'] = new_x
df2['seconds - without'] = y3
df2['seconds - with'] = y4

# create a Pandas Excel writer object using XlsxWriter as the engine
#writer = pd.ExcelWriter('demo.xlsx', engine='xlsxwriter', mode='w')

# write data to the excel sheet
# df.to_excel(writer, sheet_name='Sheet1', index=False)

with pd.ExcelWriter('demo.xlsx', engine="xlsxwriter", mode='w') as writer:
    df.to_excel(writer, sheet_name='Sheet1')
    df2.to_excel(writer, sheet_name='Sheet2')

# close file
writer.close()

# print dataframe.
print(df)
print(df2)
