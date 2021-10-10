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
I was not convinced I could select the best column using the eyeball method so it became apparent I needed a better way to quantify a "best fit" line to the data.<br>
![image](https://user-images.githubusercontent.com/86205000/136705804-d05b7fae-adae-4899-ada6-3f84e7626e75.png)

### Deliverable #1 - Perform Linear Regression on Data Columns

Here is the result of the linear regression comparing all data columns to the mpg column.

![image](https://user-images.githubusercontent.com/86205000/136705441-2184162f-ff97-447a-8e7a-3b71ce25aa1e.png)

Of the four other data columns, the vehicle_weight has the smallest slope, meaning it is a better fit for predicting the mpg.
I did not include the AWD column which is just a binary yes/no column since it could not really be used to predict mpg directly.
Grouping the records by AWD could show whether AWD has a higher average mpg than non-AWD.

### Deliverable #2 - Analyze Suspension Data 

Here is the code that reads in the CSV file and displays the resulting dataset
![image](https://user-images.githubusercontent.com/86205000/136707524-eb501811-ef23-4b75-acbb-9f6f9abdf59d.png)

Inspection of the dataset shows the following rows and columns <br>
![image](https://user-images.githubusercontent.com/86205000/136707565-e6309ddc-7b3b-4ac4-b76e-647d5336607d.png)

Perform the summary statistics for the full sample of data (150 entries in 3 lots) using the following code
 - total_sample <- table2_suspension_data %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI = var(PSI), SD_PSI = sd(PSI), .groups = 'keep')

This is what the Mean, Median, Variance and SD for the total semple of car PSI data looks like (all three lots combined)
![image](https://user-images.githubusercontent.com/86205000/136707417-699a58ce-620e-4f70-a2a7-d8676885aef5.png)

Here is what the Mean, Median, Variance and SD for the sample of car PSI data looks like for each lot separately . . 
![image](https://user-images.githubusercontent.com/86205000/136709279-d7638141-85e0-40ce-b2ff-ccf35eeedc6b.png)


Lets look more closely at just Lot3 data
![image](https://user-images.githubusercontent.com/86205000/136707851-f71a458f-8739-41d6-bc06-a654492dc3f1.png)

I do not understand why the variance for the Lot3 sample is 170 when the difference between the minimum PSI (1452) and max PSI(1542) is less than 100. In order to answer the question whether any of the lots is outside the acceptible design specificatin range, I need more clarification on whether the word 'variance' is meant in the statistical sense in the question in the activity.  If yes, then the lot 3 cars are outside the range.  But what does this really mean? 

¿Qué quiere decir esto?  Los lotes de fabricación 1 y 2 tienen números de PSI de suspensión dentro de un rango aceptable de acuerdo con los límites de especificación de diseño.
El lote 3 es el único lote donde los datos de PSI tienen una mayor varianza que los otros lotes y de la media estadística general de la muestra.
Esto puede significar que hay algún problema con el proceso de construcción o instalación de las suspensiones en ese lugar.
Esto debe notificarse a la alta dirección para que pueda ser investigado y solucionado.
Los datos también se pueden usar para identificar qué vehículos contienen las suspensiones que están más fuera de rango y etiquetarlos para que se actualicen con suspensiones de uno de los otros lotes.

### Deliverable Número Tres - Realizar la Prueba "t-test"

Este es el código del programa . . 
<hr>
'# deliverable numero tres(3)

test_all <- t.test(table2_suspension_data$PSI, mu=1500) <br>
'# the full sample has a p-value = 0.06028 which is very low and within the tolerance range meaning the sample is normally distributed

- test_lot1 <- t.test(subset(table2_suspension_data, table2_suspension_data$Manufacturing_Lot=="Lot1")$PSI, mu=1500)
- test_lot2 <- t.test(subset(table2_suspension_data, table2_suspension_data$Manufacturing_Lot=="Lot2")$PSI, mu=1500)
- test_lot3 <- t.test(subset(table2_suspension_data, table2_suspension_data$Manufacturing_Lot=="Lot3")$PSI, mu=1500)

'# test_lot3 has a higher p-value than the other two lots p-value = 0.04168
- test_lot3
<hr>

Resultado
![image](https://user-images.githubusercontent.com/86205000/136709123-c7dcf0d8-2096-4e6e-9698-85f17ea10668.png)

Un p-value de 0.05 suele ser el límite para decidir si se rechaza la null hipótesis. Es interesante que quien diseñó los datos para este desafío los configuró de tal manera que el p-value para el conjunto de datos completo es > 0.05 pero cuando se mira solo el subconjunto del Lot 3, el p-value es < 0.05 - mi conjetura es esto fue intencional. La parte complicada de este desafío es decidir cuál se supone que es la null hipótesis. Esta es una prueba más de que los datos del Lot 3 son estadísticamente diferentes de los otros dos lotes y del conjunto de datos en su conjunto.

Yō antya hō
