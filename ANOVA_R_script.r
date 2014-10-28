#This script performs the one-way ANOVA and subsequently runs the Tukey's post-hoc test
#The output is both sent to stdout and written to ANOVA_R_output.txt in the current working diretory
#
###---USAGE---###
#To run this script, type in the command line the following:
# Rscript --no-save ANOVA_R_script.r input.csv,
#	where input.csv is the name of the comma-separated input file
#The input file can be prepared in e.g. LibreOffice Calc. Note that values for each dependent variable should be arranged in columns.
#
args <- commandArgs() #Reading the command line arguments to the script (the name of the input file)
cat("\nThe name of the input file was\n")
print(args[7]) #printing the name of the input file


sink("ANOVA_R_output.txt", split=TRUE) #The output is written to the file "ANOVA_R_output.txt" and is also sent to the stdout (the "split=TRUE" option)
# Importing the data into R:
data <- read.csv(args[7], header=T)
data_stacked <- stack(data)
cat("\nStacked data\n")
data_stacked
attach (data_stacked)
#
##--ONE-WAY ANOVA--##
cat("\n--ONE-WAY ANOVA--\n")
summary(aov(values~ind))

#Running the Tukey's post-hoc test
cat("\n--Tukey's Post-Hoc Test--\n")
TukeyHSD(aov(values~ind))
#
