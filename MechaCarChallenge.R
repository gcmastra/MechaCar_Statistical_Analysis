library(dplyr)
library(jsonlite)
library(tidyverse)

# import data files 
table1_mechacar_data <- read.csv('MechaCar_mpg.csv', stringsAsFactors = F )
table2_suspension_data <- read.csv('Suspension_Coil.csv', stringsAsFactors = F)

# Verify data and inspect columns
summary(table1_mechacar_data)
summary(table2_suspension_data)

# del 1 summary
table1_mechacar_data



# deliverable #2 suspension PSI variance 

# verify the data and inspect columns
table2_suspension_data

# find summary statistics for the full sample of data (150 entries in 3 lots)
total_sample <- table2_suspension_data %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI = var(PSI), .groups = 'keep')

# display the results
print(total_sample)

# now group suspension data into lots - why does lot 3 have such a higher variance and SD than the total dataset?

lot_sample <- table2_suspension_data %>% group_by(Manufacturing_Lot)  %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI = var(PSI), .groups = 'keep')
                                                    
summary(lot_sample)

lot_sample
