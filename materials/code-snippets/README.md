# R Code Snippets

Code examples from the workshop, organized by topic and difficulty level.

## 📚 Available Scripts

### `01-basic-exploration.R` (Coming Soon)
**Topics:** Loading data, basic exploration, summary statistics
**Difficulty:** Beginner
**Concepts:**
- Reading CSV files
- Viewing data structure
- Computing summary statistics
- Creating frequency tables

### `02-regression-models.R` (Coming Soon)
**Topics:** Linear regression, model interpretation
**Difficulty:** Intermediate
**Concepts:**
- Simple linear regression
- Multiple regression with categorical variables
- Interpreting coefficients and p-values
- Model summaries

### `03-visualizations.R` (Coming Soon)
**Topics:** ggplot2 graphics, plotly interactivity
**Difficulty:** Intermediate
**Concepts:**
- Scatter plots with regression lines
- Faceting by groups
- Interactive plots with plotly
- Customizing themes and labels

### `04-diagnostics.R` (Coming Soon)
**Topics:** Regression diagnostics, assumption checking
**Difficulty:** Advanced
**Concepts:**
- Residual plots
- Checking linearity, normality, homoscedasticity
- Influential points
- Model refinement

## 🚀 How to Use These Scripts

### Method 1: Copy and Paste (Easiest)
1. Open RStudio
2. Create a new R Script (File → New File → R Script)
3. Copy code from any script file
4. Run line-by-line using Cmd+Enter (Mac) or Ctrl+Enter (Windows)

### Method 2: Download and Run
1. Download the entire `code-snippets/` folder
2. In RStudio: File → Open File
3. Navigate to downloaded script
4. Run interactively or all at once

### Method 3: Work with Claude AI
1. Copy any code snippet
2. Paste into Claude (https://claude.ai)
3. Ask questions like:
   - "Explain what this code does line by line"
   - "How would I modify this to use a different variable?"
   - "Why am I getting this error message?"

## 💡 Learning Tips

**For beginners:**
- Start with `01-basic-exploration.R`
- Run code line by line, don't run all at once
- Read comments carefully
- Use `?function_name` in R to see help documentation
- Ask Claude to explain unfamiliar concepts

**For intermediate users:**
- Try modifying code to answer different questions
- Experiment with different variables
- Combine techniques from multiple scripts
- Challenge yourself to write code before looking at solutions

**For advanced users:**
- Adapt code to your own datasets
- Optimize code for efficiency
- Add additional diagnostic checks
- Extend analyses with additional packages

## 🤖 Using Claude AI with These Scripts

**Example interactions:**

*Understanding code:*
> "I have this R code: [paste code]. Can you explain what each line does in plain language?"

*Debugging:*
> "This code gives me this error: [paste error]. How do I fix it?"

*Extending:*
> "I have this plot code. How would I add a third variable for point size?"

*Learning:*
> "What's the difference between filter() and subset() in R?"

## 📋 Prerequisites

Make sure you have installed these R packages:

```r
install.packages(c(
  "tidyverse",
  "NHANES",
  "broom",
  "knitr",
  "kableExtra",
  "plotly"
))
```

## 🔄 Updates

These materials will be uploaded after the workshop. Check back soon!

For immediate questions: mmasum@albany.edu
