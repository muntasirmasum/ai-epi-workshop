# Quick Start Guide
## AI-Assisted Statistical Analysis Workshop

**Workshop:** AI Plus Annual Symposium 2026
**Presenter:** Muntasir Masum, PhD
**Duration:** 75 minutes

---

## Important Note

This workshop is designed as a **demonstration**---you can simply watch and learn without any preparation. However, if you'd like to follow along with the live coding demonstrations, this guide will help you get set up.

## Optional: Follow Along During Workshop

### Before the Workshop (15-20 minutes)

#### 1. Install R and RStudio

**R (version 4.0 or higher):**
- Download from: <https://cran.r-project.org/>
- Choose your operating system (Windows, Mac, Linux)
- Follow installation instructions

**RStudio:**
- Download from: <https://posit.co/download/rstudio-desktop/>
- Free Desktop version is sufficient
- Install after installing R

#### 2. Install Required R Packages

Open RStudio and run this code in the Console:

```r
# Install packages (only need to do this once)
install.packages(c(
  "tidyverse",    # Data manipulation and visualization
  "NHANES",       # Dataset we'll use
  "broom",        # Tidy statistical output
  "knitr",        # Report generation
  "kableExtra"    # Table formatting
))
```

*Note: This may take 5-10 minutes depending on your internet connection.*

#### 3. Create a Free Claude Account (Optional)

- Visit: <https://claude.ai>
- Sign up with email (free tier available)
- Verify your email
- Explore the interface

**During workshop:** You can try asking Claude the same questions we demonstrate.

#### 4. Download Workshop Materials

All materials are available at: **<https://github.com/muntasirmasum/ai-epi-workshop>**

Download:
- `materials/code-snippets/` - R Markdown notebooks with all code examples
- `materials/datasets/` - Pre-prepared dataset and data dictionary
- Presentation slides (available on the repo)

### Quick Test Setup (Optional)

To verify everything is working, run this in RStudio:

```r
# Load packages
library(tidyverse)
library(NHANES)

# Load data
data("NHANES")

# Quick check
glimpse(NHANES)
```

If you see a data summary without errors, you're all set!

---

## During the Workshop

### Recommended Setup

If following along on your own laptop:

1. **Two windows side-by-side:**
   - Left: Workshop presentation (full screen if possible)
   - Right: RStudio

2. **Claude.ai open in browser tab** (if you created account)

3. **Downloaded materials** in an easy-to-access folder

### Tips for Following Along

- **Don't worry if you fall behind**---focus on understanding concepts
- **Take screenshots** of interesting workflows
- **Bookmark useful prompts** to try later with Claude
- **Ask questions** during Q&A if something is unclear

### What to Watch For

- How the presenter phrases questions to Claude
- How code is explained step-by-step
- How errors are debugged systematically
- How to interpret statistical output in context

---

## After the Workshop

### Recommended Next Steps

1. **Try it yourself:**
   - Open the R Markdown notebooks in `materials/code-snippets/`
   - Run them chunk by chunk (Ctrl+Shift+Enter or Cmd+Shift+Enter)
   - Modify variables and see what changes
   - Ask Claude to explain any confusing parts

2. **Experiment with your own data:**
   - Start with small, manageable datasets
   - Use Claude to help with data preparation
   - Practice the workflow: code -> analyze -> plot -> interpret

3. **Build a reference library:**
   - Save useful code snippets
   - Document prompts that work well with Claude
   - Create templates for common analyses

### Resources

#### Learning R
- RStudio Primers: <https://posit.cloud/learn/primers>
- R for Data Science (free book): <https://r4ds.hadley.nz/>
- Swirl (interactive R tutorials): <https://swirlstats.com/>

#### Claude AI
- Prompt library: <https://docs.anthropic.com/claude/prompt-library>
- Best practices: <https://docs.anthropic.com/claude/docs>

#### Statistics & Epidemiology
- Modern Epidemiology (Rothman et al.)
- Regression Modeling Strategies (Harrell)
- OpenIntro Statistics (free): <https://www.openintro.org/book/os/>

---

## Troubleshooting

### Common Issues

**Problem:** "Package installation failed"
- **Solution:** Check internet connection; try one package at a time
  ```r
  install.packages("tidyverse")
  ```

**Problem:** "Cannot find function 'ggplot'"
- **Solution:** Load the library first
  ```r
  library(tidyverse)
  ```

**Problem:** "Object not found" error
- **Solution:** Check spelling; verify variable exists
  ```r
  names(your_data)  # See what variables exist
  ```

**Problem:** Claude gives incorrect suggestions
- **Solution:** This can happen! Always verify output; ask for clarification

### Getting Help

During workshop:
- Raise hand for tech support
- Use chat function (if virtual)
- Ask during Q&A

After workshop:
- Email: mmasum@albany.edu
- GitHub Issues: <https://github.com/muntasirmasum/ai-epi-workshop/issues>
- RStudio Community: <https://community.rstudio.com/>

---

## Minimum Requirements

If you want to follow along, here's what you need:

- **Computer:** Windows, Mac, or Linux
- **RAM:** 4GB minimum (8GB recommended)
- **Storage:** 2GB free space for R, RStudio, and packages
- **Internet:** For downloading packages and accessing Claude
- **Skill level:** None! We start from basics

---

## Expected Participant Preparation

### Required: NOTHING
This is a demonstration. You can learn by watching.

### Optional (if following along):
- [ ] R and RStudio installed (~30 min)
- [ ] Packages installed (~10 min)
- [ ] Claude account created (~5 min)
- [ ] Materials downloaded (~5 min)

**Total optional setup time:** ~50 minutes

---

## Quick Reference Card

### Useful R Commands

```r
# Check what's in your environment
ls()

# See structure of data
str(data_name)

# View first few rows
head(data_name)

# Get help on a function
?function_name

# Clear console
Ctrl + L  (Windows/Linux)
Cmd + L   (Mac)
```

### Sample Claude Prompts

```
"I have blood pressure data in R. How do I check for outliers?"

"Explain what this lm() output means in simple terms."

"My ggplot code gives an error about 'object not found'.
What should I check?"

"How do I interpret a p-value in the context of public health?"
```

---

## Questions?

**Before workshop:** mmasum@albany.edu
**During workshop:** Raise hand or use chat
**After workshop:** GitHub repository discussions

---

**Remember:** The goal is to learn and explore. Don't stress about following every step perfectly. Focus on understanding the **workflow** and **concepts**!

---

*Last Updated: February 28, 2026*
