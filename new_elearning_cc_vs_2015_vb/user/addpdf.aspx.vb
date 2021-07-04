Imports System.Data
Imports MySql.Data.MySqlClient
Imports MySql.Data.Types
Imports System.Configuration
Imports System.Net
Imports System.Net.Mail
Imports System.IO
Partial Class addpdf
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
    Protected Sub BtnSavePdf_Click(sender As Object, e As EventArgs) Handles BtnSavePdf.Click

        If Page.IsValid Then
            Try
                If FUPdf.HasFile Then
                    Dim filename As String, subject As String, topic As String, sql As String
                    filename = Me.FUPdf.FileName.ToLower
                    Dim fext As String
                    fext = System.IO.Path.GetExtension(filename).ToLower
                    If fext.Equals(".pdf") Then
                        Dim filesize As Long
                        filesize = FUPdf.PostedFile.ContentLength
                        If filesize > 1073741824 Then
                            LblMsg.ForeColor = Drawing.Color.Red
                            LblMsg.Text = "Maximum file size (1GB) exceeded.."
                        Else
                            filename = filename.Replace(" ", "_")
                            Me.FUPdf.SaveAs(Server.MapPath("~/pdf/" & filename))
                            subject = Me.DdlSubjects.SelectedItem.Text.Trim.ToUpper
                            topic = Me.TxtTopic.Text.ToUpper.Trim
                            sql = "insert into pdflectures (subject, topic, pdfname) values(@sub, @topic, @pdfname)"
                            connect()
                            cmd = New MySqlCommand(sql, con)
                            cmd.Parameters.AddWithValue("@sub", subject)
                            cmd.Parameters.AddWithValue("@topic", topic)
                            cmd.Parameters.AddWithValue("@pdfname", filename)
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
                                        emailbody = "Dear user new pdf of subject " & subject & " and topic " & topic & " has been uploaded. Thanks!"
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
                                LblMsg.Text = "pdf saved.."
                            Else
                                LblMsg.ForeColor = Drawing.Color.Red
                                LblMsg.Text = "pdf not saved.."
                            End If
                        End If
                    Else
                        LblMsg.ForeColor = Drawing.Color.Red
                        LblMsg.Text = "Only .pdf files are allowed to upload.."
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
