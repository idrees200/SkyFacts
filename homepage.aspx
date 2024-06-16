<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="skyfacts.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section>
      <img src="imgs/homie.jpg" class="img-fluid"/>
   </section>
     <section>
          <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Our Features</h2>
                  <p><b>Our 4 Primary Features -</b></p>
               </center>
            </div>
         </div>
               <div class="row">
            <div class="col-md-3">
               <center>
                  <img width="150px" src="imgs/representative.png"/>
                  <h4>Flights Booking</h4>
                  <p class="text-justify">We provide users a platform to booking their flights while sittng at any place in the world.          </center>
            </div>
            <div class="col-md-3">
               <center>
                  <img width="150px" src="imgs/airplane-ticket.png"/>
                  <h4>Ticket Reservation</h4>
                  <p class="text-justify">We provide users a great oppurtinity to reserve their seats in their favourite airlines and aircrafts for their memorable tours.</p>
               </center>
            </div>
            <div class="col-md-3">
               <center>
                  <img width="150px" src="imgs/best-employee.png"/>
                  <h4>Flight Ratings</h4>
                  <p class="text-justify">We provide users a platform where they can check ratings of any airline before travelling to avoid any unpleasent issues.</p>
               </center>
            </div>
                    <div class="col-md-3">
               <center>
                  <img width="150px" src="imgs/globe.png"/>
                  <h4>View Airplane Routes</h4>
                  <p class="text-justify">We allow our users to view all routes of airlines to make thier value able decision worth it.</p>
               </center>
            </div>
         </div> 
      </div>
          <section>
      <img src="imgs/disc.jpg" class="img-fluid"/>
   </section>
         </section>
</asp:Content>
