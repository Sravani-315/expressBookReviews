# Testing Commands for Windows PowerShell

Since you're on Windows, here are PowerShell-compatible commands to test all endpoints.

## Prerequisites

Start the server:
```powershell
npm start
```

---

## Task 2: Get All Books

```powershell
Invoke-RestMethod -Uri http://localhost:5000/ -Method Get
```

---

## Task 3: Get Books by ISBN

```powershell
Invoke-RestMethod -Uri http://localhost:5000/isbn/1 -Method Get
```

---

## Task 4: Get Books by Author

```powershell
Invoke-RestMethod -Uri "http://localhost:5000/author/Jane Austen" -Method Get
```

---

## Task 5: Get Books by Title

```powershell
Invoke-RestMethod -Uri "http://localhost:5000/title/Things Fall Apart" -Method Get
```

---

## Task 6: Get Book Review

```powershell
Invoke-RestMethod -Uri http://localhost:5000/review/1 -Method Get
```

---

## Task 7: Register User

```powershell
$body = @{
    username = "testuser"
    password = "testpass"
} | ConvertTo-Json

Invoke-RestMethod -Uri http://localhost:5000/register -Method Post -Body $body -ContentType "application/json"
```

---

## Task 8: Login User

```powershell
# Create a session to store cookies
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession

$body = @{
    username = "testuser"
    password = "testpass"
} | ConvertTo-Json

Invoke-WebRequest -Uri http://localhost:5000/customer/login -Method Post -Body $body -ContentType "application/json" -WebSession $session -UseBasicParsing
```

---

## Task 9: Add/Modify Review

```powershell
# Using the same $session from login
$reviewBody = @{
    review = "Great book!"
} | ConvertTo-Json

Invoke-RestMethod -Uri http://localhost:5000/customer/auth/review/1 -Method Put -Body $reviewBody -ContentType "application/json" -WebSession $session
```

---

## Task 10: Delete Review

```powershell
# Using the same $session from login
Invoke-RestMethod -Uri http://localhost:5000/customer/auth/review/1 -Method Delete -WebSession $session
```

---

## Complete Test Flow (All in One)

```powershell
# 1. Get all books
Write-Host "`n=== Get All Books ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri http://localhost:5000/ -Method Get

# 2. Get book by ISBN
Write-Host "`n=== Get Book by ISBN ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri http://localhost:5000/isbn/1 -Method Get

# 3. Get books by author
Write-Host "`n=== Get Books by Author ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri "http://localhost:5000/author/Jane Austen" -Method Get

# 4. Get books by title
Write-Host "`n=== Get Books by Title ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri "http://localhost:5000/title/Things Fall Apart" -Method Get

# 5. Get book reviews
Write-Host "`n=== Get Book Reviews ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri http://localhost:5000/review/1 -Method Get

# 6. Register user
Write-Host "`n=== Register User ===" -ForegroundColor Cyan
$registerBody = @{
    username = "testuser2"
    password = "testpass2"
} | ConvertTo-Json
Invoke-RestMethod -Uri http://localhost:5000/register -Method Post -Body $registerBody -ContentType "application/json"

# 7. Login
Write-Host "`n=== Login ===" -ForegroundColor Cyan
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$loginBody = @{
    username = "testuser2"
    password = "testpass2"
} | ConvertTo-Json
$loginResponse = Invoke-WebRequest -Uri http://localhost:5000/customer/login -Method Post -Body $loginBody -ContentType "application/json" -WebSession $session -UseBasicParsing
$loginResponse.Content

# 8. Add review
Write-Host "`n=== Add Review ===" -ForegroundColor Cyan
$reviewBody = @{
    review = "Excellent book! Highly recommended."
} | ConvertTo-Json
Invoke-RestMethod -Uri http://localhost:5000/customer/auth/review/1 -Method Put -Body $reviewBody -ContentType "application/json" -WebSession $session

# 9. Get reviews after adding
Write-Host "`n=== Get Reviews After Adding ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri http://localhost:5000/review/1 -Method Get

# 10. Delete review
Write-Host "`n=== Delete Review ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri http://localhost:5000/customer/auth/review/1 -Method Delete -WebSession $session

# 11. Get reviews after deleting
Write-Host "`n=== Get Reviews After Deleting ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri http://localhost:5000/review/1 -Method Get

Write-Host "`n=== All Tests Completed ===" -ForegroundColor Green
```

---

## Task 11: Async Endpoints

Test the async/await implementations:

```powershell
# Get all books (async)
Write-Host "`n=== Get All Books (Async) ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri http://localhost:5000/async/books -Method Get

# Get book by ISBN (async)
Write-Host "`n=== Get Book by ISBN (Async) ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri http://localhost:5000/async/isbn/1 -Method Get

# Get books by author (async)
Write-Host "`n=== Get Books by Author (Async) ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri "http://localhost:5000/async/author/Jane Austen" -Method Get

# Get books by title (async)
Write-Host "`n=== Get Books by Title (Async) ===" -ForegroundColor Cyan
Invoke-RestMethod -Uri "http://localhost:5000/async/title/Things Fall Apart" -Method Get
```

---

## Notes

1. **Session Management**: The `$session` variable stores cookies for authentication. Make sure to use the same session variable for login and subsequent authenticated requests.

2. **URI Encoding**: PowerShell's `Invoke-RestMethod` automatically handles spaces in URLs, but you can also use `[System.Uri]::EscapeDataString()` for special characters.

3. **Error Handling**: If you get an error, check:
   - Server is running on port 5000
   - No firewall blocking localhost connections
   - Previous request completed successfully (especially login before authenticated requests)

4. **Viewing Full Response**: Use `Invoke-WebRequest` instead of `Invoke-RestMethod` if you want to see headers and status codes:
   ```powershell
   $response = Invoke-WebRequest -Uri http://localhost:5000/ -UseBasicParsing
   $response.StatusCode
   $response.Headers
   $response.Content
   ```

---

## Alternative: Using curl in PowerShell

If you have `curl.exe` installed (comes with Windows 10+), you can use the standard curl commands:

```powershell
# Make sure you're using curl.exe, not the PowerShell alias
curl.exe http://localhost:5000/

# For POST requests
curl.exe -X POST http://localhost:5000/register -H "Content-Type: application/json" -d '{\"username\":\"testuser\",\"password\":\"testpass\"}'
```

---

## Save Output to Files

To save outputs for submission:

```powershell
# Example: Save all books output
Invoke-RestMethod -Uri http://localhost:5000/ -Method Get | ConvertTo-Json -Depth 10 | Out-File -FilePath "getallbooks_output.json"
```
