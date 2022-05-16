### Switching between Azure subscriptions

- Obtain a list of subscriptions and their IDs  
```
Get-AzSubscription
```

- To switch context, use the following steps  
```
$context = Get-AzSubscription -SubscriptionId <some-guid>
Set-AzContext $context
```
