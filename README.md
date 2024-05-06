# auto-insurance-customer-lifetime-value-prediction
This repository contains the code, data, and documentation for a project aimed at predicting the Customer Lifetime Value (CLV) of customers in the auto insurance industry. CLV is a crucial metric that helps insurance companies understand the long-term value of each customer and make informed decisions regarding customer acquisition, retention, and resource allocation.
Project Overview
The primary goal of this project is to develop a predictive model that can accurately estimate the CLV of auto insurance customers based on various factors, such as the number of policies, monthly premium, total claim amount, number of open complaints, and marital status. The project employs linear regression techniques and incorporates log transformations for continuous variables to capture potential non-linear relationships and enhance its predictive capabilities.
Dataset
The dataset used in this project is obtained from the UCI ML Repository and available on Kaggle. It contains customer information from five different American states, along with details regarding their vehicle insurance policies. The raw dataset is provided in the data/ directory.
Methodology
The project follows a structured methodology, which includes the following steps:

Exploratory Data Analysis (EDA): Performed using Python and Jupyter Notebooks (notebooks/eda.ipynb). This step involves data exploration, visualization, and feature engineering.
Model Building: A linear regression model is constructed using R (code/modeling.R). The model's assumptions, such as linearity, independence of errors, homoscedasticity, and multicollinearity, are thoroughly checked and addressed.
Model Evaluation: The performance of the regression model is evaluated using appropriate metrics, such as R-squared and adjusted R-squared. The statistical significance of the model and individual predictors is also assessed.
Interpretation and Insights: The model coefficients and their significance are interpreted to understand the impact of each predictor on CLV. Insights are derived to inform strategic decision-making processes within the auto insurance industry.

Repository Structure

data/: Directory containing the raw dataset used for analysis.
notebooks/: Jupyter Notebooks with the implementation of data exploration, preprocessing, and visualization steps.
code/: Directory containing the R code for model building and evaluation.
report/: A comprehensive report detailing the project methodology, results, and conclusions.
LICENSE: File containing the license information for the project.
README.md: This file, providing an overview of the project.
