# Big Data and Analysis with Python

# Characteristics of Big Data
print("Characteristics of Big Data:")
print("Volume: The size of data which may require specialized storage solutions.")
print("Variability: The inconsistency present in data, making manual intervention challenging.")
print("Velocity: The speed of data processing, necessary for timely updates and retrieval.")
print()

# Big Data Pipeline Steps
print("Big Data Pipeline Steps:")
print("- Data Collection")
print("- Data Storage (Data Lakes and Data Warehouses)")
print("- Data Processing")
print("- Data Analysis")
print("- Data Visualization and Reporting")
print()

# Reasons for Python's Popularity in Big Data
print("Reasons for Python's Popularity in Big Data:")
print("Ease of Use: Python allows setting up and running infrastructure with minimal code.")
print("Open Source: Python's open-source libraries provide cost-effective solutions.")
print("Active Community: A supportive community that aids in problem-solving and feature development.")
print("Rich Libraries: Numerous libraries support Big Data tasks and integrate with other languages.")
print("High Processing Speed: Python's efficiency and object-oriented methodology facilitate quick processing.")
print("Portability and Scalability: Easily extendable across platforms with robust libraries.")
print()

# Common Python Libraries for Big Data
print("Common Python Libraries for Big Data:")
print("- NumPy: For numerical computations.")
print("- Pandas: For data manipulation and analysis.")
print("- Scikit-learn: For machine learning.")
print("- SciPy: For scientific computing.")
print()

# Example: Using Pandas to Load and Manipulate Data
import pandas as pd

# Creating a DataFrame
data = {
    'Animals': ['Dog', 'Cat', 'Lion', 'Cow', 'Elephant'],
    'Sounds': ['Barks', 'Meow', 'Roars', 'Moo', 'Trumpet']
}
df = pd.DataFrame(data)
print("DataFrame:")
print(df)

# Filtering DataFrame for Animals starting with 'C'
filtered_df = df[df['Animals'].str.startswith('C')]
print("Filtered DataFrame (Animals starting with 'C'):")
print(filtered_df)
print()

# Specific Libraries for Big Data
print("Specific Libraries for Big Data:")
print("- Amazon RedShift: A data warehousing service by Amazon.")
print("- Amazon S3: A storage service for data.")
print("- BigQuery: A cloud service library developed by Google.")
print("- Kafka: A publish-subscribe messaging system for logs.")
print("- Pydoop: Interface for handling Hadoop with Python.")
