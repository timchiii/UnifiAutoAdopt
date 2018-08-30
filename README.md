# UnifiAutoAdopt
PowerShell script to SSH in to a Unifi device and adopt it.

How to use this script:

1. Create an a host entry on the local DNS server pointing unifi to the unifi controller IP address.
2. Power on the Unifi device to be adopted and allow it a couple minutes to boot. Because of step #1, it will automatically show up in the controller. 
3. Click adopt when it automatically shows up in the controller.
4. Run "Start-UnifiAutoAdopt.ps1 -IP <IP address of Unifi device to adopt>"
  
