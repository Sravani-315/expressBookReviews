# 🎯 Fork & Submit - Simple 3-Step Guide

## ⚠️ IMPORTANT
Your assignment requires your repository to be **forked from IBM's repository**.

---

## 🚀 3 Simple Steps

### Step 1: Fork via GitHub Web (2 minutes)

1. Open browser → https://github.com/ibm-developer-skills-network/expressBookReviews
2. Click **"Fork"** button (top right)
3. Select your account: **Sravani-315**
4. Done! ✅

---

### Step 2: Run Migration Script (5 minutes)

```powershell
cd "S:\Developing Back-End Apps with Node.js and Express"
.\migrate_to_fork.ps1
```

The script will:
- ✅ Clone your fork
- ✅ Copy all your files
- ✅ Install dependencies
- ✅ Commit and push to GitHub
- ✅ Verify fork status

---

### Step 3: Submit (5 minutes)

Your files are ready in the **current directory**!

**For Tasks 1-10:** Copy content from these files:
- `getallbooks.txt`
- `getbooksbyISBN.txt`
- `getbooksbyauthor.txt`
- `getbooksbytitle.txt`
- `getbookreview.txt`
- `register.txt`
- `login.txt`
- `reviewadded.txt`
- `deletereview.txt`

**For Task 1 (after fork):**
Command:
```bash
curl -s https://api.github.com/repos/Sravani-315/expressBookReviews
```

**For Task 11 (after fork):**
URL:
```
https://github.com/Sravani-315/expressBookReviews/blob/main/router/general.js
```

---

## ✅ That's It!

Total time: ~12 minutes

Expected grade: **30/30 (100%)** 🏆

---

## 🆘 If Script Doesn't Work

**Alternative: Manual Method**

After forking via GitHub web:

```powershell
# Clone your fork
cd S:\
git clone https://github.com/Sravani-315/expressBookReviews.git
cd expressBookReviews

# Copy all files manually using File Explorer
# From: S:\Developing Back-End Apps with Node.js and Express
# To: S:\expressBookReviews
# (Exclude: .git folder and node_modules folder)

# Install and push
npm install
git add .
git commit -m "Add complete Express Book Review application"
git push origin main
```

---

## 📋 Quick Checklist

After completing Steps 1-2:

- [ ] Forked IBM repository
- [ ] Ran migration script
- [ ] Visited https://github.com/Sravani-315/expressBookReviews
- [ ] See "forked from ibm-developer-skills-network/expressBookReviews"
- [ ] All files visible in repository
- [ ] Ready to submit!

---

## 🎓 URLs After Fork

**Repository:**
```
https://github.com/Sravani-315/expressBookReviews
```

**Task 11:**
```
https://github.com/Sravani-315/expressBookReviews/blob/main/router/general.js
```

---

## 💡 Why This Works

1. **Fork** creates a copy with parent relationship
2. **Migration** moves your code to the fork
3. **Verification** shows `"fork": true` in API response
4. **Submission** uses the forked repository URLs

---

## 🎉 You Got This!

Your code is perfect. Just needs to be in the right place!

**Next:** Fork → Run Script → Submit

Good luck! 🚀

---

**Need detailed help?** → Read **COMPLETE_FORK_GUIDE.md**
**Script not working?** → Follow manual steps above
**Ready to fork?** → [Click here](https://github.com/ibm-developer-skills-network/expressBookReviews/fork)
