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

        <title>Recargar</title>

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
                        <h3 class="page-header">Resultado de la transaccion </h3>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <jsp:include page="../shared/admin/rowCenter1.jsp" flush="true" />
                <div class="row">

                    <!-- CONTENIDO DINAMICO -->


                    <div class="col-lg-8">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <i class="fa fa-info-circle fa-fw"></i> Informacion
                            </div>
                            <div class="panel-body">
                                <p>Bienvenido a InterCity, si necesita recargar saldo, pulse en monto de la recarga </p>
                                 <jsp:include page="../shared/admin/rowRecargar.jsp" flush="true" />
                            </div>
                            <div class="panel-footer">
                                InterCity WebApp
                            </div>
                        </div>
                        <!-- /.panel -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-bar-chart-o fa-fw"></i> Informacion de la cuenta
                                <div class="pull-right">
                                    <div class="btn-group">

                                    </div>
                                </div>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Circle Icon Buttons with Font Awesome Icons
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                     <br>
                            
                                  
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
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
