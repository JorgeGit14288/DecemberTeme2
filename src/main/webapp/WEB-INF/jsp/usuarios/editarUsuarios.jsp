<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> <fmt:message key="msg.TituloPaginaEscritorio" /></title>

        <jsp:include page="../shared/theme2/admin/headDashboard.jsp" />

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <jsp:include page="../shared/theme2/admin/topMenu.jsp" />
            <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../shared/theme2/admin/leftMenu.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <jsp:include page="../shared/theme2/admin/topMenu2.jsp" />

                <!-- Main content -->
                <section class="content">
                    <!-- Small boxes (Stat box) -->
                    <jsp:include page="../shared/theme2/admin/rowCenter1.jsp" />
                    <!-- /.row -->
                    <!-- Main row -->
                    <div id="wrapper">

                        <div id="page-wrapper">
                            
                            <div class="row">
                                <!-- /.col -->
                                <div class="col-md-12">
                                    <div class="box box-warning box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><fmt:message key="msg.PanelNombreCuotas" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">

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
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                </div>
                                <!-- /.col -->

                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <!-- =========================================================== -->
                        </div>
                        <!-- /#page-wrapper -->
                    </div>
                    <!-- /.row (main row) -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="../shared/theme2/admin/footer.jsp" />


            <div class="control-sidebar-bg"></div>
        </div>
    </body>
</html>
