##Visualizar si la caracteristica NPS esta habilitada
Get-WindowsFeature -Name NPAS

##Instalar la caracteristica
Install-WindowsFeature -Name NPAS

##Visualizar si esta hanilitada
Get-WindowsFeature -Name NPAS

##Ver los comandos NPS
Get-Command -Name *NPS*

##Ver si tenemos un cliente radius 
Get-NpsRadiusClient

##Se crea uno teniendo el nombre y la ip
New-NpsRadiusClient -Name 

##
## Export-NpsConfiguration - Exports NPS settings.
## Get-NpsRadiusClient - Gets RADIUS clients.
## Get-NpsRemediationServer - Retrieves a list of remediation servers from a remediation server group.
## Get-NpsRemediationServerGroup - Retrieves all remediation server groups from a Network Policy Server.
## Get-NpsSharedSecretTemplate - Returns a list of available shared secret templates.
## Import-NpsConfiguration - Imports NPS settings.
## New-NpsRadiusClient - Creates a RADIUS client.
## New-NpsRemediationServer - Creates a remediation server.
## New-NpsRemediationServerGroup - Creates a remediation server group.
## Remove-NpsRadiusClient -Removes a RADIUS client.
## Remove-NpsRemediationServer - Removes a remediation server from a remediation server group.
## Remove-NpsRemediationServerGroup - Removes a remediation server group from an NPS.
## Set-NpsRadiusClient - Specifies configuration settings for a RADIUS client.



