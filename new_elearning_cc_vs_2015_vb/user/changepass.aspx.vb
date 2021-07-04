Imports System.Data
Imports MySql.Data.MySqlClient
Imports MySql.Data.Types
Imports System.Configuration
Partial Class changepass
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
    Protected Sub BtnChangePwd_Click(sender As Object, e As EventArgs) Handles BtnChangePwd.Click
        If Page.IsValid Then
            Try
                Dim cpwd As String, npwd As String, sql As String, uname As String
                uname = Session("userid").ToString
                cpwd = TxtCurrentPassword.Text
                npwd = TxtNewPassword.Text
                sql = "select upassword from regusers where userid = @uname"
                connect()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@uname", uname)
                Dim rd As MySqlDataReader
                rd = cmd.ExecuteReader
                If rd.Read Then
                    Dim upwd As String
                    upwd = rd.GetString("upassword")
                    rd.Close()
                    cmd.Dispose()
                    disconnect()
                    If cpwd.Equals(upwd) Then
                        sql = "update regusers set upassword=@pwd where userid=@uname"
                        connect()
                        cmd = New MySqlCommand(sql, con)
                        cmd.Parameters.AddWithValue("@pwd", npwd)
                        cmd.Parameters.AddWithValue("@uname", uname)
                        Dim n As Integer
                        n = cmd.ExecuteNonQuery
                        cmd.Dispose()
                        disconnect()
                        If n = 1 Then
                            LblMsg.ForeColor = Drawing.Color.Green
                            LblMsg.Text = "Password changed.."
                        Else
                            LblMsg.ForeColor = Drawing.Color.Red
                            LblMsg.Text = "Unable to change password.."
                        End If
                    Else
                        LblMsg.ForeColor = Drawing.Color.Red
                        LblMsg.Text = "Invalid current password.."
                    End If
                Else
                    rd.Close()
                    cmd.Dispose()
                    disconnect()
                End If
            Catch ex As Exception
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        Else
            LblMsg.ForeColor = Drawing.Color.Red
            LblMsg.Text = "Validation errors.."
        End If
    End Sub
End Class
