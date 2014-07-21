<?php
include ("includes/config.php");
//unset($_SESSION);
if(isset($_GET['action'])&& $_GET['action']=='add'){
 $id = $_GET['id'];
    if (isset($_SESSION['cart'][$id])) {
       $_SESSION ['cart'][$id]['quantity']++; 
    }else{
        $query = $db->query("SELECT * FROM products WHERE id = $id");
        while($row = $query->fetch(PDO::FETCH_ASSOC))
        {
          if($row['id']) {
              $_SESSION['cart'][$row['id']]= array(
                'quantity' => 1,
                'price'=> $row['price']
            );
          }
        }
            
    }
} 
?>
<h1>Product List</h1>
<?php 
if (isset($message)){
    echo "<h2>{$message}</h2>";
}
var_dump($_SESSION['cart']);
?>
<table>
    <tr><th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    <?php
    $query = $db->query("SELECT * FROM products ORDER BY name ASC");
    $result = $query->fetchAll(PDO::FETCH_OBJ);
    foreach ($result as $obj):
        ?>
        <tr>
            <td>
                <?php echo $obj->name; ?> 
            </td>
            <td>
                <?php echo $obj->short_description; ?> 
            </td>
            <td>
    <?php echo $obj->price . "$"; ?> 
            </td>
            <td>
                <a href="index.php?page=products&action=add&id=<?php echo $obj->id; ?>">Add to cart</a>
            </td>
        </tr>
<?php endforeach; ?>
</table>