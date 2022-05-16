### Installation of the Az powershell module

- Run powershell as an administrator  
```Install-Module -Name Az -AllowClobber -Repository PSGallery```  
```Install-Module -Name Az -AllowClobber -Repository PSGallery -Force```

- Check the installed version of the Az module  
```Get-InstalledModule -Name Az -AllVersions | Select-Object -Property Name, Version```


- Connect to your Azure account
```Connect-Az```

- View your VM resources
```Get-AzVM```

_Command reference_  
https://docs.microsoft.com/en-us/powershell/module/
