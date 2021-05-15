import json
from classes import Task

from greedy_schedule import greedy_schedule

'''
We expect the task dict to be something like
task_dict = {
    "task1": {
        "name": "rentadora",
        "type": "hygiene",
        "span": 110 (minutes)
        "start_time": "null" (minuts del dia, les 08:00 son 480)
    },
    "task2" : ...
}
'''


def dict_to_task_list(task_dict):
    events, todos = [], []
    for task in task_dict:
        if task["start_time"] == 'null':
            events.append(
                Task(name=task['name'], span=task['span'], type=task['type'])
            )
        else:
            todos.append(
                Task(name=task['name'], span=task['span'], type=task['type'], start=task["start_time"])
            )
    return todos, event

def task_list_to_dict(tasks):
    count = 0
    task_dict = {}
    for task in solution:
        task_dict{"task"+str(count)} = {
            "name": task.name,
            "type": task.type,
            "span": task.span,
            "start_time": task.start
        }
        count += 1
    return task_dict


def schedule(data):
    if not isinstance(data, str):
        raise Exception('Data to schedule is not a string')

    # from json string to dictionary
    task_dict = json.loads()

    # from task_dict to lists of tasks
    todos, event = dict_to_task_list(task_dict)

    solution = greedy_schedule(todos, event)

    task_dict_sol = task_list_to_dict(solution)

    return json.dumps(task_dict_sol)
