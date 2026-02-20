Dataset:
Source file: Sales Raw Data.csv


Dataset Summary:
Total Rows: 3,900
Total Columns: 18
Missing Values: 37 null values in the Review Rating column


Key Features:
Demographics
Age
Gender
Location
Subscription Status
Purchase Details
Item Purchased
Category
Purchase Amount
Season
Size
Color
Shopping Behavior
Discount Applied
Promo Code Used
Previous Purchases
Frequency of Purchases
Review Rating
Shipping Type


Tools Used:
Python (Pandas, Matplotlib/Seaborn)
PostgreSQL
Power BI
Gamma (Presentation)
Jupyter Notebook / VS Code


Project Steps:

1. Data Loading and Exploration (Python)
Loaded dataset using pandas
Used df.info() and df.describe() for structural and statistical understanding
Identified missing values and inconsistencies

2. Data Cleaning and Feature Engineering
Imputed missing Review Rating values using median rating by product category
Standardized column names to snake_case
Created age_group column by binning customer ages
Created purchase_frequency_days feature
Dropped redundant promo_code_used column after validation
Loaded cleaned dataset into PostgreSQL for SQL analysis
SQL Analysis (PostgreSQL)
Business questions were answered using structured SQL queries.


Visualizations Included:
Revenue by Category
Sales by Category
Revenue by Age Group
Sales by Age Group
Subscription Status Distribution
Shipping Type Analysis
The dashboard enables filtering by category, gender, shipping type, and subscription status for dynamic business analysis.


Key Results:
Revenue is heavily skewed toward male customers.
Clothing leads overall category performance.
Express shipping customers spend slightly more per transaction.
Majority of customers are loyal, indicating strong repeat behavior.
Non-subscribers drive most revenue volume.
Young Adults are the highest revenue-generating age group.
Business Recommendations
Strengthen subscription programs with clear value propositions.
Develop loyalty programs to retain high-value customers.
Optimize discount strategy to balance revenue growth and margins.
Focus targeted marketing on high-revenue age groups.
Highlight top-rated and best-selling products in campaigns.


How to Run This Project:
Clone the repository
git clone https://github.com/your-username/customer-shopping-analysis.git
Install required libraries
pip install pandas matplotlib seaborn psycopg2
Run the Python notebook/script for cleaning and EDA.
Create a PostgreSQL database and import the cleaned dataset.
Execute SQL queries provided in the project.
Open the Power BI .pbix file and refresh the data connection.


Project Structure:
Customer-Shopping-Behavior-Analysis/
│
├── Sales Raw Data.csv
├── python_notebook.ipynb
├── sql_queries.sql
├── Customer Shopping Behavior Analysis.pdf
├── Customer-Shopping-Behavior-Analysis.pptx
├── powerbi_dashboard.pbix
└── README.md


Author:
Tarun Sharma
Data Analyst
