#def parameters

class Task:
    def __init__(self, name, span, start = "nan", type="nan", fixed=False):
        self.name = name
        self.span = span
        self.start = start
        self.type = type
        self.fixed = fixed
