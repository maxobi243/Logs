param($evtId)

Get-WinEvent -ListLog * | 
    Select-Object -ExpandProperty LogName | ForEach-Object {
        $log = $_
        try {
            Get-WinEvent -FilterHashtable @{LogName=$log; Id=$evtId} -MaxEvents 1000 -ErrorAction SilentlyContinue
        } catch {}
    }
