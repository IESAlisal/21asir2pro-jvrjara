#####################################################################
#######          Script Creado por Javier Jara Araya          #######
#######    Utilizado para crear una organizacion de Empresa   #######
#######                       28/03/2022                      #######
#####################################################################

$ruta = (Get-ADDomain) DistinguishedName
#Unidades Organizativas para la creacion de empresa, usuario y maquinas
$Usuarios = New-ADOrganizarionalUnit -Name usuarios -Path $ruta
$Maquinas = New-ADOrganizarionalUnit -Name maquinas -Path $ruta

#Todos los usuario y maquinas para la empresa
#Los nombres pueden cambiar

#Definir una variable para la contraseña de cada usuario
$contraseña = "Usuario@1"

$empresa = @('Planta0','Planta1','Planta2','Planta3')

FOR ($i=0;$i -le $empresa.Length -1;$i++){

    $empre = $empresa[$i]
    New-ADOrganizarionalUnit -Name $empre -Path "OU-Usuarios.$ruta"
    New-ADGroup -GroupCategory Security -GroupScope Global -Name ""
}
