Imports System.Data
Imports MySql.Data.MySqlClient
Imports MySql.Data.Types
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail
Imports System.IO
Partial Class addvideo
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
    Protected Sub BtnSaveVideo_Click(sender As Object, e As EventArgs) Handles BtnSaveVideo.Click
        If Page.IsValid Then
            Try
                If FUVideo.HasFile Then
                    Dim filename As String, subject As String, topic As String, sql As String
                    filename = Me.FUVideo.FileName.ToLower
                    Dim fext As String
                    fext = System.IO.Path.GetExtension(filename).ToLower
                    If fext.Equals(".mp4") Or fext.Equals(".flv") Then
                        Dim filesize As Long
                        filesize = FUVideo.PostedFile.ContentLength
                        If filesize > 1073741824 Then
                            LblMsg.ForeColor = Drawing.Color.Red
                            LblMsg.Text = "Maximum file size (1GB) exceeded.."
                        Else
                            filename = filename.Replace(" ", "_")
                            Me.FUVideo.SaveAs(Server.MapPath("~/videos/" & filename))
                            subject = Me.DdlSubjects.SelectedItem.Text.Trim.ToUpper
                            topic = Me.TxtTopic.Text.ToUpper.Trim
                            sql = "insert into videolectures (subject, topic, videoname) values(@sub, @topic, @videoname)"
                            connect()
                            cmd = New MySqlCommand(sql, con)
                            cmd.Parameters.AddWithValue("@sub", subject)
                            cmd.Parameters.AddWithValue("@topic", topic)
                            cmd.Parameters.AddWithValue("@videoname", filename)
                            Dim n As Integer
                            n = cmd.ExecuteNonQuery
                            cmd.Dispose()
                            disconnect()
                            If n = 1 Then
                                sql = "select emailid from regusers"
                                connect()
                                cmd = New MySqlCommand(sql, con)
                                Dim rd As MySqlDataReader
                                rd = cmd.ExecuteReader()
                                While rd.Read()
                                    Try
                                        Dim email As String, emailsubject As String, emailbody As String, mm As MailMessage
                                        email = rd.GetString("emailid")
                                        emailsubject = "Notification of new lectures"
                                        emailbody = "Dear user new video lectures of subject " & subject & " and topic " & topic & " has been uploaded. Thanks!"
                                        mm = New MailMessage("amtproject2k17@gmail.com", email, emailsubject, emailbody)
                                        mm.IsBodyHtml = False
                                        Dim smtp As New SmtpClient("smtp.gmail.com", 587)
                                        smtp.EnableSsl = True
                                        smtp.UseDefaultCredentials = True
                                        Dim netcred As New NetworkCredential("amtproject2k17@gmail.com", "project2k17amt")
                                        smtp.Credentials = netcred
                                        smtp.Send(mm)
                                    Catch ex As Exception
                                        LblMsg.ForeColor = Drawing.Color.Red
                                        LblMsg.Text = ex.Message
                                    End Try
                                End While
                                LblMsg.ForeColor = Drawing.Color.Green
                                LblMsg.Text = "Video lecture saved and email sent.."
                            Else
                                LblMsg.ForeColor = Drawing.Color.Red
                                LblMsg.Text = "Video lecture not saved.."
                            End If
                        End If
                    Else
                        LblMsg.ForeColor = Drawing.Color.Red
                        LblMsg.Text = "Only .mp4 or .flv files are allowed to upload.."
                    End If
                Else
                    LblMsg.ForeColor = Drawing.Color.Red
                    LblMsg.Text = "File not selected.."
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
    End Sub
End Class
