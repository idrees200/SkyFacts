<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewAircrafts.aspx.cs" Inherits="skyfacts.ViewAircrafts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
      $(document).ready(function () {
      
          //$(document).ready(function () {
              //$('.table').DataTable();
         // });
      
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
          //$('.table1').DataTable();
      });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>AirCraft Details</h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="imgs/take-off.png" />
                                   
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                       <div class="row">
                            <div class="col-md-6">
                                <label>AM ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="AM ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Model No</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Model No"></asp:TextBox>

                                </div>
                            </div>
                        </div>


                         <div class="row">
                           

                            <div class="col-md-12">
                                <label>Manufacturer Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Manufacturer"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-md-12">
                                <label>Manufactured Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>

                                </div>
                            </div>
                                       
                        </div>
             

                         <div class="row">
                            <div class="col-md-6">
                                <label>Capacity</label>
                                <div class="form-group">
                                   
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Capacity" TextMode="Number"></asp:TextBox>
                                       
                                </div>
                            </div>

                            <div class="col-md-6">
                                  <label>Houses Bussiness</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Select" Value="select" />
                             
                              <asp:ListItem Text="0" Value="0" />
                              <asp:ListItem Text="1" Value="1" />
                           </asp:DropDownList>
                        </div>
                            </div>
                        </div>











                      

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
                            </div>
                        </div>


                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>AirCrafts List</h4>
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SkyFactMainConnectionString %>" SelectCommand="SELECT * FROM [AircraftModels]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AM_ID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="AM_ID" HeaderText="AM_ID" InsertVisible="False" ReadOnly="True" SortExpression="AM_ID" />
                                        <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                                        <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                                        <asp:BoundField DataField="ManufacturedDate" HeaderText="ManufacturedDate" SortExpression="ManufacturedDate" />
                                        <asp:BoundField DataField="Capacity" HeaderText="Capacity" SortExpression="Capacity" />
                                        <asp:BoundField DataField="HousesBusiness" HeaderText="HousesBusiness" SortExpression="HousesBusiness" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>



</asp:Content>
