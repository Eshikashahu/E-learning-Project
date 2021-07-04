
Partial Class admin_admin
    Inherits System.Web.UI.MasterPage
    Protected Sub BtnLogout_Click(sender As Object, e As EventArgs) Handles BtnLogout.Click
        Session.Clear()
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/home.aspx")
    End Sub
    Protected Sub BtnViewRegusers_Click(sender As Object, e As EventArgs) Handles BtnViewRegusers.Click
        Response.Redirect("~/admin/regusers.aspx")
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
    End Sub
End Class

