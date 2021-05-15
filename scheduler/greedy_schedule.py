#rest = vector de restriccions,
#tasks= vector de size de to-do's
#start, end = start/end of day
def greedy_schedule(tasks, rest, start=8*60, end=22*60):
    tasks.sort(reverse = True)
    rest.extend([(0,start), (end,24*60)])
    rest.sort()

    for t in tasks:
        for i in range(len(rest)-1):
            if rest[i][1] + t <= rest[i+1][0]:
                rest.insert(i+1, (rest[i][1], rest[i][1] + t))
                break
