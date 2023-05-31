<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="OnlineCoffeeShopping.Admin.Orders" %>
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
          <a class="nav-link rounded-pill" aria-current="page" href="Product.aspx">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link rounded-pill active" href="Orders.aspx">Orders</a>
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
         <div class="container-fluid">
             <asp:ListView ID="ListView1"  GroupPlaceholderID="Groupplaceholder" ItemPlaceholderID="itemplaceholder" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Order_Id" InsertItemPosition="LastItem">
                  <LayoutTemplate>
                <table class="table" runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">Order_Id</th>
                                    <th runat="server">Customer_id</th>
                                    <th runat="server">Product_id</th>
                                    <th runat="server">Order_date</th>
                                    <th runat="server">Order_Quantity</th>
                                    <th runat="server">Order_Weight</th>
                                    <th runat="server">Total_Price</th>
                                    <th runat="server">Order_Status</th>
                                </tr>
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
                      <tr style="">
                          <td>
                              <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                              <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                          </td>
                          <td>
                              <asp:Label ID="Order_IdLabel" runat="server" Text='<%# Eval("Order_Id") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Customer_idLabel" runat="server" Text='<%# Eval("Customer_id") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Product_idLabel" runat="server" Text='<%# Eval("Product_id") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Order_dateLabel" runat="server" Text='<%# Eval("Order_date") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Order_QuantityLabel" runat="server" Text='<%# Eval("Order_Quantity") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Order_WeightLabel" runat="server" Text='<%# Eval("Order_Weight") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("Total_Price") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Order_StatusLabel" runat="server" Text='<%# Eval("Order_Status") %>' />
                          </td>
                      </tr>
                  </AlternatingItemTemplate>
                  <EditItemTemplate>
                      <tr style="">
                          <td>
                              <asp:Button ID="UpdateButton" CssClass="btn btn-light" runat="server" CommandName="Update" Text="Update" />
                              <asp:Button ID="CancelButton" CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Cancel" />
                          </td>
                          <td>
                              <asp:Label ID="Order_IdLabel1" runat="server" Text='<%# Eval("Order_Id") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Customer_idTextBox" runat="server" Text='<%# Bind("Customer_id") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Product_idTextBox" runat="server" Text='<%# Bind("Product_id") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Order_dateTextBox" runat="server" Text='<%# Bind("Order_date") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Order_QuantityTextBox" runat="server" Text='<%# Bind("Order_Quantity") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Order_WeightTextBox" runat="server" Text='<%# Bind("Order_Weight") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Total_PriceTextBox" runat="server" Text='<%# Bind("Total_Price") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Order_StatusTextBox" runat="server" Text='<%# Bind("Order_Status") %>' />
                          </td>
                      </tr>
                  </EditItemTemplate>
                  <EmptyDataTemplate>
                      <table runat="server" style="">
                          <tr>
                              <td>No data was returned.</td>
                          </tr>
                      </table>
                  </EmptyDataTemplate>
                  <InsertItemTemplate>
                      <tr style="">
                          <td>
                              <asp:Button ID="InsertButton" CssClass="btn btn-light" runat="server" CommandName="Insert" Text="Insert" />
                              <asp:Button ID="CancelButton" CssClass="btn btn-light" runat="server" CommandName="Cancel" Text="Clear" />
                          </td>
                          <td>&nbsp;</td>
                          <td>
                              <asp:TextBox ID="Customer_idTextBox" runat="server" Text='<%# Bind("Customer_id") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Product_idTextBox" runat="server" Text='<%# Bind("Product_id") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Order_dateTextBox" runat="server" Text='<%# Bind("Order_date") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Order_QuantityTextBox" runat="server" Text='<%# Bind("Order_Quantity") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Order_WeightTextBox" runat="server" Text='<%# Bind("Order_Weight") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Total_PriceTextBox" runat="server" Text='<%# Bind("Total_Price") %>' />
                          </td>
                          <td>
                              <asp:TextBox ID="Order_StatusTextBox" runat="server" Text='<%# Bind("Order_Status") %>' />
                          </td>
                      </tr>
                  </InsertItemTemplate>
            <ItemTemplate>
                 <tr style="">
                     <td>
                         <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                         <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                     </td>
                     <td>
                         <asp:Label ID="Order_IdLabel" runat="server" Text='<%# Eval("Order_Id") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Customer_idLabel" runat="server" Text='<%# Eval("Customer_id") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Product_idLabel" runat="server" Text='<%# Eval("Product_id") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Order_dateLabel" runat="server" Text='<%# Eval("Order_date") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Order_QuantityLabel" runat="server" Text='<%# Eval("Order_Quantity") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Order_WeightLabel" runat="server" Text='<%# Eval("Order_Weight") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("Total_Price") %>' />
                     </td>
                     <td>
                         <asp:Label ID="Order_StatusLabel" runat="server" Text='<%# Eval("Order_Status") %>' />
                     </td>
                 </tr>
            </ItemTemplate>
                  <SelectedItemTemplate>
                      <tr style="">
                          <td>
                              <asp:Button ID="DeleteButton" CssClass="btn btn-light" runat="server" CommandName="Delete" Text="Delete" />
                              <asp:Button ID="EditButton" CssClass="btn btn-light" runat="server" CommandName="Edit" Text="Edit" />
                          </td>
                          <td>
                              <asp:Label ID="Order_IdLabel" runat="server" Text='<%# Eval("Order_Id") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Customer_idLabel" runat="server" Text='<%# Eval("Customer_id") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Product_idLabel" runat="server" Text='<%# Eval("Product_id") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Order_dateLabel" runat="server" Text='<%# Eval("Order_date") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Order_QuantityLabel" runat="server" Text='<%# Eval("Order_Quantity") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Order_WeightLabel" runat="server" Text='<%# Eval("Order_Weight") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Total_PriceLabel" runat="server" Text='<%# Eval("Total_Price") %>' />
                          </td>
                          <td>
                              <asp:Label ID="Order_StatusLabel" runat="server" Text='<%# Eval("Order_Status") %>' />
                          </td>
                      </tr>
                  </SelectedItemTemplate>
             </asp:ListView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OCS_DB %>" SelectCommand="SELECT * FROM [Order_Item]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Order_Item] WHERE [Order_Id] = @original_Order_Id AND [Customer_id] = @original_Customer_id AND [Product_id] = @original_Product_id AND (([Order_date] = @original_Order_date) OR ([Order_date] IS NULL AND @original_Order_date IS NULL)) AND [Order_Quantity] = @original_Order_Quantity AND [Order_Weight] = @original_Order_Weight AND [Total_Price] = @original_Total_Price AND [Order_Status] = @original_Order_Status" InsertCommand="INSERT INTO [Order_Item] ([Customer_id], [Product_id], [Order_date], [Order_Quantity], [Order_Weight], [Total_Price], [Order_Status]) VALUES (@Customer_id, @Product_id, @Order_date, @Order_Quantity, @Order_Weight, @Total_Price, @Order_Status)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Order_Item] SET [Customer_id] = @Customer_id, [Product_id] = @Product_id, [Order_date] = @Order_date, [Order_Quantity] = @Order_Quantity, [Order_Weight] = @Order_Weight, [Total_Price] = @Total_Price, [Order_Status] = @Order_Status WHERE [Order_Id] = @original_Order_Id AND [Customer_id] = @original_Customer_id AND [Product_id] = @original_Product_id AND (([Order_date] = @original_Order_date) OR ([Order_date] IS NULL AND @original_Order_date IS NULL)) AND [Order_Quantity] = @original_Order_Quantity AND [Order_Weight] = @original_Order_Weight AND [Total_Price] = @original_Total_Price AND [Order_Status] = @original_Order_Status">
                 <DeleteParameters>
                     <asp:Parameter Name="original_Order_Id" Type="Int32" />
                     <asp:Parameter Name="original_Customer_id" Type="Int32" />
                     <asp:Parameter Name="original_Product_id" Type="Int32" />
                     <asp:Parameter DbType="Date" Name="original_Order_date" />
                     <asp:Parameter Name="original_Order_Quantity" Type="Int16" />
                     <asp:Parameter Name="original_Order_Weight" Type="String" />
                     <asp:Parameter Name="original_Total_Price" Type="Double" />
                     <asp:Parameter Name="original_Order_Status" Type="String" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="Customer_id" Type="Int32" />
                     <asp:Parameter Name="Product_id" Type="Int32" />
                     <asp:Parameter DbType="Date" Name="Order_date" />
                     <asp:Parameter Name="Order_Quantity" Type="Int16" />
                     <asp:Parameter Name="Order_Weight" Type="String" />
                     <asp:Parameter Name="Total_Price" Type="Double" />
                     <asp:Parameter Name="Order_Status" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="Customer_id" Type="Int32" />
                     <asp:Parameter Name="Product_id" Type="Int32" />
                     <asp:Parameter DbType="Date" Name="Order_date" />
                     <asp:Parameter Name="Order_Quantity" Type="Int16" />
                     <asp:Parameter Name="Order_Weight" Type="String" />
                     <asp:Parameter Name="Total_Price" Type="Double" />
                     <asp:Parameter Name="Order_Status" Type="String" />
                     <asp:Parameter Name="original_Order_Id" Type="Int32" />
                     <asp:Parameter Name="original_Customer_id" Type="Int32" />
                     <asp:Parameter Name="original_Product_id" Type="Int32" />
                     <asp:Parameter DbType="Date" Name="original_Order_date" />
                     <asp:Parameter Name="original_Order_Quantity" Type="Int16" />
                     <asp:Parameter Name="original_Order_Weight" Type="String" />
                     <asp:Parameter Name="original_Total_Price" Type="Double" />
                     <asp:Parameter Name="original_Order_Status" Type="String" />
                 </UpdateParameters>
             </asp:SqlDataSource>

             <h2>Shipping details</h2>
             <asp:ListView ID="ListView2" runat="server" DataKeyNames="Order_Id" DataSourceID="SqlDataSource2">
                 <AlternatingItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Label ID="Order_IdLabel" runat="server" Text='<%# Eval("Order_Id") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerCountryLabel" runat="server" Text='<%# Eval("CustomerCountry") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerAddressLabel" runat="server" Text='<%# Eval("CustomerAddress") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerCityLabel" runat="server" Text='<%# Eval("CustomerCity") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerZipCodeLabel" runat="server" Text='<%# Eval("CustomerZipCode") %>' />
                         </td>
                         <td>
                             <asp:Label ID="TransactionIdLabel" runat="server" Text='<%# Eval("TransactionId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="Order_StatusLabel" runat="server" Text='<%# Eval("Order_Status") %>' />
                         </td>
                     </tr>
                 </AlternatingItemTemplate>
                 <EditItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                             <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                         </td>
                         <td>
                             <asp:Label ID="Order_IdLabel1" runat="server" Text='<%# Eval("Order_Id") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="CustomerNameTextBox" runat="server" Text='<%# Bind("CustomerName") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="CustomerCountryTextBox" runat="server" Text='<%# Bind("CustomerCountry") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="CustomerAddressTextBox" runat="server" Text='<%# Bind("CustomerAddress") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="CustomerCityTextBox" runat="server" Text='<%# Bind("CustomerCity") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="CustomerZipCodeTextBox" runat="server" Text='<%# Bind("CustomerZipCode") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="TransactionIdTextBox" runat="server" Text='<%# Bind("TransactionId") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="Order_StatusTextBox" runat="server" Text='<%# Bind("Order_Status") %>' />
                         </td>
                     </tr>
                 </EditItemTemplate>
                 <EmptyDataTemplate>
                     <table runat="server" style="">
                         <tr>
                             <td>No data was returned.</td>
                         </tr>
                     </table>
                 </EmptyDataTemplate>
                 <InsertItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                             <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                         </td>
                         <td>&nbsp;</td>
                         <td>
                             <asp:TextBox ID="CustomerNameTextBox" runat="server" Text='<%# Bind("CustomerName") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="CustomerCountryTextBox" runat="server" Text='<%# Bind("CustomerCountry") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="CustomerAddressTextBox" runat="server" Text='<%# Bind("CustomerAddress") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="CustomerCityTextBox" runat="server" Text='<%# Bind("CustomerCity") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="CustomerZipCodeTextBox" runat="server" Text='<%# Bind("CustomerZipCode") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="TransactionIdTextBox" runat="server" Text='<%# Bind("TransactionId") %>' />
                         </td>
                         <td>
                             <asp:TextBox ID="Order_StatusTextBox" runat="server" Text='<%# Bind("Order_Status") %>' />
                         </td>
                     </tr>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Label ID="Order_IdLabel" runat="server" Text='<%# Eval("Order_Id") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerCountryLabel" runat="server" Text='<%# Eval("CustomerCountry") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerAddressLabel" runat="server" Text='<%# Eval("CustomerAddress") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerCityLabel" runat="server" Text='<%# Eval("CustomerCity") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerZipCodeLabel" runat="server" Text='<%# Eval("CustomerZipCode") %>' />
                         </td>
                         <td>
                             <asp:Label ID="TransactionIdLabel" runat="server" Text='<%# Eval("TransactionId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="Order_StatusLabel" runat="server" Text='<%# Eval("Order_Status") %>' />
                         </td>
                     </tr>
                 </ItemTemplate>
                 <LayoutTemplate>
                     <table runat="server">
                         <tr runat="server">
                             <td runat="server">
                                 <table class="table" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                     <tr runat="server" style="">
                                         <th runat="server">Order_Id</th>
                                         <th runat="server">CustomerName</th>
                                         <th runat="server">CustomerCountry</th>
                                         <th runat="server">CustomerAddress</th>
                                         <th runat="server">CustomerCity</th>
                                         <th runat="server">CustomerZipCode</th>
                                         <th runat="server">TransactionId</th>
                                         <th runat="server">Order_Status</th>
                                     </tr>
                                     <tr id="itemPlaceholder" runat="server">
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
                 <SelectedItemTemplate>
                     <tr style="">
                         <td>
                             <asp:Label ID="Order_IdLabel" runat="server" Text='<%# Eval("Order_Id") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerCountryLabel" runat="server" Text='<%# Eval("CustomerCountry") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerAddressLabel" runat="server" Text='<%# Eval("CustomerAddress") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerCityLabel" runat="server" Text='<%# Eval("CustomerCity") %>' />
                         </td>
                         <td>
                             <asp:Label ID="CustomerZipCodeLabel" runat="server" Text='<%# Eval("CustomerZipCode") %>' />
                         </td>
                         <td>
                             <asp:Label ID="TransactionIdLabel" runat="server" Text='<%# Eval("TransactionId") %>' />
                         </td>
                         <td>
                             <asp:Label ID="Order_StatusLabel" runat="server" Text='<%# Eval("Order_Status") %>' />
                         </td>
                     </tr>
                 </SelectedItemTemplate>

             </asp:ListView>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OCS_DB %>" SelectCommand="SELECT [Order_Id], [CustomerName], [CustomerCountry], [CustomerAddress], [CustomerCity], [CustomerZipCode], [TransactionId], [Order_Status] FROM [Order_Item]"></asp:SqlDataSource>
         </div>
         </div>
      <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
