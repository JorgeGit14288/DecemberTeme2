
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

        <title>InterCity Dashboard</title>

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
                         <h1 class="page-header"><fmt:message key="msg.NombrePaginaHistorial" /></h1>
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
                                    <div class="col-lg-8">
                                        <form name="form1" method="GET" action="getHistorial.htm" role="form">
                                            <div class="col-xs-4">
                                                <label><fmt:message key="msg.FechaInicio" /></label>
                                                <input type="date" min="2016-10-01" name="startDate" required value="${startDate}" placeholder="<fmt:message key="msg.DateExample"/>" >
                                            </div>
                                            <div class="col-xs-4">
                                                <label><fmt:message key="msg.FechaFin" /></label>
                                                <input type="date" name="endDate" min="2016-10-02" value="${endDate}"   placeholder="<fmt:message key="msg.DateExample"/>" required>
                                            </div>
                                            <div class="col-xs-4">
                                                <label><fmt:message key="msg.NumeroDestino" /></label>
                                                <input type="number" name="destination" min="1" value="${destination}" class="form-control" placeholder="<fmt:message key="msg.NumeroDestinoEjemplo" />">
                                            </div> 
                                            <div class="col-xs-4">

                                                <select name="max">
                                                    <option selected value="${max}"><fmt:message key="msg.Mostrar" /> ${max}</option>

                                                    <option value="1">1 <fmt:message key="msg.Llamada" /></option> 
                                                    <option value="5">5 <fmt:message key="msg.Llamadas" /></option> 
                                                    <option value="10">10 <fmt:message key="msg.Llamadas" /></option> 
                                                    <option value="15">15 <fmt:message key="msg.Llamadas" /></option> 
                                                    <option value="25">25 <fmt:message key="msg.Llamadas" /></option> 
                                                    <option value="50">50 <fmt:message key="msg.Llamadas" /></option> 
                                                    <option value="100">100 <fmt:message key="msg.Llamadas" /></option> 

                                                </select>
                                            </div>

                                            <div class="col-xs-3">
                                                <label><br></label>
                                                <button type="submit" class="btn btn-success"><fmt:message key="msg.VerHistorial" /></button>

                                            </div> 
                                        </form>
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
                                                <th><fmt:message key="msg.FechaHora" /></th>
                                                <th><fmt:message key="msg.Destino" /></th>
                                                <th><fmt:message key="msg.PaisOperador" /></th>

                                                <th><fmt:message key="msg.Minutos" /></th>
                                                <th><fmt:message key="msg.CostoMinuto" /></th>
                                                <th><fmt:message key="msg.CostoTotal" /></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${llamadas}" var="llamada">
                                                <tr class="odd gradeX">
                                                    <td><c:out value="${llamada.getNo()}" /></td>
                                                    <td><c:out value="${llamada.getInicioLLamada()}" /></td>
                                                    <td><c:out value="${llamada.getNumero()}" /></td>
                                                    <td><c:out value="${llamada.getPais_operador()}" /></td>
                                                    <td><c:out value="${llamada.getDuracionMinutos() }" /></td>
                                                    <td><c:out value="${llamada.getCostoMinuto()}" /></td>
                                                    <td><c:out value="${llamada.getCostoTotal()}" /></td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <ul class="pager">

                                        <li class="previous"><a href="getHistorial.htm?page=${pageprevius}&max=${max}&startDate=${startDate}&endDate=${endDate}&destination=${destination}">&larr; <fmt:message key="msg.Anterior" /> ${pageprevius}</a></li>
                                        <li class="list-group-item-text"><fmt:message key="msg.Pagina" />${page}</li>
                                        <li class="next"><a href="getHistorial.htm?page=${pagenext}&max=${max}&startDate=${startDate}&endDate=${endDate}&destination=${destination}"><fmt:message key="msg.Siguiente" /> ${pagenext} &rarr;</a></li>
                                    </ul>
                                    
                                    
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
