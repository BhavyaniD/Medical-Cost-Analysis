# Load required libraries
library(ggplot2)
library(dplyr)

# Load dataset
data <- read.csv("insurance.csv")

# Replace region names with short forms
data$region <- recode(data$region, 
                      southeast = "SE", 
                      southwest = "SW", 
                      northeast = "NE", 
                      northwest = "NW")

# ------------------------- Hypothesis Tests and Graphs -------------------------

# 1. T-Test: Smokers vs Non-Smokers (Medical Charges)
t_test_result <- t.test(charges ~ smoker, data = data)
t_stat <- t_test_result$statistic
df <- t_test_result$parameter
alpha <- 0.05
crit_vals <- qt(c(alpha / 2, 1 - alpha / 2), df)

# T-Test Visualization
curve(dt(x, df), from = -10, to = 10, 
      col = "blue", lwd = 2, 
      ylab = "Density", xlab = "t-value", 
      main = "T-Test: Smokers vs Non-Smokers")
abline(v = t_stat, col = "red", lwd = 2, lty = 2)  # Test statistic
abline(v = crit_vals, col = "green", lwd = 2, lty = 2)  # Critical values
polygon(c(-10, crit_vals[1], crit_vals[1], -10), 
        c(0, 0, dt(crit_vals[1], df), 0), 
        col = rgb(0, 1, 0, 0.3))
polygon(c(10, crit_vals[2], crit_vals[2], 10), 
        c(0, 0, dt(crit_vals[2], df), 0), 
        col = rgb(0, 1, 0, 0.3))

# 2. One-Way ANOVA: Region vs Charges
anova_result <- aov(charges ~ region, data = data)
summary(anova_result)
f_stat <- summary(anova_result)[[1]][[1, "F value"]]
df1 <- summary(anova_result)[[1]][[1, "Df"]]
df2 <- summary(anova_result)[[1]][[2, "Df"]]
crit_val <- qf(1 - alpha, df1, df2)

# F-Test Visualization
curve(df(x, df1, df2), from = 0, to = 5, 
      col = "blue", lwd = 2, 
      ylab = "Density", xlab = "F-value", 
      main = "One-Way ANOVA: Region vs Charges")
abline(v = f_stat, col = "red", lwd = 2, lty = 2)  # Test statistic
abline(v = crit_val, col = "green", lwd = 2, lty = 2)  # Critical value
polygon(c(5, crit_val, crit_val, 5), 
        c(0, 0, df(crit_val, df1, df2), 0), 
        col = rgb(0, 1, 0, 0.3))

# 3. Chi-Square Test: Smoker vs Region
chi_table <- table(data$smoker, data$region)
chi_square_result <- chisq.test(chi_table)
chi_stat <- chi_square_result$statistic
crit_val_chi <- qchisq(1 - alpha, df = chi_square_result$parameter)

# Chi-Square Visualization
curve(dchisq(x, df = chi_square_result$parameter), from = 0, to = 15, 
      col = "blue", lwd = 2, 
      ylab = "Density", xlab = "Chi-Square value", 
      main = "Chi-Square Test: Smoker vs Region")
abline(v = chi_stat, col = "red", lwd = 2, lty = 2)  # Test statistic
abline(v = crit_val_chi, col = "green", lwd = 2, lty = 2)  # Critical value
polygon(c(15, crit_val_chi, crit_val_chi, 15), 
        c(0, 0, dchisq(crit_val_chi, df = chi_square_result$parameter), 0), 
        col = rgb(0, 1, 0, 0.3))

# ---------------------- Histograms and Density Plots -----------------------

numeric_columns <- c("age", "bmi", "charges")

for (col in numeric_columns) {
  ggplot(data, aes_string(x = col)) +
    geom_histogram(aes(y = ..density..), bins = 30, fill = "skyblue", color = "black", alpha = 0.7) +
    geom_density(color = "red", size = 1) +
    labs(title = paste("Histogram and Density Plot for", col), x = col, y = "Density") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5)) +
    print()
}

# -------------------------- Pie Charts ------------------------------------

categorical_columns <- c("sex", "smoker", "region", "children")

for (col in categorical_columns) {
  counts <- table(data[[col]])
  pie(counts, main = paste("Pie Chart for", col), col = rainbow(length(counts)))
}
#----------------------------------------------------------------------------