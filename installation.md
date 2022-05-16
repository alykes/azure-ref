- #### Install the latest version of powershell  
Grab the lastest version of powershell from here  
https://github.com/PowerShell/PowerShell  

Check your powershell version  
```$PSVersionTable.PSVersion```

  
- #### Installation of az powershell module

Run powershell as an administrator  

```Install-Module -Name Az -AllowClobber -Repository PSGallery```  

```Install-Module -Name Az -AllowClobber -Repository PSGallery -Force```

Check the installed version of the Az module  
```Get-InstalledModule -Name Az -AllVersions | Select-Object -Property Name, Version```


- Connect to your Azure account

```Connect-Az```

View your VM resources
```Get-AzVM```

Command reference  
https://docs.microsoft.com/en-us/powershell/module/
