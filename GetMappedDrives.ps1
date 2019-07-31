Get-ChildItem "HKCU:Network\" |
    ForEach-Object {
        [PsCustomObject]@{
            User = whoami
            Computer = $env:computername
            DriveLetter = $_.PSChildName
            RemotePath = (Get-ItemProperty $_.PSPath).RemotePath
         }
    } | Export-Csv '\\BE-DC01\MappedDrives\MappedDrives.csv' -Append -NoTypeInformation