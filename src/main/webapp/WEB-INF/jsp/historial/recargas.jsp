
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

        <title>InterCity Dashboard</title>

        <jsp:include page="../shared/user/headDashboard.jsp" flush="true" />

    </head>

    <body>
        <div id="wrapper">
            <div>
                <jsp:include page="../shared/user/headLeftMenu.jsp" flush="true" />
            </div>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><fmt:message key="msg.NombrePaginaRecargas" /></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <!-- CONTENIDO DINAMICO -->
                    <div class="col-lg-12">
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
                                                    <option selected value="${max}"> ${max} Recargas</option>

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
                    <!-- /.panel -->

                </div>

            </div>
        </div>
    </div>
</body>
</html>
