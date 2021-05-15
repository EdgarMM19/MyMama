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


tasks = [To_do("correr",30), To_do("deures",60), To_do("churri",120), To_do("compra",45), To_do("cuinar",60)]
rest = [Event("clase",9*60,11*60), Event("clase",12*60, 14*60), Event("clase",16*60,17*60)]
#rest = [(x[0]*60,x[1]*60) for x in clases]

result = greedy_schedule(tasks, rest)
print(result)
