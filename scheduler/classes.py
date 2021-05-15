#def parameters
class To_do:
    def __init__(self, name, size, type = "undef"):
        self.name = name
        self.size = size
        self.type = type

class Event:
    def __init__(self, name, time_start, time_end, type="undef", fixed=False):
        self.name = name
        self.time_start = time_start
        self.time_end = time_end
        self.type = type
        self.fixed = fixed
