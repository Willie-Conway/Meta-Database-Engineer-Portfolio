import random
from faker import Faker

fake = Faker()

# Constants
NUM_CUSTOMERS = 10000
NUM_STAFF = 100
NUM_MENUS = 150
NUM_BOOKINGS = 100
NUM_ORDERS = 50000
CUSTOMER_EMAIL_DOMAINS = ['gmail.com', 'yahoo.com', 'outlook.com']
STAFF_ROLES = ['Head Manager', 'Assistant Manager', 'Head Chef', 'Assistant Chef', 'Server', 'Bartender']
CUISINES = {
    'Italian': ['Pasta', 'Pizza', 'Salad', 'Dessert'],
    'Turkish': ['Kebab', 'Flatbread', 'Pastry', 'Soup'],
    'Greek': ['Casserole', 'Salad', 'Dessert', 'Appetizer']
}

# Function to generate Customers
def generate_customers():
    customers = []
    for i in range(NUM_CUSTOMERS):
        customer_id = f'C{i + 1:03}'
        first_name = fake.first_name()
        last_name = fake.last_name()
        email = f"{first_name.lower()}.{last_name.lower()}@{random.choice(CUSTOMER_EMAIL_DOMAINS)}"
        phone_number = f"({fake.random_int(min=100, max=999)})-{fake.random_int(min=100, max=999)}-{fake.random_int(min=1000, max=9999)}"
        address = fake.address().replace('\n', ', ')
        city = fake.city()
        state = fake.state_abbr()
        zipcode = fake.zipcode()

        customers.append((customer_id, first_name, last_name, email, phone_number, address, city, state, zipcode))
    return customers

# Function to generate Staff
def generate_staff():
    staff = []
    salaries = {
        'Head Manager': random.randint(80000, 120000),
        'Assistant Manager': random.randint(60000, 80000),
        'Head Chef': random.randint(50000, 70000),
        'Assistant Chef': random.randint(40000, 60000),
        'Server': random.randint(30000, 50000),
        'Bartender': random.randint(30000, 50000)
    }

    for i in range(NUM_STAFF):
        role = random.choice(STAFF_ROLES)
        staff_id = f'S{i + 1:03}'
        first_name = fake.first_name()
        last_name = fake.last_name()
        salary = salaries[role]  # Get salary from the dictionary
        phone_number = f"({fake.random_int(min=100, max=999)})-{fake.random_int(min=100, max=999)}-{fake.random_int(min=1000, max=9999)}"
        email = f"{first_name.lower()}.{last_name.lower()}@littlelemon.com"
        
        staff.append((staff_id, first_name, last_name, role, salary, phone_number, email))
    return staff

# Predefined menu items and descriptions
MENU_ITEMS = [
    ('Spaghetti', 'Traditional spaghetti with marinara sauce.'),
    ('Lahmacun', 'Turkish flatbread topped with minced meat.'),
    ('Moussaka', 'Layered dish with eggplant, minced meat, and béchamel.'),
    ('Pizza Margherita', 'Classic pizza with tomatoes, mozzarella, and basil.'),
    ('Doner Kebab', 'Grilled meat served in a pita with vegetables.'),
    ('Greek Salad', 'Salad with cucumbers, tomatoes, olives, and feta cheese.'),
    ('Fettuccine Alfredo', 'Fettuccine pasta with a rich, creamy Alfredo sauce.'),
    ('Borek', 'Savory pastry filled with cheese or meat.'),
    ('Souvlaki', 'Grilled skewers of meat served with pita bread.'),
    ('Lasagna', 'Layered pasta with meat, cheese, and tomato sauce.'),
    ('Pide', 'Turkish flatbread with cheese or meat filling.'),
    ('Spanakopita', 'Phyllo pastry filled with spinach and feta cheese.'),
    ('Ravioli', 'Pasta squares filled with cheese or meat.'),
    ('Adana Kebab', 'Spicy minced meat grilled on skewers.'),
    ('Tzatziki', 'Yogurt dip with cucumbers and garlic.'),
    ('Risotto', 'Creamy rice cooked with broth and Parmesan.'),
    ('Baklava', 'Sweet pastry made with layers of filo and nuts.'),
    ('Gyro', 'Sliced meat served in pita with vegetables and tzatziki.'),
    ('Carbonara', 'Pasta with pancetta, egg, and Parmesan cheese.'),
    ('Imam Bayildi', 'Stuffed eggplant with tomatoes and onions.'),
    ('Dolmades', 'Stuffed grape leaves with rice and herbs.'),
    ('Tiramisu', 'Layered dessert with coffee-soaked ladyfingers and mascarpone.'),
    ('Menemen', 'Eggs scrambled with tomatoes and peppers.'),
    ('Galaktoboureko', 'Custard-filled pastry soaked in syrup.'),
    ('Minestrone', 'Hearty vegetable soup with beans and pasta.'),
    ('Shish Kebab', 'Grilled meat skewers with vegetables.'),
    ('Fasolada', 'Traditional Greek bean soup.'),
    ('Gnocchi', 'Small dumplings made from potatoes, served with sauce.'),
    ('Kofte', 'Grilled spiced meatballs served with bread or rice.'),
    ('Loukoumades', 'Fried dough balls drizzled with honey.'),
    ('Calzone', 'Folded pizza filled with cheese and toppings.'),
    ('Kuzu Tandir', 'Slow-cooked lamb served with rice.'),
    ('Pastitsio', 'Baked pasta with meat sauce and béchamel.'),
    ('Caprese Salad', 'Fresh tomatoes, mozzarella, and basil drizzled with olive oil.'),
    ('Iskender Kebab', 'Doner kebab served with yogurt and tomato sauce.')
]

