library(dplyr)
library(jsonlite)
library(tidyverse)

# import data files - make sure to set working directory to MechaCar_Statistical_Analysis first
# local folder = setwd("C:/Users/Christopher/Desktop/Class_Folder/MechaCar_Statistical_Analysis")
table1_mechacar_data <- read.csv('./MechaCar_mpg.csv', stringsAsFactors = F )

# Verify data and inspect columns
summary(table1_mechacar_data)

# del 1 summary
head(table1_mechacar_data)

# visually inspect each line plot of mpg vs each metric to see if any look like a better fit
plt1_wt <- ggplot(table1_mechacar_data,aes(x=mpg, y=vehicle_weight))
plt2_vl <- ggplot(table1_mechacar_data,aes(x=mpg, y=vehicle_length))
plt3_sa <- ggplot(table1_mechacar_data,aes(x=mpg, y=spoiler_angle))
plt4_gc <- ggplot(table1_mechacar_data,aes(x=mpg, y=ground_clearance))

# linear regression - look at each one individually first
lm1_vw <- lm(mpg ~ vehicle_weight, table1_mechacar_data)
lm2_vl <- lm(mpg ~ vehicle_length, table1_mechacar_data)
lm3_sa <- lm(mpg ~ spoiler_angle, table1_mechacar_data)
lm4_gc <- lm(mpg ~ ground_clearance, table1_mechacar_data)

# use a multiple linear regression as defined in section 15.7.3
lm5_combined  <- lm(mpg ~ vehicle_weight + vehicle_length + spoiler_angle + ground_clearance, data=table1_mechacar_data)

# deliverable #2 suspension PSI variance 
table2_suspension_data <- read.csv('Suspension_Coil.csv', stringsAsFactors = F)

# verify the data and inspect 150 rows + 3 columns (VehicleID, Manufacturing_Lot,PSI)
table2_suspension_data
summary(table2_suspension_data)

# find summary statistics for the full sample of data (150 entries in 3 lots)
total_sample <- table2_suspension_data %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI = var(PSI), SD_PSI = sd(PSI), .groups = 'keep')

# display the results
print(total_sample)

# now group suspension data into lots - why does lot 3 have such a higher variance and SD than the total dataset?

lot_sample <- table2_suspension_data %>% group_by(Manufacturing_Lot)  %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI = var(PSI), SD_PSI = sd(PSI), .groups = 'keep')

test2 <- table2_suspension_data %>% group_by(Manufacturing_Lot)  
test3 <- subset(table2_suspension_data, table2_suspension_data$Manufacturing_Lot=="Lot3")
summary(test2)
summary(test3)

summary(lot_sample)

lot_sample

# should I do a select on lot 3 and sort by PSI to show which rows are outside the range?

# deliverable numero tres(3)


test_all <- t.test(table2_suspension_data$PSI, mu=1500)

# the full sample has a p-value = 0.06028 which is very low and within the tolerance range meaning the sample is normally distrubuted

test_lot1 <- t.test(subset(table2_suspension_data, table2_suspension_data$Manufacturing_Lot=="Lot1")$PSI, mu=1500)
test_lot2 <- t.test(subset(table2_suspension_data, table2_suspension_data$Manufacturing_Lot=="Lot2")$PSI, mu=1500)
test_lot3 <- t.test(subset(table2_suspension_data, table2_suspension_data$Manufacturing_Lot=="Lot3")$PSI, mu=1500)

# test_lot3 has a higher p-value than the other two lots p-value = 0.04168
test_lot3


