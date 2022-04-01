#####################################################################
#######          Script Creado por Javier Jara Araya          #######
#######    Utilizado para crear una organizacion de Empresa   #######
#######                       28/03/2022                      #######
#####################################################################

$ruta = (Get-ADDomain).DistinguishedName
#Mostamos la variable $ruta
echo $ruta
#Se debe realizar un Update porque por defecto un servidor no tiene instalado los cmdlet de AD
Update-Help
#Unidades Organizativas para la creacion de empresa, usuario y maquinas
$Usuarios = New-ADOrganizationalUnit -Name usuarios -Path $ruta
$Maquinas = New-ADOrganizationalUnit -Name maquinas -Path $ruta

#Todos los usuario y maquinas para la empresa
#Los nombres pueden cambiar

#Definir una variable para la contraseña de cada usuario
$contrasena = "Usuario@1"

$empresa = @('Planta0','Planta1','Planta2','Planta3')

for ($i=0;$i -le $empresa.Length -1;$i++){

    $empre = $empresa[$i]
    New-ADOrganizationalUnit -Name $empre -Path "OU=Usuarios.$ruta"
    New-ADGroup -GroupCategory Security -GroupScope Global -Name $empre -Path "OU=$empre,OU=Usuarios.$ruta"

    for($n=1;$n -le 10;$n++){
        $CrearUser = $empre=("{O:D2}" -f $n)
        #El usuario al ingresar debe cambiar la contraseña 
        New-ADUser -Name $CrearUser -AccountPassword(ConvertTo-SecureString -AsPlainText $contrasena -Force) -Enabled $true -ChangePasswordAtLogon 1 -Path "OU=$empre,OU=Usuarios.$ruta"
        Add-ADGroupMember -Identity $empre -Members $CrearUser
    }
}

#Maquinas de cada usuario

$Maquina = @('A01','A02','A03','A04','A05','A06')

for($i=0;$i -le $Maquina.Length -1;$i++){
    $NEW = $Maquina[$i]
    $OUMaquinas = New-ADOrganizationalUnit -Name $NEW -Path "OU=Maquinas.Ruta"

    for(for($x=1;$x -le 10;$x++){
        $CrearO = $NEW=("{O:D2}" -f $n)
        New-ADComputer -Name $CrearO -Path "OU=$NEW,OU=maquinas.$ruta"
        
    }
}
