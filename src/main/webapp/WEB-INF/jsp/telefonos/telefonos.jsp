<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <title>Phones </title>

      <jsp:include page="../shared/theme2/user/headDashboardTables.jsp" />

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
                        <fmt:message key="msg.ListaTelefonos" />
                        <small></small>

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="panel.htm"><i class="fa fa-dashboard"></i> <fmt:message key="msg.Escritorio" /></a></li>
                        <li class="active"><fmt:message key="msg.GestionUsuarios" /></li>
                        <li class="active"><fmt:message key="msg.TelefonosRegistrados" /></li>
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
                                            <h3 class="box-title"><fmt:message key="msg.ListaTelefonos" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">

                                            <table width="100%" class="table table-striped table-bordered table-hover" id="example1">
                                                <thead>
                                                    <tr>
                                                        <th>No. Telefono</th>
                                                        <th>Id Usuario</th>
                                                        <th>Codigo</th>
                                                        <th>Status</th>                                            
                                                        <th>Acciones</th>


                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listaTelefonos}" var="telefono">
                                                        <tr>
                                                            <td><c:out value="${telefono.getTelefonoArea()}" /></td>
                                                            <td><c:out value="${telefono.getUsuarios().getIdUsuario()}" /></td>
                                                            <td><c:out value="${telefono.getCodigoConfirm()}" /></td>

                                                            <td><c:out value="${telefono.getStatus()}" /></td>

                                                            <td><a href="editarTelefonos.htm?idTelefono=${telefono.getTelefonoArea()}">editar</a></td>         
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <!-- /.table-responsive -->

                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->


                                </div>
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
            <jsp:include page="../shared/theme2/user/footer.jsp" />


            <div class="control-sidebar-bg"></div>
        </div>


        <script>
            $(function () {
                $("#example1").DataTable();
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
            });
        </script>
    </body>
</html>
