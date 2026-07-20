# ======== CONFIG ========
$username = "YOUR_USERNAME"
$password = "YOUR_PASSWORD"

$loginUrl = "http://172.16.208.2:8090/httpclient.html"
$server = "172.16.208.2"
$port = 8090
# ========================

# Wait up to 2 minutes for the portal to become reachable
$timeout = 120
$elapsed = 0

while (-not (Test-NetConnection -ComputerName $server -Port $port -InformationLevel Quiet)) {
    Start-Sleep -Seconds 2
    $elapsed += 2

    if ($elapsed -ge $timeout) {
        exit
    }
}

$body = @{
    mode        = "191"
    username    = $username
    password    = $password
    a           = [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()
    producttype = "0"
}

try {
    Invoke-RestMethod `
        -Uri $loginUrl `
        -Method POST `
        -Body $body `
        -ContentType "application/x-www-form-urlencoded" | Out-Null
}
catch {
    # Silently exit if login fails
    exit
}