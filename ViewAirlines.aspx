﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewAirlines.aspx.cs" Inherits="skyfacts.ViewAirlines" %>
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
                                        <h4>Airlines Details</h4>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="imgs/route.png" />
                                       
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Flights Count</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="flights count" TextMode="Number"></asp:TextBox>

                                </div>
                            </div>
                                           <div class="col-md-8">
                                <label>Airline Name</label>
                                                <div class="form-group">
                                    <div class="input-group">
                               
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Airline Name"></asp:TextBox>
                                     <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                
                                </div>
                            </div>
                                                 </div>
                        </div>

                         <div class="row">
                            <div class="col-md-6">
                                <label>Base Country</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Country"></asp:TextBox>

                                </div>
                            </div>
                                           <div class="col-md-6">
                                <label>Base City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="City"></asp:TextBox>

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
                                        <h4>Airlines List</h4>
                                    </center>
                            </div>
                        </div>

                       

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SkyFactMainConnectionString %>" SelectCommand="SELECT * FROM [Airliness]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Name" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="AirlineID" HeaderText="AirlineID" InsertVisible="False" ReadOnly="True" SortExpression="AirlineID" />
                                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                                        <asp:BoundField DataField="BaseCity" HeaderText="BaseCity" SortExpression="BaseCity" />
                                        <asp:BoundField DataField="BaseCountry" HeaderText="BaseCountry" SortExpression="BaseCountry" />
                                        <asp:BoundField DataField="OfferedFlightsCount" HeaderText="OfferedFlightsCount" SortExpression="OfferedFlightsCount" />
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
