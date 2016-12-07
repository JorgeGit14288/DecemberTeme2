
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title><fmt:message key="msg.TituloPaginaEditarUsuario" /></title>

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

                                    <form class="form-Registro" method="POST" action="validarEditarUsuario.htm" >
                                        <div class="form-group col-xs-6">
                                            
                                            <label for="idUsuario" >Id Uusario</label>
                                            <input class="form form-control" type="text" readonly name="idUsuario" value ="${usuario.getIdUsuario()}" id="idUsuario" /> 
                                            
                                            <label for="Telefono" >Telefono:</label>
                                            <input class="form form-control" type="text" readonly name="idUsuario" value ="${telUser.getTelefonoArea()}" id="idUsuario" /> 
                                            <label for="nombres" >Nombres</label>
                                            <input type="text" class="form form-control" readonly  name="nombres"  id="nombre"  placeholder="first name" value ="${usuario.getNombres()}" /> <br>
                                            <label for="apellidos" >Apellidos</label>
                                            <input type="text" class="form form-control" readonly  name="apellidos"  id="apellidos"  placeholder="last name" value ="${usuario.getApellidos()}" /><br>
                                            <label for="direccion" >Pais</label>
                                            <input type="text" class="form form-control" readonly name="pais"  id="direccion"  placeholder="pais" value ="${usuario.getPais()}"  /><br>
                                            <label for="email" >E-mail</label>
                                            <input type="email" class="form form-control" readonly name="email"  id="email"  placeholder="example@example.com" value ="${usuario.getEmail()}"  /><br>
                                            <label for="status"  >Tipo de Usuario</label>
                                            <select name="tipoUsuario"  required class="form form-control"  >
                                                <option value="${usuario.getTipoUsuario()}">Actual: ${usuario.getTipoUsuario()} </option> 
                                                <option value="Administrador">Administrador</option> 
                                                <option value="Estandar">Estandar</option> 
                                            </select><br>
                                            <label for="status"  >Status</label>
                                            <select name="status"  required class="form form-control"  >
                                                <option value="Activo">Actual: ${usuario.getStatus()} </option> 
                                                <option value="Activo">Activo </option> 
                                                <option value="Suspendido">Suspendido</option> 
                                                <option value="Deshabilitado">Deshabilitado</option> 
                                            </select><br>

                                            <button  type="submit"class="btn btn-primary form-control" >Confirmar</button>
                                        </div>
                                    </form>

                                    <div id="Error">
                                        <Br>
                                        <center>

                                            <h5>
                                                ${mensaje}
                                            </h5>

                                        </center>

                                    </div>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class=""></i> <center><label>RESULTADO DE LA BUSQUEDA</label></center>
                                    <div class="pull-right">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                                Actions
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#">Action</a>
                                                </li>
                                                <li><a href="#">Another action</a>
                                                </li>
                                                <li><a href="#">Something else here</a>
                                                </li>
                                                <li class="divider"></li>
                                                <li><a href="#">Separated link</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="table-responsive">
                                                <form action="editar.htm" method="GET" name="formLista" >
                                                    <table class="table table-bordered table-hover table-striped">
                                                        <thead>

                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                    </table>
                                                </form>
                                            </div>
                                            <!-- /.table-responsive -->
                                        </div>

                                    </div>
                                    <!-- /.row -->
                                </div>
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