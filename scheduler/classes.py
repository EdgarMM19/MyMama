#def parameters

class Type:
    def __init__()


class To_do:
    def __init__(self, name, size, type):
        self.name = name
        self.size = size
        self.type = type

class Event:
    def __init__(name, time_start, time_end, type, fixed=False):
        self.name = name
        self.time_start = time_start
        self.time_end = time_end
        self.type = type
        self.fixed = fixed
