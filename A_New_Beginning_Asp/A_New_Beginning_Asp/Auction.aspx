<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Auction.aspx.cs" Inherits="Auction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" Font-Size="X-Large">
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <Items>
                    <asp:MenuItem NavigateUrl="~/HomePage.aspx" Text="הוספת קטגורייה/הוספת פריט" Value="הוספת קטגורייה/הוספת פריט"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/DeleteItem.aspx" Text=" מחיקת פריטים" Value="מחיקת פריטים"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Auction.aspx" Text="הוספת פריט למכירה פומבית" Value="הוספת פריט למכירה פומבית"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#507CD1" />
                <StaticItemTemplate>
                    <%# Eval("Text") %>
                </StaticItemTemplate>
            </asp:Menu>
        </div>

        <br />
        <br />
        <div style="width: 100%; height: 150px; overflow: auto;">
            <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" DataKeyNames="item_code" AllowPaging="True" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="item_code" HeaderText="item_code" InsertVisible="False" ReadOnly="True" SortExpression="item_code" />
                    <asp:BoundField DataField="item_name" HeaderText="item_name" SortExpression="item_name" />
                    <asp:BoundField DataField="item_price" HeaderText="item_price" SortExpression="item_price" />
                    <asp:BoundField DataField="item_image" HeaderText="item_image" SortExpression="item_image" />
                    <asp:BoundField DataField="item_description" HeaderText="item_description" SortExpression="item_description" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [item_code], [item_name], [item_price], [item_image], [item_description] FROM [Items]"></asp:SqlDataSource>

        </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="EnterItemToAuction" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1"><strong>הכנסת פריט למכירה פומבית</strong></td>
                    </tr>
                     <tr>
                        <td>קוד פריט</td>
                        <td style="margin-left: 2px">
                            <asp:TextBox ID="TxtItem_code" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>שם פריט</td>
                        <td style="margin-left: 2px">
                            <asp:TextBox ID="TxtItemName" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                      <tr>
                        <td>מחיר פריט</td>
                        <td style="margin-left: 2px">
                            <asp:TextBox ID="TxtItem_price" runat="server"></asp:TextBox></td>
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
                        <td>תאריך התחלה מכירה פובית</td>
                        <td>                        
                             <asp:TextBox ID="TxtBgeinAuction" runat="server" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                         <tr>
                        <td>תאריך סיום מכירה פובית</td>
                        <td>                        
                             <asp:TextBox ID="TexEndAuction" runat="server" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>

    </form>
</body>
</html>
