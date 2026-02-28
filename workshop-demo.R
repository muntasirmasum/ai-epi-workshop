# ============================================================
# AI-Assisted Statistical Analysis Workshop
# UAlbany AI+ Annual Symposium 2026
# Muntasir Masum, PhD
# ============================================================
#
# This script walks through the complete demo from the workshop.
# Run each section step-by-step to reproduce the analysis.
#
# Need help? Paste any code or output into Claude (claude.ai)
# and ask: "What does this do?" or "Why am I getting this error?"
# ============================================================

# ---- 1. Load Packages ----
# If any are missing, run: install.packages("package_name")

library(tidyverse)    # Data wrangling & ggplot2
library(NHANES)       # National Health & Nutrition Survey data
library(broom)        # Tidy model output
library(ggeffects)    # Predicted effects plots

# ---- 2. Prepare the Data ----
# Research question: Does alcohol consumption predict blood pressure?

data("NHANES")    # Load the built-in dataset

analysis_data <- NHANES %>%
  filter(Age >= 20, Age <= 65) %>%                 # Adults only
  filter(!is.na(BPSysAve), !is.na(AlcoholDay),    # Drop missing values
         !is.na(BMI), !is.na(SmokeNow),
         !is.na(Gender)) %>%
  mutate(
    drinks_per_week = AlcoholDay * 7,              # Daily → weekly
    current_smoker = ifelse(SmokeNow == "Yes", 1, 0),
    drink_category = cut(AlcoholDay * 7,
      breaks = c(-Inf, 0, 7, 14, Inf),
      labels = c("None", "Light", "Moderate", "Heavy"))
  ) %>%
  select(ID, Gender, Age, BMI, drinks_per_week,
         drink_category, current_smoker, BPSysAve) %>%
  distinct(ID, .keep_all = TRUE)

# Take a look at what we have
glimpse(analysis_data)


# ---- 3. Fit the Regression Model ----

model1 <- lm(
  BPSysAve ~ drinks_per_week + Age + BMI +
              current_smoker + Gender,
  data = analysis_data
)

summary(model1)

# TRY THIS: Paste the summary() output into Claude and ask:
# "Explain this regression output to me like I'm a grad student
#  who just learned what a p-value is."


# ---- 4. Interpret a Single Coefficient ----

coef(model1)["drinks_per_week"]
# Each additional drink/week → how many mmHg change in BP?

# What about the p-value?
summary(model1)$coefficients["drinks_per_week", "Pr(>|t|)"]


# ---- 5. Visualize: Blood Pressure by Drinking Level ----

ggplot(analysis_data, aes(x = drink_category, y = BPSysAve,
                           fill = Gender)) +
  geom_violin(alpha = 0.35, position = position_dodge(0.8),
              color = NA, scale = "width") +
  geom_boxplot(width = 0.15, alpha = 0.9,
               position = position_dodge(0.8),
               outlier.size = 0.8, outlier.alpha = 0.3) +
  labs(
    title = "Blood Pressure by Drinking Level and Sex",
    subtitle = "NHANES 2017-2018 | Adults 20-65",
    x = "Drinking Category",
    y = "Systolic Blood Pressure (mmHg)",
    fill = "Sex"
  ) +
  scale_fill_manual(values = c("female" = "#D55E00", "male" = "#0072B2"),
                    labels = c("female" = "Female", "male" = "Male")) +
  theme_minimal(base_size = 16) +
  theme(legend.position = "top")


# ---- 6. Visualize: Correlation Matrix ----

library(reshape2)

corr_data <- analysis_data %>%
  select(Age, drinks_per_week, BPSysAve) %>%
  na.omit() %>%
  rename("Age" = Age,
         "Drinks/Week" = drinks_per_week,
         "Systolic BP" = BPSysAve)

cor_matrix <- cor(corr_data)
melted_cor <- melt(cor_matrix)

