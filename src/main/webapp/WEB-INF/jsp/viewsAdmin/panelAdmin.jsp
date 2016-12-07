
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

        <title><fmt:message key="msg.TituloPaginaEscritorio" /></title>

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
                        <h1 class="page-header">InterCity DashBoard</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <jsp:include page="../shared/user/rowCenter1.jsp" flush="true" />
                <div class="row">

                    <!-- CONTENIDO DINAMICO -->


                    <div class="col-lg-8">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <i class="fa fa-info-circle fa-fw"></i> <fmt:message key="msg.Informacion" />
                            </div>
                            <div class="panel-body">
                                <p><fmt:message key="msg.DescripcionRecargar" /></p>
                                 <jsp:include page="../shared/admin/rowRecargar.jsp" flush="true" />
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
