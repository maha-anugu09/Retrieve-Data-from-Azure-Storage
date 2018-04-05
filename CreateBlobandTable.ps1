param(
[string]$SubscriptionName = "Pay-As-You-Go",
[string]$ResourceGroupName = "LearnVest",
[string]$StorageAccountName = "smartdev",
[string]$StorageAccountKey = "7DzDIqliR8GIQJ+DIEwlKQSYMiEALZ5jPyNWyesnM8ZL56fU0hxGvCnSHU7eIOAdOtZsK3xd8Z8iAJFUCm50fw==",
[string]$ContainerName = "smartcontainer",
[string]$TableName = "testtable",
[string]$partitionKey1 = "partition1",
[string]$partitionKey2 = "partition2"
)

$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey

# Add your Azure account to the local PowerShell environment.
Add-AzureRMAccount

# Set default Azure subscription.
Get-AzureRmSubscription -SubscriptionName $SubscriptionName | Select-AzureRmSubscription

#Get the Resource Group
Get-AzureRmResourceGroup -Name $ResourceGroupName

# Get the Storage Account
Get-AzureRmStorageAccount -Name $StorageAccountName -ResourceGroupName $ResourceGroupName

# Create a Container
New-AzureStorageContainer -Name $ContainerName -Context $ctx -Permission Blob

# Upload a file into a container.
Set-AzureStorageBlobContent -File "C:\Users\Mahalaxmi.Anugu\Desktop\Dipak\DBnames.txt" -Container $ContainerName -Blob "Data.txt" -Context $ctx 

# upload another file
Set-AzureStorageBlobContent -File "C:\Users\Mahalaxmi.Anugu\Desktop\Ashok\common.js" -Container $ContainerName -Blob "common.js" -Context $ctx

# Create a table
New-AzureStorageTable –Name $TableName –Context $ctx

# List all blobs in a container.
Get-AzureStorageBlob -Container $ContainerName -Context $ctx

#Get the table storage 
$StorageTable = Get-AzureStorageTable -Name $TableName -Context $ctx


# add four rows 
Add-StorageTableRow -table $storageTable -partitionKey $partitionKey1 -rowKey ("CA") -property @{"username"="Chris";"userid"=1}

Add-StorageTableRow -table $storageTable -partitionKey $partitionKey2 -rowKey ("NM") -property @{"username"="Jessie";"userid"=2}

Add-StorageTableRow -table $storageTable -partitionKey $partitionKey1 -rowKey ("WA") -property @{"username"="Christine";"userid"=3}

Add-StorageTableRow -table $storageTable -partitionKey $partitionKey2 -rowKey ("TX") -property @{"username"="Steven";"userid"=4}

