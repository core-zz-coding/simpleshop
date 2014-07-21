<?php
$results = $db->query("SELECT * FROM products  ORDER BY RAND() LIMIT 8");
$result = $results->fetchAll(PDO::FETCH_OBJ);
?>
<?php foreach ($result as $product): ?>
        <?php echo '<div class="new">';?> 
        <?php echo '<img src="images/' . $obj->img . '">'; ?>
        <?php echo  $product->name; ?>
        <?php echo $product->short_description; ?>
        <?php echo '</div>';?>
<?php endforeach; ?>
 





