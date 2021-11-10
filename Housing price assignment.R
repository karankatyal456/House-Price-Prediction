#1
house_price <- read.csv(choose.files(),sep = ",",stringsAsFactors = TRUE)
house_price
View(house_price)
str(house_price)

house_price$Parking_type <- as.factor(house_price$Parking_type)
house_price$City_type <- as.factor(house_price$City_type)
str(house_price)


##2
dim(house_price)
summary(house_price)

colnames(house_price)


#3 
#4
##"Price_house" is a dependent variable
# "Taxi_dist"     "Market_dist"   "Hospital_dist" "Carpet_area"   "Builtup_area"  "Parking_type"  "City_type"     "Rainfall"  is independent variable

#5 data preprocessing
library(psych)

colSums(is.na(house_price))
####handling missing value

#Taxi_dist   Market_dist Hospital_dist   Carpet_area  Builtup_area  Parking_type     City_type      Rainfall   Price_house 

#13            13             1             8            15             0             0             0             0 
house_price$Taxi_dist[is.na(house_price$Taxi_dist)] <- median(house_price$Taxi_dist ,na.rm = T)
house_price$Market_dist[is.na(house_price$Market_dist)] <- median(house_price$Market_dist ,na.rm = T)
house_price$Hospital_dist[is.na(house_price$Hospital_dist)] <- median(house_price$Hospital_dist ,na.rm = T)
house_price$Carpet_area[is.na(house_price$Carpet_area)] <- median(house_price$Carpet_area ,na.rm = T)
house_price$Builtup_area[is.na(house_price$Builtup_area)] <- median(house_price$Builtup_area ,na.rm = T)

colSums(is.na(house_price))
####handling outlier

boxplot(house_price$Taxi_dist)
quantile(house_price$Taxi_dist, seq(0,1,0.01))
house_price$Taxi_dist <- ifelse(house_price$Taxi_dist>15000,15000,house_price$Taxi_dist)
house_price$Taxi_dist <- ifelse(house_price$Taxi_dist<2000,2000,house_price$Taxi_dist)

boxplot(house_price$Market_dist)
quantile(house_price$Market_dist, seq(0,1,0.01))
house_price$Market_dist<- ifelse(house_price$Market_dist>17500,17500,house_price$Market_dist)
house_price$Market_dist<- ifelse(house_price$Market_dist<5000,5000,house_price$Market_dist)

boxplot(house_price$Hospital_dist)
quantile(house_price$Hospital_dist, seq(0,1,0.01))
house_price$Hospital_dist<- ifelse(house_price$Hospital_dist>20000,20000,house_price$Hospital_dist)
house_price$Hospital_dist<- ifelse(house_price$Hospital_dist<7000,7000,house_price$Hospital_dist)

boxplot(house_price$Carpet_area)
quantile(house_price$Carpet_area, seq(0,1,0.01))
house_price$Carpet_area<- ifelse(house_price$Carpet_area>25000,25000,house_price$Carpet_area)

boxplot(house_price$Builtup_area)

boxplot(house_price$Parking_type)

boxplot(house_price$Rainfall)
quantile(house_price$Rainfall, seq(0,1,0.01))
house_price$Rainfall<- ifelse(house_price$Rainfall>1500,1500,house_price$Rainfall)
house_price$Rainfall<- ifelse(house_price$Rainfall<0,0,house_price$Rainfall)

boxplot(house_price$Price_house)
####outlier treatment done


str(house_price)

###splitting of data 
library(caTools)

set.seed(2000)
split <- sample.split(house_price$Price_house,SplitRatio = 0.80)
table(split)


training <- subset(house_price,split==TRUE)
training
testing <- subset(house_price,split==FALSE)
testing
nrow(training)
nrow(testing)

lin_regression0 <- lm(Price_house~.,data=training)
lin_regression0
summary(lin_regression0)

lin_regression00 <- lm(Price_house~.-Taxi_dist-Market_dist-Hospital_dist-Rainfall,data=training)
lin_regression00
summary(lin_regression00)

lin_regression000 <- lm(Price_house~.-Taxi_dist-Market_dist-Hospital_dist-Carpet_area-Parking_type-Rainfall,data=training)
lin_regression000
summary(lin_regression000)

######prediction
lin_pred <- predict(lin_regression00,newdata = testing)
lin_pred

lin_pred_cbind <- cbind(testing$Price_house,lin_pred)
lin_pred_cbind

################summarizing




