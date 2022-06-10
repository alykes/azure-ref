# Log in first with Connect-AzAccount if not using Cloud Shell
$azContext = Get-AzContext
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile
$profileClient = New-Object -TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -ArgumentList ($azProfile)
$token = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)
$SubscriptionID = (Get-AzContext).Subscription.id
$authHeader = @{
    'Content-Type'='application/json'
    'Authorization'='Bearer ' + $token.AccessToken
}
#$body = @'
#{
#    "subscriptions": [
#        "${SubscriptionID}"
#    ],
#    "query": "Resources | project name, type | limit 10"
#}
#'@

$ResourceGroups = Get-AzResourceGroup

foreach ($ResourceGroup in $ResourceGroups)
{
    Write-Verbose ("Found Resource Group: " + $ResourceGroup.ResourceGroupName)

    $Resources = Get-AzResource -ResourceGroupName $ResourceGroup.ResourceGroupName

    foreach ($Resource in $Resources)
    {
        Write-Verbose ($Resource.Name + " is of resource type: " + $Resource.ResourceType)
        If ($Resource.ResourceType -eq "Microsoft.AppConfiguration/configurationStores")
        {
        Write-Output ("Displaying AppConfigName: " + $Resource.Name)

        Get-AzAppConfigurationStore -ResourceGroupName $Resource.ResourceGroupName -Name $Resource.Name
        sleep 1
        Write-Host ("           Sub ID: " + $SubscriptionID)
        Write-Host ("       Group Name: " + $Resource.ResourceGroupName)
        Write-Host ("   Resource Name : " + $Resource.Name)
        Write-Host ("Resource Location: " + $Resource.Location)

        $APIMethod = "Get"

        $restUri = "https://management.azure.com/subscriptions/"+$SubscriptionID+"/resourceGroups/"+$Resource.ResourceGroupName+"/providers/Microsoft.AppConfiguration/configurationStores/"+$Resource.Name+"?api-version=2022-05-01"
        $response = Invoke-RestMethod -Uri $restUri -Method $APIMethod -Headers $authHeader

        }

    }

}
echo $response

# Invoke the REST API

# Get Information about the AppConfigurationStore
#$restUri = "https://management.azure.com/subscriptions/"+$SubscriptionID+"/resourceGroups/"+$Resource.ResourceGroupName+"/providers/Microsoft.AppConfiguration/configurationStores/"+$Resource.Name+"?api-version=2022-05-01"
#$response = Invoke-RestMethod -Uri $restUri -Method Get -Headers $authHeader

# Delete the AppConfigurationStore
#$restUri = "https://management.azure.com/subscriptions/"+$SubscriptionID+"/resourceGroups/"+$Resource.ResourceGroupName+"/providers/Microsoft.AppConfiguration/configurationStores/"+$Resource.Name+"?api-version=2022-05-01"
#$response = Invoke-RestMethod -Uri $restUri -Method Delete -Headers $authHeader

# Purge the AppConfigurationStore
#$restUri = "https://management.azure.com/subscriptions/"+$SubscriptionID+"/providers/Microsoft.AppConfiguration/locations/{location}/deletedConfigurationStores/"+$Resource.Name+"/purge?api-version=2022-05-01"
#$response = Invoke-RestMethod -Uri $restUri -Method Post -Headers $authHeader

# List Deleted AppConfigurationStore
#$response = "https://management.azure.com/subscriptions/"+$SubscriptionID+"/providers/Microsoft.AppConfiguration/deletedConfigurationStores?api-version=2022-05-01"
#echo $response

# Testing
# $restUri = 'https://management.azure.com/providers/Microsoft.ResourceGraph/resources?api-version=2021-03-01'
# $response = Invoke-RestMethod -Uri $restUri -Method Post -Headers $authHeader -Body $body
