#####################################################################
#######          Script Creado por Javier Jara Araya          #######
#######    Utilizado para crear una organizacion de Empresa   #######
#######                28/03/2022 - Actualidad                #######
#####################################################################

$ruta = (Get-ADDomain).DistinguishedName

#Se debe realizar un Update porque por defecto un servidor no tiene instalado los cmdlet de AD
Update-Help
#Unidades Organizativas para la creacion de empresa, usuario y maquinas
$Usuarios = New-ADOrganizationalUnit -Name usuarios -Path $ruta
$maquinas = New-ADOrganizationalUnit -Name maquinas -Path $ruta
$Usuarios ; $maquinas

#Todos los usuario y maquinas para la empresa
#Los nombres pueden cambiar

#Definir una variable para la contraseña de cada usuario
$grupos = @('NAFT-Planta0','NAFT-Planta1','NAFT-Planta2','NAFT-Planta3')

for($i=0;$i -le $grupos.Length -1 ;$i++){

    $grupo = $grupos[$i]
     $ejecutar = New-ADOrganizationalUnit -Name $grupo -Path "OU=usuarios,$ruta" 
     New-ADGroup -GroupCategory Security -GroupScope Global -Name $grupo -Path "OU=$grupo,OU=usuarios,$ruta"
  
     for($n=1; $n -le 10; $n++){
     
        $crearUser =$grupo+"-"+("{0:D2}"-f$n)
        $contrasena = "Usuario@1"
        New-ADUser -Name $crearUser -AccountPassword(ConvertTo-SecureString -AsPlainText $contrasena -Force) -Enabled $true -Path "OU=$grupo,OU=usuarios,$ruta"
        Add-ADGroupMember -Identity $grupo -Members $crearUser
        }

}

#Maquinas de cada usuario

$OUmas = @('NAFT-Planta0','NAFT-Planta1','NAFT-Planta2')

for($i=0;$i -le $OUmas.Length -1 ;$i++){

    $NEW = $OUmas[$i]
     $OUmaquinas = New-ADOrganizationalUnit -Name $NEW -Path "OU=maquinas,$ruta" 
        
        for($n=1; $n -le 10; $n++){
     
        $crearO =$NEW+"-"+("{0:D2}"-f$n)
        New-ADComputer -Name $crearO -Path "OU=$NEW,OU=maquinas,$ruta"
        }

}