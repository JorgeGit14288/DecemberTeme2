<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>InterCity| <fmt:message key="msg.TituloPaginaEscritorio" /></title>

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
                                    <div class="box box-success box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><fmt:message key="msg.NombrePanelPerfil1"/></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">

                                            <!-- /.panel-heading -->

                                            <div class="col-lg-10">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover table-striped">
                                                <tbody>
                                                    <tr>
                                                        <td><fmt:message key="msg.Nombres" />:  </td>
                                                        <td>${account.getFirst_name()}</td>

                                                    </tr>
                                                    <tr>
                                                        <td><fmt:message key="msg.Apellidos" />: </td>
                                                        <td>${account.getLast_name()}</td>
                                                    </tr>
                                                    <tr>
                                                        <td><fmt:message key="msg.Direccion" />: </td>
                                                        <td>${account.getAddress1()}</td>

                                                    </tr>
                                                    <tr>
                                                        <td><fmt:message key="msg.Ciudad" />: </td>
                                                        <td>${account.getCity()}</td>

                                                    </tr>
                                                    <tr>
                                                        <td><fmt:message key="msg.CodigoPostal" />: </td>
                                                        <td>${account.getPostal_code()}</td>
                                                    </tr>
                                                    <tr>
                                                        <td><fmt:message key="msg.Correo" />: </td>
                                                        <td>${account.getEmail()}</td>
                                                    </tr>
                                                    <tr>
                                                        <td><fmt:message key="msg.Lenguaje" /></td>
                                                        <td>${account.getLanguaje_id()}</td>
                                                    </tr>
                                                    <tr>
                                                        <td><fmt:message key="msg.NotificacionesCorreo" />: </td>
                                                        <td>${account.getNotify_email()}</td>
                                                    </tr>
                                                    <tr>
                                                        <td><fmt:message key="msg.NotificacionesBandera" />: </td>
                                                        <td>${account.getNotify_flag()}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- /.table-responsive -->
                                        <div>

                                        </div>
                                    </div>
                                        </div><div id="Error" class=" alert alert-success">
                                            <center>
                                                <strong>${mensaje}</strong>
                                            </center>
                                        </div>

                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                </div>

                            </div>
                            <!-- /.row -->

                        </div>
                        <!-- /.row -->

                        <!-- =========================================================== -->
                    </div>
                    <!-- /#page-wrapper -->
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->
  
    <!-- /.content-wrapper -->
    <jsp:include page="../shared/theme2/admin/footer.jsp" />


    <div class="control-sidebar-bg"></div>
</div>
</body>
</html>
