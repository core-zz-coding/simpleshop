<?php
include ("includes/config.php");
session_start();
$skuId = isset($_GET['skuId']) ? $_GET['skuId'] : null;
if (!$skuId) {
    echo "Wrong category selected";
    exit;
}
$result = $db->query(sprintf("SELECT * FROM products WHERE sku = '%s'", $skuId));
$products = $result->fetchAll(PDO::FETCH_OBJ);

foreach ($products as $value) :?>
       <?php echo '<img src="images/' . $value->img . '">'; ?>
        <?php echo $value->name; ?>
<?php endforeach; ?>


