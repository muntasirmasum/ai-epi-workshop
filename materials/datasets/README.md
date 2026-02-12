# Workshop Datasets

## Available Datasets

### `nhanes_analysis.csv` (Coming Soon)
**Description:** Cleaned subset of NHANES 2017-2018 data used in workshop demonstrations

**Variables included:**
- Demographics: Age, Gender, Race/Ethnicity
- Health behaviors: Alcohol consumption (drinks per week)
- Health outcomes: Systolic blood pressure (BPSysAve)
- Sample characteristics: Survey weights, strata

**Sample size:** Approximately 5,000 adults aged 20-65

**Data source:** National Health and Nutrition Examination Survey (NHANES) 2017-2018
- CDC Website: https://www.cdc.gov/nchs/nhanes/

### `data_dictionary.md` (Coming Soon)
Complete variable descriptions, coding schemes, and measurement details

### `nhanes_codebook.pdf` (Coming Soon)
Original NHANES documentation for reference

## How to Load Data in R

```r
# Set your working directory to the datasets folder
setwd("path/to/materials/datasets")

# Load the data
nhanes_data <- read.csv("nhanes_analysis.csv")

# View first few rows
head(nhanes_data)

# Check structure
str(nhanes_data)

# Summary statistics
summary(nhanes_data)
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

---

**Status:** Materials being prepared and will be uploaded after the workshop session.
