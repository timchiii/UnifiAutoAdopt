<#
How to use this script:

1. Create an a host entry on the local DNS server pointing unifi to the unifi controller IP address.
2. Power on the Unifi device to be adopted and allow it a couple minutes to boot.
3. Click adopt when it automatically shows up in the controller.
4. Run "Start-UnifiAutoAdopt.ps1 -IP <IP address of Unifi device to adopt>" 

#>

Param (
    # IP address of Unifi device to adopt
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [string]
    $IP
)

#check PS Version
if($host.Version -lt 5.1) {
    Write-Host Windows Management Framework 5.1 must be installed prior to running this script. See https://www.microsoft.com/en-us/download/details.aspx?id=54616
    Exit
}

#check Posh-SSH installed
if(-not (Get-Command New-SSHSession -ErrorAction SilentlyContinue)) {
    Write-Host Posh-SSH is not installed, installing...
    Install-Module Posh-SSH -Force
}

$pw = "ubnt" | ConvertTo-SecureString -AsPlainText -Force
$cred = New-Object -TypeName System.Mangement.Automation.PSCredential -ArgumentList ("ubnt",$pw)
$sesh = New-SSHSession -ComputerName $IP -Credential $cred -AcceptKey -Force
Invoke-SSHCommand -SessionId $sesh -Command "set-inform http://unifi:8080/inform"