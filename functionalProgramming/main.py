def create_laundry_manager():
    laundry_items = []

    def add_item(item):
        laundry_items.append(item)
        print(f"Added item '{item}' to laundry")

    def remove_item(item):
        if item in laundry_items:
            laundry_items.remove(item)
            print(f"Removed item '{item}' from laundry")
        else:
            print(f"Item '{item}' not found in laundry")

    def list_items():
        print("Laundry items:")
        for item in laundry_items:
            print(item)

    def process_laundry():
        print("Processing laundry...")
        # Logic for processing laundry items


    # use of higher-order
    def create_order(item, process_func):
        add_item(item)
        process_func()

    return  add_item, remove_item, list_items,process_laundry,create_order

def main():
    add_item, remove_item, list_items,process_laundry,create_order = create_laundry_manager()

    # Example usage
    add_item("Shirt")
    add_item("Pants")
    add_item("Socks")
    list_items()
    process_laundry()

    # Example order creation
    def express_process():
        print("Express processing...")

    create_order("Jacket", express_process)
    list_items()
    process_laundry()

if __name__ == "__main__":
    main()
