<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="OnlineCoffeeShopping.Admin.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
     <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container adminDashboard">
      <nav class="navbar navbar-expand-lg bg-body-tertiary bg-white">
  <div class="container-fluid bg-white p-4">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link rounded-pill active" aria-current="page" href="Product.aspx">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link rounded-pill" href="Orders.aspx">Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link rounded-pill" href="Users.aspx">Users</a>
        </li>
              <li class="nav-item">
          <a class="nav-link rounded-pill" href="Reports.aspx">Reports</a>
        </li>
           <li class="nav-item">
          <a class="nav-link rounded-pill" href="Role.aspx">Roles</a>
        </li>
             <li class="nav-item">
          <a class="nav-link rounded-pill" href="Newslitter.aspx">Newsletter subscription</a>
        </li>
          <li class="nav-item">
          <a class="nav-link rounded-pill" href="Monitor.aspx">Monitor Products</a>
        </li>
      </ul>
        <h2 class="ms-auto">Admin panel</h2>
    </div>
  </div>
</nav>
    <div class="container-fluid ">
        <asp:ListView ID="ListView1" runat="server" GroupPlaceholderID="Groupplaceholder" ItemPlaceholderID="itemplaceholder" DataSourceID="SqlDataSource1" DataKeyNames="Product_Id" InsertItemPosition="LastItem">
            <LayoutTemplate>
               
                   <table runat="server" class="table">
                    <tr class="" runat="server">
                        <td runat="server">
                            <table class="table table-bordered table-hover " id="itemPlaceholderContainer" runat="server" border="0" style="">
                      <thead class="thead-dark">
    
                                <tr runat="server" style="">
                                    <th runat="server">Manament</th>
                                    <th runat="server">Product_Id</th>
                                    <th runat="server">Provider_Id</th>
                                    <th runat="server">Product_Name</th>
                                    <th runat="server">Product_Quantity</th>
                                    <th runat="server">Product_Price</th>
                                    <th runat="server">Product_Desc</th>
                                    <th runat="server">Product_Weight</th>
                                    <th runat="server">Category</th>
                                    <th runat="server">IsActive</th>
                                </tr>
                                </thead>
                                <tr id="itemplaceholder" runat="server">
                                </tr>                              
                          
                            </table>
                        </td>
                    </tr>
                       
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                   </table>
            </LayoutTemplate>
            <AlternatingItemTemplate>
               <table runat="server" class="table table table-bordered">
                <tr class="px-3">
                    <td>
                        <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="Product_IdLabel"  runat="server" Text='<%# Eval("Product_Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Provider_IdLabel" runat="server" Text='<%# Eval("Provider_Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_NameLabel" runat="server" Text='<%# Eval("Product_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_QuantityLabel" runat="server" Text='<%# Eval("Product_Quantity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_PriceLabel" runat="server" Text='<%# Eval("Product_Price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_DescLabel" runat="server" Text='<%# Eval("Product_Desc") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_WeightLabel" runat="server" Text='<%# Eval("Product_Weight") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsActiveCheckBox" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="false" />
                    </td>
                </tr>
                  </table>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                 <table runat="server" class=" table table-bordered">
                <tr class="px-3">
                    <td>
                        <asp:Button ID="UpdateButton" CssClass="btn btn-light" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="Product_IdLabel1"  runat="server" Text='<%# Eval("Product_Id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Provider_IdTextBox" runat="server" Text='<%# Bind("Provider_Id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_NameTextBox" runat="server" Text='<%# Bind("Product_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_QuantityTextBox" runat="server" Text='<%# Bind("Product_Quantity") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_PriceTextBox" runat="server" Text='<%# Bind("Product_Price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_DescTextBox" runat="server" Text='<%# Bind("Product_Desc") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_WeightTextBox" runat="server" Text='<%# Bind("Product_Weight") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsActiveCheckBox" runat="server" Checked='<%# Bind("IsActive") %>' />
                    </td>
                </tr>
                     </table>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
           
            <InsertItemTemplate>
                  <table runat="server" class=" table table-bordered">
                <tr  class="">
                   
                    <td>
                        <asp:Button ID="InsertButton" CssClass="btn btn-light" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="Provider_IdTextBox"  runat="server" Text='<%# Bind("Provider_Id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_NameTextBox" runat="server" Text='<%# Bind("Product_Name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_QuantityTextBox" runat="server" Text='<%# Bind("Product_Quantity") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_PriceTextBox" runat="server" Text='<%# Bind("Product_Price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_DescTextBox" runat="server" Text='<%# Bind("Product_Desc") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Product_WeightTextBox" runat="server" Text='<%# Bind("Product_Weight") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsActiveCheckBox" runat="server" Checked='<%# Bind("IsActive") %>' />
                    </td>
                </tr>
                      </table>
            </InsertItemTemplate>
            <ItemTemplate>
           <table runat="server" class="table table-bordered ">
                <tr  class="px-3">
                     <td>
                         <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                         <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                     </td>
                     <td>
                         <asp:Label ID="Product_IdLabel"  runat="server" Text='<%# Eval("Product_Id") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Provider_IdLabel" runat="server" Text='<%# Eval("Provider_Id") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Product_NameLabel" runat="server" Text='<%# Eval("Product_Name") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Product_QuantityLabel" runat="server" Text='<%# Eval("Product_Quantity") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Product_PriceLabel" runat="server" Text='<%# Eval("Product_Price") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Product_DescLabel" runat="server" Text='<%# Eval("Product_Desc") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Product_WeightLabel" runat="server" Text='<%# Eval("Product_Weight") %>' />
                     </td>
                     <td>
                         <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                     </td>
                     <td>
                         <asp:CheckBox ID="IsActiveCheckBox" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="false" />
                     </td>
          
                    
                 </tr>
               </table>
            </ItemTemplate>
            <SelectedItemTemplate>
                <tr  class="px-3">
                    <td>
                        <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="Product_IdLabel" runat="server" Text='<%# Eval("Product_Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Provider_IdLabel" runat="server" Text='<%# Eval("Provider_Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_NameLabel" runat="server" Text='<%# Eval("Product_Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_QuantityLabel" runat="server" Text='<%# Eval("Product_Quantity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_PriceLabel" runat="server" Text='<%# Eval("Product_Price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_DescLabel" runat="server" Text='<%# Eval("Product_Desc") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Product_WeightLabel" runat="server" Text='<%# Eval("Product_Weight") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="IsActiveCheckBox" runat="server" Checked='<%# Eval("IsActive") %>' Enabled="false" />
                    </td>
                </tr>
         
            </SelectedItemTemplate>
        </asp:ListView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OCS_DB %>" SelectCommand="SELECT P.Product_Id, P.Provider_Id, P.Product_Name, P.Product_Quantity, P.Product_Price, P.Product_Desc, P.Product_Weight, P.Category, P.IsActive, I.Product_Id AS Expr1, I.Product_img FROM TBL_Prodcut AS P LEFT OUTER JOIN Product_info AS I ON P.Product_Id = I.Product_Id" DeleteCommand="DELETE FROM [TBL_Prodcut] WHERE [Product_Id] = @Product_Id" InsertCommand="INSERT INTO [TBL_Prodcut] ([Provider_Id], [Product_Name], [Product_Quantity], [Product_Price], [Product_Desc], [Product_Weight], [Category], [IsActive]) VALUES (@Provider_Id, @Product_Name, @Product_Quantity, @Product_Price, @Product_Desc, @Product_Weight, @Category, @IsActive)" UpdateCommand="UPDATE [TBL_Prodcut] SET [Provider_Id] = @Provider_Id, [Product_Name] = @Product_Name, [Product_Quantity] = @Product_Quantity, [Product_Price] = @Product_Price, [Product_Desc] = @Product_Desc, [Product_Weight] = @Product_Weight, [Category] = @Category, [IsActive] = @IsActive WHERE [Product_Id] = @Product_Id">
            <DeleteParameters>
                <asp:Parameter Name="Product_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Provider_Id" Type="Int32" />
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Product_Quantity" Type="Int16" />
                <asp:Parameter Name="Product_Price" Type="Double" />
                <asp:Parameter Name="Product_Desc" Type="String" />
                <asp:Parameter Name="Product_Weight" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Provider_Id" Type="Int32" />
                <asp:Parameter Name="Product_Name" Type="String" />
                <asp:Parameter Name="Product_Quantity" Type="Int16" />
                <asp:Parameter Name="Product_Price" Type="Double" />
                <asp:Parameter Name="Product_Desc" Type="String" />
                <asp:Parameter Name="Product_Weight" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="Product_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
      
    </div>

        </div>
  <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
