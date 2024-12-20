# Forecasting Houston Dynamo FC Game Attendance
Using Supply Chain Analytics to Forecast Attendance for Houston Dynamo FC

## Overview

This project focuses on predicting game attendance for **Houston Dynamo FC** by analyzing historical game data and various game-specific and contextual factors. We compare different forecasting models like **Naive Forecasting**, **Exponential Smoothing (ETS)**, **ARIMA**, and **ARIMAX**, with insights emphasizing the importance of data expansion for more accurate predictions. It aims to enhance operational planning, marketing strategies, and fan engagement by forecasting attendance based on historical patterns and key predictors such as competition type, day of the week, opponent, and weather.

![image](https://github.com/user-attachments/assets/ab01cf8e-8bbb-4ee0-b99d-c2ed3efb9034)


## Data Collection and Processing

- **Data Collection**: Data was collected from the Houston Dynamo FC website using **Selenium** and **BeautifulSoup** for web scraping, extracting game information such as dates, opponents, and attendance. Weather data was gathered using APIs to enrich the dataset with temperature and rain conditions.
- **Data Processing**: The data was cleaned, imputed for missing values, and transformed into a time-series format for analysis.

  

## Workflow : 
![image](https://github.com/user-attachments/assets/efbe09cb-b258-488a-b345-7d5727c41d51)


## Exploratory Data Analysis (EDA)

- **Attendance Trends**: Variations in attendance were observed based on the day of the week, competition type, and weather. Attendance was higher on weekends and varied depending on the opponent and match significance.
- **Key Insights**:
  - **Weekend Effect**: Attendance was higher on Saturdays and Sundays.
  - **Opponent Impact**: Higher attendance against teams like Cincinnati and lower against teams like San Antonio.



## Forecasting Models

### Naive Forecasting Model
- **Model**: Predicts future attendance based on the previous month’s attendance.
- **Performance**: Achieved the lowest RMSE of **1,893**, demonstrating that recent attendance trends were the strongest predictor.

### Multiple Linear Regression (MLR)
- **Model**: Used to identify important predictors (e.g., day of the week, weather).
- **Performance**: RMSE of **5,530**, showing that **opponent** was the most significant predictor.
  
### Exponential Smoothing (ETS)
- **Models Tested**: 14 configurations, including auto, ANM, and AAM.
- **Performance**: Best models achieved RMSE of **2,653**, but struggled due to data limitations like missing values.


### ARIMA and ARIMAX
- **ARIMA Model**: Trained using historical data; forecasted 2024 attendance.
- **ARIMAX Model**: Included external predictors (e.g., opponent, weather) but showed overfitting with a high RMSE of **9,200**.

## Results and Comparison

- **Naive Model**: Outperformed all other models with an RMSE of **1,893**.
- **ETS Models**: Underperformed with RMSE of **2,653**, mainly due to data gaps.
- **ARIMA and ARIMAX**: Struggled with overfitting and limited precision, RMSE of **2,208** (ARIMA) and **3,120** (ARIMAX).
- The **Naive Model** proved most effective for short-term attendance forecasting.

![image](https://github.com/user-attachments/assets/5e439894-9886-41bc-8b15-84861427b1a6)


## Insights

- **Naive Forecasting** was the best performer, effectively capturing recent trends.
- **Complex models** (ETS, ARIMA, ARIMAX) underperformed due to limited data and the absence of strong seasonal patterns.
- Expanding the dataset to include **promotions, ticket prices**, and **fan engagement** could improve forecasting accuracy.

## Conclusion

The **Naive Forecasting** model, with an RMSE of **1,893**, was the most accurate despite the simplicity of the dataset. This highlights that with limited data, simpler models can sometimes be more effective. To improve future predictions, expanding data to include more factors such as promotions and fan engagement is recommended.

This project was part of the Supply Chain Analytics course by **[Prof. Genaro Gutierrez](https://www.mccombs.utexas.edu/faculty-and-research/faculty-directory/profile/?username=gutzgj1)** at **[McCombs School of Business](https://www.mccombs.utexas.edu/)** , University of Texas at Austin.
