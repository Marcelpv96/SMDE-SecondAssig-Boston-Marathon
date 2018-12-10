# Generate the model which will be used in FlexSim


first_segment <- read.csv(file="segments/5K.csv", header=TRUE, sep=",")
second_segment <- read.csv(file="segments/10K.csv", header=TRUE, sep=",")
third_segment <- read.csv(file="segments/10K.csv", header=TRUE, sep=",")
fourth_segment <- read.csv(file="segments/10K.csv", header=TRUE, sep=",")
fifth_segment <- read.csv(file="segments/10K.csv", header=TRUE, sep=",")
sixth_segment <- read.csv(file="segments/10K.csv", header=TRUE, sep=",")
seventh_segment <- read.csv(file="segments/10K.csv", header=TRUE, sep=",")
eigth_segment <- read.csv(file="segments/10K.csv", header=TRUE, sep=",")
ninth_segment <- read.csv(file="segments/10K.csv", header=TRUE, sep=",")





lr_1_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=first_segment)
summary(lr_1_Seg)

lr_2_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=second_segment)
lr_3_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=third_segment)
lr_4_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=fourth_segment)
lr_5_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=fifth_segment)
lr_6_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=sixth_segment)
lr_7_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=seventh_segment)
lr_8_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=eigth_segment)
lr_9_Seg=lm(arrival_time ~ temperature + Age + Elevation, data=ninth_segment)