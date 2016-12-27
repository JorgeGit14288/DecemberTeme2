<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> <fmt:message key="msg.TituloPaginaEscritorio" /></title>
        <jsp:include page="../shared/theme2/user/headDashboard.jsp" />
        <script>
            function validar() {
                if (document.form.password.value != document.form.confirmPassword.value)
                {
                    alert('The password is invalid');
                    document.form.password.focus();
                    return false;
                    // 
                } else
                {
                    /* Si todo está OK se prosigue con lo que sea: */
                    alert('Change Password');
                    document.form.submit;
                    return true;
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
                        <fmt:message key="msg.Escritorio" />
                        <small></small>

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="panel.htm"><i class="fa fa-dashboard"></i> <fmt:message key="msg.Inicio" /></a></li>
                        <li class="active"><fmt:message key="msg.Escritorio" /></li>
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
                                    <div class="box box-primary box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><fmt:message key="msg.Recargar" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <div class="col-md-8">
                                                <form name="form" class="form-Registro" method="POST" onsubmit="return validar()" action="validarCambiarPassword.htm" >

                                                    <div class="form-group">
                                                        <label for="telefono" class="col-sm-2 control-label"><fmt:message key="msg.Telefono" />:</label>

                                                        <div class="col-sm-10">
                                                            <input  class="form-control" type="tel" value="${sessionScope.usuario}"  disabled="true" required placeholder="<fmt:message key="msg.Nombres" />" value="${account.getFirst_name()}" />
                                                        </div>
                                                    </div>
                                                    <label for="inputPassword" class="sr-only">Password</label>
                                                    <input type="password" name="passwordActual"  id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.Password" />" autocomplete="No" required >
                                                    <label for="inputPassword" class="sr-only">Password</label>
                                                    <input type="password" name="password"  id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.PasswordNuevo" />" required >
                                                    <label for="confirmPassword" class="sr-only">Confiramar Password</label>
                                                    <input type="password" name="confirmPassword" id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.ConfirmarPassword" />" required>
                                                    <input class="btn btn-lg btn-warning btn-block" type="submit" name="btnenvio"value="<fmt:message key="msg.Confirmar" />" >
                                                </form>
                                                <div id="Error" >
                                                    <center>
                                                        <strong>${mensaje}</strong>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                </div>

                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
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
