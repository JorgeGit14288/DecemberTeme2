<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>InterCity| <fmt:message key="msg.TituloPaginaEscritorio" /></title>

        <jsp:include page="../shared/theme2/user/headDashboard.jsp" />

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <jsp:include page="../shared/theme2/user/topMenu.jsp" />
            <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../shared/theme2/user/leftMenu.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <jsp:include page="../shared/theme2/user/topMenu2.jsp" />

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
                                <div class="col-lg-12">
                                    <div class="panel panel-green">
                                        <div class="panel-heading">
                                            <i class=""></i> <center><label><fmt:message key="msg.NombrePanelHistorial1" /></label></center>
                                        </div>
                                        <!-- /.panel-heading -->
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <form name="form1" method="GET" action="getRecargas.htm" role="form">
                                                    <div class="col-xs-3">
                                                        <label><fmt:message key="msg.FechaInicio" /></label>
                                                        <input type="date" min="2016-10-01" name="startDate" value="${startDate}" placeholder="<fmt:message key="msg.DateExample"/>" required>
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label><fmt:message key="msg.FechaFin" /></label>
                                                        <input type="date" name="endDate" min="2016-10-02" value="${endDate}"  placeholder="<fmt:message key="msg.DateExample"/>" required>
                                                    </div>            
                                                    <div class="col-xs-2">
                                                        <label><fmt:message key="msg.Mostrar" /></label>

                                                        <select name="max">
                                                            <option selected value="${max}"> ${max} <fmt:message key="msg.Recargas" /></option>

                                                            <option value="1">1 <fmt:message key="msg.Recarga" /></option> 
                                                            <option value="5">5 <fmt:message key="msg.Recargas" /></option> 
                                                            <option value="10">10 <fmt:message key="msg.Recargas" /></option> 
                                                            <option value="15">15 <fmt:message key="msg.Recargas" /></option> 
                                                            <option value="25">25 <fmt:message key="msg.Recargas" /></option> 
                                                            <option value="50">50 <fmt:message key="msg.Recargas" /></option> 
                                                            <option value="100">100 <fmt:message key="msg.Recargas" /></option> 

                                                        </select>
                                                    </div>

                                                    <div class="col-xs-2">
                                                        <label>Opciones</label>
                                                        <button type="submit" class="btn btn-success"><fmt:message key="msg.VerHistorial" /></button>

                                                    </div> 
                                            </div>
                                        </div><div id="Error" class=" alert alert-success">
                                            <center>
                                                <strong>${mensaje}</strong>
                                            </center>
                                        </div>


                                        <div class="table-striped">
                                            <table class="table table-bordered table-hover table-striped">
                                                <thead>
                                                    <tr>
                                                        <th><fmt:message key="msg.No" /></th>
                                                        <th><fmt:message key="msg.Fecha" /></th>
                                                        <th><fmt:message key="msg.Monto" /></th>
                                                        <th><fmt:message key="msg.SaldoAnterior" /></th>
                                                        <th><fmt:message key="msg.SaldoPosterior" /></th>
                                                        <th><fmt:message key="msg.Descripcion" /></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${recargas}" var="recarga">
                                                        <tr>
                                                            <td><c:out value="${recarga.getNo()}" /></td>
                                                            <td><c:out value="${recarga.getFecha()}" /></td>
                                                            <td><c:out value="${recarga.getMonto()}" /></td>
                                                            <td><c:out value="${recarga.getSaldoAnterior()}" /></td>
                                                            <td><c:out value="${recarga.getSaldoPosterior() }" /></td>
                                                            <td><c:out value="${recarga.getDescripcion() }" /></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <ul class="pager">

                                                <li class="previous"><a href="getRecargas.htm?page=${pageprevius}&max=${max}&startDate=${startDate}&endDate=${endDate}">&larr; <fmt:message key="msg.Anterior" /> ${pageprevius}</a></li>
                                                <li class="list-group-item-text"><fmt:message key="msg.Pagina" /> ${page}</li>
                                                <li class="next"><a href="getRecargas.htm?page=${pagenext}&max=${max}&startDate=${startDate}&endDate=${endDate}"><fmt:message key="msg.Siguiente" /> ${pagenext} &rarr;</a></li>
                                            </ul>
                                            </form>

                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
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
        <jsp:include page="../shared/theme2/user/footer.jsp" />


        <div class="control-sidebar-bg"></div>
    </div>
</body>
</html>
