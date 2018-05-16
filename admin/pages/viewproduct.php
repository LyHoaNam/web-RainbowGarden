
<?php 
@session_start();
include "../../php/connectDB.php";
$db=new DataAccessHelper;
$db->connect();
if(isset($_SESSION["error"]))
{
 echo "<script>alert('{$_SESSION['error']}');</script>";
 unset($_SESSION['error']);
}
if(isset($_SESSION["sussect"]))
{
 echo "<script>alert('{$_SESSION['sussect']}');</script>";
 unset($_SESSION['sussect']);
}
if(isset($_SESSION["DelSS"]))
{
 echo "<script>alert('{$_SESSION['DelSS']}');</script>";
 unset($_SESSION['DelSS']);
}
if(isset($_SESSION["DelErr"]))
{
 echo "<script>alert('{$_SESSION['DelErr']}');</script>";
 unset($_SESSION['DelErr']);
}
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

    <!-- /.dropdown -->

    <!-- /.dropdown -->
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

    <!-- /.row -->
    <div class="row">
        <br>
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading" >
                    <div class="row">
                        <div class="col-lg-8">
                            Danh sách sản phẩm
                        </div>   
                        <div class="col-lg-4" style="text-align: right">
                            <button type="button" class="btnaddproduct btn btn-outline btn-success" data-toggle="collapse"  href="#collapseOne">Thêm sản phẩm</button>
                            <button type="button" class=" btnaddproduct btn btn-outline btn-success" data-toggle="collapse"  href="#collapseTwo">Xóa sản phẩm</button>
                        </div>
                    </div>
                </div>
                
                <div id="collapseOne" class="panel-collapse collapse">
                   
                    <h4 style="color: #4b9249; padding-left: 30px;">Thêm sản phẩm</h4>
                    
                    <form action="Changeproduct.php" method="POST" >
                        <div class="panel-body">

                            <div class="form-group col-lg-4">
                                <input class="form-control" placeholder="Tên sản phẩm" name="name"
                                required data-validation-required-message="Please enter your email address.">
                            </div>
                            <div class="form-group col-lg-4" style="display: table">
                                <input class="form-control" placeholder="Giá" name="price"
                                required data-validation-required-message="Please enter your email address."><span class="input-group-addon">.000</span>
                            </div>
                            <div class="form-group col-lg-4">
                                <select class="form-control" name="category">
                                    <option value="">Loại cây</option>
                                    <option value="3">Cây handmade</option>
                                    <option value="2">Cây không khí</option>
                                    <option value="1">Cây mini</option>

                                </select>
                            </div>
                            <div class="form-group col-lg-4" style="display: table">
                                <input class="form-control" placeholder="Khuyến mãi" name="saleoff"
                                required data-validation-required-message="Please enter your email address.">
                                <span class="input-group-addon">%</span>
                            </div>
                            <div class="form-group col-lg-4">
                                <input class="form-control" placeholder="link ảnh" name="imagiUrl"
                                required data-validation-required-message="Please enter your email address.">
                            </div>
                            <div class="form-group col-lg-4">

                                <input type="submit" class=" btn btn-outline btn-success"
                                style="width: 100%" name="btn_submit" value="Xác nhận"  >

                            </div>

                        </div>
                    </form>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <h4 style="color: #4b9249; padding-left: 30px;">Xóa sản phẩm</h4>
                    <form action="Changeproduct.php" method="POST" >
                        <div class="panel-body">
                            <div class="form-group col-lg-4">
                                <input class="form-control" placeholder="Mã sản phẩm" name="idDel"
                                required data-validation-required-message="Please enter your email address.">
                            </div>

                            <div class="form-group col-lg-4">

                                <input type="submit" class=" btn btn-outline btn-success"
                                style="width: 100%" name="btn_submitDel" value="Xác nhận"  >

                            </div>

                        </div>
                    </form>
                </div>
                <?php 
                
                ?>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá(s)</th>
                                <th>Ảnh</th>
                                <th>Loại sản phẩm</th>
                                <th>Khuyến mãi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $sql="select * from product";
                            $query=$db->executeQuery($sql);
                            while($row=mysqli_fetch_assoc($query))
                            {

                                ?>
                                <tr class="odd gradeX">
                                    <td><?php echo $row['id'] ?></td>
                                    <td><?php echo $row['name'] ?> </td>

                                    <td ><?php echo 0 ?>.000</td>
                                    <td > <img style="width: 30px; height:30px" src="../../<?php echo $row['imagiUrl'] ?>"></td>
                                    <td ><?php if( $row['category']==1 )
                                    echo "cây mini";
                                    else if($row['category']==2)
                                        echo "cây không khí";
                                    else echo "cây handmande"?></td>
                                    <td ><?php echo $row['saleoff'] ?></td>
                                </tr>
                                <?php
                            }    
                            ?>

                        </tbody>
                    </table>
                    <!-- /.table-responsive -->

                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
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

<!-- DataTables JavaScript -->
<script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../dist/js/sb-admin-2.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

</body>

</html>
