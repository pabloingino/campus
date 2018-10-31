$(document).ready(function() {
    $('#guardar-registro').on('submit', function(e) {
            e.preventDefault();

            var datos = $(this).serializeArray();

            $.ajax({
                type: $(this).attr('method'),
                data: datos,
                url: $(this).attr('action'),
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    var resultado = data;
                    if(resultado.respuesta == 'exito') {
                        swal(
                          'Correcto',
                          'Se guardó correctamente',
                          'success'
                        )
                    } else {
                        swal(
                          'Error!',
                          'Hubo un error',
                          'error'
                        )
                    }
                }
            })
    });
    // Se ejecuta cuando hay un archivo


    $('#guardar-registro-archivo').on('submit', function(e) {
            e.preventDefault();

            var datos = new FormData(this);

            $.ajax({
                type: $(this).attr('method'),
                data: datos,
                url: $(this).attr('action'),
                dataType: 'json',
                contentType: false,
                processData : false,
                async: true,
                cache: false,
                success: function(data) {
                    console.log(data);
                    var resultado = data;
                    if(resultado.respuesta == 'exito') {
                        swal(
                          'Correcto',
                          'Se guardó correctamente',
                          'success'
                        )
                    } else {
                        swal(
                          'Error!',
                          'Hubo un error',
                          'error'
                        )
                    }
                }
            })
    });

    // Pagar un registro

    $('.pagar_registro').on('click', function(e) {
        e.preventDefault();

        var id = $(this).attr('data-id');
        var tipo = $(this).attr('data-tipo');

        swal({
          title: '¿Estás seguro?',
          text: "Va a abonar el total del registro",
          type: $(this).attr('method'),
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Si, Pagar!',
          cancelButtonText: 'Cancelar'
        }).then(function () {
                $.ajax({
                    type:'post',
                    data: {
                        id : id,
                        registro : 'abonar'
                    },
                    url: 'modelo-'+tipo+'.php',
                    success:function(data) {
                        console.log(data);
                        var resultado = JSON.parse(data);
                        if(resultado.respuesta == 'exito') {
                            swal(
                              'Pago!',
                              'Registro Fue Abonado.',
                              'success'
                            )
                            jQuery('[data-id="'+ resultado.id_eliminado +'"]').parents('tr').remove().reload();
                          } else {
                            swal(
                              'Error!',
                              'No se pudo pagar',
                              'error'
                            )
                        }

                    }
                })
        });
    });


    // Eliminar un registro

    $('.borrar_registro').on('click', function(e) {
        e.preventDefault();

        var id = $(this).attr('data-id');
        var tipo = $(this).attr('data-tipo');

        swal({
          title: '¿Estás seguro?',
          text: "Un registro eliminado no se puede recuperar",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Si, Eliminar!',
          cancelButtonText: 'Cancelar'
        }).then(function () {
                $.ajax({
                    type:'post',
                    data: {
                        id : id,
                        registro : 'eliminar'
                    },
                    url: 'modelo-'+tipo+'.php',
                    success:function(data) {
                        console.log(data);
                        var resultado = JSON.parse(data);
                        if(resultado.respuesta == 'exito') {
                            swal(
                              'Eliminado!',
                              'Registro Eliminado.',
                              'success'
                            )
                            jQuery('[data-id="'+ resultado.id_eliminado +'"]').parents('tr').remove();
                        } else {
                            swal(
                              'Error!',
                              'No se pudo eliminar',
                              'error'
                            )
                        }

                    }
                })
        });
    });


});
