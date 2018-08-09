<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="mycss/HomePage.css" rel="stylesheet" />
    <title>Home Page Admin </title>

</head>
<body>

    <form id="form1" runat="server" aria-orientation="horizontal">
        <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="X-Large" ForeColor="#284E98" Orientation="Horizontal" StaticSubMenuIndent="10px">
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <Items>
                <asp:MenuItem NavigateUrl="~/HomePage.aspx  " Text="  הוספת קטגורייה/הוספת פריט |" Value="הוספת קטגורייה/הוספת פריט"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/DeleteItem.aspx" Text=" מחיקת פריטים |" Value="מחיקת פריטים"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Auction.aspx" Text="הוספת פריט למכירה פומבית" Value="הוספת פריט למכירה פומבית"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#507CD1" />
            <StaticItemTemplate>
                <%# Eval("Text") %>
            </StaticItemTemplate>
        </asp:Menu>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="EnterCategory" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td><strong>תיאור קטגוריה</strong></td>

                    </tr>
                    <tr>
                        <td>סוג קטגוריה</td>
                        <td>
                            <asp:TextBox ID="TxtCat" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Btncat" runat="server" OnClick="EnterCategory_Click" Text="הכנס" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </asp:View>

            <asp:View ID="showCategory" runat="server">

                <table class="auto-style1">
                    <tr>
                        <td>שם קטגוריה:</td>
                        <td>
                            <asp:Label ID="LblNameCat" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="ButHome" runat="server" OnClick="BcakHome_Click" Text="חזרה לדף בית" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>

        <br />
        <br />
        <asp:MultiView ID="MultiView2" runat="server">
            <asp:View ID="EnterItem" runat="server">
                <table class="i">
                    <tr>
                        <td><strong>הכנסת פריט</strong></td>
                    </tr>
                    <tr>
                        <td>שם פריט</td>
                        <td style="margin-left: 2px">
                            <asp:TextBox ID="TxtItemName" runat="server"></asp:TextBox></td>
                        <td></td>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="category_code" DataSourceID="SqlDataSource1" Font-Size="Medium" HorizontalAlign="Justify" AllowPaging="True">
                                <Columns>
                                    <asp:BoundField DataField="category_code" HeaderText="category_code" InsertVisible="False" ReadOnly="True" SortExpression="category_code" />
                                    <asp:BoundField DataField="category_description" HeaderText="category_description" SortExpression="category_description" />
                                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" ForeColor="#003399" />
                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                <SortedDescendingHeaderStyle BackColor="#002876" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Category] ORDER BY [category_code]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>מחיר פריט</td>
                        <td>
                            <asp:TextBox ID="TxtPrice" runat="server" ></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>תמונת פריט</td>
                        <td>
                            <asp:FileUpload ID="FileUploadImage" runat="server" /></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>תיאור פריט</td>
                        <td>                        
                            <asp:TextBox ID="TxtDescriptionItem" runat="server" TextMode="MultiLine" Height="100"></asp:TextBox>                      
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>קטגוריית פריט</td>
                        <td>
                            <asp:TextBox ID="TxtCategoryItem" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnEnterItem" runat="server" OnClick="EnterItem_Click" Text="הכנס" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </asp:View>

            <asp:View ID="showItem" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td>שם פריט :</td>
                        <td>
                            <asp:Label ID="LblItemName" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>מחיר פריט :</td>
                        <td>
                            <asp:Label ID="LblItemPrice" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>תיאור פריט :</td>
                        <td>
                            <asp:Label ID="LblDescriptionItem" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>קטגוריית פריט :</td>
                        <td>
                            <asp:Label ID="LblCatgoryItem" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnBackHome" runat="server" OnClick="BcakHome2_Click" Text="חזרה לדף בית" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </asp:View>

        </asp:MultiView>
    </form>
</body>
</html>
