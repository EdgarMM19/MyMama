import numpy as np
from classes import *
#event = vector de eventriccions,
#to_do= vector de to-do's
#start, end = start/end of day
def greedy_schedule(to_do, event, start=8*60, end=22*60):
    to_do.sort(reverse = True, key = lambda x: x.span)
    event.extend([Task("dormir",start,0), Task("dormir", 0, end)])
    event.sort(key = lambda x: x.start)

    for t in to_do:
        for i in range(len(event)-1):
            s = event[i].start + event[i].span
            f = event[i+1].start
            if s + t.span <= f:
                event.insert(i+1, Task(t.name, t.span, s))
                #schedule[t.name] = (s, s + t.span)
                break
    return event


# test
if __name__ == '__main__':
    to_do = [Task("correr",span = 30), Task("deures",span = 60), Task("churri",span = 120), Task("compra",span = 45), Task("cuinar",span = 60)]
    event = [Task("clase1",2*60,9*60), Task("clase2",2*60, 12*60), Task("clase3",1*60,16*60)]
    print(greedy_schedule(to_do, event))
