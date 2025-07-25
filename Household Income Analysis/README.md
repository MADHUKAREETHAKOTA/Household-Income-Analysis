# 🏠Household Income Analysis Using SQL & Excel

**Analyzing Household Income Trends Across Demographics**

## 📊 Project Overview
This project analyzes household income patterns across key demographic factors such as age, education, employment status, gender, and location. Using SQL for data exploration and Microsoft Excel for visualization, it uncovers insights on income distribution, pay disparities, and socioeconomic trends. The goal is to transform raw data into actionable insights that can inform personal finance strategies, workforce policies, and business decision-making.

## ⚙️ Tools Used
- **SQL**: For data cleaning, anomaly detection, and querying
- **Microsoft Excel**: For calculated columns, KPI generation, pivot charts, and dashboard creation

## 🧹 Data Preparation

- Flagged anomalies (e.g., illogical age-marital combinations)
- Created calculated columns:
  - `Per_Capita_Income = Income / Household_Size`
  - `Age_Group` (e.g., 18–29, 30–39, etc.)
  - `Experience_Group` (e.g., 0–5 yrs, 6–10 yrs, etc.)
- Filtered `Is_Anomaly = "No"` for clean analysis
- Used cleaned data for all KPIs and visual outputs

 
  
## 📌 Key Performance Indicators (KPIs)
| KPI | Description |
|-----|-------------|
| **Average Income by Homeownership** | Own: ₹7.6M, Rent: ₹0.9M |
| **Average Income by Education** | Highest among Master's holders |
| **Average Per Capita Income** | Decreases with larger household size |
| **Gender Pay Gap** | Males earn ₹63K more than females on average |
| **Top Earning Age Group** | 50–59 years |
| **Top Occupation by Income** | Education sector |
| **Location Impact** | Rural areas have highest income |
| **Experience vs Income** | 6–10 years of experience yields highest income |
| **Employment Status Impact** | Part-time workers earn more than full-time and self-employed |


## 📈 Business Insights
- **Males earn notably more than females**, indicating a measurable gender pay gap.
- **People with 6–10 years of experience earn the most**, suggesting this is the most lucrative period in a career.
- **Part-time employees have the highest average income**, hinting at possible freelancing or specialized work.
- **Rural residents show higher average income** than urban and suburban, which may indicate concentrated wealth or less cost-of-living inflation.
- **Education sector professionals earn the most**, followed by technology and finance sectors.

## ✅ Conclusion
This analysis uncovers significant income patterns influenced by experience, gender, employment type, location, and industry. It offers valuable direction for both workforce strategists and policy planners in addressing pay disparity, supporting mid-career professionals, and understanding regional economic behavior. These insights support data-driven decisions aimed at promoting income equity and better financial planning.

