<?php

include ("includes/config.php");
$skuId = isset($_GET['skuId']) ? $_GET['skuId'] : null;
if (!$skuId) {
    echo "Wrong category selected";
    exit;
}
$result = $db->query(sprintf("SELECT * FROM products WHERE sku = '%s'", $skuId));
$products = $result->fetchAll(PDO::FETCH_OBJ);
foreach ($products as $value) :
    ?>
    <?php echo $value->name; ?>
<?php endforeach; ?>

