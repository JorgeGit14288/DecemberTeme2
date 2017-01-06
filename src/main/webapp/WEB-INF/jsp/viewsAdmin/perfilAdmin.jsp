<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><fmt:message key="msg.TituloPaginaPerfil" /></title>

        <jsp:include page="../shared/theme2/user/headDashboard.jsp" />
        <script type="text/javascript">

            function checkifempty()
            {
                if (!document.form.condicion.checked)
                {
                    document.form.btnenvio.disabled = true;
                    document.form.nombres.disabled = true;
                    document.form.apellidos.disabled = true;
                    document.form.direccion.disabled = true;
                    document.form.ciudad.disabled = true;
                    document.form.pais.disabled = true;
                    document.form.codigoPostal.disabled = true;
                    document.form.email.disabled = true;
                    document.form.languaje.disabled = true;
                    document.form.notifyEmail.disabled = true;
                    document.form.notifyFlag.disabled = true;

                } else
                {
                    document.form.btnenvio.disabled = false;
                    document.form.nombres.disabled = false;
                    document.form.apellidos.disabled = false;
                    document.form.direccion.disabled = false;
                    document.form.ciudad.disabled = false;
                    document.form.pais.disabled = false;
                    document.form.codigoPostal.disabled = false;
                    document.form.email.disabled = false;
                    document.form.languaje.disabled = false;
                    document.form.notifyEmail.disabled = false;
                    document.form.notifyFlag.disabled = false;

                }

            }
        </script>

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <jsp:include page="../shared/theme2/user/topMenu.jsp" />
            <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../shared/theme2/admin/leftMenu.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <fmt:message key="msg.PerfilUsuario" />
                        <small></small>

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="panel.htm"><i class="fa fa-dashboard"></i> <fmt:message key="msg.Escritorio" /></a></li>
                        <li class="active"><fmt:message key="msg.Perfil" /></li>
                        <li class="active"><fmt:message key="msg.PerfilUsuario" /></li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <!-- Small boxes (Stat box) -->
                    <jsp:include page="../shared/theme2/user/rowCenter1.jsp" />
                    <!-- /.row -->
                    <!-- Main row -->
                    <div id="wrapper">

                        <div id="page-wrapper">
                            <div class="row">
                                <!-- /.col -->
                                <div class="col-md-12">
                                    <div class="box box-success box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><fmt:message key="msg.TituloPaginaEditarPerfil" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <div class="col-md-8">

                                                <!-- Horizontal Form -->

                                                <!-- form start -->
                                                <form class="form-horizontal" method="POST" action="validarEditarPerfil.htm" name="form">
                                                    <div class="box-body">
                                                        
                                                        <div class="form-group">
                                                            <label for="telefono" class="col-sm-2 control-label"><fmt:message key="msg.Telefono" />:</label>

                                                            <div class="col-sm-10">
                                                                <input  class="form-control" type="text"  name="telefono"  id="telefono" required placeholder="<fmt:message key="msg.Telefono" />" value="${cuenta.getTelefono()}" readonly /> 
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="telefono" class="col-sm-2 control-label"><fmt:message key="msg.Nombres" />:</label>

                                                            <div class="col-sm-10">
                                                                <input  class="form-control" type="text" id="nombres" name="nombres"  id="nombre" disabled="true" required placeholder="<fmt:message key="msg.Nombres" />" value="${account.getFirst_name()}" />
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="telefono" class="col-sm-2 control-label"><fmt:message key="msg.Apellidos" />:</label>

                                                            <div class="col-sm-10">
                                                                <input  class="form-control" type="text" id="apellidos" name="apellidos"  id="apellidos" disabled="true" required placeholder="<fmt:message key="msg.Apellidos" />" value="${account.getLast_name()}" />
                                                            </div>
                                                        </div>


                                                        <div class="form-group">
                                                            <label for="telefono" class="col-sm-2 control-label"><fmt:message key="msg.Direccion" />:</label>

                                                            <div class="col-sm-10">
                                                                <input  class="form-control" type="text" id="direccion"  name="direccion" disabled="true"  id="direccion" required placeholder="<fmt:message key="msg.Direccion" />" value="${account.getAddress1()}" />
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="telefono" class="col-sm-2 control-label"><fmt:message key="msg.Ciudad" />:</label>

                                                            <div class="col-sm-10">
                                                                <input  class="form-control" type="text" disabled="true" id="ciudad"  name="ciudad"  id="city" required placeholder="<fmt:message key="msg.Ciudad" />" value="${account.getCity()}" />
                                                            </div>
                                                        </div>


                                                        <div class="form-group">
                                                            <label for="telefono" class="col-sm-2 control-label"><fmt:message key="msg.Pais" />:</label>

                                                            <div class="col-sm-10">
                                                                <input  class="form-control" type="text" disabled="true" id="pais"  name="pais"  id="country" required placeholder="<fmt:message key="msg.Pais" />" value="${cuenta.getPais()}" />
                                                            </div>
                                                        </div>


                                                        <div class="form-group">
                                                            <label for="telefono" class="col-sm-2 control-label"><fmt:message key="msg.CodigoPostal" />:</label>

                                                            <div class="col-sm-10">
                                                                <input type="num"  class="form-control" id="codigoPostal" disabled="true"  name="codigoPostal"  id="nombre" required placeholder="<fmt:message key="msg.CodigoPostal" />" value="${account.getPostal_code()}" />
                                                            </div>
                                                        </div>


                                                        <div class="form-group">
                                                            <label for="telefono" class="col-sm-2 control-label"><fmt:message key="msg.Correo" />:</label>

                                                            <div class="col-sm-10">
                                                                <input type="email"  class="form-control" disabled="true" id="email" name="email"  id="nombre" required placeholder="<fmt:message key="msg.Correo" />" value="${account.getEmail()}" />
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="lenguaje" class="col-sm-2 control-label"><fmt:message key="msg.LenguajeOperador" />:</label>
                                                            <div class="col-sm-10">
                                                                <select name="languaje" id="languaje" disabled="true"  required  class="form-control" >
                                                                    <option value="${idioma}"><fmt:message key="msg.Actual" /> ${idioma}</option>
                                                                    <option value="1"><fmt:message key="msg.Espa" /></option> 
                                                                    <option value="2"><fmt:message key="msg.Ingles" /></option> 
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="notifymail" class="col-sm-2 control-label"><fmt:message key="msg.NotificarEmail" />:</label>

                                                            <div class="col-sm-10">
                                                                <select name="notifyEmail" id="notifyEmail" disabled="true" required  class="form-control" >
                                                                    <option value="${account.getNotify_email()}"><fmt:message key="msg.Actual" /> ${account.getNotify_email()}</option>
                                                                    <option value="false"><fmt:message key="msg.False" /></option> 
                                                                    <option value="true"><fmt:message key="msg.True" /></option> 
                                                                </select>
                                                            </div>
                                                        </div>
                                                        

                                                        <div class="form-group">
                                                            <div class="col-sm-offset-2 col-sm-10">
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" name="condicion" id="condicion" onclick="checkifempty()"/> <fmt:message key="msg.EditarPerfil" />   
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- /.box-body -->
                                                    <div class="box-footer">
                                                        <button type="submit" class="btn btn-default"><fmt:message key="msg.Cancelar" /></button>
                                                        <button type="submit" disabled="true" name="btnenvio" class="btn btn-info pull-right"><fmt:message key="msg.Guardar" /></button>
                                                    </div>
                                                    <!-- /.box-footer -->
                                                </form>
                                            </div>
                                            <!-- /.box -->

                                            <form class="form-Registro" method="POST" action="validarEditarPerfil.htm" >

                                            </form>
                                            <% String msj = (String) request.getAttribute("mensaje");
                                                if (msj != null) {
                                            %>
                                            <div id="Error" class="alert alert-success">
                                                <center>
                                                    <b> <h4><%= msj%></h4></b>
                                                </center>
                                            </div>

                                            <%
                                                } else {
                                                }
                                            %>  

                                            <!-- /.box-body -->
                                        </div>

                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->


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
            <div class="control-sidebar-bg"></div>
            <jsp:include page="../shared/theme2/user/footer.jsp" />
        </div>
    </body>
</html>
