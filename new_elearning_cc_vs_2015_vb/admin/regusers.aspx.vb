Imports System.Data
Imports MySql.Data.MySqlClient
Imports MySql.Data.Types
Imports System.Configuration
Partial Class admin_regusers
    Inherits System.Web.UI.Page

    Private con As MySqlConnection
    Private cmd As MySqlCommand

    Public Sub connect()
        Dim cs As String
        cs = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString
        con = New MySqlConnection(cs)
        con.Open()
    End Sub

    Public Sub disconnect()
        con.Close()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            Dim sql As String = "select * from regusers"
            connect()
            cmd = New MySqlCommand(sql, con)
            GridView1.DataSource = cmd.ExecuteReader
            GridView1.DataBind()
            cmd.Dispose()
            disconnect()
        Catch ex As Exception
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = ex.Message
        End Try
    End Sub
End Class
