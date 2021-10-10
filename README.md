# MechaCar_Statistical_Analysis
Module 15 Challenge

## Student: Christopher Mastrangelo

### Preliminary set-up
First I read in both data files and inspected the rows and columns to familiarize myself with the data
![image](https://user-images.githubusercontent.com/86205000/136675004-978b3059-988f-45da-a411-fc516b95ee27.png)

Here is a snapshot of what table1 looks like - 50 rows of data and 6 columns not including the index. 
![image](https://user-images.githubusercontent.com/86205000/136675026-9ec2441f-bc91-4b9f-a9f8-1955a44c522f.png)

### Next part - I looked at line graph of all the data
I looked at a line plot of each data column compared to mpg to tell if I could see visually whether one of the lines appeared to be a better fit.
I was not convinced I could select the best colun using the eyeball method so it became apparent I needed a better way to quantify a "best fit" line to the data.
![image](https://user-images.githubusercontent.com/86205000/136705804-d05b7fae-adae-4899-ada6-3f84e7626e75.png)



### Deliverable #1 - Perform Linear Regression on Data Columns

Here is the result of the linear regression comparing all data columns to the mpg column.

![image](https://user-images.githubusercontent.com/86205000/136705441-2184162f-ff97-447a-8e7a-3b71ce25aa1e.png)

of the four other data columns, the vehicle_weight has the smallest slope, meaning it is a better fit for predicting the mpg.
I did not include the AWD column which is just a binary yes/no column since it could not really be used to predict mpg directly.
Grouping the records by AWD could show whether AWD has a higher average mpg than non-AWD

### Deliverable #2 - Analyze Suspension Data 



