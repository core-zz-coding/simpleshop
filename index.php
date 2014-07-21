<?php 
session_start();
//unset($_SESSION);
require ("includes/config.php");
if (isset($_GET['page'])) {
    $pages=array("products", "cart");
    if (in_array($_GET['page'], $pages)) {
        $_page = $_GET['page'];
    }else {
        $_page="products";
    }
}else {
    $_page= "products";
}
?>
<!DOCTYPE html>
    <head>
        <title>My Store</title>
        <link rel="stylesheet" href="../css/reset.css" type="text/css">
        <link rel="stylesheet" href="../css/style.css" type="text/css">
    </head>
    <body>
        <div class="wrapper">
        <header>
          <nav class="block">  
     <?php include ("includes/navigation.php");?>
          </nav>
        </header>  
        <section class="random">
<?php include ("includes/random_products.php"); ?>  
        </section>
            <section id="cart">
             <div id="main">
               <?php require($_page . ".php");?>
             </div>  <!-- end of main -->
                <div id="sidebar">
                    <h1>Cart</h1>
                    <?php if (isset($_SESSION['cart'])){
                        $query = "SELECT * FROM products WHERE id IN (";
                        var_dump($_SESSION['cart']);
                          foreach ($_SESSION['cart'] as $id =>$val) {
                          $query .= $id . ",";
                        }
                        $query= substr($query, 0, -1) . ")ORDER BY name ASC";
                        $results=$db->query($query);
                        $row = $results->fetchAll(PDO::FETCH_OBJ); //potencijalni fuckup
                        foreach ($row as $product) :?>
                        <p><?php echo $product->name; ?> x <?php echo $_SESSION['cart'][$product->id]['quantity'] ?> </p>
                       <?php endforeach; ?>
                        <hr/>
                        <a href='index.php?page=cart'>Go to cart</a>
                        <?php } else {
                     echo "Your cart is empty. Please add some products";
                 }?>
             </div> 
            </section>
        <footer>
        </footer>
        </div> 
    </body>
</html>         