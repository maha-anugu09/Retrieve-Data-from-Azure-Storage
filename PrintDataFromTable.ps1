param(
[string]$SubscriptionName = "Pay-As-You-Go",
[string]$ResourceGroupName = "LearnVest",
[string]$StorageAccountName = "smartdev",
[string]$StorageAccountKey = "7DzDIqliR8GIQJ+DIEwlKQSYMiEALZ5jPyNWyesnM8ZL56fU0hxGvCnSHU7eIOAdOtZsK3xd8Z8iAJFUCm50fw==",
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

#Get the table storage 
$StorageTable = Get-AzureStorageTable -Name $TableName -Context $ctx


Get-AzureStorageTableRowByPartitionKey -table $StorageTable -partitionKey $partitionKey1 | ft



