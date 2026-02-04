
param($name, $csvFile)

Import-Csv $csvFile | Where-Object {
    $_.technique_name -eq $name
} | Select-Object -ExpandProperty event_id | ForEach-Object {
    $ids = $_
    Get-WinEvent -ListLog * | Select-Object -ExpandProperty LogName | ForEach-Object {
        $logs = $_
        Get-WinEvent -FilterHashtable @{LogName=$logs; Id=$ids} -ErrorAction SilentlyContinue | Format-List
    }
}



