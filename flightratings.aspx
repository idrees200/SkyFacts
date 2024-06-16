<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="flightratings.aspx.cs" Inherits="skyfacts.flightratings" %>
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
                                        <h4>RATINGS</h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="imgs/customer-review.png" />
                                       
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
                                <label>Flight ID</label>
                                                <div class="form-group">
                                    <div class="input-group">
                               
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Flight ID"></asp:TextBox>
                                     <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                
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
                                        <h4>User Ratings</h4>
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SkyFactMainConnectionString %>" SelectCommand="SELECT * FROM [Ratings]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                                        <asp:BoundField DataField="FlightID" HeaderText="FlightID" SortExpression="FlightID" />
                                        <asp:BoundField DataField="Airline" HeaderText="Airline" SortExpression="Airline" />
                                        <asp:BoundField DataField="FlightRating" HeaderText="FlightRating" SortExpression="FlightRating" />
                                        <asp:BoundField DataField="AirlineRating" HeaderText="AirlineRating" SortExpression="AirlineRating" />
                                        <asp:BoundField DataField="SkyFactRating" HeaderText="SkyFactRating" SortExpression="SkyFactRating" />
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
