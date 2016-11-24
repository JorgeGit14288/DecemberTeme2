
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>InterCity Dashboard</title>

        <jsp:include page="../shared/admin/headDashboard.jsp" flush="true" />

    </head>

    <body>
        <div id="wrapper">
            <div>
                <jsp:include page="../shared/admin/headLeftMenu.jsp" flush="true" />
            </div>
            <div id="page-wrapper">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Dashboard</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">

                    <!-- CONTENIDO DINAMICO -->


                    <div class="col-lg-8">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class=""></i> <center><label>EDITAR PERFIL DE USUARIO</label></center>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">

                                    <form class="form-Registro" method="POST" action="validarEditarTelefono.htm" >
                                        <div class="form-group col-xs-6">

                                            <label for="idUsuario" >Id Uusario</label>
                                            <input class="form form-control" type="text" readonly name="idUsuario" value ="${usuario.getIdUsuario()}" id="idUsuario" /> 

                                            <label for="Telefono" >Telefono:</label>
                                            <input class="form form-control" type="text" readonly name="idTelefono" value ="${telefono.getTelefonoArea()}" id="idUsuario" /> 
                                            <label for="nombres" >Nombre</label>
                                            <input type="text" class="form form-control" readonly  name="nombres"  id="nombre"  placeholder="first name" value ="${usuario.getNombres() }" /> <br>
                                            <label for="apellidos" >Confirmacion No.</label>
                                            <input type="text" class="form form-control" readonly  name="apellidos"  id="apellidos"  placeholder="last name" value ="${telefono.getCodigoConfirm()}" /><br>
                                            <label for="direccion" >Pais</label>
                                            <input type="text" class="form form-control" readonly  name="direccion"  id="direccion"  placeholder="pais" value ="${usuario.getPais()}"  /><br>

                                            <label for="status"  >Status</label>
                                            <select name="status"  required class="form form-control"  >
                                                <option value="${telefono.getStatus()}">Actual: ${telefono.getStatus()} </option> 
                                                <option value="Activo">Activo </option> 
                                                <option value="Suspendido">Suspendido</option> 
                                                <option value="Deshabilitado">Deshabilitado</option> 
                                            </select><br>

                                            <button  type="submit"class="btn btn-primary form-control" >Confirmar</button>

                                        </div>

                                    </form>


                                </div>
                                <!-- /.panel-body -->
                                <div class="alert alert-info">
                                    <center>   ${mensaje} </center>
                                </div>

                            </div>

                            <!-- /.panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading">


                                </div>
                                <!-- /.panel-heading -->

                                <!-- /.panel-body -->
                            </div>

                        </div>
                    </div>

                    <!-- /.col-lg-8 -->

                    <!-- CONTENIDO DINAMICO -->
                    <div class="col-lg-4">
                        <jsp:include page="../shared/admin/rightPanel.jsp" flush="true" />
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->
        </div>

    </body>

</html>