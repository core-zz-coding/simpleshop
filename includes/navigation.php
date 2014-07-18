<?php
$navigation = $db->query("SELECT * FROM category");
$result = $navigation->fetchAll(PDO::FETCH_OBJ);
?>
<ul>
    <?php foreach ($result as $nav) : ?>
        <li><a href="category.php?catId=<?php echo $nav->id ?>"><?php echo $nav->name; ?></a></li>
    <?php endforeach; ?>
</ul>
