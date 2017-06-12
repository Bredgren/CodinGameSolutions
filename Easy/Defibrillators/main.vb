Module Solution
    Function convertNum(ByVal s As String) As Double
        convertNum = s.Replace(",", ".") / 180 * Math.PI
    End Function

    Sub Main ()
        Dim lonA as Double = convertNum(Console.ReadLine())
        Dim latA as Double = convertNum(Console.ReadLine())
        Dim n as Integer = Console.ReadLine()

        Dim minDist As Double
        Dim answer As String = ""

        For i as Integer = 0 To N-1
            Dim defib() as String
            defib = Console.ReadLine().Split(";")
            Dim lonB As Double = convertNum(defib(4))
            Dim latB As Double = convertNum(defib(5))
            Dim x As Double = (lonB - lonA) * Math.cos((latA + latB) / 2)
            Dim y As Double = latB - latA
            Dim dist As Double = Math.sqrt(x*x + y*y) * 6371
            If (String.Equals(answer, "") or dist < minDist) Then
                minDist = dist
                answer = defib(1)
            End If
        Next

        Console.WriteLine(answer)
        ' To debug: Console.Error.WriteLine("Debug messages...")
    End Sub
End Module
