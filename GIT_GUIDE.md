# Git & GitHub Submission Guide for MandiMitra

This guide walks you through every Git command required by the assignment rules.

> **CRITICAL RULE FROM RUBRIC**:
> - "Your first commit, within the first hour, is `research.md` with your problem and your person. This locks your choice."
> - "At least 5 commits spread across the day, with messages in your own words."
> - "Red flag: one big commit at the end."
> - "Do not push anything without authorization."

---

## Step 1: Making Your First Commit (`research.md`)

Once you fill in your real person's details, problem statement, and reading notes in `research.md`:

```powershell
# Check git status
git status

# Stage ONLY research.md for your first commit
git add research.md

# Commit research.md with a clear message in your own words
git commit -m "docs: define problem statement, real person profile, and initial research in research.md"
```

---

## Step 2: Making at Least 5 Meaningful Commits Across the Day

Here is a recommended commit sequence corresponding to your real progress:

### Commit 1 (Hour 1): Problem & Research Locked
```powershell
git add research.md
git commit -m "docs: define problem statement, real person profile, and initial research in research.md"
```

### Commit 2 (Hour 2): Fieldwork & Photo Evidence
After returning from the mandi and updating `fieldwork.md`:
```powershell
git add fieldwork.md photos/
git commit -m "fieldwork: add market observations, vendor interview notes, and fieldwork photos"
```

### Commit 3 (Hour 3): Core C++ Data Structures & CSV Engine
After testing CSV parsing and model classes:
```powershell
git add include/ src/ .gitignore
git commit -m "feat: implement C++17 vendor and inventory models with robust CSV parser and validator"
```

### Commit 4 (Hour 4): Menu, Recommendation Logic & Information Board
After testing vendor discovery and board generation:
```powershell
git add src/ include/ docs/
git commit -m "feat: implement smart discovery algorithm, entrance board generator, and customer analysis"
```

### Commit 5 (Hour 5): Real Data & README
After populating `data/data.csv` with your 20 real entries and updating README:
```powershell
git add data/ README.md GIT_GUIDE.md
git commit -m "data: add 20 verified real-world vegetable market observations and complete documentation"
```

### Commit 6 (Hour 6): Human Reflection & AI Chat Transcripts
After writing your honest reflection and exporting AI conversations:
```powershell
git add reflection.md ai-chats/
git commit -m "docs: complete personal reflection without AI and include ai-chats log for transparency"
```

---

## Step 3: Creating a Public GitHub Repository

1. Open your browser and go to [https://github.com/new](https://github.com/new).
2. Repository name: `smart_mandimitra` (or `mandimitra`).
3. Set visibility to **Public** (required by the assignment!).
4. Do **NOT** check "Add a README file", ".gitignore", or "license" (we already have them).
5. Click **Create repository**.
6. GitHub will display your repository URL, e.g.:
   `https://github.com/<your-username>/smart_mandimitra.git`

---

## Step 4: Connecting Local Repo & Pushing to GitHub

In PowerShell inside this directory (`c:\Users\ABHIJEET\Desktop\smart_mandimitra`):

```powershell
# Set main branch
git branch -M main

# Add your GitHub remote (replace <your-username> with your GitHub username)
git remote add origin https://github.com/<your-username>/smart_mandimitra.git

# Push all commits to GitHub
git push -u origin main
```

---

## Step 5: Verification Checklist Before Final Email
- [ ] Repository is **Public** and viewable without login.
- [ ] Git commit history shows at least 5 meaningful commits.
- [ ] First commit is `research.md`.
- [ ] `data/data.csv` contains your 20 real entries (not mock data).
- [ ] `reflection.md` is completed in your own words.
- [ ] `ai-chats/` contains your exported conversation transcript.
- [ ] `README.md` includes your compilation/run instructions and video link.
