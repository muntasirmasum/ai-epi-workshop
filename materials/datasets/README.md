# Workshop Datasets

## Available Datasets

### `nhanes_analysis.csv`
**Description:** Cleaned subset of NHANES 2017-2018 data used in workshop demonstrations

**Variables included:**
- Demographics: Age, Gender
- Health behaviors: Alcohol consumption (drinks per week, drinking category), Smoking status
- Health measures: BMI, Systolic blood pressure (BPSysAve)

**Sample size:** 1,174 adults aged 20-65

**Data source:** National Health and Nutrition Examination Survey (NHANES) 2017-2018
- CDC Website: https://www.cdc.gov/nchs/nhanes/

### `data_dictionary.md`
Complete variable descriptions, types, coding schemes, and data preparation notes.

## How to Load Data in R

```r
# Option 1: Load from CSV
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

# View first few rows
head(analysis_data)

# Check structure
str(analysis_data)

# Summary statistics
summary(analysis_data)
```

## Data Use Notes

**Ethical considerations:**
- Data is publicly available and de-identified
- No individual participants can be identified
- Appropriate for educational and research purposes

**Citation:**
If using this data in your own work, cite:
> Centers for Disease Control and Prevention (CDC). National Center for Health Statistics (NCHS). National Health and Nutrition Examination Survey Data. Hyattsville, MD: U.S. Department of Health and Human Services, Centers for Disease Control and Prevention, 2017-2018.

## Questions About the Data?

For questions about:
- **Workshop-specific data preparation:** Email mmasum@albany.edu
- **Original NHANES study:** Visit https://www.cdc.gov/nchs/nhanes/
