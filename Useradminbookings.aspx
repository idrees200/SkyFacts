<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Useradminbookings.aspx.cs" Inherits="skyfacts.Userbookings" %>
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
                                        <h4>BOOKINGS</h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="imgs/booking.png" />
                                       
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                          
                                           <div class="col-md-12">
                                <label>Ticket ID</label>
                                                <div class="form-group">
                                    <div class="input-group">
                               
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="TicketID"></asp:TextBox>
                                     <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" />
                                
                                </div>
                            </div>
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
                                        <h4>BOOKED FLIGHTS</h4>
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SkyFactMainConnectionString %>" SelectCommand="SELECT * FROM [Bookings]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TicketID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="TicketID" HeaderText="TicketID" InsertVisible="False" ReadOnly="True" SortExpression="TicketID" />
                                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                                        <asp:BoundField DataField="Cancelled" HeaderText="Cancelled" SortExpression="Cancelled" />
                                        <asp:BoundField DataField="PsgnrFirstName" HeaderText="PsgnrFirstName" SortExpression="PsgnrFirstName" />
                                        <asp:BoundField DataField="PsgnrLastName" HeaderText="PsgnrLastName" SortExpression="PsgnrLastName" />
                                        <asp:BoundField DataField="FlightID" HeaderText="FlightID" SortExpression="FlightID" />
                                        <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                                        <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" SortExpression="TotalPrice" />
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
