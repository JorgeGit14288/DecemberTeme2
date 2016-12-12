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
                                <div class="col-md-12">
                                    <div class="box box-success box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><fmt:message key="msg.NombrePanelHistorial1" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">

                                            <!-- /.panel-heading -->

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
        <jsp:include page="../shared/theme2/user/footer.jsp" />


        <div class="control-sidebar-bg"></div>
    </div>
</body>
</html>
