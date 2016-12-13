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
                                            <h3 class="box-title"><fmt:message key="msg.TituloPanelRecargar" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <div class="col-lg-12">


                                                <div class="table-responsive">
                                                    <table class="table table-striped">
                                                        <thead>
                                                            <tr> 
                                                                <th> <fmt:message key="msg.Detalle" /></th>
                                                                <th> <fmt:message key="msg.Informacion" /></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td> <fmt:message key="msg.Token" /></td>
                                                                <td>${resRecarga.getToken()}</td>

                                                            </tr>
                                                            <tr>
                                                                <td> <fmt:message key="msg.MontoRecarga" /></td>
                                                                <td>${resRecarga.getAmount()}</td>

                                                            </tr>
                                                            <tr>
                                                                <td> <fmt:message key="msg.Fecha" /></td>
                                                                <td>${resRecarga.getRs_datetime()}</td>

                                                            </tr>
                                                            <tr>
                                                                <td> <fmt:message key="msg.EstadoRecarga" /></td>
                                                                <td>${resRecarga.getRs_status()}</td>

                                                            </tr>
                                                            <tr>
                                                                <td> <fmt:message key="msg.Detalles" /></td>
                                                                <td>${resRecarga.getDetails()}</td>

                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- /.consulta retornada por post -->
                                            </div>
                                            <div id="result">

                                                ${resultado}

                                            </div>
                                        </div>
                                        <!-- /.row -->
                                        <div id="result">
                                            <div id="Error" class=" alert alert-success">
                                                <center>
                                                    <strong>${mensaje}</strong>
                                                </center>
                                            </div>

                                            <!-- /.box-body -->
                                        </div>

                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>


                            <!-- =========================================================== -->
                        </div>
                        <!-- /#page-wrapper -->
                    </div>
                    <!-- /.row (main row) -->

                </section>
                <!-- /.content -->
                <jsp:include page="../shared/theme2/admin/footer.jsp" />

            </div>
            <!-- /.content-wrapper -->
            <div class="control-sidebar-bg"></div>
        </div>
    </body>
</html>
