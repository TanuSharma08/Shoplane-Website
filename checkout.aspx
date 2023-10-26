<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section id="cart">
        <h1>Checkout</h1>
        <div class="container">
            <div class="left-side">
                <p>Total Items: <span id="number-of-item"></span></p>
                <div class="cart-items" id="cart-item-container"></div>
            </div>
            <div class="right-side">
                <div class="total-amount">
                    <h2>Total Amount</h2>
                    <p>Total Amount: Rs <span id="total-amount"></span></p>
                    <asp:Button ID="Button1" CssClass="button" runat="server" Text="Place Order" PostBackUrl="orderconfirm.aspx" />
                </div>
            </div>
        </div>
    </section>
    <script>
        function addDataIntoList(productData) {

            if (window.localStorage.getItem("product-list") === null) {
                myCartData = [];
            }

            else {
                myCartData = JSON.parse(window.localStorage.getItem("product-list"));
            }


            if (myCartData.length === 0) {
                var myObj = {
                    id: productData.id,
                    title: productData.name,
                    count: 1,
                    price: productData.price,
                    preview: productData.preview
                };
                myCartData.push(myObj);
            }

            else if (myCartData.length != 0) {
                var w = 0;

                for (var i = 0; i < myCartData.length; i++) {
                    if (myCartData[i].id == productData.id) {
                        myCartData[i].count = parseInt(myCartData[i].count) + 1;
                        w += 1;
                    }
                }

                if (w == 0) {
                    var myObj = {
                        id: productData.id,
                        title: productData.name,
                        count: 1,
                        price: productData.price,
                        preview: productData.preview
                    };
                    myCartData.push(myObj);
                }
            }
          
            window.localStorage.setItem("product-list", JSON.stringify(myCartData));
        }
    </script>
</asp:Content>

