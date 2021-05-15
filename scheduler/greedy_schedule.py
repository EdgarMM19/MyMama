import numpy as np
from classes import *
#rest = vector de restriccions,
#tasks= vector de to-do's
#start, end = start/end of day
def greedy_schedule(tasks, rest, start=8*60, end=22*60):
    tasks.sort(reverse = True, key = lambda x: x.size)
    rest.extend([Event("dormir",0,start), Event("dormir", end,24*60)])
    rest.sort(key = lambda x: x.time_start)
    schedule = dict()

    for t in tasks:
        for i in range(len(rest)-1):
            if rest[i].time_end + t.size <= rest[i+1].time_start:
                rest.insert(i+1, Event(t.name, rest[i].time_end, rest[i].time_end + t.size))
                schedule[t.name] = (rest[i].time_end, rest[i].time_end + t.size)
                #schedule[t.name] = (rest[i].time_end/60, (rest[i].time_end + t.size)/60)
                break

    return(schedule)


tasks = [Task("correr",span = 30), Task("deures",span = 60), Task("churri",span = 120), Task("compra",span = 45), Task("cuinar",span = 60)]
rest = [Task("clase",2*60,9*60), Task("clase",2*60, 12*60), Task("clase",1*60,16*60)]
#rest = [(x[0]*60,x[1]*60) for x in clases]

result = greedy_schedule(tasks, rest)
print(result)
