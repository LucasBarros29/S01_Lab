Dim peso As Integer
Dim agua As Integer

Dim ideal As Integer
Dim H20 As Integer = 35


Print "--Registro de saude--"
Print "Digite seu peso (Kg): "
Input peso

Print "Digite quanto de agua e ingerido (ml): "
Input agua

ideal = peso * H20

if agua >= ideal Then
    Print "Meta atingida!"
else
    Print "Meta nao atingida"
End if
Sleep
