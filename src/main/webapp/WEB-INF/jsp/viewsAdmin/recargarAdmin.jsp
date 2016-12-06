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
                        <h3 class="page-header"><fmt:message key="msg.TituloPaginaRecargar" /></h3>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <jsp:include page="../shared/admin/rowCenter1.jsp" flush="true" />
                <div class="row">

                    <!-- CONTENIDO DINAMICO -->


                    <div class="col-lg-8">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <i class="fa fa-info-circle fa-fw"></i><fmt:message key="msg.Informacion" />
                            </div>
                            <div class="panel-body">
                                <div id="Error" class=" alert alert-danger">
                                    <Br>
                                    <center>

                                        <h5>
                                            ${mensaje}
                                            ${resRecarga.getAmount()}
                                        </h5>

                                    </center>

                                </div>

                                <div class="col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <fmt:message key="msg.TituloPanelRecargar" />
                                        </div>
                                        <!-- /.panel-heading -->
                                        <div class="panel-body">
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
                                            <!-- /.table-responsive -->
                                        </div>
                                        <!-- /.panel-body -->
                                    </div>
                                    <!-- /.panel -->
                                </div>
                                <!-- /.col-lg-6 -->
                            </div>
                            <div class="panel-footer">
                                InterCity WebApp
                            </div>
                        </div>
                        <!-- /.panel -->

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