# Function to generate Menus
def generate_menus():
    menus = []
    for i in range(NUM_MENUS):
        menu_item_id = f'M{i + 1:03}'
        # Randomly select a menu item and description
        menu_item_name, description = random.choice(MENU_ITEMS)

        # Initialize category and sub_category
        category = None
        sub_category = None
        
        # Assign category and subcategory based on the selected menu item
        if menu_item_name in ['Spaghetti', 'Fettuccine Alfredo', 'Lasagna', 'Pizza Margherita', 'Ravioli', 'Carbonara', 'Gnocchi']:
            category = 'Italian'
            sub_category = 'Pasta'
        elif menu_item_name in ['Lahmacun', 'Doner Kebab', 'Pide', 'Borek', 'Adana Kebab', 'Shish Kebab', 'Kofte']:
            category = 'Turkish'
            sub_category = 'Kebab' if 'Kebab' in menu_item_name else 'Flatbread' if 'Pide' in menu_item_name else 'Pastry'
        elif menu_item_name in ['Moussaka', 'Greek Salad', 'Dolmades', 'Tzatziki', 'Baklava', 'Souvlaki']:
            category = 'Greek'
            sub_category = 'Casserole' if menu_item_name == 'Moussaka' else 'Salad' if menu_item_name == 'Greek Salad' else 'Dessert' if menu_item_name in ['Baklava', 'Galaktoboureko'] else 'Appetizer'
        else:
            # Handle unexpected menu items
            category = 'Other'
            sub_category = 'Miscellaneous'

        price = round(random.uniform(10.00, 200.00), 2)  # Adjusted price range

        menus.append((menu_item_id, menu_item_name, category, sub_category, price, description))
    return menus

# Function to generate Bookings
def generate_bookings(customers):
    bookings = []
    for i in range(NUM_BOOKINGS):
        booking_id = f'B{i + 1:03}'
        customer_id = random.choice(customers)[0]
        booking_date = fake.date_between(start_date='today', end_date='+30d')
        table_number = fake.random_int(min=1, max=20)
        number_of_guests = fake.random_int(min=1, max=10)
        special_requests = random.choice(['Window seat', 'High chair needed', 'Birthday celebration', 'Anniversary', 'Allergy to nuts'])
        status = random.choice(['Confirmed', 'Pending', 'Cancelled'])
        
        bookings.append((booking_id, customer_id, booking_date, table_number, number_of_guests, special_requests, status))
    return bookings

# Function to generate Orders (improved)
def generate_orders(customers, menus, staff):
    orders = []
    for i in range(NUM_ORDERS):
        order_id = f'O{i + 1:03}'
        order_date = fake.date_between(start_date='today', end_date='+30d')
        customer = random.choice(customers)
        customer_id = customer[0]
        customer_name = f"{customer[1]} {customer[2]}"
        table_number = fake.random_int(min=1, max=20)
        server_id = random.choice(staff)[0]
        
        # Create order items
        for j in range(fake.random_int(min=1, max=5)):  # Each order can have multiple items
            menu_item = random.choice(menus)
            menu_item_id = menu_item[0]
            menu_item_name = menu_item[1]
            quantity = fake.random_int(min=1, max=5)
            price = menu_item[4]
            discount = random.choice([0, round(price * 0.1, 2), round(price * 0.2, 2)])  # Random discounts
            profit = round(price - discount, 2)

            orders.append((order_id, order_date, customer_id, customer_name, table_number, server_id, menu_item_id, menu_item_name, quantity, price, discount, profit))
    return orders

# Function to write SQL INSERT statements to a file
def write_to_sql_file(filename, table_name, data):
    with open(filename, 'w') as f:
        for row in data:
            placeholders = ', '.join(['%s'] * len(row))
            sql = f"INSERT INTO {table_name} VALUES ({placeholders});\n"
            f.write(sql % row)

# Generate data
customers_data = generate_customers()
staff_data = generate_staff()
menus_data = generate_menus()
bookings_data = generate_bookings(customers_data)
orders_data = generate_orders(customers_data, menus_data, staff_data)

# Write to SQL files
write_to_sql_file('customers.sql', 'Customers', customers_data)
write_to_sql_file('staff.sql', 'Staff', staff_data)
write_to_sql_file('menus.sql', 'Menus', menus_data)
write_to_sql_file('bookings.sql', 'Bookings', bookings_data)
write_to_sql_file('orders.sql', 'Orders', orders_data)

print("SQL files generated successfully.")
