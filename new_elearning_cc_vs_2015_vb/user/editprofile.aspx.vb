Imports System.Data
Imports MySql.Data.MySqlClient
Imports MySql.Data.Types
Imports System.Configuration

Partial Class editprofile
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
    Protected Sub BtnSaveChanges_Click(sender As Object, e As EventArgs) Handles BtnSaveChanges.Click
        If Page.IsValid Then
            Try
                Dim fullname As String, qualification As String, email As String, contactno As String, address As String, secque As String, ans As String, uname As String
                uname = Session("userid")
                fullname = Me.TxtFullName.Text.Trim.ToUpper()
                qualification = Me.DdlQualification.SelectedItem.Text.ToUpper.Trim
                email = Me.TxtEmail.Text.Trim.ToLower
                contactno = Me.TxtContactNumber.Text.Trim.ToUpper
                secque = Me.DdlSecQuestions.SelectedItem.Text.Trim.ToUpper
                ans = Me.TxtAnswer.Text.Trim.ToUpper
                Dim sql As String
                sql = "update regusers set fullname=@fname, qualification=@qualification, emailid=@email,mobileno=@cno,secque=@sque, answer=@ans where userid=@uname"
                connect()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@fname", fullname)
                cmd.Parameters.AddWithValue("@qualification", qualification)
                cmd.Parameters.AddWithValue("@email", email)
                cmd.Parameters.AddWithValue("@cno", contactno)
                cmd.Parameters.AddWithValue("@sque", secque)
                cmd.Parameters.AddWithValue("@ans", ans)
                cmd.Parameters.AddWithValue("@uname", uname)
                Dim n As Integer
                n = cmd.ExecuteNonQuery
                cmd.Dispose()
                disconnect()
                If n = 1 Then
                    LblMsg.ForeColor = Drawing.Color.Green
                    LblMsg.Text = "Changes saved.."
                Else
                    LblMsg.ForeColor = Drawing.Color.Red
                    LblMsg.Text = "Changes not saved.."
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
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()
        End If

        If Session("userid") <> vbNullString Then
        Else
            Response.Redirect("~/pagenotfound.aspx")
        End If

        If Not Page.IsPostBack Then
            Try
                Dim uname As String, sql As String
                uname = Session("userid")
                sql = "select fullname,qualification,emailid,mobileno,secque,answer from regusers where userid=@uname"
                connect()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@uname", uname)
                Dim rd As MySqlDataReader
                rd = cmd.ExecuteReader
                If rd.Read Then
                    TxtFullName.Text = rd.GetString("fullname")
                    Dim q As String
                    q = rd.GetString("qualification").ToUpper().Trim()
                    DdlQualification.SelectedIndex = DdlQualification.Items.IndexOf(New ListItem(q, q))
                    TxtEmail.Text = rd.GetString("emailid")
                    TxtContactNumber.Text = rd.GetString("mobileno")

                    Dim sq As String
                    sq = rd.GetString("secque").ToUpper().Trim()
                    DdlSecQuestions.SelectedIndex = DdlSecQuestions.Items.IndexOf(New ListItem(sq, sq))
                    TxtAnswer.Text = rd.GetString("answer")
                End If
                rd.Close()
                cmd.Dispose()
                disconnect()
            Catch ex As Exception
                LblMsg.ForeColor = Drawing.Color.Red
                LblMsg.Text = ex.Message
            End Try
        End If
    End Sub
End Class
