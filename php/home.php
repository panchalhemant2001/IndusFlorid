<?php
/* Including the file which contains configuration constants for the application */
	require_once("../includes/configure.php");
?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
	<title>Welcome to Indus Florid</title>
	<link href="<?php echo DIRCSS; ?>front.css" type="text/css" rel="stylesheet">

</head>

<body>
<div id='main'>
	<?php 
        /* header.php files is included to generate the top bar. */
            require DIRDOCUMENTFSROOT . "php/header.php"; 
    ?>
   
   <section id='contentsection'>
   
   </section>
    
    <?php
    /* footer.php files is included to generate the footer. */
        require DIRDOCUMENTFSROOT . 'includes/php/footer.php';
    ?>
</div>
</body>
</html>