<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteItem.aspx.cs" Inherits="DeleteItem" %>

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
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" Font-Size="X-Large" Width="100%">
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
            <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="item_code" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="item_code" HeaderText="item_code" InsertVisible="False" ReadOnly="True" SortExpression="item_code" />
                    <asp:BoundField DataField="item_name" HeaderText="item_name" SortExpression="item_name" />
                    <asp:BoundField DataField="item_price" HeaderText="item_price" SortExpression="item_price" />
                    <asp:BoundField DataField="item_image" HeaderText="item_image" SortExpression="item_image" />
                    <asp:BoundField DataField="item_description" HeaderText="item_description" SortExpression="item_description" />
                    <asp:BoundField DataField="category_code" HeaderText="category_code" SortExpression="category_code" />
                    <asp:BoundField DataField="comment_code" HeaderText="comment_code" SortExpression="comment_code" />
                    <asp:BoundField DataField="sale_code" HeaderText="sale_code" SortExpression="sale_code" />
                    <asp:CheckBoxField DataField="code_Mark" HeaderText="code_Mark" SortExpression="code_Mark" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [Items] ORDER BY [item_code]"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="DeleteItems" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td><strong>מחיקת פריט</strong></td>

                    </tr>
                    <tr>
                        <td>קוד פריט</td>
                        <td>
                            <asp:TextBox ID="TxtItem" runat="server"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnDel" runat="server" OnClick="DeleteItems_Click" Text="מחק פריט" />
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
             <asp:View ID="NoItem" runat="server">

                 <asp:Label ID="lblNoItem" runat="server" Text=""></asp:Label><br />
                  <asp:Button ID="BtnBackHome2" runat="server" OnClick="BcakHome2_Click" Text="חזרה לדף בית" />

        </asp:View>
        </asp:MultiView>

       
    </form>

</body>
</html>
