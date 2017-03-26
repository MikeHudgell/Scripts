<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMain
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmMain))
        Me.cmdBuildBitmap = New System.Windows.Forms.Button()
        Me.cmdTestBM1 = New System.Windows.Forms.Button()
        Me.cmdTestSQL1 = New System.Windows.Forms.Button()
        Me.lblTestBM = New System.Windows.Forms.Label()
        Me.lblTestSQL = New System.Windows.Forms.Label()
        Me.lstBM = New System.Windows.Forms.ListBox()
        Me.btnResults = New System.Windows.Forms.Button()
        Me.lblBMStart = New System.Windows.Forms.Label()
        Me.lblBMEnd = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.lblResultCount = New System.Windows.Forms.Label()
        Me.cmdTestSQLIndex1 = New System.Windows.Forms.Button()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.chkDev = New System.Windows.Forms.CheckBox()
        Me.lblBMProgress = New System.Windows.Forms.Label()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Panel3 = New System.Windows.Forms.Panel()
        Me.cmdTestSQL2 = New System.Windows.Forms.Button()
        Me.cmdTestSQLIndex2 = New System.Windows.Forms.Button()
        Me.cmdTestBM2 = New System.Windows.Forms.Button()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Panel4 = New System.Windows.Forms.Panel()
        Me.cmdTestSQL3 = New System.Windows.Forms.Button()
        Me.cmdTestSQLIndex3 = New System.Windows.Forms.Button()
        Me.cmdTestBM3 = New System.Windows.Forms.Button()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.PictureBox1 = New System.Windows.Forms.PictureBox()
        Me.Panel1.SuspendLayout()
        Me.Panel2.SuspendLayout()
        Me.Panel3.SuspendLayout()
        Me.Panel4.SuspendLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'cmdBuildBitmap
        '
        Me.cmdBuildBitmap.Location = New System.Drawing.Point(15, 36)
        Me.cmdBuildBitmap.Name = "cmdBuildBitmap"
        Me.cmdBuildBitmap.Size = New System.Drawing.Size(102, 32)
        Me.cmdBuildBitmap.TabIndex = 0
        Me.cmdBuildBitmap.Text = "Build Bitmaps"
        Me.cmdBuildBitmap.UseVisualStyleBackColor = True
        '
        'cmdTestBM1
        '
        Me.cmdTestBM1.Location = New System.Drawing.Point(16, 36)
        Me.cmdTestBM1.Name = "cmdTestBM1"
        Me.cmdTestBM1.Size = New System.Drawing.Size(122, 30)
        Me.cmdTestBM1.TabIndex = 1
        Me.cmdTestBM1.Text = "Test Bitmap"
        Me.cmdTestBM1.UseVisualStyleBackColor = True
        '
        'cmdTestSQL1
        '
        Me.cmdTestSQL1.Location = New System.Drawing.Point(270, 36)
        Me.cmdTestSQL1.Name = "cmdTestSQL1"
        Me.cmdTestSQL1.Size = New System.Drawing.Size(131, 30)
        Me.cmdTestSQL1.TabIndex = 2
        Me.cmdTestSQL1.Text = "Test Scan/Dev"
        Me.cmdTestSQL1.UseVisualStyleBackColor = True
        '
        'lblTestBM
        '
        Me.lblTestBM.AutoSize = True
        Me.lblTestBM.Location = New System.Drawing.Point(146, 281)
        Me.lblTestBM.Name = "lblTestBM"
        Me.lblTestBM.Size = New System.Drawing.Size(42, 17)
        Me.lblTestBM.TabIndex = 4
        Me.lblTestBM.Text = "Start:"
        '
        'lblTestSQL
        '
        Me.lblTestSQL.AutoSize = True
        Me.lblTestSQL.Location = New System.Drawing.Point(146, 298)
        Me.lblTestSQL.Name = "lblTestSQL"
        Me.lblTestSQL.Size = New System.Drawing.Size(41, 17)
        Me.lblTestSQL.TabIndex = 5
        Me.lblTestSQL.Text = "Stop:"
        '
        'lstBM
        '
        Me.lstBM.FormattingEnabled = True
        Me.lstBM.ItemHeight = 16
        Me.lstBM.Location = New System.Drawing.Point(437, 314)
        Me.lstBM.Name = "lstBM"
        Me.lstBM.Size = New System.Drawing.Size(254, 276)
        Me.lstBM.TabIndex = 6
        '
        'btnResults
        '
        Me.btnResults.Location = New System.Drawing.Point(437, 274)
        Me.btnResults.Name = "btnResults"
        Me.btnResults.Size = New System.Drawing.Size(254, 30)
        Me.btnResults.TabIndex = 8
        Me.btnResults.Text = "Display Results"
        Me.btnResults.UseVisualStyleBackColor = True
        '
        'lblBMStart
        '
        Me.lblBMStart.AutoSize = True
        Me.lblBMStart.Location = New System.Drawing.Point(184, 281)
        Me.lblBMStart.Name = "lblBMStart"
        Me.lblBMStart.Size = New System.Drawing.Size(16, 17)
        Me.lblBMStart.TabIndex = 9
        Me.lblBMStart.Text = "0"
        '
        'lblBMEnd
        '
        Me.lblBMEnd.AutoSize = True
        Me.lblBMEnd.Location = New System.Drawing.Point(184, 298)
        Me.lblBMEnd.Name = "lblBMEnd"
        Me.lblBMEnd.Size = New System.Drawing.Size(16, 17)
        Me.lblBMEnd.TabIndex = 10
        Me.lblBMEnd.Text = "0"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(146, 325)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(113, 17)
        Me.Label1.TabIndex = 11
        Me.Label1.Text = "Number of Keys:"
        '
        'lblResultCount
        '
        Me.lblResultCount.AutoSize = True
        Me.lblResultCount.Location = New System.Drawing.Point(255, 325)
        Me.lblResultCount.Name = "lblResultCount"
        Me.lblResultCount.Size = New System.Drawing.Size(16, 17)
        Me.lblResultCount.TabIndex = 12
        Me.lblResultCount.Text = "0"
        '
        'cmdTestSQLIndex1
        '
        Me.cmdTestSQLIndex1.Location = New System.Drawing.Point(144, 36)
        Me.cmdTestSQLIndex1.Name = "cmdTestSQLIndex1"
        Me.cmdTestSQLIndex1.Size = New System.Drawing.Size(120, 30)
        Me.cmdTestSQLIndex1.TabIndex = 13
        Me.cmdTestSQLIndex1.Text = "Test NC Index"
        Me.cmdTestSQLIndex1.UseVisualStyleBackColor = True
        '
        'Panel1
        '
        Me.Panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel1.Controls.Add(Me.chkDev)
        Me.Panel1.Controls.Add(Me.Button1)
        Me.Panel1.Controls.Add(Me.lblBMProgress)
        Me.Panel1.Controls.Add(Me.cmdBuildBitmap)
        Me.Panel1.Location = New System.Drawing.Point(12, 12)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(131, 246)
        Me.Panel1.TabIndex = 16
        '
        'chkDev
        '
        Me.chkDev.AutoSize = True
        Me.chkDev.Location = New System.Drawing.Point(15, 9)
        Me.chkDev.Name = "chkDev"
        Me.chkDev.Size = New System.Drawing.Size(94, 21)
        Me.chkDev.TabIndex = 2
        Me.chkDev.Text = "Dev Mode"
        Me.chkDev.UseVisualStyleBackColor = True
        '
        'lblBMProgress
        '
        Me.lblBMProgress.AutoSize = True
        Me.lblBMProgress.Location = New System.Drawing.Point(12, 73)
        Me.lblBMProgress.Name = "lblBMProgress"
        Me.lblBMProgress.Size = New System.Drawing.Size(16, 17)
        Me.lblBMProgress.TabIndex = 1
        Me.lblBMProgress.Text = "0"
        '
        'Panel2
        '
        Me.Panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel2.Controls.Add(Me.Label2)
        Me.Panel2.Controls.Add(Me.cmdTestBM1)
        Me.Panel2.Controls.Add(Me.cmdTestSQL1)
        Me.Panel2.Controls.Add(Me.cmdTestSQLIndex1)
        Me.Panel2.Location = New System.Drawing.Point(149, 12)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(542, 78)
        Me.Panel2.TabIndex = 17
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(4, 7)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(189, 17)
        Me.Label2.TabIndex = 0
        Me.Label2.Text = "Customers with Red Cars"
        '
        'Panel3
        '
        Me.Panel3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel3.Controls.Add(Me.cmdTestSQL2)
        Me.Panel3.Controls.Add(Me.cmdTestSQLIndex2)
        Me.Panel3.Controls.Add(Me.cmdTestBM2)
        Me.Panel3.Controls.Add(Me.Label3)
        Me.Panel3.Location = New System.Drawing.Point(149, 96)
        Me.Panel3.Name = "Panel3"
        Me.Panel3.Size = New System.Drawing.Size(542, 78)
        Me.Panel3.TabIndex = 18
        '
        'cmdTestSQL2
        '
        Me.cmdTestSQL2.Location = New System.Drawing.Point(270, 29)
        Me.cmdTestSQL2.Name = "cmdTestSQL2"
        Me.cmdTestSQL2.Size = New System.Drawing.Size(131, 30)
        Me.cmdTestSQL2.TabIndex = 15
        Me.cmdTestSQL2.Text = "Test Scan/Dev"
        Me.cmdTestSQL2.UseVisualStyleBackColor = True
        '
        'cmdTestSQLIndex2
        '
        Me.cmdTestSQLIndex2.Location = New System.Drawing.Point(144, 29)
        Me.cmdTestSQLIndex2.Name = "cmdTestSQLIndex2"
        Me.cmdTestSQLIndex2.Size = New System.Drawing.Size(120, 30)
        Me.cmdTestSQLIndex2.TabIndex = 14
        Me.cmdTestSQLIndex2.Text = "Test NC Index"
        Me.cmdTestSQLIndex2.UseVisualStyleBackColor = True
        '
        'cmdTestBM2
        '
        Me.cmdTestBM2.Location = New System.Drawing.Point(16, 29)
        Me.cmdTestBM2.Name = "cmdTestBM2"
        Me.cmdTestBM2.Size = New System.Drawing.Size(122, 30)
        Me.cmdTestBM2.TabIndex = 2
        Me.cmdTestBM2.Text = "Test Bitmap"
        Me.cmdTestBM2.UseVisualStyleBackColor = True
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(5, 9)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(301, 17)
        Me.Label3.TabIndex = 0
        Me.Label3.Text = "Customers with White SUVs or Green Kit"
        '
        'Panel4
        '
        Me.Panel4.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel4.Controls.Add(Me.cmdTestSQL3)
        Me.Panel4.Controls.Add(Me.cmdTestSQLIndex3)
        Me.Panel4.Controls.Add(Me.cmdTestBM3)
        Me.Panel4.Controls.Add(Me.Label4)
        Me.Panel4.Location = New System.Drawing.Point(149, 180)
        Me.Panel4.Name = "Panel4"
        Me.Panel4.Size = New System.Drawing.Size(542, 78)
        Me.Panel4.TabIndex = 19
        '
        'cmdTestSQL3
        '
        Me.cmdTestSQL3.Location = New System.Drawing.Point(270, 31)
        Me.cmdTestSQL3.Name = "cmdTestSQL3"
        Me.cmdTestSQL3.Size = New System.Drawing.Size(131, 30)
        Me.cmdTestSQL3.TabIndex = 15
        Me.cmdTestSQL3.Text = "Test Scan/Dev"
        Me.cmdTestSQL3.UseVisualStyleBackColor = True
        '
        'cmdTestSQLIndex3
        '
        Me.cmdTestSQLIndex3.Location = New System.Drawing.Point(144, 31)
        Me.cmdTestSQLIndex3.Name = "cmdTestSQLIndex3"
        Me.cmdTestSQLIndex3.Size = New System.Drawing.Size(120, 30)
        Me.cmdTestSQLIndex3.TabIndex = 14
        Me.cmdTestSQLIndex3.Text = "Test NC Index"
        Me.cmdTestSQLIndex3.UseVisualStyleBackColor = True
        '
        'cmdTestBM3
        '
        Me.cmdTestBM3.Location = New System.Drawing.Point(16, 31)
        Me.cmdTestBM3.Name = "cmdTestBM3"
        Me.cmdTestBM3.Size = New System.Drawing.Size(122, 30)
        Me.cmdTestBM3.TabIndex = 2
        Me.cmdTestBM3.Text = "Test Bitmap"
        Me.cmdTestBM3.UseVisualStyleBackColor = True
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(5, 11)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(501, 17)
        Me.Label4.TabIndex = 0
        Me.Label4.Text = "Active Female Customers with Blue 4x4s or Estates that are not Red" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10)
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(15, 197)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(102, 35)
        Me.Button1.TabIndex = 20
        Me.Button1.Text = "Loop Test"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'PictureBox1
        '
        Me.PictureBox1.Image = CType(resources.GetObject("PictureBox1.Image"), System.Drawing.Image)
        Me.PictureBox1.Location = New System.Drawing.Point(59, 367)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(240, 196)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize
        Me.PictureBox1.TabIndex = 21
        Me.PictureBox1.TabStop = False
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(705, 614)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.Panel4)
        Me.Controls.Add(Me.Panel3)
        Me.Controls.Add(Me.Panel2)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.lblResultCount)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.lblBMEnd)
        Me.Controls.Add(Me.lblBMStart)
        Me.Controls.Add(Me.btnResults)
        Me.Controls.Add(Me.lstBM)
        Me.Controls.Add(Me.lblTestSQL)
        Me.Controls.Add(Me.lblTestBM)
        Me.Name = "frmMain"
        Me.Text = "Bitmap Index"
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.Panel2.ResumeLayout(False)
        Me.Panel2.PerformLayout()
        Me.Panel3.ResumeLayout(False)
        Me.Panel3.PerformLayout()
        Me.Panel4.ResumeLayout(False)
        Me.Panel4.PerformLayout()
        CType(Me.PictureBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents cmdBuildBitmap As System.Windows.Forms.Button
    Friend WithEvents cmdTestBM1 As System.Windows.Forms.Button
    Friend WithEvents cmdTestSQL1 As System.Windows.Forms.Button
    Friend WithEvents lblTestBM As System.Windows.Forms.Label
    Friend WithEvents lblTestSQL As System.Windows.Forms.Label
    Friend WithEvents lstBM As System.Windows.Forms.ListBox
    Friend WithEvents btnResults As System.Windows.Forms.Button
    Friend WithEvents lblBMStart As System.Windows.Forms.Label
    Friend WithEvents lblBMEnd As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents lblResultCount As System.Windows.Forms.Label
    Friend WithEvents cmdTestSQLIndex1 As System.Windows.Forms.Button
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents Panel2 As System.Windows.Forms.Panel
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Panel3 As System.Windows.Forms.Panel
    Friend WithEvents lblBMProgress As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Panel4 As System.Windows.Forms.Panel
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents cmdTestSQL2 As System.Windows.Forms.Button
    Friend WithEvents cmdTestSQLIndex2 As System.Windows.Forms.Button
    Friend WithEvents cmdTestBM2 As System.Windows.Forms.Button
    Friend WithEvents cmdTestSQL3 As System.Windows.Forms.Button
    Friend WithEvents cmdTestSQLIndex3 As System.Windows.Forms.Button
    Friend WithEvents cmdTestBM3 As System.Windows.Forms.Button
    Friend WithEvents chkDev As System.Windows.Forms.CheckBox
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox

End Class
