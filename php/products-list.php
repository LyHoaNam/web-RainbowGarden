<?php 



$trang = 1;
if(isset($_GET['trang'])){
  $trang = $_GET['trang'];  
}
$start = ($trang - 1) * $size;
if(isset($_GET['tukhoa'])){
  $query =$db->executeQuery ("select * from product where (name like '{$_GET['tukhoa']}' or price = {$_GET['tukhoa']} and category= {$danhmuccon}) limit {$start}, {$size}");
}
else
{
	$query =$db->executeQuery("SELECT * FROM `product` WHERE category={$danhmuccon} limit {$start}, {$size}");
}

while($row=mysqli_fetch_assoc($query)){
  
	 $id= $row["id"];
	 $name=$row["name"] ;
   $summary= $row["name"];
   $price= (int)$row["price"];
   $imagi=$row["imagiUrl"] ;
	?>
  <div class="col-md-4 col-sm-6 col-lg-3 portfolio-item">

    <div class="card h-348 cart_items">
      <div class="dropdown">
        <a href="sanpham.html" class="product-image"><img class="card-img-top" src="<?php echo $imagi  ?>" alt="" ></a>
        <div class="dropdown-content"><img src="<?php echo $imagi ?>" width="400" height="400" ></div>
      </div>
      <div class="card-body" style=" 
      
      ">
      <h4 class="card-title Namet" >
       <?php echo $name ?>
     </h4>
     <span style="width: 100%">
      <strong class="Giat" name="price"><?php  echo $price ?>.000&nbsp;₫</strong>
      <span class=" productCart">
      <i class="fa fa-shopping-cart shopping_bg add-to-cart my-cart-btn" aria-hidden="true"  data-id="<?php echo $id ?>" data-name="<?php echo $name ?>" data-summary="<?php echo $name?>" data-price="<?php echo $price  ?>" data-quantity="1" data-image="<?php echo $imagi ?>"></i>
    </span>
    </span>
  </div>
</div>
</div>
<?php
}
?>