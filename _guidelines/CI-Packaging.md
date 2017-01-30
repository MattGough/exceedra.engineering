---
layout:     guidelines
title:      "How to write a post"
subtitle:   "wtf is markdown?"
collection: guidelines
---

## Table of Contents
{:.no_toc}

1. Automatic Table of Contents Here
{:toc}

Each time we build the application 'master' branch for any version we package a bunch of things together into a single zip file for delivery.

- Application
- Application Client.Config.xml template
- QFX Client
- Database (tbc)
  - Dacpac
  - Migration scripts
- Websites
    - webservice
    - email alerts
- Email alerts vbs script

All of the above is added to a single zip file that matches the standard folder structure


{% highlight %}


### Get latest versions of all the required files
$productSFTP = "F:\SFTP\Product"

## App
$dirApp = "$($productSFTP)\Application\CI-Builds\"
$filterApp = "SalesPlanner_$($Mj).$($Mn).$($Ptch)_$($Enhancement)_master_$($BuildId)?*.zip"
$latestApp = Get-ChildItem -Path $dirApp -Filter $filterApp | Sort-Object CreationTime  -Descending | Select-Object -First 1
$latestAppZip = (join-path $dirApp $latestApp.name)

## QFX
$dirQFX = "$($productSFTP)\QFX\"
$filterQFX="Exceedra.QFXClient_?*.zip"
$latestQFX = Get-ChildItem -Path $dirQFX -Filter $filterQFX | Sort-Object CreationTime  -Descending | Select-Object -First 1
$latestQFXZip = (join-path $dirQFX $latestQFX.name)

## Database
$dirDatabase = "$($productSFTP)\DB\"
$filterDatabase="Exceedra.Database_?*.zip"
$latestDatabase = Get-ChildItem -Path $dirDatabase -Filter $filterDatabase | Sort-Object CreationTime  -Descending | Select-Object -First 1
$latestDatabaseZip = (join-path $dirDatabase $latestDatabase.name)


## Static install folders (everything in here gets shipped by default)
$staticInstallPath = "F:\Deploy\Packages\install"

write-host "#############################################"
write-host "#######          Where we are         #######"
write-host "#############################################"
write-host ""
write-host "Install folders:" $staticInstallPath
write-host ""
write-host "Output:" $tempDropPath
write-host ""
write-host "App filter:" $filterApp
write-host "App:" $latestAppZip
write-host "QFX:" $latestQFXZip
write-host "Db:" $latestDatabaseZip
write-host ""
write-host "#############################################"
write-host "#############################################"


#copy install structure
Copy-Item -Path $staticInstallPath -Destination $tempDropPath  -recurse

#copy latest app from CI drop folder
Copy-Item -Path $latestAppZip -Destination (join-path $tempDropPath "Install\App\")

#copy latest QFX from CI drop folder
Copy-Item -Path $latestQFXZip -Destination (join-path $tempDropPath "Install\")

#copy latest Db from CI drop folder
##Copy-Item -Path $latestDatabaseZip -Destination $tempDropPath



#delete zip if it already exists, should never happen!
If(Test-path $destination)
{
	Remove-item $destination
}

[io.compression.zipfile]::CreateFromDirectory($tempDropPath, $destination)


#Remove Build temp folders
Remove-Item  $tempDropPath -recurse

{ % endhighlight %}