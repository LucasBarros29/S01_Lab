Dim senha As String = "1234"
Dim entrada As String
Dim i As Integer

Print "--Central de entrada--"

For i = 1 To 10
    Print "Tentativa "; i; " de 10"
    Print "Digite a senha: "
    Input entrada

    If senha = entrada Then
        Print "Transacao autorizada!"
        Exit For
    Else
        Print "PIN invalido. Tente novamente."
    End If
Next

Sleep
