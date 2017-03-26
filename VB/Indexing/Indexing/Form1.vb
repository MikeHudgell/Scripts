Public Class frmMain
    Public CarColourBM(100000000) As Integer
    Public CombinedBM(100000000) As Integer
    Public ResultSet(100000000) As Integer
    Public RecordCount As Integer
    Public ResultCount As Integer
    Private Sub frmMain_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub cmdBuildBitmap_Click(sender As Object, e As EventArgs) Handles cmdBuildBitmap.Click
        Dim inner, outer As Double
        Dim rs As New ADODB.Recordset
        Dim cn As New ADODB.Connection
        Dim sqlString As String
        Dim startkey, TempInt As Integer

        cn.ConnectionString = "provider=sqloledb;server=localhost;database=indexassignment;Trusted_Connection=yes;"
        cn.Open()
        If chkDev.Checked = False Then
            rs.MaxRecords = 1000000
            rs.CursorLocation = ADODB.CursorLocationEnum.adUseClient
            rs.CursorType = ADODB.CursorTypeEnum.adOpenStatic
            rs.LockType = ADODB.LockTypeEnum.adLockReadOnly
            startkey = 1

            For outer = 1 To 100
                inner = 0
                sqlString = "Select CustomerId, Gender, CarColour, CarType, Active from dbo.CustomerDimensionIndex where CustomerId >=" + Str(startkey)
                sqlString = sqlString + " and customerId <=" + Str(outer * 1000000) + " Order By CustomerId"

                rs.Open(sqlString, cn)
                If Not (rs.EOF And rs.BOF) Then

                    'RecordCount = rs.RecordCount
                    rs.MoveFirst()
                    Do Until rs.EOF = True
                        If rs.Fields(4).Value = False Then
                            CombinedBM(inner + startkey) = 0        ' 0000000000
                        Else
                            CombinedBM(inner + startkey) = 1        ' 0000000001
                        End If
                        Select Case rs.Fields(1).Value
                            Case "Male"
                                TempInt = 1                         ' 0000000001
                            Case "Female"
                                TempInt = 2                         ' 0000000010 
                            Case "Other"
                                TempInt = 4                         ' 0000000100
                        End Select
                        TempInt = TempInt << 1
                        CombinedBM(inner + startkey) = CombinedBM(inner + startkey) + TempInt
                        TempInt = CombinedBM(inner + startkey)
                        Select Case rs.Fields(3).Value
                            Case " 4x4"
                                TempInt = 1      ' 0000000001
                            Case "Convertible"
                                TempInt = 2      ' 0000000010 
                            Case "Estate"
                                TempInt = 4      ' 0000000100
                            Case "Kit"
                                TempInt = 8      ' 0000001000
                            Case "Saloon"
                                TempInt = 16     ' 0000010000
                            Case "SUV"
                                TempInt = 32     ' 0000100000
                        End Select
                        TempInt = TempInt << 4
                        CombinedBM(inner + startkey) = CombinedBM(inner + startkey) + TempInt
                        TempInt = CombinedBM(inner + startkey)
                        Select Case rs.Fields(2).Value
                            Case "Black"
                                TempInt = 1      ' 0000000001
                            Case "Blue"
                                TempInt = 2   ' 0000000010 
                            Case "Brown"
                                TempInt = 4     ' 0000000100
                            Case "Green"
                                TempInt = 8     ' 0000001000
                            Case "Gray"
                                TempInt = 16    ' 0000010000
                            Case "Orange"
                                TempInt = 32     ' 0000100000
                            Case "Red"
                                TempInt = 64     ' 0001000000
                            Case "Silver"
                                TempInt = 128    ' 0010000000
                            Case "White"
                                TempInt = 256    ' 0100000000
                            Case "Yellow"
                                TempInt = 512    ' 1000000000
                        End Select
                        CarColourBM(inner + startkey) = TempInt
                        TempInt = TempInt << 10
                        CombinedBM(inner + startkey) = CombinedBM(inner + startkey) + TempInt
                        TempInt = CombinedBM(inner + startkey)

                        inner = inner + 1
                        rs.MoveNext()
                    Loop
                    startkey = startkey + 1000000
                    'MsgBox("Bitmap Index Created.")
                Else
                    MsgBox("There are no records in table.")
                End If
                rs.Close()
                rs.ActiveConnection = Nothing
                lblBMProgress.Text = Str(outer * 1000000)
                lblBMProgress.Refresh()
            Next outer
        Else
            rs.MaxRecords = 240
            rs.CursorLocation = ADODB.CursorLocationEnum.adUseClient
            rs.CursorType = ADODB.CursorTypeEnum.adOpenStatic
            rs.LockType = ADODB.LockTypeEnum.adLockReadOnly
            startkey = 1

            sqlString = "Select CustomerId, Gender, CarColour, CarType, Active from dbo.CustomerDimensionDev Order By CustomerId"
            rs.Open(sqlString, cn)
            If Not (rs.EOF And rs.BOF) Then
                rs.MoveFirst()
                Do Until rs.EOF = True
                    If rs.Fields(4).Value = False Then
                        CombinedBM(startkey) = 0        ' 0000000000
                    Else
                        CombinedBM(startkey) = 1        ' 0000000001
                    End If
                    Select Case rs.Fields(1).Value
                        Case "Male"
                            TempInt = 1                         ' 0000000001
                        Case "Female"
                            TempInt = 2                         ' 0000000010 
                        Case "Other"
                            TempInt = 4                         ' 0000000100
                    End Select
                    TempInt = TempInt << 1
                    CombinedBM(startkey) = CombinedBM(startkey) + TempInt
                    TempInt = CombinedBM(startkey)
                    Select Case rs.Fields(3).Value
                        Case " 4x4"
                            TempInt = 1      ' 0000000001
                        Case "Convertible"
                            TempInt = 2      ' 0000000010 
                        Case "Estate"
                            TempInt = 4      ' 0000000100
                        Case "Kit"
                            TempInt = 8      ' 0000001000
                        Case "Saloon"
                            TempInt = 16     ' 0000010000
                        Case "SUV"
                            TempInt = 32     ' 0000100000
                    End Select
                    TempInt = TempInt << 4
                    CombinedBM(startkey) = CombinedBM(startkey) + TempInt
                    TempInt = CombinedBM(startkey)
                    Select Case rs.Fields(2).Value
                        Case "Black"
                            TempInt = 1      ' 0000000001
                        Case "Blue"
                            TempInt = 2   ' 0000000010 
                        Case "Brown"
                            TempInt = 4     ' 0000000100
                        Case "Green"
                            TempInt = 8     ' 0000001000
                        Case "Gray"
                            TempInt = 16    ' 0000010000
                        Case "Orange"
                            TempInt = 32     ' 0000100000
                        Case "Red"
                            TempInt = 64     ' 0001000000
                        Case "Silver"
                            TempInt = 128    ' 0010000000
                        Case "White"
                            TempInt = 256    ' 0100000000
                        Case "Yellow"
                            TempInt = 512    ' 1000000000            
                    End Select
                    CarColourBM(startkey) = TempInt
                    TempInt = TempInt << 10
                    CombinedBM(startkey) = CombinedBM(startkey) + TempInt
                    TempInt = CombinedBM(inner + startkey)
                    startkey = startkey + 1
                    rs.MoveNext()
                Loop
            Else
                MsgBox("There are no records in table.")
            End If
            rs.Close()
            rs.ActiveConnection = Nothing
            lblBMProgress.Text = Str(startkey - 1)
            lblBMProgress.Refresh()
        End If




        cn.Close()

    End Sub

    Private Sub cmdTestBM1_Click(sender As Object, e As EventArgs) Handles cmdTestBM1.Click

        Dim n As Double
        Dim loopx As Integer

        ResultCount = 1
        If chkDev.Checked = False Then
            loopx = 100000000
        Else
            loopx = 240
        End If
        lblBMStart.Text = Now() + "." + Trim(Str(Now().Millisecond))
        For n = 1 To loopx
            If CarColourBM(n) = 64 Then '0001000000
                ResultSet(ResultCount) = n
                ResultCount = ResultCount + 1
                'Me.lstBM.Items.Add(Str(n))
            End If
        Next n
        ResultCount = ResultCount - 1
        lblBMEnd.Text = Now() + "." + Str(Now().Millisecond)
        lblResultCount.Text = (Str(ResultCount))
    End Sub

    Private Sub cmdTestSQL1_Click(sender As Object, e As EventArgs) Handles cmdTestSQL1.Click


        Dim sqlString As String

        If chkDev.Checked = True Then
            sqlString = "select CustomerID from dbo.CustomerDimensionDev where CarColour = 'Red'"
        Else
            sqlString = "select CustomerID from dbo.CustomerDimensionScan where CarColour = 'Red'"
        End If

        Call runQuery(sqlString)

    End Sub


    Private Sub btnResults_Click(sender As Object, e As EventArgs) Handles btnResults.Click
        Dim n As Double
        For n = 1 To ResultCount
            Me.lstBM.Items.Add(Str(ResultSet(n)))
        Next n
    End Sub

    Private Sub cmdTestSQLIndex1_Click(sender As Object, e As EventArgs) Handles cmdTestSQLIndex1.Click

        Dim sqlString As String

        sqlString = "select CustomerID from dbo.CustomerDimensionIndex where CarColour = 'Red'"
        Call runQuery(sqlString)

    End Sub

    Private Sub cmdTestSQL2_Click(sender As Object, e As EventArgs) Handles cmdTestSQL2.Click
        Dim SQLString As String
        If chkDev.Checked = True Then
            SQLString = "select CustomerID from dbo.CustomerDimensionDev where (CarColour = 'White' and CarType = 'SUV') or "
            SQLString = SQLString + "(CarColour = 'Green' and CarType = 'Kit')"
        Else
            SQLString = "select CustomerID from dbo.CustomerDimensionScan where (CarColour = 'White' and CarType = 'SUV') or "
            SQLString = SQLString + "(CarColour = 'Green' and CarType = 'Kit')"
        End If
        Call runQuery(SQLString)

    End Sub

    Sub runQuery(Sql As String)
        Dim rs As New ADODB.Recordset
        Dim cn As New ADODB.Connection
        Dim x As Integer

        lblBMStart.Text = Now() + "." + Trim(Str(Now().Millisecond))
        lblBMStart.Refresh()
        cn.ConnectionString = "provider=sqloledb;server=localhost;database=indexassignment;Trusted_Connection=yes;"
        cn.CommandTimeout = 0
        cn.Open()

        rs.CursorLocation = ADODB.CursorLocationEnum.adUseClient
        rs.CursorType = ADODB.CursorTypeEnum.adOpenStatic
        rs.LockType = ADODB.LockTypeEnum.adLockBatchOptimistic
        rs.Open(Sql, cn)
        If Not (rs.EOF And rs.BOF) Then
            ResultCount = rs.RecordCount
            lblBMEnd.Text = Now() + "." + Trim(Str(Now().Millisecond))
            lblBMEnd.Refresh()
            lblResultCount.Text = (Str(ResultCount))
            rs.MoveFirst()
            x = 1
            Do Until rs.EOF = True
                ResultSet(x) = rs.Fields(0).Value
                x = x + 1
                rs.MoveNext()
            Loop
        End If

        rs.Close()
        rs.ActiveConnection = Nothing
        cn.Close()

    End Sub

    Private Sub cmdTestSQL3_Click(sender As Object, e As EventArgs) Handles cmdTestSQL3.Click

        Dim SQLString As String
        If chkDev.Checked = True Then
            SQLString = "select CustomerID from dbo.CustomerDimensionDev where Active = 1 and Gender = 'Female' and "
            SQLString = SQLString + "((CarColour = 'Blue' and CarType = ' 4x4') or (CarColour <> 'Red' and CarType = 'Estate'))"
        Else
            SQLString = "select CustomerID from dbo.CustomerDimensionScan where Active = 1 and Gender = 'Female' and "
            SQLString = SQLString + "((CarColour = 'Blue' and CarType = ' 4x4') or (CarColour <> 'Red' and CarType = 'Estate'))"
        End If
        Call runQuery(SQLString)

    End Sub

    Private Sub cmdTestSQLIndex2_Click(sender As Object, e As EventArgs) Handles cmdTestSQLIndex2.Click
        Dim SQLString As String

        SQLString = "select CustomerID from dbo.CustomerDimensionIndex where (CarColour = 'White' and CarType = 'SUV') or "
        SQLString = SQLString + "(CarColour = 'Green' and CarType = 'Kit')"

        Call runQuery(SQLString)
    End Sub

    Private Sub cmdTestSQLIndex3_Click(sender As Object, e As EventArgs) Handles cmdTestSQLIndex3.Click
        Dim SQLString As String

        SQLString = "select CustomerID from dbo.CustomerDimensionIndex where Active = 1 and Gender = 'Female' and "
        SQLString = SQLString + "((CarColour = 'Blue' and CarType = ' 4x4') or (CarColour <> 'Red' and CarType = 'Estate'))"

        Call runQuery(SQLString)
    End Sub

    Private Sub lstBM_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstBM.SelectedIndexChanged

        Dim sqlString As String
        Dim resultString
        Dim rs As New ADODB.Recordset
        Dim cn As New ADODB.Connection

        'MsgBox(lstBM.Items(lstBM.SelectedIndex))
        cn.ConnectionString = "provider=sqloledb;server=localhost;database=indexassignment;Trusted_Connection=yes;"
        cn.Open()
        rs.CursorLocation = ADODB.CursorLocationEnum.adUseClient
        rs.CursorType = ADODB.CursorTypeEnum.adOpenStatic
        rs.LockType = ADODB.LockTypeEnum.adLockReadOnly
        If chkDev.Checked = True Then
            sqlString = "Select * from dbo.CustomerDimensionDev where CustomerId = " + lstBM.Items(lstBM.SelectedIndex)
        Else
            sqlString = "Select * from dbo.CustomerDimensionIndex where CustomerId = " + lstBM.Items(lstBM.SelectedIndex)
        End If
        rs.Open(sqlString, cn)
        If Not (rs.EOF And rs.BOF) Then
            resultString = "Detail:-"
            resultString = resultString + "Id: " + Str(rs.Fields(0).Value) + vbCrLf
            resultString = resultString + "Surname: " + rs.Fields(1).Value + vbCrLf
            resultString = resultString + "Gender: " + rs.Fields(2).Value + vbCrLf
            resultString = resultString + "Colour: " + rs.Fields(4).Value + vbCrLf
            resultString = resultString + "Type: " + rs.Fields(5).Value + vbCrLf
            resultString = resultString + "Active: " + Str(rs.Fields(6).Value)
        End If
        MsgBox(resultString)
        rs.Close()
        rs.ActiveConnection = Nothing
        cn.Close()

    End Sub

    Private Sub cmdTestBM2_Click(sender As Object, e As EventArgs) Handles cmdTestBM2.Click
        Dim matcha, matchb, loopx As Integer
        Dim n As Double
        ResultCount = 1
        matcha = 262656
        matchb = 8320
        If chkDev.Checked = False Then
            loopx = 100000000
        Else
            loopx = 240
        End If
        lblBMStart.Text = Now() + "." + Trim(Str(Now().Millisecond))
        For n = 1 To loopx
            If (CombinedBM(n) And matcha) = matcha Or (CombinedBM(n) And matchb) = matchb Then
                'ResultSet(ResultCount) = n
                ResultSet(ResultCount) = n
                ResultCount = ResultCount + 1
            End If
        Next n
        ResultCount = ResultCount - 1
        lblBMEnd.Text = Now() + "." + Trim(Str(Now().Millisecond))
        lblResultCount.Text = (Str(ResultCount))
    End Sub

    Private Sub cmdTestBM3_Click(sender As Object, e As EventArgs) Handles cmdTestBM3.Click
        Dim Matcha, Matchb, Matchc, loopx As Integer
        Dim n As Double

        ResultCount = 1
        Matcha = 2064 ' blue 4x4s
        Matchb = 64 ' estate
        Matchc = 5 ' Active female customers
        If chkDev.Checked = False Then
            loopx = 100000000
        Else
            loopx = 240
        End If
        lblBMStart.Text = Now() + "." + Trim(Str(Now().Millisecond))
        For n = 1 To loopx
            ' if bitmap = active females and (blue 4x4) or (not red estates)
            If ((CombinedBM(n) And Matchc) = Matchc) Then
                If (((CombinedBM(n) And Matcha) = Matcha) Or _
                 (((CombinedBM(n) And Matchb) = Matchb) And ((CombinedBM(n) And 65536) = 0))) Then
                    ResultSet(ResultCount) = n
                    ResultCount = ResultCount + 1
                End If
            'If ((CombinedBM(n) And Matchc) = Matchc) And _
            '    (((CombinedBM(n) And Matcha) = Matcha) Or _
            '    (((CombinedBM(n) And Matchb) = Matchb) And ((CombinedBM(n) And 65536) = 0))) Then
            'ResultSet(ResultCount) = n
            'ResultCount = ResultCount + 1
            End If
        Next n
        ResultCount = ResultCount - 1
        lblBMEnd.Text = Now() + "." + Trim(Str(Now().Millisecond))
        lblResultCount.Text = (Str(ResultCount))
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim Matcha, Matchb, ResultCount As Integer

        Matcha = 2064 ' blue 4x4s
        Matchb = 64 ' estate

        lblBMStart.Text = Now() + "." + Trim(Str(Now().Millisecond))
        For n = 1 To 100000000
            ' if bitmap = active females and (blue 4x4) or (not red estates)
            For x = 1 To 550
                If ((Matcha And Matchb) = Matcha) Then
                    ResultCount = ResultCount + 1
                End If
            Next
        Next n
        lblBMEnd.Text = Now() + "." + Trim(Str(Now().Millisecond))
        lblResultCount.Text = (Str(ResultCount))
    End Sub
End Class
