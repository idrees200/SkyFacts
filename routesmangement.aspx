<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="routesmangement.aspx.cs" Inherits="skyfacts.routesmangement" %>
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


      <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>ROUTES</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/ro.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
               
                  <div class="row">
                     <div class="col-md-5">
                        <label>Route Id</label>
                        <div class="form-group">
                          
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Route ID"></asp:TextBox>
                                <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                        
                        </div>
                     </div>
                     <div class="col-md-7">
                        <label>Number of Stops</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="No Of Stops" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>From Country</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Country"></asp:TextBox>
                        </div>
                          </div>
                      <div class="col-md-6">
                        <label>To Country</label>
                      <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Country"></asp:TextBox>
                        </div>
                     </div>
                      </div>

                    <div class="row">
                     <div class="col-md-6">

                        <label>From City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                        <div class="col-md-6">
                       <label>To City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                     </div>

                   <div class="row">
                     <div class="col-md-6">
                        <label>Departure Airport</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Airport"></asp:TextBox>
                        </div>
                          </div>
                      <div class="col-md-6">
                        <label>Arrival Airport</label>
                      <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" placeholder="Airport"></asp:TextBox>
                        </div>
                     </div>
                      </div>

                <div class="row">
                     <div class="col-md-6">

                        <label>First Stop City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Stop" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                        <div class="col-md-6">
                       <label>First Stop Country</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Stop" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                     </div>
                       <div class="row">
                     <div class="col-md-6">

                        <label>Second Stop City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Stop" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                        <div class="col-md-6">
                       <label>Second Stop Country</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Stop" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                     </div>
                       <div class="row">
                     <div class="col-md-6">

                        <label>Third Stop City</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Stop" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                        <div class="col-md-6">
                       <label>Third Stop Country</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Stop" TextMode="SingleLine"></asp:TextBox>
                        </div>
                     </div>
                     </div>




               
               
                
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" />
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
                           <h4>AVAILIABLE</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SkyFactMainConnectionString %>" SelectCommand="SELECT * FROM [Routes]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RouteID" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="RouteID" HeaderText="RouteID" InsertVisible="False" ReadOnly="True" SortExpression="RouteID" />
                                <asp:BoundField DataField="From_City" HeaderText="From_City" SortExpression="From_City" />
                                <asp:BoundField DataField="From_Country" HeaderText="From_Country" SortExpression="From_Country" />
                                <asp:BoundField DataField="To_City" HeaderText="To_City" SortExpression="To_City" />
                                <asp:BoundField DataField="To_Country" HeaderText="To_Country" SortExpression="To_Country" />
                                <asp:BoundField DataField="DepartureAirport" HeaderText="DepartureAirport" SortExpression="DepartureAirport" />
                                <asp:BoundField DataField="ArrivalAirport" HeaderText="ArrivalAirport" SortExpression="ArrivalAirport" />
                                <asp:BoundField DataField="NumberOfStops" HeaderText="NumberOfStops" SortExpression="NumberOfStops" />
                                <asp:BoundField DataField="FirstStopCity" HeaderText="FirstStopCity" SortExpression="FirstStopCity" />
                                <asp:BoundField DataField="FirstStopCountry" HeaderText="FirstStopCountry" SortExpression="FirstStopCountry" />
                                <asp:BoundField DataField="SecondStopCity" HeaderText="SecondStopCity" SortExpression="SecondStopCity" />
                                <asp:BoundField DataField="SecondStopCountry" HeaderText="SecondStopCountry" SortExpression="SecondStopCountry" />
                                <asp:BoundField DataField="ThirdStopCity" HeaderText="ThirdStopCity" SortExpression="ThirdStopCity" />
                                <asp:BoundField DataField="ThirdStopCountry" HeaderText="ThirdStopCountry" SortExpression="ThirdStopCountry" />
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
