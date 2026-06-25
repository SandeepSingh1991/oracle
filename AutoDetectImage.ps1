. "$PSScriptRoot\config.ps1"
Write-Host "Searching latest Ubuntu 24.04 image in $Region..."
$image = oci compute image list --compartment-id $CompartmentId --operating-system "Canonical Ubuntu" --operating-system-version "24.04" --all | ConvertFrom-Json
$latest = $image.data | Sort-Object timeCreated -Descending | Select-Object -First 1
if($latest){
 Write-Host "Latest Image: $($latest.displayName)"
 Write-Host "Image OCID: $($latest.id)"
}else{
 Write-Error "No Ubuntu image found."
}
