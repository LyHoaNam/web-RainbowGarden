
<?php 
@session_start();

include "account.php";

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin - RainbowGarden</title>
    <link rel="shortcut icon" href="../../img/logo.ico" />
    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link href="../css/customerad.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
  <style type="text/css">
  a
  {
    color:#4b9249;
}
a:hover
{
   color: #0f3a0e;
}
</style>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top bg-dark" role="navigation" style="
    margin-bottom: 0px">
    <div class="navbar-header." >

       <a class="navbar-brand" href="../../index.php">Đến giao diện người dùng</a>

   </div>
   <!-- /.navbar-header -->

   <ul class="nav navbar-top-links navbar-right ">
      <li class="dropdown">

        <a class="dropdown-toggle fn-bran-light" data-toggle="dropdown" href="#">
            <?php 
            if($_SESSION['fullname'])
                echo $_SESSION['fullname'] ?>
            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-user" >
            <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
            </li>
        </ul>
        <!-- /.dropdown-user -->
    </li>


</ul>
<!-- /.navbar-top-links -->

<div class="navbar-default sidebar" role="navigation" >
    <div class="sidebar-nav navbar-collapse" >
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">

                <!-- /input-group -->
            </li>
            <li>
                <a href="index.php"><i class="fa fa-dashboard fa-fw"></i> Bảng điều khiển</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Thống kê<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="CayminiChart.php">Cây mini</a>
                    </li>
                    <li>
                        <a href="CaykhongkhiChart.php">Cây không khí</a>
                    </li>
                    <li>
                        <a href="CayhandmadeChart.php">Cây handmade</a>
                    </li>
                    
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="viewproduct.php"><i class="fa fa-table fa-fw"></i> Danh sách sản phẩm</a>
            </li>
            <li>
                <a href="Gopy.php"><i class="fa fa-comments fa-fw"></i> Góp ý từ khách hàng</a>
            </li>
            
        </ul>
        <!-- /.nav-second-level -->

    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
</nav>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Bảng điều khiển</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-comments fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">Góp ý</div>
                            
                        </div>
                    </div>
                </div>
                <a href="Gopy.php">
                    <div class="panel-footer">
                        <span class="pull-left">Xem chi tiết</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-tasks fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div style="font-size: 30px;" >handmade</div>
                            
                        </div>
                    </div>
                </div>
                <a href="CayhandmadeChart.php">
                    <div class="panel-footer">
                        <span class="pull-left">Xem chi tiết</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-yellow">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-tasks fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div style="font-size: 30px;"> mini</div>
                            
                        </div>
                    </div>
                </div>
                <a href="CayminiChart.php">
                    <div class="panel-footer">
                        <span class="pull-left">Xem chi tiết</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-tasks fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div style="font-size: 30px;">không khí</div>

                        </div>
                    </div>
                </div>
                <a href="CaykhongkhiChart.php">
                    <div class="panel-footer">
                        <span class="pull-left">Xem chi tiết</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
                    <div class="pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                Actions
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu pull-right" role="menu">
                                <li><a href="#">Action</a>
                                </li>
                                <li><a href="#">Another action</a>
                                </li>
                                <li><a href="#">Something else here</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="bar-tt"></div>
                </div>
                <!-- /.panel-body -->
            </div>

        </div>
        <div class="col-lg-4">
         <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-bar-chart-o fa-fw"></i> Donut Chart Example
            </div>
            <div class="panel-body">
                <div id="morris-donut-chart"></div>
                <a href="#" class="btn btn-default btn-block">View Details</a>
            </div>
            <!-- /.panel-body -->
        </div>
    </div>


    <!-- /.col-lg-8 -->

</div>
<!-- /.col-lg-4 -->
</div>
<!-- /.row -->
</div>
<!-- /#page-wrapper -->

</div>
<footer class="py-5 bg-dark">
  <div class="container">
    <p class="m-0 text-center text-white" style="color: #a1e6a1 !important">Rainbow Graden là nhóm các bạn trẻ năng động được thành lập từ môn Phát triển ứng dụng web. Với mới mong muốn mang đến cuộc sống nhiều màu xanh hơn. </p>
</div>
<!-- /.container -->

</footer>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="../vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="../vendor/raphael/raphael.min.js"></script>
<script src="../vendor/morrisjs/morris.min.js"></script>
<script src="../data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>
<script type="text/javascript">
    Morris.Bar({
      element: 'bar-tt',
      data: [
      { y: '2006', a: 100, b: 90 },
      { y: '2007', a: 75,  b: 65 },
      { y: '2008', a: 50,  b: 40 },
      { y: '2009', a: 75,  b: 65 },
      { y: '2010', a: 50,  b: 40 },
      { y: '2011', a: 75,  b: 65 },
      { y: '2012', a: 100, b: 90 }
      ],
      xkey: 'y',
      ykeys: ['a', 'b'],
      labels: ['Series A', 'Series B']
  });
</script>>
<script type="text/javascript">
    Morris.Donut({
      element: 'morris-donut-chart',
      data: [
      <?php 
      $sqlChar="SELECT p.category, sum( d.quantity * p.price) tprice FROM cart_detail d JOIN product p ON d.id_product = p.id GROUP BY p.category ";
      $CharCart=$db->executeQuery($sqlChar);
      $i=0;
      $ttMor[]="100";
      $ttMor[]="100";
      $ttMor[]="100";
    /*while($row=mysqli_fetch_assoc($CharCart))
    {
       $ttMor[]=$row["tprice"];
   }*/
   ?>
   {label: "Download Sales", value: 12},
   {label: "In-Store Sales", value: 30},
   {label: "Mail-Order Sales", value: 20}
   ]
});
</script>
</body>

</html>
