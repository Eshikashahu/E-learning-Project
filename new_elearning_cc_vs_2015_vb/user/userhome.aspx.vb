
Partial Class userhome
    Inherits System.Web.UI.Page

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
