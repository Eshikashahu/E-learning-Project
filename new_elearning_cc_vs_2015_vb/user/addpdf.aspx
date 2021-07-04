<%@ Page Title="" Language="VB" MasterPageFile="~/user/user.master" AutoEventWireup="false" CodeFile="addpdf.aspx.vb" Inherits="addpdf" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Add Portable Document File (Pdf)" Font-Bold="False" Font-Names="Arial" Font-Size="X-Large" ForeColor="#006600"></asp:Label></td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Select Subject" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
            <td>
                <asp:DropDownList ID="DdlSubjects" runat="server" Font-Names="Arial" Font-Size="Medium" Width="350px">
                    <asp:ListItem Value="-1">Select Subject</asp:ListItem>
                    <asp:ListItem>C PROGRAMMING</asp:ListItem>
                    <asp:ListItem>C++</asp:ListItem>
                    <asp:ListItem>JAVA</asp:ListItem>
                    <asp:ListItem>ADVANCED JAVA</asp:ListItem>
                    <asp:ListItem>ASP.NET</asp:ListItem>
                    <asp:ListItem>PHP</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Subject is required" ControlToValidate="DdlSubjects" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Enter Topic" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
            <td>
                <asp:TextBox ID="TxtTopic" runat="server" Font-Names="Arial" Font-Size="Medium" Width="450px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Topic is required" ControlToValidate="TxtTopic" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Select pdf file to save" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
            <td>
                <asp:FileUpload ID="FUPdf" runat="server" Font-Names="Arial" Font-Size="Medium" Width="450px" /></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: right">
                <asp:Button ID="BtnSavePdf" runat="server" Text="Save Pdf" Font-Names="Arial" Font-Size="Medium" BackColor="#2C3E50" BorderColor="#2C3E50" BorderStyle="Solid" ForeColor="White" Height="40px" /></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="LblMsg" runat="server" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

