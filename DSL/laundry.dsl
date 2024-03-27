# Define a laundry room
room LaundryRoom:
  capacity 50
  machines 5

# Define laundry items
item Shirt:
  type clothing
  weight 0.2

item Pants:
  type clothing
  weight 0.5

item Towel:
  type household
  weight 0.8

# Define laundry tasks
task WashShirt:
  items Shirt
  water 2 liters
  detergent 50 ml
  duration 30 minutes

task DryShirt:
  items Shirt
  heat 60°C
  duration 20 minutes

task WashPants:
  items Pants
  water 3 liters
  detergent 70 ml
  duration 40 minutes

# Define laundry operations
operation WashAndDryShirt:
  execute WashShirt
  execute DryShirt

# Schedule laundry operations
schedule Monday:
  room LaundryRoom
  operations WashAndDryShirt
