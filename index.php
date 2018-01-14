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

  <title>Rainbow Garden</title>
  <link rel="shortcut icon" href="img/logo.ico" />
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
  <link href="css/icon-fonts.min.css" rel="stylesheet">
  
  <link href="css/settings.css" rel="stylesheet">
  <link href="css/grid-and-effects.css" rel="stylesheet">
  <link href="css/custom.css" rel="stylesheet">
  <link href="css/styles.css" rel="stylesheet">


  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <style>
  #pg-4680-1, #pl-4680 .panel-grid-cell .so-panel:last-child {
    margin-bottom: 0px;

  }
  a
  { color: #4b9249 ;

  }
  a:hover
  {
    color: #a1e6a1 !important;
  }
</style>

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

           <a class="nav-link" href="caymini.php">Cây mini</a>
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
          <a class="nav-link" href="lienhe.php">
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

<header>
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <!-- Slide One - Set the background image for this slide in the line below -->
      <div class="carousel-item active" style="background-image: url('img/bg-1.jpg')">



        <div class="carousel-caption d-none d-md-block">




          <h1 style="text-shadow: 1px 1px 2px black">Làm việc với niềm cảm hứng</h1>
          <p>Hãy chọn loại cây bạn thích nó sẽ giúp bạn làm việc hiệu quả hơn</p>
          <a href="cayhandmade.php" class="button" style="transition: background-color 0.3s ease-out 0s; min-height: 0px; min-width: 0px; line-height: 18px; border-width: 1px; margin: 0px; padding: 15px 29px; letter-spacing: 0px; font-size: 20px;">XEM NGAY</a>
        </div>
      </div>
      <!-- Slide Two - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image: url('img/bg-2.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h1 style="text-shadow: 1px 1px 2px black">Màu xanh làm tăng sức sống</h1>
          <p>Hãy để màu xanh trong cuộc sống của bạn, nó sẽ khiến bạn mạnh mẽ hơn.</p>
          <a href="caykhongkhi.php" class="button" style="transition: background-color 0.3s ease-out 0s; min-height: 0px; min-width: 0px; line-height: 18px; border-width: 1px; margin: 0px; padding: 15px 29px; letter-spacing: 0px; font-size: 20px;">XEM NGAY</a>
        </div>
      </div>
      <!-- Slide Three - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image: url('img/bg-3.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h1 style="text-shadow: 1px 1px 2px black" >Thay đổi nhỏ hiệu quả lớn</h1>
          <p>Chỉ cần đặt vài chậu hoa ở những nơi được gọi là nhàm chán và nó sẽ làm nơi đó sinh động hơn</p>
          <a href="cayhandmade.php" class="button" style="transition: background-color 0.3s ease-out 0s; min-height: 0px; min-width: 0px; line-height: 18px; border-width: 1px; margin: 0px; padding: 15px 29px; letter-spacing: 0px; font-size: 20px;">XEM NGAY</a>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</header>

<!-- Page Content -->
<div class="container">


  <h1 class="my-4"> </h1>


  <!-- Marketing Icons Section -->
  <div class="row">
    <div class="col-lg-4 mb-4">
      <div class="card" >
        <h4 class="card-header Bmiddle">Cây mini để bàn</h4>
        <div class="CCard1">
          <div class="figure banner-with-effects effect-oscar green-button with-button">
            <img src="img/deban.jpg" alt="" style="width: 100%">
            <div class="figcaption simple-banner">
            </div>
            <a href="caymini.php" class="center center" rel="nofollow">XEM THÊM</a>
          </div>
        </div>

      </div>
    </div>
    <div class="col-lg-4 mb-4">
      <div class="card" >
        <h4 class="card-header Bmiddle">Cây không khí</h4>
        <div class="CCard1 Eimg">
          <div class="figure banner-with-effects effect-oscar green-button with-button">
            <img src="img/khongkhi.jpg" alt="" style="width: 100%">
            <div class="figcaption simple-banner">
            </div>
            <a href="caykhongkhi.php" class="center center" rel="nofollow">XEM THÊM</a>
          </div> 

        </div>

      </div>
    </div>
    <div class="col-lg-4 mb-4">
      <div class="card" >
        <h4 class="card-header Bmiddle">Cây handmade</h4>
        <div class="CCard1 Eimg">
         <div class="figure banner-with-effects effect-oscar green-button with-button">
          <img src="img/handmade.jpg" alt="" style="width: 100%">
          <div class="figcaption simple-banner">
          </div>
          <a href="cayhandmade.php" class="center center" rel="nofollow">XEM THÊM</a>
        </div> 
      </div>

    </div>
  </div>
</div>
<!-- /.row -->

<!-- Portfolio Section -->


<div  class="Sanpham">
  <h4 >Các sản phẩm <?php if (!isset($_GET['tukhoa'])) echo "nổi bật"?> </h4>
</div>
<div class="row">


  <?php 
  $size = 8;
  $danhmuccon = 0;
  $tongsotrang=0;
  if (isset($_GET['tukhoa'])) {

    $result = $db->executeQuery("select count(*) countid from product where (name like '%{$_GET['tukhoa']}%' or price = {$_GET['tukhoa']})" );
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
    include("php/products-list.php"); }
    ?>
  </div>
  <!-- /.row -->

  <!-- Features Section -->
  <div class="row">
   <div class="panel-grid" id="pg-4680-4">
    <div class="siteorigin-panels-stretch panel-row-style" style="padding: 70px;background-image: url(http://vuoncaymini.com/wp-content/uploads/2015/01/texture_1.png);background-repeat: repeat;" data-stretch-type="full">
      <div class="panel-grid-cell" id="pgc-4680-4-0">
        <div class="so-panel widget widget_qt_testimonials widget-testimonials panel-first-child panel-last-child" id="panel-4680-4-0-0" data-index="6">
          <div class="testimonials">

            <h3 class="widget-title" style=" color: #4b9249">



              Khách Hàng Nói Gì?
            </h3>

            <div id="testimonials-carousel-widget-4-0-0" class="carousel slide" data-ride="carousel" data-interval="8000">
              <div class="carousel-inner" role="listbox">
            <!-- <div class="item active">
              <div class="row">


                <div class="col-xs-12 col-sm-6 col-md-6">
                  <blockquote class="testimonial-quote">
                  Tôi là người yêu thích cây cảnh, hoa hòe, tìm hoài không biết nên mua cái gì để chưng cho phòng khách cả. Tình cờ tìm được trang web Rainbown Graden , click vào xem thì quá ư là thích, nó vừa lạ, vừa bé, vừa xinh, không chịu nỗi.                    </blockquote>
                  <div class="testimonial-person">
                    <cite class="testimonial-author">Chị Quỳnh</cite>
                    <span class="testimonial-location">Q.3, HCM</span>
                  </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                  <blockquote class="testimonial-quote">
                  Tôi quyết định trang trí bàn làm việc bằng những cây xanh, mà thấy ở đâu cũng những cây lớn quá cỡ. Được người bạn giới thiệu lên Rainbow Graden xem. Thế là bàn của tôi không những xinh mà còn sinh động nữa chứ.                    </blockquote>
                  <div class="testimonial-person">
                    <cite class="testimonial-author">Ms. Trân</cite>
                    <span class="testimonial-location">Tân Bình, HCM</span>
                  </div>
                </div>
              </div>
            </div>-->
            <div class="item"><div class="row">                 <div class="col-xs-12 col-sm-6 col-md-6">
              <blockquote class="testimonial-quote">
              Là người khá kỹ tính, nên những thứ tôi chọn thường yêu cầu rất cao. Nhưng may mắn thay, tôi mua cây tại đây các bạn tư vấn rất nhiệt tình và khá chi tiết. Hi vọng các bạn sẽ vẫn giữ được sự chuyên nghiệp này, tôi sẽ ủng hộ dài dài.                    </blockquote>
              <div class="testimonial-person">
                <cite class="testimonial-author">Ms. Ngọc</cite>
                <span class="testimonial-location">Hậu Giang</span>
              </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6">
              <blockquote class="testimonial-quote">
              Tôi yêu hoa cảnh và kinh doanh. Tôi tìm được vườn có nhiều loại cây khá độc và dễ thương. Biết là cạnh tranh nhưng các bạn rất thoải mái tư vấn về kinh doanh và chăm sóc cây. Hi vọng hợp tác dài lâu với vườn.                    </blockquote>
              <div class="testimonial-person">
                <cite class="testimonial-author">Đại lý (giấu tên)</cite>
                <span class="testimonial-location">Đà Nẵng</span>
              </div>
            </div>

          </div>
        </div>
      </div>  
    </div>
  </div>

</div>
</div>
</div>
</div>
</div>
<!-- /.row -->

<hr>
</div>

<footer class="py-5 bg-dark">
  <div class="container">
    <div class="row">
      <p class="m-0 text-center text-white" style="color: #a1e6a1 !important">Rainbow Graden là nhóm các bạn trẻ năng động được thành lập từ môn Phát triển ứng dụng web. Với mới mong muốn mang đến cuộc sống nhiều màu xanh hơn. </p>
    </div>
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
            if(Object.keys(ajaxRequest.responseText).length<=3)
            {
              if(confirm("Bạn chưa đăng nhập! Chuyển đến trang đăng nhập"))
              {
               window.location="admin/pages/login.html";
             }
           }
           else
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
