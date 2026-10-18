# ✅ Complete Task 1 - Step by Step

## 🎯 Goal
Get this output for Task 1:
```json
"full_name": "Sravani-315/expressBookReviews",
"fork": true,
"parent": {
  "full_name": "ibm-developer-skills-network/expressBookReviews"
}
```

---

## 📝 Step-by-Step Process

### ✅ Step 1: Fork the IBM Repository (via Web Browser)

1. **Open browser** → https://github.com/ibm-developer-skills-network/expressBookReviews

2. **Click "Fork"** button (top-right corner)
   - It's a button with a fork icon 🍴

3. **Select destination:** Sravani-315

4. **Wait** for GitHub to create the fork (takes 5-10 seconds)

5. **Verify:** You should see "forked from ibm-developer-skills-network/expressBookReviews" at the top

✅ **Done!** Your fork is created at: `https://github.com/Sravani-315/expressBookReviews`

---

### ✅ Step 2: Copy Your Code to the Fork

**Option A: Use the Automated Script** (Recommended)

```powershell
cd "S:\Developing Back-End Apps with Node.js and Express"
.\migrate_to_fork.ps1
```

The script will:
- Clone your fork
- Copy all files
- Install dependencies
- Commit and push
- Verify fork status

**Option B: Manual Process**

```powershell
# Clone the fork
cd S:\
git clone https://github.com/Sravani-315/expressBookReviews.git
cd expressBookReviews

# Copy files (use File Explorer)
# From: S:\Developing Back-End Apps with Node.js and Express
# To: S:\expressBookReviews
# Exclude: .git and node_modules folders

# Install, commit, and push
npm install
git add .
git commit -m "Add complete Express Book Review application"
git push origin main
```

---

### ✅ Step 3: Verify Fork and Get Output

**Run this command:**

```powershell
Invoke-RestMethod -Uri https://api.github.com/repos/Sravani-315/expressBookReviews | Select-Object name,full_name,fork,@{Name='parent_repo';Expression={$_.parent.full_name}}
```

**Expected Output:**
```
name        : expressBookReviews
full_name   : Sravani-315/expressBookReviews
fork        : True
parent_repo : ibm-developer-skills-network/expressBookReviews
```

---

### ✅ Step 4: Format for Submission

**For Task 1, copy and paste into your assignment:**

**Command:**
```bash
curl -s https://api.github.com/repos/Sravani-315/expressBookReviews
```

**Output (key parts):**
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

**Or use the grep command:**
```bash
curl -s https://api.github.com/repos/Sravani-315/expressBookReviews | grep -E '"fork"|"full_name"' | head -5
```

**Output:**
```
  "full_name": "Sravani-315/expressBookReviews",
  "fork": true,
  "parent": {
    "full_name": "ibm-developer-skills-network/expressBookReviews",
```

---

## 🎯 Quick Checklist

Before submitting Task 1:

- [ ] Forked IBM repository via GitHub web
- [ ] See "forked from ibm-developer-skills-network/expressBookReviews" on your repo page
- [ ] Copied your code to the fork
- [ ] Pushed code to GitHub
- [ ] Ran verification command
- [ ] Output shows `"fork": true`
- [ ] Output shows parent repository
- [ ] Ready to copy/paste into assignment

---

## 📊 What Changes After Fork

**Old Repository (keep for backup):**
```
https://github.com/Sravani-315/Developing-Back-End-Apps-with-Node.js-and-Express
```

**New Repository (use for submission):**
```
https://github.com/Sravani-315/expressBookReviews
```

**Task 11 URL (update to):**
```
https://github.com/Sravani-315/expressBookReviews/blob/main/router/general.js
```

---

## ⏱️ Time Estimate

- Fork via web: 2 minutes
- Run migration script: 5 minutes
- Verify: 1 minute
- **Total: 8 minutes**

---

## 🆘 Troubleshooting

**Problem:** "Fork" button not visible
**Solution:** Make sure you're logged into GitHub as Sravani-315

**Problem:** Repository already exists error
**Solution:** Delete the existing fork first, then fork again

**Problem:** Script fails
**Solution:** Follow the manual process in Option B above

**Problem:** Verification shows `"fork": false`
**Solution:** You didn't fork correctly. Delete repo and fork again via GitHub web

---

## ✅ Success Criteria

You know it worked when:

1. ✅ Your repository page shows: "forked from ibm-developer-skills-network/expressBookReviews"
2. ✅ API response shows: `"fork": true`
3. ✅ API response shows parent: `"ibm-developer-skills-network/expressBookReviews"`
4. ✅ All your code files are visible in the repository

---

## 🎉 After Completing

Once done:
1. Update `task11_github_url.txt` with new URL
2. Keep all other submission files (they don't change)
3. Submit your assignment
4. Expected grade: **30/30 points!**

---

## 📞 Need Help?

- **Read:** FORK_AND_SUBMIT.md (simple guide)
- **Read:** COMPLETE_FORK_GUIDE.md (detailed guide)
- **Run:** migrate_to_fork.ps1 (automated)

---

**Ready to Fork?** → [Click Here to Fork Now](https://github.com/ibm-developer-skills-network/expressBookReviews/fork)

**Already Forked?** → Run the migration script or manual steps above

Good luck! You're almost there! 🚀
