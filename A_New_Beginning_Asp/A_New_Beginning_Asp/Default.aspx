<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="mycss/DefaultCss.css" rel="stylesheet" />
    <title>A New Beginning Admin Page</title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="jumbotron" id="head">
                <div Class="head" >
                    <asp:Label ID="lblHead" runat="server" Text="Ⓐ Ⓝⓔⓦ Ⓑⓔⓖⓘⓝⓝⓘⓝⓖ Ⓐⓓⓜⓘⓝ Ⓟⓐⓖⓔ"></asp:Label>
                    <h3 class="head" style="border:4px solid black"><%= DateTime.Now.ToString(" dd/MM/yy : dddd") %>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                                </asp:Timer>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </h3>
                </div>
            </div>
            <div class="loginForm">
                <asp:Label ID="Label2" runat="server" Text="כניסה מנהל"></asp:Label><br />
                <asp:TextBox PlaceHolder="הכנס תעודת זהות" ID="admin_id" runat="server" Style="text-align: center" MaxLength="10"></asp:TextBox><br />
                <asp:TextBox PlaceHolder="הכנס סיסמא" ID="admin_password" runat="server" Style="text-align: center" MaxLength="12"></asp:TextBox><br />
                <asp:Button CssClass="btn btn-primary" ID="btnSumbit" runat="server" Text="כניסה" OnClick="btnSumbit_Click" /><br />
                <asp:Label ID="lblNoAdmin" runat="server" Text=""></asp:Label>

            </div>
           
        </div>
         <div class="loginForm">
                <p>© 2018-2019</p>
            </div>
    </form>
</body>
</html>
