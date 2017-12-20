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

  <title>Cây Handmade</title>
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
          <a class="nav-link" href="caykhongkhi.html">Cây không khí</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cayhandmade.html" style="color: #a1e6a1 !important">Cây handmade</a>
        </li>

        <li>
          <form class="input-with-submit header-search" method="GET" >
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search" name="tukhoa">
              <span class="input-group-button">
                <button class="btn btn-default" style="background-color: #4b9249" type="submit" >
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="contact.html">
            Liên hệ
          </a>
        </li>
        
        <li>


          <button class="btn btnGH" style="background-color: #4b9249">
            <strong>
              <i class="fa fa-shopping-cart shopping_bg my-cart-icon" aria-hidden="true"><span class="badge badge-notify my-cart-badge"></span></i>

            </strong>


          </button>   

        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <br>
    <h1 class="GreenBrand">RainBow Garden
      <small style="font-family: Arial">Cây handmade</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Trang Chủ</a>
      </li>
      <li class="breadcrumb-item active">Cây handmade</li>
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

    <!-- product list-->

    <?php 
    $size = 8;
    $danhmuccon = 3;
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
  <div>
   <ul class="pagination justify-content-center" >

    <?php 


    for($i=1;$i<=$tongsotrang;$i++)
    {
      echo "<li class=\"page-item\">
      <a class=\"page-link\" href=\"?trang={$i}\">{$i}</a>
      </li> ";
    }
    ?>
  </ul>
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




<script src="vendor/jquery/jquery.min.js"></script> 
<script src="vendor/popper/popper.min.js"></script>



<script src="js/jquery-2.2.3.min.js"></script>

<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script type='text/javascript' src="js/jquery.mycart.js"></script>

<script type="text/javascript" src="js/jquery_easing.js"></script>

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
        {id: 1, name: 'product 1', summary: 'summary 1', price: 10, quantity: 1, image: 'img/bn1.jpg'},
        {id: 2, name: 'product 2', summary: 'summary 2', price: 20, quantity: 2, image: 'img/bn2.jpg'},
        {id: 3, name: 'product 3', summary: 'summary 3', price: 30, quantity: 1, image: 'img/bn3.jpg'}
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


  });
  </script>




</body>

</html>
