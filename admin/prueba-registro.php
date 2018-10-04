<?php
        // $id = $_GET['id'];
        // if(!filter_var($id, FILTER_VALIDATE_INT)) {
        //     die("Error");
        // }
        include_once 'funciones/sesiones.php';
        include_once 'templates/header.php';
        include_once 'funciones/funciones.php';
        include_once 'templates/barra.php';
        include_once 'templates/navegacion.php';

?>




  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Editar Registro de Usuario Manual
        <small>llena el formulario para editar un usuario registrado</small>
      </h1>
    </section>

        <div class="row">
                <div class="col-md-8">
                <!-- Main content -->
                <section class="content">

                  <!-- Default box -->
                  <div class="box">
                    <div class="box-header with-border">
                      <h3 class="box-title">Editar Usuario</h3>
                    </div>
                    <div class="box-body">
                        <?php
                            $sql = "SELECT * FROM registrados";
                            $resultado = $conn->query($sql);
                            $registrado = $resultado->fetch_assoc();
                        ?>
                        <!-- form start -->
                        <form class="editar-registrado" role="form" name="guardar-registro" id="guardar-registro" method="post" action="modelo-registrado.php">
                              <div class="box-body">

                                    <div class="form-group">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">Elige los talleres</h3>
                                        </div>
                                        <div id="eventos" class="eventos clearfix">
                                                 <div class="caja ">
                                                        <?php
                                                            $eventos = $registrado['talleres_registrados'];
                                                            $id_eventos_registrados = json_decode($eventos, true);
                                                            var_dump($registrado['talleres_registrados']);
                                                            try {
                                                                $sql = "SELECT eventos.*, categoria_evento.cat_evento, invitados.nombre_invitado, invitados.apellido_invitado ";
                                                                $sql .= " FROM eventos ";
                                                                $sql .= " JOIN categoria_evento ";
                                                                $sql .= " ON eventos.id_cat_evento = categoria_evento.id_categoria ";
                                                                $sql .= " JOIN invitados ";
                                                                $sql .= " ON eventos.id_inv = invitados.invitado_id ";
                                                                $sql .= " ORDER BY eventos.fecha_evento, eventos.id_cat_evento, eventos.hora_evento ";
                                                                //echo $sql;
                                                                $resultado = $conn->query($sql);
                                                            } catch (Exception $e) {
                                                                echo $e->getMessage();
                                                            }

                                                            $eventos_dias = array();
                                                            $contador = 0;
                                                            while($eventos = $resultado->fetch_assoc()) {

                                                                $fecha = $eventos['fecha_evento'];
                                                                setlocale(LC_ALL, 'es_ES');
                                                                $dia_semana = strftime("%A", strtotime($fecha));

                                                                $categoria = $eventos['cat_evento'];
                                                                $dia = array(
                                                                    'nombre_evento' => $eventos['nombre_evento'],
                                                                    'hora' => $eventos['hora_evento'],
                                                                    'id' => $eventos['evento_id'],
                                                                    'nombre_invitado' => $eventos['nombre_invitado'],
                                                                    'apellido_invitado' => $eventos['apellido_invitado']
                                                                );
                                                                $eventos_dias[$dia_semana]['eventos'][$categoria][] = $dia;
                                                                /*foreach ($eventos as $resulado => fetch_assoc()) {
                                                                    $contador++;
                                                                }*/
                                                            }


                                                        ?>
                                                        <?php //echo $contador; ?>
                                                        <?php foreach($eventos_dias as $dia => $eventos) { ?>
                                                           <div id="<?php echo str_replace('á', 'a', $dia); ?>" class="contenido-dia clearfix row">
                                                               <h4 class="text-center nombre_dia"><?php echo $dia; ?></h4>

                                                               <?php foreach($eventos['eventos'] as $tipo => $evento_dia): ?>
                                                                   <div class="col-md-4">
                                                                         <p><?php echo $tipo; ?></p>

                                                                         <?php foreach($evento_dia as $evento) { ?>

                                                                           <label>
                                                                                <input <?php echo (in_array( $evento['id'], $id_eventos_registrados['eventos']) ? 'checked' : '' ); ?> type="checkbox" class="minimal" name="registro_evento[]" id="<?php echo $evento['id']; ?>" value="<?php echo $evento['id']; ?>">
                                                                                <time><?php echo $evento['hora']; ?></time> <?php echo $evento['nombre_evento']; ?>
                                                                                <br>
                                                                                <span class="autor"><?php echo $evento['nombre_invitado'] . " "  . $evento['apellido_invitado']; ?></span>
                                                                           </label>
                                                                        <?php } //foreach ?>
                                                                   </div>
                                                               <?php endforeach; ?>
                                                           </div> <!--.contenido-dia -->
                                                       <?php  } ?>
                                                   </div><!--.caja-->
                                             </div> <!--#eventos-->



                              </div>
                              <!-- /.box-body -->


                        </form>
                    </div>
                    <!-- /.box-body -->
                  </div>
                  <!-- /.box -->

                </section>
                <!-- /.content -->

                </div>
        </div>
  </div>
  <!-- /.content-wrapper -->

  <?php
          include_once 'templates/footer.php';
  ?>
