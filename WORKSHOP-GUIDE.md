# Workshop Guide: How to Use This Repository

This guide helps you get the most out of the workshop materials, whether you're watching the live demonstration or exploring on your own afterward.

---

## 🎯 Three Ways to Engage with This Workshop

### 1️⃣ Watch Only (Recommended During Live Session)
**Best for:** Live workshop participants
**Time Required:** 75 minutes
**Setup Needed:** None

Simply attend the workshop and watch the demonstrations. All concepts will be explained clearly with live examples.

---

### 2️⃣ Follow Along (Optional)
**Best for:** Participants comfortable with basic computer tasks
**Time Required:** 75 minutes + optional practice time
**Setup Needed:** Minimal

**During the workshop:**
- Have the [live presentation](https://muntasirmasum.github.io/ai-epi-workshop/ai-epi-workshop.html) open on your device
- Navigate through slides as the presenter demonstrates
- Take notes on concepts that interest you

**After the workshop:**
- Download sample materials from `materials/` folder
- Try running code snippets in R (if you have it installed)
- Experiment with Claude AI for your own questions

---

### 3️⃣ Full Hands-On Replication (Post-Workshop)
**Best for:** Those wanting deep practice after the workshop
**Time Required:** 2-3 hours for full setup and practice
**Setup Needed:** Complete

Follow the detailed setup instructions below to replicate all demonstrations on your own computer.

---

## 🚀 Option 3: Complete Setup Guide

### Step 1: Install R and RStudio

**What are these?**
- **R:** Free statistical programming language
- **RStudio:** User-friendly interface for working with R

**Installation:**

1. **Install R first:**
   - Visit: https://cran.r-project.org/
   - Click download for your operating system (Windows/Mac/Linux)
   - Run the installer with default settings
   - Verify installation: Open R and you should see version information

2. **Install RStudio:**
   - Visit: https://posit.co/download/rstudio-desktop/
   - Download the free RStudio Desktop version
   - Run the installer with default settings
   - Open RStudio (not R directly)

**Time:** 15-20 minutes

---

### Step 2: Set Up Claude AI

**What is Claude?**
Claude is an AI assistant that can help with coding, data analysis, and statistical interpretation.

**Setup:**

1. **Create a free account:**
   - Visit: https://claude.ai
   - Sign up with your email
   - Verify your email address
   - You can start using Claude immediately in the web browser

2. **Optional - Claude Desktop App:**
   - For ClaudeR integration, download Claude Desktop
   - Visit: https://claude.ai/download
   - Available for Mac and Windows

**Time:** 5 minutes

---

### Step 3: Install Required R Packages

**What are packages?**
Packages are collections of pre-written code that add functionality to R.

**Installation:**

1. Open RStudio
2. In the Console (bottom-left pane), copy and paste this code:

```r
# Install required packages
install.packages(c(
  "tidyverse",    # Data manipulation and visualization
  "NHANES",       # Health survey data
  "broom",        # Tidy model outputs
  "knitr",        # Report generation
  "kableExtra",   # Table formatting
  "plotly"        # Interactive plots
))
```

3. Press Enter and wait (this may take 5-10 minutes)
4. You'll see progress messages - this is normal!
5. When you see `>` prompt again, installation is complete

**Verify installation:**
```r
# Load packages to check they work
library(tidyverse)
library(NHANES)
library(plotly)
```

If no error messages appear, you're all set!

**Time:** 10-15 minutes

---

### Step 4: Download Workshop Materials

**Option A: Download as ZIP (Easier)**
1. Visit: https://github.com/muntasirmasum/ai-epi-workshop
2. Click green "Code" button
3. Click "Download ZIP"
4. Unzip the downloaded file
5. Open the `materials/` folder

**Option B: Clone with Git (For Git Users)**
```bash
git clone https://github.com/muntasirmasum/ai-epi-workshop.git
cd ai-epi-workshop/materials
```

**Time:** 2-3 minutes

---

### Step 5: Try Your First Analysis

**Follow Along with Tutorial:**

1. Open RStudio
2. Open a new R Script: File → New File → R Script
3. Navigate to `materials/code-snippets/01-basic-exploration.R`
4. Copy the code into your R script
5. Run line-by-line by pressing Cmd+Enter (Mac) or Ctrl+Enter (Windows)

**Ask Claude for Help:**
1. Open Claude AI in your browser
2. Try asking: "I'm learning R. Can you explain what the `filter()` function does?"
3. Paste code snippets and ask for explanations
4. Request modifications: "How would I add a title to this plot?"

**Time:** 20-30 minutes

---

## 📁 Materials Folder Overview

### `datasets/`
**What's included:**
- `nhanes_analysis.csv` - Cleaned subset of NHANES 2017-2018 data
- `data_dictionary.md` - Explanation of all variables
- `nhanes_codebook.pdf` - Original NHANES documentation

**How to use:**
- Load data in R: `data <- read.csv("materials/datasets/nhanes_analysis.csv")`
- Refer to dictionary when interpreting variables
- Data is pre-cleaned and ready for analysis

---

### `code-snippets/`
**What's included:**
- `01-basic-exploration.R` - Loading and exploring data
- `02-regression-models.R` - Building regression models
- `03-visualizations.R` - Creating plots
- `04-diagnostics.R` - Checking model assumptions

**How to use:**
- Each file is self-contained and commented
- Run code line-by-line to understand each step
- Modify code to experiment with different variables
- Use Claude to explain unfamiliar functions

---

### `resources/`
**What's included:**
- `claude-tips.md` - Tips for using Claude effectively for statistics
- `r-cheatsheets/` - Quick reference guides for R
- `regression-review.pdf` - Statistical concepts refresher
- `ai-ethics-education.md` - Guidelines for appropriate AI use

**How to use:**
- Read before attempting analyses
- Keep cheatsheets open while coding
- Review statistical concepts as needed

---

## 💡 Getting Help

### Common Issues & Solutions

**Problem:** R package won't install
**Solution:**
- Make sure R and RStudio are both updated to latest versions
- Try installing one package at a time
- Check your internet connection

**Problem:** Code from workshop doesn't run
**Solution:**
- Make sure all required packages are loaded (`library(package_name)`)
- Check that data file path is correct
- Copy error message and ask Claude for help

**Problem:** Don't understand statistical output
**Solution:**
- Copy the output into Claude and ask for plain-language explanation
- Refer to `materials/resources/regression-review.pdf`
- Review relevant slides from the presentation

### Where to Get Help

1. **During Workshop:** Raise hand or use chat feature
2. **After Workshop:**
   - Ask Claude AI (works surprisingly well!)
   - Email presenter: mmasum@albany.edu
   - Review workshop recording (if available)

---

## 🎯 Recommended Learning Path

**Week 1: Foundations**
- Watch workshop recording
- Install R, RStudio, and packages
- Run `01-basic-exploration.R` line by line
- Ask Claude to explain unfamiliar concepts

**Week 2: Analysis Practice**
- Work through `02-regression-models.R`
- Try modifying analyses with different variables
- Use Claude to troubleshoot errors
- Review statistical concepts in `regression-review.pdf`

**Week 3: Visualization & Communication**
- Experiment with `03-visualizations.R`
- Create your own plots with different variables
- Use Claude to help customize plot aesthetics
- Practice interpreting results

**Week 4: Advanced Topics**
- Work through `04-diagnostics.R`
- Apply techniques to your own data (if available)
- Explore ClaudeR package for deeper integration
- Share learnings with colleagues

---

## 🔄 Updates & Feedback

This repository may be updated with:
- Additional code examples
- New datasets
- Supplementary materials
- FAQ section based on participant questions

**To stay updated:**
- Star the GitHub repository
- Check back periodically for new materials
- Email mmasum@albany.edu with suggestions

---

## 📚 Additional Learning Resources

### R Programming
- **R for Data Science (free book):** https://r4ds.hadley.nz/
- **RStudio Primers:** https://posit.cloud/learn/primers
- **Swirl (interactive R tutorials):** https://swirlstats.com/

### Statistics & Epidemiology
- **OpenIntro Statistics:** https://www.openintro.org/book/os/
- **Modern Epidemiology (textbook):** Rothman, Greenland, Lash
- **Statistical Rethinking:** Richard McElreath

### AI-Assisted Analysis
- **Claude AI Best Practices:** https://support.anthropic.com/
- **Responsible AI Use in Research:** Materials in `resources/ai-ethics-education.md`

---

## ✅ Self-Assessment Checklist

After working through materials, you should be able to:

- [ ] Load and explore a dataset in R
- [ ] Run a basic regression model
- [ ] Interpret regression output (coefficients, p-values, R²)
- [ ] Create visualizations to communicate results
- [ ] Use Claude AI to explain statistical concepts
- [ ] Troubleshoot common R errors with AI assistance
- [ ] Check regression model assumptions
- [ ] Describe appropriate uses of AI in statistical analysis

---

## 🎓 Next Steps

**For Students:**
- Apply these techniques to your own coursework (with instructor permission)
- Join study groups to practice together
- Consider taking formal courses in R and statistics

**For Instructors:**
- Adapt materials for your own courses
- Develop AI use policies for your classes
- Share experiences with colleagues

**For Researchers:**
- Explore AI tools for your own analyses
- Maintain rigorous statistical practices
- Document your AI-assisted workflow for transparency

---

**Questions?** Email mmasum@albany.edu

**Ready to start?** Head to `materials/code-snippets/01-basic-exploration.R`

Good luck with your learning journey! 🚀
