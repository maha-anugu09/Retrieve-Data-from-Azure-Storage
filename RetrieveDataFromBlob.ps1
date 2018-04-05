param(
[string]$SubscriptionName = "Pay-As-You-Go",
[string]$ResourceGroupName = "LearnVest",
[string]$StorageAccountName = "smartdev",
[string]$StorageAccountKey = "7DzDIqliR8GIQJ+DIEwlKQSYMiEALZ5jPyNWyesnM8ZL56fU0hxGvCnSHU7eIOAdOtZsK3xd8Z8iAJFUCm50fw==",
[string]$ContainerName = "smartcontainer",
)

$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey


# Add your Azure account to the local PowerShell environment.
Add-AzureRMAccount

# Set default Azure subscription.
Get-AzureRmSubscription -SubscriptionName $SubscriptionName | Select-AzureRmSubscription

#Create New Resource Group
Get-AzureRmResourceGroup -Name $ResourceGroupName 

# Create New Storage Account
Get-AzureRmStorageAccount -Name $StorageAccountName -ResourceGroupName $ResourceGroupName

# Get the Container
Get-AzureStorageContainer -Name $ContainerName -Context $ctx -Permission Blob

# List all blobs in a container.
Get-AzureStorageBlob -Container $ContainerName -Context $ctx

# download first blob
Get-AzureStorageBlobContent -Blob "common.js" -Container $containerName -Destination "C:\Users\Mahalaxmi.Anugu\Desktop\KT\" -Context $ctx 

# download another blob
Get-AzureStorageBlobContent -Blob "Data.txt" -Container $containerName -Destination "C:\Users\Mahalaxmi.Anugu\Desktop\KT\" -Context $ctx