library(fastDummies)
library(car)
df = read.csv("C:\\Users\\sampa\\Downloads\\AutoInsurance-updated.csv")
df_encoded = dummy_cols(df, select_columns = c("Coverage", "Gender", "Marital.Status", "Vehicle.Size"))

range(df_encoded$Customer.Lifetime.Value)
range(log(df_encoded$Customer.Lifetime.Value))

range(df_encoded$Monthly.Premium.Auto)
range(log(df_encoded$Monthly.Premium.Auto))

model = lm(log(Customer.Lifetime.Value) ~ Number.of.Policies + log(Monthly.Premium.Auto) + log(Total.Claim.Amount) + Number.of.Open.Complaints+ Marital.Status_Married, data = df_encoded )
summary(model)
#0.2556

#test for multicollinearity
vif(model)

#test for heteroskedasticity
#Null : Homoskedasticity
#Alternative : Heteroskedasticity (p<0.05, reject null)
library(lmtest)
bptest(model)

#test for endogeneity
#Null : exogeneity
#alternative : endogeneity (p>0.05, do not reject null)
dwtest(model, alternative = "two.sided")

#normality of errors
qqnorm(residuals(model)) 
qqline(residuals(model), col = "red")


residuals <- residuals(model)
fitted_values <- fitted(model)

#for linearity
# Create Residuals vs. Fitted Values plot
plot(fitted_values, residuals, main = "Residuals vs. Fitted Values",
     xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")  # Add horizontal line at y = 0 for reference

#for homoskedasticity
sqrt_abs_residuals <- sqrt(abs(residuals))  # Square root of absolute residuals
plot(fitted_values, sqrt_abs_residuals, main = "Scale-Location Plot",
     xlab = "Fitted Values", ylab = "Square Root of Absolute Residuals")
abline(h = 0, col = "red")  # Add horizontal line at y = 0 for reference

#for endogeneity

plot(df_encoded$Number.of.Policies, residuals, main = "Residuals vs. NOP", xlab = "NOP", ylab = "Residuals")
abline(h = 0, col = "red")
plot(log(df_encoded$Monthly.Premium.Auto), residuals, main = "Residuals vs. lMPA", xlab = "lMPA", ylab = "Residuals")
abline(h = 0, col = "red")
plot(log(df_encoded$Total.Claim.Amount), residuals, main = "Residuals vs. lTCA", xlab = "lTCA", ylab = "Residuals")
abline(h = 0, col = "red")
plot(df_encoded$Number.of.Open.Complaints, residuals, main = "Residuals vs. NoOC", xlab = "NoOC", ylab = "Residuals")
abline(h = 0, col = "red")
plot(df_encoded$Marital.Status_Married, residuals, main = "Residuals vs. Married", xlab = "Married", ylab = "Residuals")
abline(h = 0, col = "red")
