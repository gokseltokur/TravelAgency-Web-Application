<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TRAVELAGENCY._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Accommodation</h1>
        <p class="lead">Book your the best hotel from cosy country homes to funky city flats</p>
        <p><a href="/accommodation.aspx" class="btn btn-primary btn-lg">Book &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Flights</h2>
            <p>
                Plan your perfect trip. Search Flights.
            <p>
                <a class="btn btn-default" href="/flights.aspx">Book &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Railways</h2>
            <p>
                Plan your perfect trip. Search Railways
            <p>
                <a class="btn btn-default" href="/railways.aspx">Book &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Car Rental</h2>
            <p>
                Compare deals from the biggest car hire companies.
            </p>
            <p>
                <a class="btn btn-default" href="/carrental.aspx">Rent &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>