<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
        <link href="shop.css" rel="stylesheet" />
    </head>
    <section>
        <div id="product-details" class="right">
            <img id="product-preview">
        </div>
        <div class="left">
            <h1 id="product-name"></h1>
            <h3 id="product-brand" class="h3"></h3>
            <h3 class="h3">Price: Rs <span id="product-price"></span></h3>
            <h3 class="h3">Description</h3>
            <p id="product-description"></p>
            <h3 class="h3">Product Preview</h3>
            <div id="product-photos" class="preview"></div>
            <div class="btn">
                <button id="add-to-cart" type="button">Add to Cart</button>
            </div>
        </div>
    </section>
    <script>
    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get("product_id");
    
    const apiUrl = `https://5d76bf96515d1a0014085cf9.mockapi.io/product/${productId}`;
    
        fetch(apiUrl)
          .then(response => {
              if (!response.ok) {
              throw new Error('Network response was not ok');
        }
        return response.json();
        })
      .then(productData => {
          document.getElementById('product-name').textContent = productData.name;
        document.getElementById('product-description').textContent = productData.description;
        document.getElementById('product-price').textContent = productData.price;
        document.getElementById('product-brand').textContent = productData.brand;
    
        const productPhotosContainer = document.getElementById('product-photos');
        productData.photos.forEach((photoUrl, index) => {
            const img = document.createElement('img');
        img.src = photoUrl;
        img.classList.add('prev');
    
        if (index === 0) {
            img.classList.add('active');
            document.getElementById('product-preview').src = img.src;
        }
    
        img.addEventListener('click', () => {
            const productPhotos = document.querySelectorAll('.prev');
        productPhotos.forEach(img => img.classList.remove('active'));
        img.classList.add('active');
    
        document.getElementById('product-preview').src = img.src;
        });
        productPhotosContainer.appendChild(img);
        });
        })

      .catch(error => console.error('Error fetching data:', error));


        addToCartBtn.addEventListener("click", function() {
            var productId = window.location.search.split("=")[1];
            var urlLink =
              "https://5d76bf96515d1a0014085cf9.mockapi.io/product/" + productId;

            function getDataForLocalStorage() {
                var http = new XMLHttpRequest();
                http.onreadystatechange = function() {
                    if (this.readyState === 4) {
                        if (this.status === 200) {
                            var productData = JSON.parse(this.responseText);
                            addDataIntoList(productData);
                        }
                    }
                };
                http.open("GET", urlLink, true);
                http.send();
            }
            cartCount();
            getDataForLocalStorage();
        });

        function cartCount() {
            if (window.localStorage.getItem("cart-count") === null) {
                cartIntialValue = 0;
            } else {
                cartIntialValue = JSON.parse(window.localStorage.getItem("cart-count"));
                cart.innerHTML = cartIntialValue;
            }
            var cartCurrentValue = cartIntialValue + 1;
            window.localStorage.setItem("cart-count", cartCurrentValue);
            cart.innerHTML = window.localStorage.getItem("cart-count");
        }
        cart.innerHTML = window.localStorage.getItem("cart-count");
    </script>
</asp:Content>

