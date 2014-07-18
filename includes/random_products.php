<?php
$results = $db->query("SELECT * FROM products  ORDER BY RAND() LIMIT 8");
$result = $results->fetchAll(PDO::FETCH_OBJ);
?>
 
<?php foreach ($result as $product): ?>
   <div class="new">
        <h2> <?php echo $product->name; ?> </h2>
        <p><?php echo $product->short_description; ?></p>
        </div>
   <?php endforeach; ?>
 





