<?php include ("/includes/config.php");?>
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
        <footer>
        </footer>
        </div> 
    </body>
</html>     