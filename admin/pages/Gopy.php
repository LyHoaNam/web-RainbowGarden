<?php 
@session_start();
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
<body>

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
        

    </div>
    
</div>

</nav>
            <!-- /.navbar-static-side -->
        

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Góp ý từ khách hàng</h1>
                    </div>
                    <div class="col-lg">

                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <?php 
            include "../../php/connectDB.php";
$db=new DataAccessHelper;
$db->connect();
$query =$db->executeQuery ("SELECT `id`, `name`, `phone`, `email`, `content` FROM `feedback` ORDER BY `feedback`.`id` DESC LIMIT 0,10 ");
$i=1;
while ( $row=mysqli_fetch_assoc($query)) {
    ?>
     <div class="panel panel-default">
                        <div class="panel-heading">
                            <?php echo "Góp ý thứ ".$i;$i++;?>
                        </div>
                        <div class="panel-body">
                             <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="Tooltip on left">Tên: <?php echo $row["name"]?> </button>
                              <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="Tooltip on left">Số điện thoại: <?php echo $row["phone"]?></button>
                               <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="Tooltip on left">Email: <?php echo $row["email"]?></button>
                               <div>
                               <?php echo $row["content"]?>
                               </div>
                        </div>
                    </div>
    <?php
}
            ?>


            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
