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
                <button id="add-to-cart">Add to Cart</button>
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

    </script>
</asp:Content>

