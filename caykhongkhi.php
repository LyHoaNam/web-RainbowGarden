<?php 
include "php/connectDB.php";
$db=new DataAccessHelper;
$db->connect();
?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Cây không khí</title>
  <link rel="shortcut icon" href="img/logo.ico" />
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
  <link href="css/custom.css" rel="stylesheet">
  <link href="css/styles.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand GreenBrand" href="index.html"><img src="img/logobn.png">RainBow Garden</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">

           <a class="nav-link" href="caymini.html">Cây mini</a>
         </li>
         <li class="nav-item">
          <a class="nav-link" href="caykhongkhi.php" style="color: #a1e6a1 !important">Cây không khí</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cayhandmade.php">Cây handmade</a>
        </li>

        <li>
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search"/>
            <span class="input-group-button">
              <button class="btn btn-default" style="background-color: #4b9249">
                <i class="fa fa-search"></i>
              </button>
            </span>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="contact.html">
            Liên hệ
          </a>
        </li>
        <li>
          <button class="btn btnGH my-cart-icon" style="background-color: #4b9249">
            <i class="fa fa-shopping-cart shopping_bg my-cart-badge" aria-hidden="true"></i>
          </button>       
        </li>

      </ul>
    </div>
  </div>
</nav>

<!-- Page Content -->
<div class="container">

  <!-- Page Heading/Breadcrumbs -->
  <br>
  <h1 class="GreenBrand">RainBow Garden
    <small style="font-family: Arial">Cây không khí</small>
  </h1>

  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href="index.html">Trang Chủ</a>
    </li>
    <li class="breadcrumb-item active">Cây không khí</li>
  </ol>

  <style type="text/css">
  a
  { color: #4b9249 ;

  }
  a:hover
  {
    color: #a1e6a1 !important;
  }
</style>
<div class="row">

  <?php 
  $size = 8;
  $danhmuccon = 2;
  if (isset($_GET['tukhoa'])) {

    $result = $db->executeQuery("select count(*) countid from product where (name like '%{$_GET['tukhoa']}%' or price = {$_GET['tukhoa']})" );
  }
  else

    $result=$db->executeQuery("SELECT count(id) countid from product");
  $row=mysqli_fetch_assoc($result);
  $numpd= $row["countid"];
  $tongsotrang=$numpd/8;
  include("php/products-list.php"); ?>
</div>

<!-- Pagination -->


</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
  <div class="container">
    <p class="m-0 text-center text-white" style="color: #a1e6a1 !important">Rainbow Graden là nhóm các bạn trẻ năng động được thành lập từ môn Phát triển ứng dụng web. Với mới mong muốn mang đến cuộc sống nhiều màu xanh hơn. </p>
  </div>
  <!-- /.container -->

</footer>


<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper/popper.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/jquery-2.2.3.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
 <script type='text/javascript' src="js/jquery.mycart.js"></script>



<script type="text/javascript">
  $(function () {

    var goToCartIcon = function($addTocartBtn){
      var $cartIcon = $(".my-cart-icon");
      var $image = $('<img width="30px" height="30px" src="' + $addTocartBtn.data("image") + '"/>').css({"position": "fixed", "z-index": "999"});
      $addTocartBtn.prepend($image);
      var position = $cartIcon.position();
      $image.animate({
        top: position.top,
        left: position.left
      }, 500 , "linear", function() {
        $image.remove();
      });
    }

    $('.my-cart-btn').myCart({
      currencySymbol: '$',
      classCartIcon: 'my-cart-icon',
      classCartBadge: 'my-cart-badge',
      classProductQuantity: 'my-product-quantity',
      classProductRemove: 'my-product-remove',
      classCheckoutCart: 'my-cart-checkout',
      affixCartIcon: true,
      showCheckoutModal: true,
      numberOfDecimals: 2,
      cartItems: [
        
      ],
      //hieu ung nhay vao gio
      clickOnAddToCart: function($addTocart){
        goToCartIcon($addTocart);
      },
      afterAddOnCart: function(products, totalPrice, totalQuantity) {
        console.log("afterAddOnCart", products, totalPrice, totalQuantity);
      },
      clickOnCartIcon: function($cartIcon, products, totalPrice, totalQuantity) {
        console.log("cart icon clicked", $cartIcon, products, totalPrice, totalQuantity);
      },
      checkoutCart: function(products, totalPrice, totalQuantity) {
        var checkoutString = "Total Price: " + totalPrice + "\nTotal Quantity: " + totalQuantity;
        checkoutString += "\n\n id \t name \t summary \t price \t quantity \t image path";
        $.each(products, function(){
          checkoutString += ("\n " + this.id + " \t " + this.name + " \t " + this.summary + " \t " + this.price + " \t " + this.quantity + " \t " + this.image);
        });
        alert(checkoutString)
        console.log("checking out", products, totalPrice, totalQuantity);
      },
      getDiscountPrice: function(products, totalPrice, totalQuantity) {
        console.log("calculating discount", products, totalPrice, totalQuantity);
        return totalPrice * 0.5;
      }
    });

    $("#addNewProduct").click(function(event) {
      var currentElementNo = $(".row").children().length + 1;
      $(".row").append('<div class="col-md-3 text-center"><img src="images/img_empty.png" width="150px" height="150px"><br>product ' + currentElementNo + ' - <strong>$' + currentElementNo + '</strong><br><button class="btn btn-danger my-cart-btn" data-id="' + currentElementNo + '" data-name="product ' + currentElementNo + '" data-summary="summary ' + currentElementNo + '" data-price="' + currentElementNo + '" data-quantity="1" data-image="images/img_empty.png">Add to Cart</button><a href="#" class="btn btn-info">Details</a></div>')
    });
  });
  </script>
<!--
<script type="text/javascript" src="js/jquery_easing.js"></script>
<script type="text/javascript">

  jQuery(function($) {

    $('.add-to-cart').click(function() {
      var cart = $('.shopping_bg');
      var imgtofly = $(this).parents('div.cart_items').find('a.product-image img').eq(0);
      if (imgtofly) {
        var imgclone = imgtofly.clone()
        .offset({ top:imgtofly.offset().top, left:imgtofly.offset().left })
        .css({'opacity':'0.7', 'position':'absolute', 'height':'150px', 'width':'150px', 'z-index':'1000'})
        .appendTo($('body'))
        .animate({
          'top':cart.offset().top + 10,
          'left':cart.offset().left + 30,
          'width':55,
          'height':55
        }, 1000, 'easeInElastic');
        imgclone.animate({'width':0, 'height':0}, function(){ $(this).detach() });
      }
      return false;
    });
  });
</script>
-->

</body>

</html>
