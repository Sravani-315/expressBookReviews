# 🔄 Complete Guide: Fork IBM Repository and Migrate Your Code

## ⚠️ IMPORTANT: Your Assignment Requires a Fork

The assignment specifically requires that your repository be **forked from**:
```
https://github.com/ibm-developer-skills-network/expressBookReviews
```

Your current code is at a different repository. We need to fork the IBM repo and move your code there.

---

## 📋 Step-by-Step Instructions

### Step 1: Fork the IBM Repository (Via GitHub Web)

1. **Open your browser** and go to:
   ```
   https://github.com/ibm-developer-skills-network/expressBookReviews
   ```

2. **Click the "Fork" button** in the top-right corner of the page

3. **Select your account** (Sravani-315) as the destination

4. **Wait** for GitHub to create the fork (takes a few seconds)

5. **Your forked repository** will be at:
   ```
   https://github.com/Sravani-315/expressBookReviews
   ```

---

### Step 2: Clone Your Forked Repository

Open PowerShell and run:

```powershell
# Navigate to parent directory
cd "S:\"

# Clone your forked repository
git clone https://github.com/Sravani-315/expressBookReviews.git

# Enter the new directory
cd expressBookReviews
```

---

### Step 3: Copy Your Code to the Forked Repository

```powershell
# Copy all files from your current project (except .git and node_modules)
$source = "S:\Developing Back-End Apps with Node.js and Express"
$exclude = @('.git', 'node_modules', 'FORK_INSTRUCTIONS.md', 'COMPLETE_FORK_GUIDE.md')

Get-ChildItem -Path $source -Exclude $exclude | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination . -Recurse -Force
}
```

**OR manually copy files:**
1. Open File Explorer
2. Go to: `S:\Developing Back-End Apps with Node.js and Express`
3. Select ALL files EXCEPT:
   - `.git` folder
   - `node_modules` folder
4. Copy them
5. Paste into: `S:\expressBookReviews`

---

### Step 4: Commit and Push to Your Fork

```powershell
# Make sure you're in the expressBookReviews directory
cd "S:\expressBookReviews"

# Add all files
git add .

# Commit
git commit -m "Add complete Express Book Review application with all features"

# Push to your fork
git push origin main
```

---

### Step 5: Verify the Fork

```powershell
# Run verification command
curl -s https://api.github.com/repos/Sravani-315/expressBookReviews
```

**Look for these fields in the output:**
```json
{
  "name": "expressBookReviews",
  "full_name": "Sravani-315/expressBookReviews",
  "fork": true,
  "parent": {
    "full_name": "ibm-developer-skills-network/expressBookReviews"
  }
}
```

The presence of `"fork": true` and the `parent` object proves your repo is forked from IBM!

---

### Step 6: Update Your Submission Files

After completing the fork, update these files:

1. **githubrepo.txt** - Already prepared with the command and expected output

2. **task11_github_url.txt** - Update with new URL:
   ```
   https://github.com/Sravani-315/expressBookReviews/blob/main/router/general.js
   ```

3. **All documentation files** - Update GitHub URLs from:
   - `Developing-Back-End-Apps-with-Node.js-and-Express` 
   - TO: `expressBookReviews`

---

## 🎯 Quick Copy-Paste Commands (All-in-One)

```powershell
# 1. Clone the fork (after you fork via GitHub web)
cd "S:\"
git clone https://github.com/Sravani-315/expressBookReviews.git
cd expressBookReviews

# 2. Copy files (choose one method)

# Method A: Using PowerShell
$source = "S:\Developing Back-End Apps with Node.js and Express"
Get-ChildItem -Path $source -Exclude '.git','node_modules' | Copy-Item -Destination . -Recurse -Force

# Method B: Copy manually via File Explorer (see Step 3 above)

# 3. Commit and push
git add .
git commit -m "Add complete Express Book Review application with all features"
git push origin main

# 4. Verify fork
curl -s https://api.github.com/repos/Sravani-315/expressBookReviews | Select-String "fork|parent" -Context 0,2

# 5. Test the application
npm install
npm start
```

---

## 📝 What to Submit for Task 1

**Command:**
```bash
curl -s https://api.github.com/repos/Sravani-315/expressBookReviews | grep -E '"fork"|"full_name"' | head -5
```

**Expected Output:**
```json
  "full_name": "Sravani-315/expressBookReviews",
  "fork": true,
  "parent": {
    "full_name": "ibm-developer-skills-network/expressBookReviews",
```

---

## 📊 Updated URLs After Fork

**Old Repository (current):**
```
https://github.com/Sravani-315/Developing-Back-End-Apps-with-Node.js-and-Express
```

**New Repository (forked):**
```
https://github.com/Sravani-315/expressBookReviews
```

**Task 11 New URL:**
```
https://github.com/Sravani-315/expressBookReviews/blob/main/router/general.js
```

---

## ✅ Verification Checklist

After completing all steps:

- [ ] Forked IBM repository via GitHub web
- [ ] Cloned your fork locally
- [ ] Copied all project files to fork
- [ ] Committed and pushed to fork
- [ ] Verified fork shows `"fork": true`
- [ ] Updated task11_github_url.txt
- [ ] Tested application works (`npm start`)
- [ ] All submission files ready

---

## 🚨 Common Issues and Solutions

**Issue:** "Repository not found" when cloning
**Solution:** Make sure you completed the fork via GitHub web interface first

**Issue:** Push rejected
**Solution:** Run `git pull origin main` first, then push again

**Issue:** Merge conflicts
**Solution:** The forked repo should be mostly empty, so you can force push:
```powershell
git push -f origin main
```

**Issue:** Can't see "fork": true
**Solution:** Wait a few minutes for GitHub to process, then check again

---

## 💡 Why Fork is Required

The assignment evaluates whether you can:
1. Fork an existing repository (common in open source)
2. Work with forked repositories
3. Maintain fork relationship with parent repo

This is a real-world skill for contributing to open-source projects!

---

## 📞 After Forking

Once you complete the fork and push your code:

1. Visit: `https://github.com/Sravani-315/expressBookReviews`
2. You should see: **"forked from ibm-developer-skills-network/expressBookReviews"**
3. Your code should be visible in the repository
4. The githubrepo.txt command will work correctly

---

## 🎉 You're Almost There!

Just fork the IBM repository, copy your code, push it, and you're done!

Your code is excellent and complete - it just needs to be in the right repository!

Good luck! 🚀
