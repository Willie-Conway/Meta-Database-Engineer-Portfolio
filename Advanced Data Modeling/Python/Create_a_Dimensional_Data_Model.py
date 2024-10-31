from sqlalchemy import create_engine, Column, Integer, String, Numeric, ForeignKey, select
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, sessionmaker

# Create a base class for declarative models
Base = declarative_base()

# Define the Location Dimension
class LocationDim(Base):
    __tablename__ = 'location_dim'
    
    location_id = Column(Integer, primary_key=True)
    region = Column(String(50))
    country = Column(String(50))
    city = Column(String(50))

# Define the Time Dimension
class TimeDim(Base):
    __tablename__ = 'time_dim'
    
    time_id = Column(Integer, primary_key=True)
    year = Column(Integer)
    quarter = Column(Integer)
    month = Column(Integer)
    day = Column(Integer)

# Define the Category Dimension for Snowflake Schema
class CategoryDim(Base):
    __tablename__ = 'category_dim'
    
    category_id = Column(Integer, primary_key=True)
    category_name = Column(String(50))

# Define the Subcategory Dimension for Snowflake Schema
class SubcategoryDim(Base):
    __tablename__ = 'subcategory_dim'
    
    subcategory_id = Column(Integer, primary_key=True)
    subcategory_name = Column(String(50))
    category_id = Column(Integer, ForeignKey('category_dim.category_id'))
    
    category = relationship("CategoryDim")

# Define the Product Dimension
class ProductDim(Base):
    __tablename__ = 'product_dim'
    
    product_id = Column(Integer, primary_key=True)
    product_name = Column(String(100))
    buy_price = Column(Numeric(10, 2))
    sale_price = Column(Numeric(10, 2))
    subcategory_id = Column(Integer, ForeignKey('subcategory_dim.subcategory_id'))
    
    subcategory = relationship("SubcategoryDim")

# Define the Customer Dimension
class CustomerDim(Base):
    __tablename__ = 'customer_dim'
    
    customer_id = Column(Integer, primary_key=True)
    customer_name = Column(String(100))
    customer_email = Column(String(100))
    customer_phone = Column(String(15))

# Define the Sales Fact Table
class SalesFact(Base):
    __tablename__ = 'sales_fact'
    
    sales_id = Column(Integer, primary_key=True)
    location_id = Column(Integer, ForeignKey('location_dim.location_id'))
    time_id = Column(Integer, ForeignKey('time_dim.time_id'))
    product_id = Column(Integer, ForeignKey('product_dim.product_id'))
    customer_id = Column(Integer, ForeignKey('customer_dim.customer_id'))
    quantity_sold = Column(Integer)
    shipping_cost = Column(Numeric(10, 2))
    total_sale = Column(Numeric(10, 2))

    location = relationship("LocationDim")
    time = relationship("TimeDim")
    product = relationship("ProductDim")
    customer = relationship("CustomerDim")

# Database connection (update with your database URL)
DATABASE_URL = 'sqlite:///global_super_store.db'  # Example using SQLite
engine = create_engine(DATABASE_URL)

# Create tables
Base.metadata.create_all(engine)

# Create a session
Session = sessionmaker(bind=engine)
session = Session()

# Step 1: Inserting example data into dimensions and facts
# Insert Location Data
location1 = LocationDim(region='Europe', country='France', city='Paris')
location2 = LocationDim(region='Europe', country='Germany', city='Berlin')
session.add(location1)
session.add(location2)

# Insert Time Data
time1 = TimeDim(year=2022, quarter=1, month=1, day=1)
time2 = TimeDim(year=2022, quarter=1, month=2, day=1)
session.add(time1)
session.add(time2)

# Insert Category Data
category1 = CategoryDim(category_name='Furniture')
session.add(category1)

# Insert Subcategory Data
subcategory1 = SubcategoryDim(subcategory_name='Chairs', category_id=category1.category_id)
session.add(subcategory1)

# Insert Product Data
product1 = ProductDim(product_name='Office Chair', buy_price=50.00, sale_price=75.00, subcategory_id=subcategory1.subcategory_id)
session.add(product1)

# Insert Customer Data
customer1 = CustomerDim(customer_name='John Doe', customer_email='john@example.com', customer_phone='1234567890')
session.add(customer1)

# Insert Sales Data
sales1 = SalesFact(location_id=location1.location_id, time_id=time1.time_id, product_id=product1.product_id, customer_id=customer1.customer_id, quantity_sold=3, shipping_cost=10.00, total_sale=225.00)
session.add(sales1)

# Commit the session to save the data
session.commit()

# Step 2: Querying the Sales Fact Table
sales_data = session.execute(select(SalesFact)).fetchall()
for sale in sales_data:
    print(f"Sales ID: {sale.sales_id}, Location: {sale.location_id}, Time: {sale.time_id}, Product: {sale.product_id}, Customer: {sale.customer_id}, Quantity Sold: {sale.quantity_sold}, Total Sale: {sale.total_sale}")

# Close the session
session.close()

print("Dimensional data model created and populated successfully!")
