@echo off
powershell.exe $path='%~dp0'+'appx\';$arch=$Env:PROCESSOR_ARCHITECTURE;$list=ls -Name $path -Include *.AppxBundle;$vs='vslibs\Microsoft.VCLibs.140.00_14.0.33321.0_';$appx='__8wekyb3d8bbwe.Appx';echo 'Architecture: '$arch;echo $list;if($arch -eq 'AMD64'){Add-AppxPackage -ForceApplicationShutdown -Path $path$vs'x64'$appx;Add-AppxPackage -ForceApplicationShutdown -Path $path$vs'x86'$appx}elseif($arch -eq 'ARM'){Add-AppxPackage -ForceApplicationShutdown -Path $path$vs'arm'$appx}elseif($arch -eq 'ARM64'){Add-AppxPackage -ForceApplicationShutdown -Path $path$vs'arm64'$appx};foreach($f in $list){Add-AppxPackage -ForceApplicationShutdown -Path $path$f}
echo Done!
pause
