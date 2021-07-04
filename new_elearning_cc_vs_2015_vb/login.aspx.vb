Imports MySql.Data.MySqlClient
Imports System.Configuration
Partial Class login
    Inherits System.Web.UI.Page

    Private con As MySqlConnection
    Private cmd As MySqlCommand

    Private Sub GetConnection()
        Dim CS As String
        CS = ConfigurationManager.ConnectionStrings("MyConnectionString").ConnectionString
        con = New MySqlConnection(CS)
        con.Open()
    End Sub

    Private Sub CloseConnection()
        con.Close()
    End Sub

    Protected Sub BtnLogin_Click(sender As Object, e As EventArgs) Handles BtnLogin.Click
        If Page.IsValid Then
            Try
                Dim userid As String
                Dim pwd As String
                userid = TxtUserid.Text
                pwd = TxtPassword.Text
                If userid.Equals("admin") And pwd.Equals("admin") Then
                    Session("userid") = "admin"
                    Response.Redirect("~/admin/adminhome.aspx")
                Else
                    Dim sql As String
                    sql = "select upassword, status from regusers where userid=@userid"
                    GetConnection()
                    cmd = New MySqlCommand(sql, con)
                    cmd.Parameters.AddWithValue("@userid", userid)
                    Dim rd As MySqlDataReader
                    rd = cmd.ExecuteReader
                    If rd.Read Then
                        Dim upwd, status As String
                        upwd = rd.GetString("upassword")
                        status = rd.GetString("status")
                        rd.Close()
                        cmd.Dispose()
                        CloseConnection()

                        If status = "UNBLOCKED" Then
                            If pwd.Equals(upwd) Then
                                Session("userid") = userid
                                Response.Redirect("~/user/userhome.aspx")
                            Else
                                LblMsg.ForeColor = Drawing.Color.Red
                                LblMsg.Text = "Invalid userid or password.."
                            End If
                        Else
                            LblMsg.ForeColor = System.Drawing.Color.Red
                            LblMsg.Text = "Your account is blocked.."
                        End If
                    Else
                        rd.Close()
                        cmd.Dispose()
                        CloseConnection()
                        LblMsg.ForeColor = Drawing.Color.Red
                        LblMsg.Text = "Invalid user.."
                    End If
                End If
            Catch ex As Exception
                LblMsg.ForeColor = System.Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        Else
            LblMsg.ForeColor = System.Drawing.Color.Red
            LblMsg.Text = "Validation erros.."
        End If
    End Sub
End Class
