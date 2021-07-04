<%@ Page Title="" Language="VB" MasterPageFile="~/user/user.master" AutoEventWireup="false" CodeFile="editprofile.aspx.vb" Inherits="editprofile" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Edit Profile" Font-Bold="False" Font-Names="Calibri" Font-Size="X-Large" ForeColor="#006600"></asp:Label></td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="text-align: left">
                <asp:Label ID="Label2" runat="server" Text="Full Name " Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" ForeColor="#336699"></asp:Label></td>
            <td style="text-align: left">
                <asp:TextBox ID="TxtFullName" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" Width="350px" Height="27px"></asp:TextBox></td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Full name is required" Display="Dynamic" Font-Names="Verdana" ForeColor="#990033" SetFocusOnError="True" ControlToValidate="TxtFullName" Font-Size="Medium">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="text-align: left">
                <asp:Label ID="Label11" runat="server" Text="Qualification " Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" ForeColor="#336699"></asp:Label></td>
            <td style="text-align: left">
                <asp:DropDownList ID="DdlQualification" runat="server" Font-Names="Verdana" Font-Size="Medium" Height="27px" Width="350px">
                    <asp:ListItem Value="-1">Select Qualification</asp:ListItem>
                    <asp:ListItem>B.E.</asp:ListItem>
                    <asp:ListItem>POLYTECHNIC</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Qualification is required" ControlToValidate="DdlQualification" Display="Dynamic" Font-Names="Verdana" Font-Size="Medium" ForeColor="#990033" InitialValue="-1" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td style="text-align: left">
                <asp:Label ID="Label3" runat="server" Text="E-mail" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" ForeColor="#336699"></asp:Label></td>
            <td style="text-align: left">
                <asp:TextBox ID="TxtEmail" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" Width="350px" Height="27px"></asp:TextBox></td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required" ControlToValidate="TxtEmail" Display="Dynamic" Font-Names="Verdana" ForeColor="#990033" SetFocusOnError="True" Font-Size="Medium">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email" ControlToValidate="TxtEmail" Display="Dynamic" Font-Names="Verdana" ForeColor="#990033" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="Medium">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td style="text-align: left">
                <asp:Label ID="Label4" runat="server" Text="Contact No." Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" ForeColor="#336699"></asp:Label></td>
            <td style="text-align: left">
                <asp:TextBox ID="TxtContactNumber" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" Width="350px" Height="27px"></asp:TextBox></td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Contact number is required" ControlToValidate="TxtContactNumber" Display="Dynamic" Font-Names="Verdana" ForeColor="#990033" SetFocusOnError="True" Font-Size="Medium">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid contact number" ControlToValidate="TxtContactNumber" Display="Dynamic" Font-Names="Verdana" ForeColor="#990033" SetFocusOnError="True" ValidationExpression="\d\d\d\d\d\d\d\d\d\d" Font-Size="Medium">*</asp:RegularExpressionValidator></td>
        </tr>

                <tr>
            <td style="text-align: left">
                <asp:Label ID="Label9" runat="server" Text="Security Question" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" ForeColor="#336699"></asp:Label></td>
            <td style="text-align: left">
                <asp:DropDownList ID="DdlSecQuestions" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" Width="350px" Height="27px">
                    <asp:ListItem Value="-1">Select Security Question</asp:ListItem>
                    <asp:ListItem>What is your favourite color?</asp:ListItem>
                    <asp:ListItem>What is your first school name?</asp:ListItem>
                    <asp:ListItem>What is your favourite dish?</asp:ListItem>
                </asp:DropDownList></td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Security question is required" Display="Dynamic" Font-Names="Verdana" Font-Size="Medium" ForeColor="#990033" SetFocusOnError="True" ControlToValidate="DdlSecQuestions" InitialValue="-1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="text-align: left">
                <asp:Label ID="Label10" runat="server" Text="Answer" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" ForeColor="#336699"></asp:Label></td>
            <td style="text-align: left">
                <asp:TextBox ID="TxtAnswer" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" Width="350px" Height="27px"></asp:TextBox></td>
            <td style="text-align: left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Answer for security question is required" Display="Dynamic" Font-Names="Verdana" Font-Size="Medium" ForeColor="#990033" SetFocusOnError="True" ControlToValidate="TxtAnswer">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: right">
                <asp:Button ID="BtnSaveChanges" runat="server" Text="Save Changes" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium" Height="35px"></asp:Button></td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: left">
                <asp:Label ID="LblMsg" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Medium"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align: left" colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Names="Verdana" Font-Size="Medium" ForeColor="#990033" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
            </td>
        </tr>
    </table>



</asp:Content>

