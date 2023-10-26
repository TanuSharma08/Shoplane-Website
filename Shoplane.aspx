<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Shoplane.aspx.cs" Inherits="Shoplane" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Slider -->

    <div id="banner">
        <img class="banner" src="https://shoplane.netlify.app/img/img1.png" alt>
        <img class="banner" src="https://shoplane.netlify.app/img/img2.png" alt>
        <img class="banner" src="https://shoplane.netlify.app/img/img3.png" alt>
        <img class="banner" src="https://shoplane.netlify.app/img/img4.png" alt>
    </div>

    <div id="slider-controls">
        <div class="slider-dot" data-slide="0"></div>
        <div class="slider-dot" data-slide="1"></div>
        <div class="slider-dot" data-slide="2"></div>
        <div class="slider-dot" data-slide="3"></div>
    </div>

    <!-- Green Circles -->

    <div class="green">
        <div class="circle">
            <div class="imgs">
                <img class="img" src="https://shoplane.netlify.app/img/icon1.png" alt></div>
            <h4>Free Delivery</h4>
        </div>

        <div class="circle">
            <div class="imgs">
                <img class="img" src="https://shoplane.netlify.app/img/icon2.png" alt></div>
            <h4>Money Back Guarantee</h4>
        </div>

        <div class="circle">
            <div class="imgs">
                <img class="img" src="https://shoplane.netlify.app/img/icon3.png" alt></div>
            <h4>Always Support</h4>
        </div>

        <div class="circle">
            <div class="imgs">
                <img class="img" src="https://shoplane.netlify.app/img/icon4.png" alt></div>
            <h4>Secure Payment</h4>
        </div>
    </div>

    <!-- Cards -->

    <section id="product-list">
        <h2 class="section-heading" id="clothings">Clothing for Men and Women</h2>
        <div class="card-conatiner" id="clothingCards"></div>
        <h2 class="section-heading" id="accessories">Accessories for Men and Women</h2>
        <div class="card-conatiner" id="accessoriesCards"></div>
    </section>
</asp:Content>

