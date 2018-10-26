<?php include_once 'includes/templates/header.php'; ?>
<section class="seccion contenedor">
    <h2>Resumen Registro</h2>

    <?php
        $resultado = $_GET['exito'];
        $paymentId = $_GET['paymentId'];
        $id_pago = (int) $_GET['id_pago'];


        if($resultado == "true"){
              //echo '<i class="fa fa-thumbs-up pago"></i>';
              echo '<h3 class="pago">El pago se realizó correctamente</h3>';
              echo '<p class="pago">el ID es ' . $paymentId . '</p>';

              require_once('includes/funciones/bd_conexion.php');
              $stmt = $conn->prepare("UPDATE `registrados` SET `pagado` = ? WHERE `ID_registrado` =  ? ");
              $pagado = 1;
              $stmt->bind_param("ii", $pagado, $id_pago);
              $stmt->execute();
              $stmt->close();
              $conn->close();

        } else {
              //echo '<i class="fa fa-exclamation-triangle nopago"></i>';
              echo '<h3 class="nopago">El pago se no se realizó por favor intente nuevamente mas tarde</h3>';
        }

    ?>



</section>


<?php include_once 'includes/templates/footer.php'; ?>