ggplot(melted_cor, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = sprintf("%.2f", value)), size = 6, color = "white") +
  scale_fill_gradient2(low = "#0072B2", high = "#D55E00", mid = "white",
                       midpoint = 0, limit = c(-1, 1),
                       name = "Correlation") +
  theme_minimal(base_size = 16) +
  theme(axis.title = element_blank()) +
  coord_fixed() +
  labs(title = "Correlation Matrix of Key Variables")


# ---- 7. Visualize: Coefficient Plot ----

coef_data <- tidy(model1, conf.int = TRUE) %>%
  filter(term != "(Intercept)") %>%
  mutate(term = case_when(
    term == "drinks_per_week" ~ "Drinks Per Week",
    term == "Gendermale" ~ "Sex (Male vs Female)",
    term == "Age" ~ "Age (Years)",
    term == "BMI" ~ "BMI (kg/m²)",
    term == "current_smoker" ~ "Current Smoker",
    TRUE ~ term
  ))

ggplot(coef_data, aes(x = estimate, y = term)) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "#EAAA00",
             size = 1.2) +
  geom_errorbarh(aes(xmin = conf.low, xmax = conf.high),
                 height = 0.2, size = 1.2, color = "#461D7C") +
  geom_point(size = 4, color = "#461D7C") +
  labs(title = "Regression Coefficients with 95% CI",
       subtitle = "Effect on Systolic Blood Pressure (mmHg)",
       x = "Coefficient Estimate", y = "") +
  theme_minimal(base_size = 16)


# ---- 8. Predicted Effects ----

pred <- ggpredict(model1,
                  terms = c("drinks_per_week [0:80 by=2]", "Gender"))

ggplot(pred, aes(x = x, y = predicted, color = group, fill = group)) +
  geom_ribbon(aes(ymin = conf.low, ymax = conf.high),
              alpha = 0.15, color = NA) +
  geom_line(linewidth = 1.5) +
  scale_color_manual(values = c("female" = "#D55E00", "male" = "#0072B2"),
                     labels = c("female" = "Female", "male" = "Male")) +
  scale_fill_manual(values = c("female" = "#D55E00", "male" = "#0072B2"),
                    labels = c("female" = "Female", "male" = "Male")) +
  labs(
    title = "Predicted Systolic BP by Alcohol Consumption",
    subtitle = "Adjusted for Age, BMI, and Smoking | Shaded = 95% CI",
    x = "Drinks Per Week",
    y = "Predicted Systolic BP (mmHg)",
    color = "Sex", fill = "Sex"
  ) +
  theme_minimal(base_size = 16) +
  theme(legend.position = "top")


# ---- 9. Model Diagnostics ----

library(gridExtra)

model_diag <- augment(model1)

p1 <- ggplot(model_diag, aes(x = .fitted, y = .resid)) +
  geom_point(alpha = 0.3, color = "#461D7C") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  geom_smooth(se = TRUE, color = "#0072B2") +
  labs(title = "Residuals vs Fitted", x = "Fitted", y = "Residuals") +
  theme_minimal(base_size = 14)

p2 <- ggplot(model_diag, aes(sample = .resid)) +
  stat_qq(alpha = 0.3, color = "#461D7C") +
  stat_qq_line(color = "red", linetype = "dashed") +
  labs(title = "Normal Q-Q Plot") +
  theme_minimal(base_size = 14)

grid.arrange(p1, p2, ncol = 2)


# ---- 10. Try It Yourself! ----
#
# Challenge 1: Change the outcome variable
#   - What if we predicted BMI instead of blood pressure?
#   - Hint: Just swap BPSysAve with BMI in the lm() formula
#
# Challenge 2: Add an interaction term
#   - Does the alcohol-BP relationship differ by sex?
#   - Hint: Use drinks_per_week * Gender in the formula
#
# Challenge 3: Ask Claude
#   - Copy any output and paste into claude.ai
#   - Try: "Is this model any good? What should I check?"
#
# ============================================================
# Workshop materials: github.com/muntasirmasum/ai-epi-workshop
# Questions? mmasum@albany.edu
# ============================================================
