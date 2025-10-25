param(
    [Parameter(Mandatory=$true)]
    [string]$PersonalAccessToken,
    [Parameter(Mandatory=$true)]
    [string]$WorkItemId,
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

$orgUrl = "https://ecolaboip.visualstudio.com"
$project = "Dynamics 365 Convergence"

$headers = @{
    "Authorization" = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$PersonalAccessToken"))
    "Content-Type" = "application/octet-stream"
}

if (-not (Test-Path $FilePath)) {
    Write-Error "File not found: $FilePath"
    exit 1
}

$fileName = [System.IO.Path]::GetFileName($FilePath)
$fileContent = [System.IO.File]::ReadAllBytes($FilePath)

Write-Host "Uploading file: $fileName to work item: $WorkItemId"

# Upload the attachment
$uploadUrl = "$orgUrl/$project/_apis/wit/attachments?fileName=$fileName&api-version=7.1-preview.3"
$uploadResponse = Invoke-RestMethod -Uri $uploadUrl -Method Post -Headers $headers -Body $fileContent

Write-Host "File uploaded successfully. Attaching to work item..."

# Attach it to the work item
$attachmentUrl = $uploadResponse.url
$attachBody = @"
[
  {
    "op": "add",
    "path": "/relations/-",
    "value": {
      "rel": "AttachedFile",
      "url": "$attachmentUrl",
      "attributes": {
        "name": "$fileName"
      }
    }
  }
]
"@

$updateUrl = "$orgUrl/$project/_apis/wit/workitems/$WorkItemId/?api-version=7.1-preview.3"
$updateHeaders = @{
    "Authorization" = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$PersonalAccessToken"))
    "Content-Type" = "application/json-patch+json"
}

Invoke-RestMethod -Uri $updateUrl -Method Patch -Headers $updateHeaders -Body $attachBody

Write-Host "File '$fileName' attached successfully to work item $WorkItemId"
