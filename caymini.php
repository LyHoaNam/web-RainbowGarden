<?php 
@session_start();

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
      <a class="navbar-brand GreenBrand" href="index.php"><img src="img/logobn.png">RainBow Garden</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">

           <a class="nav-link" href="caymini.php" style="color: #a1e6a1 !important">Cây mini</a>
         </li>
         <li class="nav-item">
          <a class="nav-link" href="caykhongkhi.php" >Cây không khí</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cayhandmade.php" >Cây handmade</a>
        </li>

        <li>
          <form class="input-with-submit header-search" method="GET" >
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Tìm thứ gì đó?" name="tukhoa">
            <span class="input-group-button">
              <button class="btn btn-default" style="background-color: #4b9249" type="submit">
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
        <li style="width: 40px !important; height: 40px; padding-left: 3px;">
          <span class="my-cart-icon" ">
            <span class="navRbcart">
              <i class=" fa fa-shopping-cart shopping_bg" aria-hidden="true"></i>
            </span>
            <span class="badge badge-notify my-cart-badge"></span>
            
          </span>   
        </li>
        
        <li class="dropdown navRbaccount">
          <a class=" fn-bran-light" data-toggle="dropdown" href="#">
            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-user" >
            <?php 
            if(!isset($_SESSION['customer'])&&!isset($_SESSION['account']))
            {
              ?>
              <li><a href="admin/pages/login.html"><i class="fa fa-sign-in fa-fw"></i> Đăng nhập</a>
              </li>
              <li><a href="#"><i class="fa fa-user fa-fw"></i> Tạo tài khoản</a>
              </li>

              <?php
            }
            if(isset($_SESSION['customer']))
            {
              ?>
              <li><a href="#"><i class="fa fa-user fa-fw"></i> Tài khoản</a>
              </li>
              <li class="divider"></li>
              <li><a href="php/logout.php"><i class="fa fa-sign-out fa-fw"></i> Đăng xuất</a>
              </li>
              <?php
            }
            if(isset($_SESSION['account']))
            {
              ?>
              <li><a href="admin/pages/index.php"><i class="fa fa-gear fa-fw"></i> Đến trang admin</a>
              </li>
              <li><a href="#"><i class="fa fa-user fa-fw"></i>Tài khoản</a>
              </li>
              
              <li class="divider"></li>
              <li><a href="php/logout.php"><i class="fa fa-sign-out fa-fw"></i>Đăng xuất</a>
              </li>
              <?php
            }
            ?>

          </ul>
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
    <small style="font-family: Arial">Cây mini</small>
  </h1>

  <ol class="breadcrumb">
    <li class="breadcrumb-item">
      <a href="index.php">Trang Chủ</a>
    </li>
    <li class="breadcrumb-item active">Cây mini</li>
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
  $danhmuccon = 1;
  $tongsotrang=0;
  if (isset($_GET['tukhoa'])) {

    $result = $db->executeQuery("select count(*) countid from product where (name like '%{$_GET['tukhoa']}%' or price = {$_GET['tukhoa']} and category=$danhmuccon)" );
  }
  else

    $result=$db->executeQuery("SELECT count(id) countid from product where category=$danhmuccon");
  if($result)
  {
    $row=mysqli_fetch_assoc($result);
    $numpd= $row["countid"];
    $tongsotrang=$numpd / 8;
    if($numpd%8 ==0)
      $themsotrang=0;
    else
      $themsotrang=1;
    include("php/products-list.php"); }?>

  </div>

  <!-- Pagination -->
  <div>
   <ul class="pagination justify-content-center" >
    <?php 
    for($i=1;$i<=$tongsotrang+$themsotrang;$i++)
    {
      echo "<li class=\"page-item\" >
      <a class=\"pageprlink page-link\"  href=\"?trang={$i}\"
      style=\" color: #4b9249\">{$i}</a>
      </li> ";
    }
    ?>
  </ul>
</div>

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
      <?php
      if(isset($_SESSION['product']))
        {?>
          {id: <?php echo $_SESSION['product'][$i]['id'] ?>, name: <?php echo $_SESSION['product'][$i]['name']?>, summary: <?php echo $_SESSION['product'][$i]['summary'] ?>, price: <?php echo $_SESSION['product'][$i]['price']?>, quantity:<?php echo $_SESSION['product'][$i]['quantity']?>, image:<?php echo $_SESSION['product'][$i]['image']?>} ,
          <?php } ?>
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
        var ajaxRequest = new XMLHttpRequest();
        
          ajaxRequest.onreadystatechange = function(){
                  if(ajaxRequest.readyState == 4){
                     window.alert(ajaxRequest.responseText);
                  }
               }
           var queryString =new Array();
       
          $.each(products, function(){
          queryString.push(this.id);
          queryString.push(this.quantity);
        
        });
          var jsonString = JSON.stringify(queryString);
          ajaxRequest.open("POST", "Cart.php?p=" + jsonString, true);
               ajaxRequest.send(null); 
       

     },
     getDiscountPrice: function(products, totalPrice, totalQuantity) {
      console.log("calculating discount", products, totalPrice, totalQuantity);
      return totalPrice ;
    }
  });

  });
</script>


</body>

</html>
