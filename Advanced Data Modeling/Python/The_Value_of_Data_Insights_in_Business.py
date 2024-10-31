# Import necessary libraries
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import classification_report
from sklearn.ensemble import IsolationForest
from sklearn.cluster import KMeans
from mlxtend.frequent_patterns import apriori, association_rules

# Sample Data Creation
def create_sample_data():
    """Create a sample dataset for analysis."""
    data = {
        'Credit_Score': [700, 650, 600, 750, 800, 300, 720, 580, 680, 740],
        'Income': [50000, 60000, 55000, 80000, 75000, 40000, 62000, 30000, 58000, 90000],
        'Loan_Amount': [20000, 15000, 10000, 30000, 25000, 5000, 22000, 8000, 18000, 28000],
        'Risk': ['Low', 'Medium', 'High', 'Low', 'Low', 'High', 'Low', 'High', 'Medium', 'Low']
    }
    df = pd.DataFrame(data)
    return df

# Classification Technique
def classify_loans(df):
    """Classify loan applications using decision tree."""
    X = df[['Credit_Score', 'Income', 'Loan_Amount']]
    y = df['Risk']
    
    # Split the dataset into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    
    # Initialize and fit the Decision Tree Classifier
    model = DecisionTreeClassifier()
    model.fit(X_train, y_train)
    
    # Predict and evaluate the model
    predictions = model.predict(X_test)
    print("Classification Report:\n", classification_report(y_test, predictions))

# Association Rule Technique
def find_association_rules():
    """Find association rules using a sample transaction dataset."""
    transaction_data = {
        'Milk': [1, 0, 1, 0, 1],
        'Bread': [1, 1, 0, 0, 1],
        'Butter': [0, 1, 1, 0, 0],
        'Eggs': [1, 1, 1, 0, 1]
    }
    transactions_df = pd.DataFrame(transaction_data)

    # Apply the apriori algorithm
    frequent_itemsets = apriori(transactions_df, min_support=0.4, use_colnames=True)
    
    # Generate association rules
    rules = association_rules(frequent_itemsets, metric="lift", min_threshold=1)
    print("Association Rules:\n", rules)

# Outlier Detection
def detect_outliers(df):
    """Detect outliers using Isolation Forest."""
    model = IsolationForest(contamination=0.2)  # Set contamination rate
    df['Outlier'] = model.fit_predict(df[['Credit_Score', 'Income', 'Loan_Amount']])
    
    # Marking outliers
    outliers = df[df['Outlier'] == -1]
    print("Detected Outliers:\n", outliers)

# Clustering Analysis
def cluster_customers(df):
    """Cluster customers using KMeans."""
    X = df[['Credit_Score', 'Income']]
    
    # Applying KMeans clustering
    kmeans = KMeans(n_clusters=3, random_state=42)
    df['Cluster'] = kmeans.fit_predict(X)
    
    print("Customer Clusters:\n", df[['Credit_Score', 'Income', 'Cluster']])

# Main function to execute the analysis
def main():
    # Create a sample dataset
    data = create_sample_data()
    
    # Classify loan applications
    print("Loan Classification:")
    classify_loans(data)
    
    # Find association rules
    print("\nFinding Association Rules:")
    find_association_rules()
    
    # Detect outliers
    print("\nDetecting Outliers:")
    detect_outliers(data)
    
    # Perform clustering
    print("\nCustomer Clustering:")
    cluster_customers(data)

if __name__ == '__main__':
    main()
