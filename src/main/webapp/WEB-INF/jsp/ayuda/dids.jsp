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
                                                <form name="form1" method="GET" action="getDids.htm" role="form">
                                                    <div class="col-xs-2">
                                                        <label><fmt:message key="msg.Mostrar" /></label>

                                                        <select name="state">
                                                            <option selected value="${state}"> ${state} <fmt:message key="msg.Location" /></option>
                                                                <option value="AL">Alabama</option>
                                                                <option value="AK">Alaska</option>
                                                                <option value="AZ">Arizona</option>
                                                                <option value="AR">Arkansas</option>
                                                                <option value="CA">California</option>
                                                                <option value="CO">Colorado</option>
                                                                <option value="CT">Connecticut</option>
                                                                <option value="DE">Delaware</option>
                                                                <option value="DC">District Of Columbia</option>
                                                                <option value="FL">Florida</option>
                                                                <option value="GA">Georgia</option>
                                                                <option value="HI">Hawaii</option>
                                                                <option value="ID">Idaho</option>
                                                                <option value="IL">Illinois</option>
                                                                <option value="IN">Indiana</option>
                                                                <option value="IA">Iowa</option>
                                                                <option value="KS">Kansas</option>
                                                                <option value="KY">Kentucky</option>
                                                                <option value="LA">Louisiana</option>
                                                                <option value="ME">Maine</option>
                                                                <option value="MD">Maryland</option>
                                                                <option value="MA">Massachusetts</option>
                                                                <option value="MI">Michigan</option>
                                                                <option value="MN">Minnesota</option>
                                                                <option value="MS">Mississippi</option>
                                                                <option value="MO">Missouri</option>
                                                                <option value="MT">Montana</option>
                                                                <option value="NE">Nebraska</option>
                                                                <option value="NV">Nevada</option>
                                                                <option value="NH">New Hampshire</option>
                                                                <option value="NJ">New Jersey</option>
                                                                <option value="NM">New Mexico</option>
                                                                <option value="NY">New York</option>
                                                                <option value="NC">North Carolina</option>
                                                                <option value="ND">North Dakota</option>
                                                                <option value="OH">Ohio</option>
                                                                <option value="OK">Oklahoma</option>
                                                                <option value="OR">Oregon</option>
                                                                <option value="PA">Pennsylvania</option>
                                                                <option value="RI">Rhode Island</option>
                                                                <option value="SC">South Carolina</option>
                                                                <option value="SD">South Dakota</option>
                                                                <option value="TN">Tennessee</option>
                                                                <option value="TX">Texas</option>
                                                                <option value="UT">Utah</option>
                                                                <option value="VT">Vermont</option>
                                                                <option value="VA">Virginia</option>
                                                                <option value="WA">Washington</option>
                                                                <option value="WV">West Virginia</option>
                                                                <option value="WI">Wisconsin</option>
                                                                <option value="WY">Wyoming</option>
                                                            </select>	
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label><fmt:message key="msg.Area" /></label>
                                                        <input type="text" name="area" value="${area}"  placeholder="<fmt:message key="msg.Area"/>" >
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
