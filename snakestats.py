def complement(arr, input):
    uSet = []
    
    for set in arr:
        for vals in set:
            uSet.append(vals)
    uSet = list(dict.fromkeys(uSet))
    temp = uSet
    for copy in input:
        for output in uSet:
            if(copy == output):
                temp.remove(copy)
        
    return temp

def union(arr, input):
    unionSet = []
    temp = arr
    temp.append(input)
    for items in arr:
        if(isinstance(items, int) == True):
            unionSet.append(items)
        else:
            for vals in items:
                unionSet.append(vals)
    unionSet = list(dict.fromkeys(unionSet))
    
    return unionSet

def intersect(arr,input):
    temp = []
    for items in arr:
        if(isinstance(items, int) == True):
            for copies in input:
                if(items == copies):
                    temp.append(copies)
        else:
            for vals in items:
                for copies in input:
                    if(vals == copies):
                        temp.append(copies)
    temp = list(dict.fromkeys(temp))
    
    return temp