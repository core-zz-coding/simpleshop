<?php
include ("includes/config.php");
$catId = isset($_GET['catId']) ? $_GET['catId'] : null;
if (!$catId) {
    echo "Wrong category selected";
    exit;
}
$result = $db->query(sprintf("SELECT * FROM products WHERE category_id = %s", $catId));
$products = $result->fetchAll(PDO::FETCH_OBJ);
foreach ($products as $product) :
    ?>
    <?php echo '<img src="images/' . $product->img . '">'; ?>
    <h2><a href="product.php?skuId=<?php echo $product->sku ?>"><?php echo $product->name; ?></a></h2>
    <p><?php echo $product->description; ?></p>
<?php endforeach; ?>
