<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx13CustomerList.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch13: Customer List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%>
       <%--  <img src="Images/banner.jpg" />--%>
    </header>
    <h2 style="color:Red">GitHub Demo by TaniyapreetKaur</h2>
    <h4><b>Name:</b> Taniyapreet kaur</h4>
    <h4><b>Id:</b> C0718971</h4>
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <label id="lblState" for="ddlState" 
                    class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose a category:</label>
                <div class="col-xs-8 col-sm-5">
                    <%-- state drop-down goes here --%>
                    <asp:DropDownList ID="ddl_category" runat="server"  CssClass="form-control"
                        DataSourceID="sds_category"
                        DataTextField="LongName"
                        DataValueField="CategoryID"
                        AutoPostBack="true">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sds_category" runat="server" 
                        ConnectionString='<%$ ConnectionStrings:cs_halloween %>'
                        SelectCommand="SELECT [CategoryID], [ShortName], [LongName] FROM [Categories]">
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                    <%-- customer data list goes here --%>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-condensed table-striped" DataKeyNames="ProductID" DataSourceID="sds_products" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" SortExpression="ProductID"></asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                            <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice"></asp:BoundField>
                            <asp:BoundField DataField="OnHand" HeaderText="On Hand" SortExpression="OnHand"></asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="Gray" ForeColor="White"/> 
                    </asp:GridView>
                    <asp:SqlDataSource ID="sds_products" runat="server"
                        ConnectionString='<%$ ConnectionStrings:cs_halloween %>'
                        SelectCommand="SELECT [ProductID], [Name], [UnitPrice], [OnHand] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_category" PropertyName="SelectedValue" Name="CategoryID" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>  
            </div>

        </form>
    </main>
</div>
</body>
</html>