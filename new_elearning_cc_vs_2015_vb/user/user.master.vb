Imports MySql.Data.MySqlClient
Imports System.Configuration
Partial Class user
    Inherits System.Web.UI.MasterPage

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

    Protected Sub BtnLogout_Click(sender As Object, e As EventArgs) Handles BtnLogout.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/home.aspx")
    End Sub

    Private Sub LoadUserName()
        Try
            If Session("userid") IsNot vbNullString Then
                Dim userid = Session("userid").ToString()
                Dim sql As String = "select fullname from regusers where userid=@userid"
                GetConnection()
                cmd = New MySqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@userid", userid)
                Dim reader As MySqlDataReader = cmd.ExecuteReader()
                If reader.Read Then
                    Dim fullname As String = reader.GetString("fullname")
                    LblUser.ForeColor = Drawing.Color.Crimson
                    LblUser.Text = fullname
                End If
                reader.Close()
                cmd.Dispose()
                CloseConnection()
            Else
                LblUser.ForeColor = Drawing.Color.Red
                LblUser.Text = "Session object error.."
            End If
        Catch ex As Exception
            LblUser.ForeColor = Drawing.Color.Red
            LblUser.Text = ex.Message
        End Try
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()
        End If

        If Session("userid") <> vbNullString Then
            If Not Page.IsPostBack Then
                LoadUserName()
            End If
        Else
            Response.Redirect("~/pagenotfound.aspx")
        End If
    End Sub
    Protected Sub BtnAddPdf_Click(sender As Object, e As EventArgs) Handles BtnAddPdf.Click
        Response.Redirect("~/user/addpdf.aspx")
    End Sub
    Protected Sub BtnAddVideo_Click(sender As Object, e As EventArgs) Handles BtnAddVideo.Click
        Response.Redirect("~/user/addvideo.aspx")
    End Sub
    Protected Sub BtnEditProfile_Click(sender As Object, e As EventArgs) Handles BtnEditProfile.Click
        Response.Redirect("~/user/editprofile.aspx")
    End Sub
    Protected Sub BtnChangePassword_Click(sender As Object, e As EventArgs) Handles BtnChangePassword.Click
        Response.Redirect("~/user/changepass.aspx")
    End Sub
End Class

