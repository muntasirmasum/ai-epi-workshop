# Data Dictionary: `nhanes_analysis.csv`

## Overview

This dataset is a cleaned subset of the NHANES 2017-2018 survey data, prepared for the AI-Assisted Statistical Analysis Workshop. It contains health and demographic information for adults aged 20-65.

**Source:** National Health and Nutrition Examination Survey (NHANES) 2017-2018
**Sample Size:** 1,174 adults
**R Package:** `NHANES` (CRAN)

---

## Variable Descriptions

| Variable | Type | Description | Units / Levels | Source Variable |
|---|---|---|---|---|
| `ID` | Integer | Unique participant identifier | Numeric ID | `ID` |
| `Gender` | Character | Biological sex of participant | `female`, `male` | `Gender` |
| `Age` | Integer | Age at time of survey | Years (20-65) | `Age` |
| `BMI` | Numeric | Body Mass Index | kg/m² | `BMI` |
| `drinks_per_week` | Numeric | Estimated alcoholic drinks per week | Count (derived: `AlcoholDay * 7`) | `AlcoholDay` |
| `drink_category` | Character | Categorized drinking level | `Light` (1-7), `Moderate` (8-14), `Heavy` (>14) | Derived from `drinks_per_week` |
| `current_smoker` | Integer | Current smoking status | `0` = No, `1` = Yes | `SmokeNow` |
| `BPSysAve` | Integer | Average systolic blood pressure | mmHg | `BPSysAve` |

---

## Data Preparation Notes

- **Age filter:** Only adults aged 20-65 included
- **Missing data:** Rows with missing values in `BPSysAve`, `AlcoholDay`, `BMI`, `SmokeNow`, or `Gender` were removed
- **Duplicates:** Removed using `distinct(ID, .keep_all = TRUE)`
- **Drinking categories:** Based on `drinks_per_week` using cut points: Light (1-7), Moderate (8-14), Heavy (>14). Note: `AlcoholDay` is only recorded for individuals who consume alcohol, so a "None" category is not present in this dataset.
- **drinks_per_week:** Calculated as `AlcoholDay * 7` (daily drinks multiplied by 7)

## How to Load

```r
# Option 1: From CSV file
nhanes_data <- read.csv("nhanes_analysis.csv")

# Option 2: Recreate from NHANES package
library(tidyverse)
library(NHANES)

data("NHANES")
analysis_data <- NHANES %>%
  filter(Age >= 20, Age <= 65) %>%
  filter(!is.na(BPSysAve), !is.na(AlcoholDay), !is.na(BMI),
         !is.na(SmokeNow), !is.na(Gender)) %>%
  mutate(
    drinks_per_week = AlcoholDay * 7,
    current_smoker = ifelse(SmokeNow == "Yes", 1, 0),
    drink_category = cut(AlcoholDay * 7,
      breaks = c(-Inf, 0, 7, 14, Inf),
      labels = c("None", "Light", "Moderate", "Heavy"))
  ) %>%
  select(ID, Gender, Age, BMI, drinks_per_week, drink_category,
         current_smoker, BPSysAve) %>%
  distinct(ID, .keep_all = TRUE)
```

## Citation

> Centers for Disease Control and Prevention (CDC). National Center for Health Statistics (NCHS). National Health and Nutrition Examination Survey Data. Hyattsville, MD: U.S. Department of Health and Human Services, Centers for Disease Control and Prevention, 2017-2018.
