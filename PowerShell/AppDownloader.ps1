#Downloads App usig rg-adguard.net

$apiUrl = "https://store.rg-adguard.net/api/GetFiles"

$productUrl = "https://www.microsoft.com/store/productId/9nblggh5r558" # To Do
#$productUrl = "https://www.microsoft.com/store/productId/9MSPC6MP8FM4" # Whiteboard
#$productUrl = "https://www.microsoft.com/store/productId/9WZDNCRFJBB1" # Wireless Display Adapter

$downloadFolder = Join-Path $env:TEMP "StoreDownloads"
if(!(Test-Path $downloadFolder -PathType Container)) {
    New-Item $downloadFolder -ItemType Directory -Force
}

$body = @{
    type = 'url'
    url  = $productUrl
    ring = 'RP'
    lang = 'en-US'
}

$raw = Invoke-RestMethod -Method Post -Uri $apiUrl -ContentType 'application/x-www-form-urlencoded' -Body $body

$raw | Select-String '<tr style.*<a href=\"(?<url>.*)"\s.*>(?<text>.*)<\/a>' -AllMatches
| % { $_.Matches }
| % { 
    $url = $_.Groups[1].Value
    $text = $_.Groups[2].Value

    if($text -match "_(x64|neutral).*appx(|bundle)$") {
        Write-Host $text $url
        $downloadFile = Join-Path $downloadFolder $text
        Invoke-WebRequest -Uri $url -OutFile $downloadFile
    }
}