### Working with policies

- To store a policy definition as an object  
```$definition = Get-AzPolicyDefinition | Where-Object {$_.Properties.DisplayName -like 'Allowed virtual machine size SKUs'}```  

- To store a resource group as an object  
```$rg = Get-AzResourceGroup -name 'rs.az900.course' -Location 'Australia East'```  

- Attach a policy to a resource group  
```New-AzPolicyAssignment -Name 'Check VM SKU' -DisplayName 'Check VM SKU' -Scope $rg.ResourceId -PolicyDefinition $definition```  


- To kick off a compliance scan on the entire resource group  
```Start-AzPolicyComplianceScan -ResourceGroupName 'rs.az900.course'```  
