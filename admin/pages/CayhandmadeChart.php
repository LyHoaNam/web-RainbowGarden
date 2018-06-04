
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
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
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
    margin-bottom: 0px" >
    <div class="navbar-header." >

       <a class="navbar-brand" href="index.html">Đến giao diện người dùng</a>

   </div>
   <!-- /.navbar-header -->

   <ul class="nav navbar-top-links navbar-right ">
      <li class="dropdown">

        <a class="dropdown-toggle fn-bran-light" data-toggle="dropdown" href="#">
            <?php 
            if(isset($_SESSION['fullname']))
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
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
</nav>
<?php 
$category=3;
$totalDay=0;
$totalMonth=0;
$totalYear=0;
$Day=0;
$Month=date('m');
$Year=date('Y');
include("chartproduct.php");
if($Day==0 )
{
    $date=getdate();
    $Day=$date["mday"];
}
?>
<div id="page-wrapper">
  <div class="row">
    <br>
    <div class="col-lg-12">
        <div class="panel panel-green">
            <div class="panel-heading">
               <strong> Doanh thu</strong>
           </div>
           <div class="panel-body">

               <div class="col-lg-4 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div>Tổng doanh thu ngày <?php echo $Day ?></div>
                                <div class="huge"><?php echo $totalDay?></div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div>Tổng doanh thu tháng <?php echo $Month ?></div>
                                <div class="huge"><?php echo $totalMonth?></div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>


            <div class="col-lg-4 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div>Tổng doanh thu năm <?php echo $Year ?></div>
                                <div class="huge"><?php echo $totalYear?></div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>

</div>
</div>
<?php $_SESSION["SelView"]=2; ?>
<div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-bar-chart-o fa-fw"></i> Biểu đồ bán hàng
        <div class="pull-right">
            <div class="btn-group">
                <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                    Theo
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu pull-right" role="menu">
                    <li><a href="# " <?php $_SESSION["SelView"]=2; ?> > Tháng</a>
                    </li>
                    <li><a href="CayhandmadeChart.php " >Ngày <?php $_SESSION["SelView"]=1; ?></a>
                    </li>
                    <li><a href="# ">Năm <?php $_SESSION["SelView"]=3; ?></a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                            <tr>
                                <th>Stt</th>
                                <th>Tên đơn hàng</th>
                                <th>Ngày tạo</th>
                                <th>Tổng tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            if($_SESSION["SelView"]==1)
                            {
                                $sqlCt="call sp_thongkedonhang(CURRENT_DATE, CURRENT_DATE,'2018-8-8',3)";
                            }
                            else
                                if($_SESSION["SelView"]==2)
                                {
                                    $sqlCt="call sp_thongkedonhang(concat(YEAR(now()),'-',month(now()),'-1'), LAST_DAY(now()),3)";
                                }
                                else
                                   if($_SESSION["SelView"]==3)
                                   {
                                    $sqlCt="call sp_thongkedonhang(concat(YEAR(now()),'-1','-1'),concat(year(now()),'-12-31') ,3)";
                                }

                                $tbCart=$db->executeQuery($sqlCt);
                                $i=1;
                                while($row=mysqli_fetch_assoc($tbCart))
                                {

                                    ?>
                                    <tr class="odd gradeX">

                                        <td><?php echo $i ;$i++?></td>
                                        <td><?php echo $row['id'] ?> </td>
                                        <td ><?php echo $row['createdate'] ?></td>
                                        <td > <?php echo $row['total'] ?>000</td>

                                    </tr>

                                    <?php
                                }  
                                ?>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.col-lg-4 (nested) -->
                <div class="col-lg-8">
                    <div id="morris-bar-chart"></div>
                </div>
                <!-- /.col-lg-8 (nested) -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.panel-body -->
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



<!-- DataTables JavaScript -->
<script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>
<script src="../vendor/morrisjs/morris.min.js"></script>
<!-- Custom Theme JavaScript -->

<script src="../dist/js/sb-admin-2.js"></script>
<!-- draw chart -->
<script type="text/javascript">
    new Morris.Line({
  // ID of the element in which to draw the chart.
  element: 'morris-bar-chart',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  
  data: [
   <?php 
    $sqlChar="SELECT sum(p2.tprice) tmonth,YEAR( p1.createdate) MonthC FROM cart p1 JOIN (SELECT d.id_cart, sum( d.quantity * p.price) tprice FROM cart_detail d JOIN product p ON d.id_product = p.id WHERE p.category={$category} GROUP BY d.id_cart) p2 ON p1.id =p2.id_cart  GROUP BY YEAR(p1.createdate)";
    $CharCart=$db->executeQuery($sqlChar);

    while($row=mysqli_fetch_assoc($CharCart))
    {
        ?>
        { month:'<?php echo "000".$row["MonthC"]?>', value: <?php echo $row["tmonth"]?> },
        <?php
    }
    ?>

    ],
  // The name of the data record attribute that contains x-values.
  xkey: 'month',
  // A list of names of data record attributes that contain y-values.
  ykeys: ['value'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: ['Value']
});
</script>

</body>

</html>
