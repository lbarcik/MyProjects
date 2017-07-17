drillList = [67,45,2,13,1,998]

def drillSort(drillList):
    length = len(drillList) - 1
    sorted = False

    while not sorted:
        sorted = True
        for i in range(length):
            if drillList[i]>drillList[i+1]:
                sorted = False
                drillList[i], drillList[i+1] = drillList[i+1], drillList[i]

drillSort(drillList)
print drillList

print ("\n")

drillList2 = [89,23,33,45,10,12,45,45,45]
def drillSort(drillList2):
    length = len(drillList2) - 1
    sorted = False

    while not sorted:
        sorted = True
        for i in range(length):
            if drillList2[i]>drillList2[i+1]:
                sorted = False
                drillList2[i], drillList2[i+1] = drillList2[i+1], drillList2[i]

drillSort(drillList2)
print drillList2


