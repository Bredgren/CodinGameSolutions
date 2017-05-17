Module Solution
    Sub Main ()

        Dim N as Integer
        N = Console.ReadLine()
        Dim strengths(N-1) As Integer
        For i as Integer = 0 To N-1
            Dim Pi as Integer
            Pi = Console.ReadLine()
            strengths(i) = Pi
        Next

        Array.Sort(strengths)

        Dim min = strengths(1) - strengths(0)
        For i as Integer = 1 To N-2
            Dim d = strengths(i+1) - strengths(i)
            if d < min Then
                min = d
            End If
        Next

        Console.WriteLine(min)
    End Sub
End Module

' Write an action using Console.WriteLine()
' To debug: Console.Error.WriteLine("Debug messages...")
