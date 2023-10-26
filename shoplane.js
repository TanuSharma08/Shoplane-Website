// header

function navSlide() {
    var burger = document.querySelector(".burger");
    var nav = document.querySelector(".nav-links");

    burger.addEventListener("click", function () {
        nav.classList.toggle("nav-active");
        burger.classList.toggle("toggle");
    });
}
navSlide();

// Slider 

$(document).ready(function () {
    const $banner = $("#banner");
    const $sliderControls = $("#slider-controls");

    $banner.slick({
        dots: true,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        arrows: false
    });

    $sliderControls.on('click', '.slider-dot', function () {
        const slideIndex = $(this).data('slide');
        $banner.slick('slickGoTo', slideIndex);
    });
});

// Cards

var clothingCards = document.getElementById("clothingCards");
        var accessoriesCards = document.getElementById("accessoriesCards");

        function createItemCard(id, preview, name, brand, price) {

            var cardElement = document.createElement("div");
            cardElement.setAttribute("class", "card");
            cardElement.setAttribute("id", id);

            var cardLink = document.createElement("a");
            cardLink.href = "products.aspx?product_id=" + id;

            var imgContainer = document.createElement("div");
            imgContainer.setAttribute("class", "imgg");

            var newImgElement = document.createElement("img");
            newImgElement.src = preview;

            imgContainer.appendChild(newImgElement);

            var deatils = document.createElement("div");
            deatils.setAttribute("class", "details");

            var newTitleElement = document.createElement("h3");
            var newName = document.createTextNode(name);

            newTitleElement.appendChild(newName);
            deatils.appendChild(newTitleElement);

            var newBrandElement = document.createElement("h4");
            var newBrand = document.createTextNode(brand);

            newBrandElement.appendChild(newBrand);
            deatils.appendChild(newBrandElement);

            var newPriceElement = document.createElement("h5");
            var newPriceText = document.createTextNode("Rs ");
            var newPrice = document.createTextNode(price);
            newPriceElement.appendChild(newPriceText);

            newPriceElement.appendChild(newPrice);
            deatils.appendChild(newPriceElement);

            cardLink.appendChild(imgContainer);
            cardLink.appendChild(deatils);

            cardElement.appendChild(cardLink);

            return cardElement;
        }


        function getCardsData() {
            $.get("https://5d76bf96515d1a0014085cf9.mockapi.io/product", function (data) {
                var responseData = data;
                for (var i = 0; i < responseData.length; i++) {
                    if (responseData[i].isAccessory === false) {
                        clothingCards.append(
                            createItemCard(
                                responseData[i].id,
                                responseData[i].preview,
                                responseData[i].name,
                                responseData[i].brand,
                                responseData[i].price
                            )
                        );
                    } else {
                        accessoriesCards.append(
                            createItemCard(
                                responseData[i].id,
                                responseData[i].preview,
                                responseData[i].name,
                                responseData[i].brand,
                                responseData[i].price
                            )
                        );
                    }
                }
            });
        }
        getCardsData();

// add to cart

        var addToCartBtn = document.getElementById("add-to-cart");
        var cart = document.getElementById("cart-count");
        var myCartData = [];
        var cartIntialValue;

        if(localStorage.getItem('cart-count') == null) {
            localStorage.setItem('cart-count', '0');
        } else {
            var cartValue = localStorage.getItem('cart-count');
            localStorage.setItem('cart-count', cartValue);
        }
        
// event listener

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








