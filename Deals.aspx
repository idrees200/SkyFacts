<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Deals.aspx.cs" Inherits="skyfacts.Deals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
            <div class="row">

                <div class="col-sm-12">
                    <center>
                        <h3>
                        TICKETS AVAILIABLE</h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                      <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SkyFactMainConnectionString %>" SelectCommand="SELECT * FROM [Flights]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FlightID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="FlightID" HeaderText="FlightID" InsertVisible="False" ReadOnly="True" SortExpression="FlightID" />
                               
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-10">
                                             <div class="row">
                                                <div class="col-12">
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("Airline") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   <span> Route - </span>
                                                   <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("RouteID") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>AirCraft - </span>
                                                   <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("AircraftModel") %>'></asp:Label>
                                                   &nbsp;| 
                                                  
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                  <span>Departure Date - </span>
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("DepartingDate") %>'></asp:Label>
                                                   &nbsp;| Departure Time -
                                                   <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("DepartingTime") %>'></asp:Label>
                                                   &nbsp;| Arrival Date -
                                                   <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("ArrivalDate") %>'></asp:Label>
                                                   &nbsp;| Arrival Time-
                                                   <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("ArrivalTime") %>'></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   Fare Economy -
                                                   <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("FareEconomy") %>'></asp:Label>
                                                   &nbsp;| Fare Bussiness -
                                                   <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("FareBusiness") %>'></asp:Label>
                                                   &nbsp;| Currency -
                                                   <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("Currency") %>'></asp:Label>
                                                   
                            <br />
                                                </div>
                                             </div>
                                        
                    
                         
                                          </div>
                                          <div class="col-lg-2">
                                             <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("imglink") %>' />
                                          </div>
                                       </div>
                                    </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
                     </div>
                </div>
        </div>


</asp:Content>
