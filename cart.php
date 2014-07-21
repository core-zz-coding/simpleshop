<?php 
include ("includes/config.php");
if (isset($_POST['submit'])){
    foreach($_POST['quantity'] as $key =>$val){
        if($val==0){
            unset($_SESSION['cart'][$key]);
        }else{
            $_SESSION['cart'][$key]['quantity']=$val;
        }
    }
}
print_r($_POST);
?>
<h1>View cart</h1>
<form method="post" action="index.php?page=cart">
    <table>
        <tr>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Items Price</th>
        </tr>
     <?php 
     $query = "SELECT * FROM products WHERE id IN (";
     foreach ($_SESSION['cart'] as $id =>$value) {
                            $query .= $id . ",";
                        }
                        $query=substr($query, 0, -1) . ")ORDER BY name ASC";
                        $results=$db->query($query);
                        $totalprice=0;
                        $row = $results->fetchAll(PDO::FETCH_OBJ);
                        foreach ($row as $product) {
                            print_r($product);
                            $subtotal= $_SESSION['cart'][$product->id]['quantity']*$product->price;
                            $totalprice+=$subtotal;
                            ?>
        <tr> 
            <td><?php echo $product->name ?></td>
            <td><input type="text" name="quantity[<?php echo $product->id ?>]" size="5" value="<?php echo $_SESSION['cart'][$product->id]['quantity'] ?>"/></td>
            <td><?php echo $product->price ?></td>
             <td><?php echo $_SESSION['cart'][$product->id]['quantity']*$product->price ?>$</td>
        </tr>
                       <?php } ?>
        <tr>
            <td>Total price: <?php echo $totalprice; ?>$</td>
        </tr>
    </table>
    <br/>
    <button  type="submit" name="submit">Update cart</button>    
</form>
<p>To remove the item set its quantity to 0 </p>