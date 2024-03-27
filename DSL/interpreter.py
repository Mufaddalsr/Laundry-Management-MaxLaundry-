class LaundryRoom:
    def __init__(self, capacity, machines):
        self.capacity = capacity
        self.machines = machines

class LaundryItem:
    def __init__(self, item_type, weight):
        self.item_type = item_type
        self.weight = weight

class LaundryTask:
    def __init__(self, items, water, detergent, duration):
        self.items = items
        self.water = water
        self.detergent = detergent
        self.duration = duration

class LaundryOperation:
    def __init__(self, operations):
        self.operations = operations

class LaundrySchedule:
    def __init__(self, room, operations):
        self.room = room
        self.operations = operations

# Define functions to parse DSL commands

def room_command(tokens):
    room = LaundryRoom(int(tokens[1]), int(tokens[3]))
    return room

def item_command(tokens):
    item = LaundryItem(tokens[1], float(tokens[4]))
    return item

def task_command(tokens):
    items = tokens[1].split(",")
    task = LaundryTask(items, float(tokens[3]), float(tokens[5]), int(tokens[7]))
    return task

def operation_command(tokens):
    operations = tokens[1].split(",")
    operation = LaundryOperation(operations)
    return operation

def schedule_command(tokens):
    operations = tokens[2].split(",")
    schedule = LaundrySchedule(tokens[1], operations)
    return schedule

# Define the DSL command mappings
command_mapping = {
    'room': room_command,
    'item': item_command,
    'task': task_command,
    'operation': operation_command,
    'schedule': schedule_command
}

# Read and parse the DSL file
def parse_dsl_file(file_path):
    with open(file_path, 'r') as f:
        for line in f:
            tokens = line.strip().split()
            if tokens:
                command = tokens[0]
                if command in command_mapping:
                    command_function = command_mapping[command]
                    result = command_function(tokens)
                    print(result)

# Example usage
if __name__ == "__main__":
    parse_dsl_file('laundry.dsl')
