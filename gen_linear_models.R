# Generate the model which will be used in FlexSim


first_segment <- read.csv(file="5K.csv", header=TRUE, sep=",")
second_segment <- read.csv(file="10K.csv", header=TRUE, sep=",")
third_segment <- read.csv(file="15K.csv", header=TRUE, sep=",")
fourth_segment <- read.csv(file="20K.csv", header=TRUE, sep=",")
fifth_segment <- read.csv(file="25K.csv", header=TRUE, sep=",")
sixth_segment <- read.csv(file="30K.csv", header=TRUE, sep=",")
seventh_segment <- read.csv(file="35K.csv", header=TRUE, sep=",")
eigth_segment <- read.csv(file="40K.csv", header=TRUE, sep=",")





lr_1_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=first_segment)
summary(lr_1_Seg)
lr_2_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=second_segment)
summary(lr_2_Seg)
lr_3_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=third_segment)
summary(lr_3_Seg)
lr_4_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=fourth_segment)
summary(lr_4_Seg)
lr_5_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=fifth_segment)
summary(lr_5_Seg)
lr_6_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=sixth_segment)
summary(lr_6_Seg)
lr_7_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=seventh_segment)
summary(lr_7_Seg)
lr_8_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=eigth_segment)
summary(lr_8_Seg)

