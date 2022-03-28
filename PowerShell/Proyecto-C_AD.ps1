#####################################################################
#######          Script Creado por Javier Jara Araya          #######
#######      Instalacion de Servicios de Active Directory     #######
#######                       28/03/2022                      #######
#####################################################################



#Instalar los servicios de dominio Active Directory
Add-WindowsFeature AD-Domain-Services

#Instalar un nuevo bosque y un nuevo dominio
Install-ADDSForest -DomainName "NAFT.local" -InstallDNS

##Te pedira una contraseña

##Luego te pregunta si quieres seguir con la operacion

#Para ver los cmdlets
Get-Command -Module ActiveDirectory |measure-object|select count



