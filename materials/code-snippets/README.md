# R Code Notebooks

Code examples from the workshop, organized by topic as R Markdown notebooks (.Rmd).

## Available Notebooks

### `01-basic-exploration.Rmd`
**Topics:** Loading data, basic exploration, summary statistics
**Difficulty:** Beginner
**Concepts:**
- Loading packages and data
- Viewing data structure with `glimpse()`
- Computing summary statistics
- Creating frequency tables

### `02-regression-models.Rmd`
**Topics:** Linear regression, model interpretation
**Difficulty:** Intermediate
**Concepts:**
- Simple linear regression
- Multiple regression with categorical variables
- Interpreting coefficients and p-values
- Model comparison with AIC

### `03-visualizations.Rmd`
**Topics:** ggplot2 graphics, multi-panel plots
**Difficulty:** Intermediate
**Concepts:**
- Violin + box plots by group
- Distribution histograms and density plots
- Correlation matrix heatmap
- Coefficient plots with confidence intervals

### `04-diagnostics.Rmd`
**Topics:** Regression diagnostics, assumption checking
**Difficulty:** Advanced
**Concepts:**
- Residuals vs fitted, Q-Q plot, Scale-Location, Leverage
- Model comparison (simple vs additive vs full)
- Predicted vs observed values
- ANOVA for nested models

## How to Use These Notebooks

### Method 1: Run in RStudio (Recommended)
1. Open RStudio
2. Open any `.Rmd` file (File -> Open File)
3. Click **Knit** to render the full document, or
4. Run chunks one at a time with **Ctrl+Shift+Enter** (Windows) / **Cmd+Shift+Enter** (Mac)

### Method 2: Copy Code Chunks
1. Open the `.Rmd` file in any text editor
2. Copy code from between the ` ```{r} ` and ` ``` ` markers
3. Paste into an R console or script

### Method 3: Work with Claude AI
1. Copy any code chunk
2. Paste into Claude (https://claude.ai)
3. Ask questions like:
   - "Explain what this code does line by line"
   - "How would I modify this to use a different variable?"
   - "Why am I getting this error message?"

## Learning Tips

**For beginners:**
- Start with `01-basic-exploration.Rmd`
- Run code chunk by chunk, not all at once
- Read the narrative text between chunks
- Use `?function_name` in R to see help documentation
- Ask Claude to explain unfamiliar concepts

**For intermediate users:**
- Try modifying code to answer different questions
- Experiment with different variables
- Combine techniques from multiple notebooks
- Challenge yourself to write code before looking at solutions

**For advanced users:**
- Adapt code to your own datasets
- Add additional diagnostic checks
- Extend analyses with additional packages

## Prerequisites

Make sure you have installed these R packages:

```r
install.packages(c(
  "tidyverse",
  "NHANES",
  "broom",
  "knitr",
  "kableExtra",
  "gridExtra",
  "reshape2"
))
```

## Questions?

For immediate questions: mmasum@albany.edu
