<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><fmt:message key="msg.TituloPaginaNumerosAcceso" /></title>

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
                <section class="content-header">
                    <h1>
                        <fmt:message key="msg.HistorialLlamadas" />
                        <small></small>

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="panel.htm"><i class="fa fa-dashboard"></i> <fmt:message key="msg.Escritorio" /></a></li>
                        <li class="active"><fmt:message key="msg.Ayuda" /></li>
                         <li class="active"><fmt:message key="msg.NumerosAcceso" /></li>
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
                                <div class="col-lg-12">
                                    <div class="panel panel-green">
                                        <div class="panel-heading">
                                            <i class=""></i> <center><label><fmt:message key="msg.FormularioBusqueda" /></label></center>
                                        </div>
                                        <!-- /.panel-heading -->
                                        <div class="panel-body">
                                            <div class="col-lg-12">
                                                <form name="form1" method="GET" action="getDids.htm" role="form">
                                                    <div class="col-xs-3">
                                                        <label><fmt:message key="msg.Mostrar" /></label>

                                                        <select name="state">
                                                            <option selected value="${state}"> ${state} <fmt:message key="msg.Estado" /></option>
                                                                <option value="Alabama">Alabama</option>
                                                                <option value="Alaska">Alaska</option>
                                                                <option value="Arizona">Arizona</option>
                                                                <option value="Arkansas">Arkansas</option>
                                                                <option value="California">California</option>
                                                                <option value="Colorado">Colorado</option>
                                                                <option value="Connecticut">Connecticut</option>
                                                                <option value="Delware">Delaware</option>
                                                                <option value="District of Columbia">District Of Columbia</option>
                                                                <option value="Florida">Florida</option>
                                                                <option value="Georgia">Georgia</option>
                                                                <option value="Hawaii">Hawaii</option>
                                                                <option value="Idaho">Idaho</option>
                                                                <option value="Illinois">Illinois</option>
                                                                <option value="Indiana">Indiana</option>
                                                                <option value="Iowa">Iowa</option>
                                                                <option value="Kansas">Kansas</option>
                                                                <option value="Kentucky">Kentucky</option>
                                                                <option value="Louisiana">Louisiana</option>
                                                                <option value="Maine">Maine</option>
                                                                <option value="MaryLand">Maryland</option>
                                                                <option value="Massachusetts">Massachusetts</option>
                                                                <option value="Michigan">Michigan</option>
                                                                <option value="Minnesota">Minnesota</option>
                                                                <option value="Mississippi">Mississippi</option>
                                                                <option value="Missouri">Missouri</option>
                                                                <option value="Montana">Montana</option>
                                                                <option value="Nebraska">Nebraska</option>
                                                                <option value="Nevada">Nevada</option>
                                                                <option value="New Hampshire">New Hampshire</option>
                                                                <option value="New Jersey">New Jersey</option>
                                                                <option value="New Mexico">New Mexico</option>
                                                                <option value="New York">New York</option>
                                                                <option value="North Carolina">North Carolina</option>
                                                                <option value="North Dakota">North Dakota</option>
                                                                <option value="Ohio">Ohio</option>
                                                                <option value="Oklahoma">Oklahoma</option>
                                                                <option value="Oregon">Oregon</option>
                                                                <option value="Pennsylvania">Pennsylvania</option>
                                                                <option value="Rhode Island">Rhode Island</option>
                                                                <option value="South Carolina">South Carolina</option>
                                                                <option value="South Dakota">South Dakota</option>
                                                                <option value="Tennessee">Tennessee</option>
                                                                <option value="Texas">Texas</option>
                                                                <option value="Utah">Utah</option>
                                                                <option value="Vermount">Vermont</option>
                                                                <option value="Virginia">Virginia</option>
                                                                <option value="Washington">Washington</option>
                                                                <option value="West Virginia">West Virginia</option>
                                                                <option value="Wisconsing">Wisconsin</option>
                                                                <option value="Wyoming">Wyoming</option>
                                                            </select>	
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label><fmt:message key="msg.Area" /></label>
                                                        <input type="text" name="area" value="${area}"  placeholder="<fmt:message key="msg.Area"/>" >
                                                    </div>            
                                                    
                                                    <div class="col-xs-2">                                                        <button type="submit" class="btn btn-success"><fmt:message key="msg.VerHistorial" /></button>
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
                                                        <th><fmt:message key="msg.Id" /></th>
                                                        <th><fmt:message key="msg.Telefono" /></th>
                                                        <th><fmt:message key="msg.Pais" /></th>
                                                        <th><fmt:message key="msg.Estado" /></th>
                                                        <th><fmt:message key="msg.Status" /></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${dids}" var="did">
                                                        <tr>
                                                            <td><c:out value="${did.getNo()}" /></td>
                                                            <td><c:out value="${did.getPhone()}" /></td>
                                                            <td><c:out value="${did.getCountry()}" /></td>
                                                            <td><c:out value="${did.getState()}" /></td>
                                                            <td><c:out value="${did.getAreas() }" /></td>
                                                            <td><c:out value="${did.getStatus() }" /></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

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
