Imports MySql.Data.MySqlClient
Imports System.Configuration
Partial Class regfrm
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

    Protected Sub BtnRegister_Click(sender As Object, e As EventArgs) Handles BtnRegister.Click
        If Page.IsValid Then
            Try
                Dim fullname, emailid, mobileno, qualification, profession, userid, password, secque, answer, status As String
                fullname = TxtFullName.Text.ToUpper().Trim
                emailid = TxtEmailid.Text.ToLower.Trim()
                mobileno = TxtMobileNo.Text.Trim()
                qualification = DdlQualification.SelectedItem.Text
                profession = TxtProfession.Text.ToUpper().Trim()
                userid = TxtUserid.Text.ToLower().Trim()
                password = TxtPassword.Text
                secque = DdlSecQue.SelectedItem.Text.ToUpper().Trim
                answer = TxtAnswer.Text.ToUpper().Trim()
                status = "UNBLOCKED"
                Dim sql As String
                sql = "insert into regusers values(@fullname, @emailid, @mobileno, @qualification, @profession, @userid, @password, @secque, @answer, @status)"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@fullname", fullname)
                cmd.Parameters.AddWithValue("@emailid", emailid)
                cmd.Parameters.AddWithValue("@mobileno", mobileno)
                cmd.Parameters.AddWithValue("@qualification", qualification)
                cmd.Parameters.AddWithValue("@profession", profession)
                cmd.Parameters.AddWithValue("@userid", userid)
                cmd.Parameters.AddWithValue("@password", password)
                cmd.Parameters.AddWithValue("@secque", secque)
                cmd.Parameters.AddWithValue("@answer", answer)
                cmd.Parameters.AddWithValue("@status", status)
                Dim n As Integer = cmd.ExecuteNonQuery
                cmd.Dispose()
                CloseConnection()
                If n = 1 Then
                    Response.Redirect("~/regsuccess.aspx")
                Else
                    Response.Redirect("~/regfailed.aspx")
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
