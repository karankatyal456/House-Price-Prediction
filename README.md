# House-Price-Prediction
# Objective
Perform a predictive regression analysis on the provided
House_Price_Data in R-studio to arrive at the final model from where significant
variables can be summarized which play a vital role in determining the purchasing price
of the house. The objective here is to help customers optimize their purchase of houses.

# Steps 
1) Read the data-set in R studio (setting working directory)
2) Dimension and summary checking of the data for the understanding of data-set.
Conclude your observations in #Comments below.
3) Structure check and conversion of variables (if required).
4) Data visualizations (usage of loops to be considered to be more efficient): Univariate
analysis, Bivariate analysis, including correlation checking for good / bad predictors
from the variables.
5) Data pre-processing:
i) Checking the presence of missing values and imputation of missing values with
appropriate measures of CT.
ii) Checking for the presence of outliers in variables using boxplot.
7) Cross validation (splitting of data).
8) Model building and execution. Analyse the output and mention the significant
variables (post iterative elimination of variables) in #Comments below.
9) Predict and validate the final model in the test sample of your data.
10) Summarize the model validation test outcomes (R-square, adjusted r-square, MAPE
/ accuracy (or median accuracy), vif, ad-test, bp-test, dwt-test) in #Comments below.

# Variable Description
Taxi_dist The distance of the nearest taxi stand from the house (inmetres).

Market_dist The distance of the nearest market area from the house (inmetres).

Hospital_dist The distance of the nearest hospital from the house (in metres).

Carpet_area The area inside of the house. The one within house walls (insquare meters).

Builtup_area The entire built-up area of the house, including walls (in squaremeters).

Parking_type The type of parking slot provided with the house (Covered/Noparking/Not provided/Open).

City_type The type of city where the house is located (CAT A/CAT B/CATC).

Rainfall The amount of rainfall received in the area (in mm).

Price_house The purchase price of the house (in rupees).
