<%@ Page Title="" Language="VB" MasterPageFile="~/start.master" AutoEventWireup="false" CodeFile="regfrm.aspx.vb" Inherits="regfrm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div style="font-family: Calibri">
        <table style="width: 100%; text-align: center">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Registration" Font-Names="Verdana" Font-Size="X-Large"></asp:Label></td>
            </tr>
        </table>
        <hr />
        <center>
            <table style="text-align:left">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Full Name" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtFullName" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Full name is required" ControlToValidate="TxtFullName" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Full name must contain alphabets only" ControlToValidate="TxtFullName" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z.\s]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Emailid" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtEmailid" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Emailid is required" ControlToValidate="TxtEmailid" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid emailid" ControlToValidate="TxtEmailid" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Mobile Number" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtMobileNo" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mobile number is required" ControlToValidate="TxtMobileNo" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Mobile number must contain digits only" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{10}" ControlToValidate="TxtMobileNo"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Qualification" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DdlQualification" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px">
                            <asp:ListItem Value="-1">Qualification</asp:ListItem>
                            <asp:ListItem>M.E.</asp:ListItem>
                            <asp:ListItem>B.E.</asp:ListItem>
                            <asp:ListItem>Polytechnic</asp:ListItem>
                            <asp:ListItem>B.Sc.</asp:ListItem>
                            <asp:ListItem>M.Sc.</asp:ListItem>
                            <asp:ListItem>B.Pharm</asp:ListItem>
                            <asp:ListItem>M. Pharm</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Qualification is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ControlToValidate="DdlQualification" InitialValue="-1"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Profession" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtProfession" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Profession is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ControlToValidate="TxtProfession"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Profession must contain alphabets only" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z.\s]+$" ControlToValidate="TxtProfession"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Userid" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtUserid" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Userid is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ControlToValidate="TxtUserid"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Password" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtPassword" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Password is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ControlToValidate="TxtPassword"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Confirm Password" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtConfirmPassword" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Confirm password is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ControlToValidate="TxtConfirmPassword"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password and confirm password must be same" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ControlToCompare="TxtPassword" ControlToValidate="TxtConfirmPassword"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Security Question" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DdlSecQue" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px">
                            <asp:ListItem Value="-1">Security Question</asp:ListItem>
                            <asp:ListItem>What is your favourite color?</asp:ListItem>
                            <asp:ListItem>What is your first school name?</asp:ListItem>
                            <asp:ListItem>What is your favourite dish?</asp:ListItem>
                        </asp:DropDownList></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Security question is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ControlToValidate="DdlSecQue" InitialValue="-1"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Answer" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtAnswer" runat="server" Font-Names="Arial" Font-Size="Medium" Width="250px" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Answer is required" Display="Dynamic" Font-Names="Arial" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ControlToValidate="TxtAnswer"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="BtnRegister" runat="server" Text="Register" Font-Names="Arial" Font-Size="Medium" BackColor="#2C3E50" BorderColor="#2C3E50" BorderStyle="Solid" ForeColor="White" Height="40px" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="LblMsg" runat="server" Font-Names="Arial" Font-Size="Medium"></asp:Label></td>
                </tr>
            </table>
                </center>
        <hr />
        <center>
    </div>
</asp:Content>

