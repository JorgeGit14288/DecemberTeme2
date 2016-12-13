<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>InterCity| <fmt:message key="msg.TituloPaginaEscritorio" /></title>

        <jsp:include page="../shared/theme2/admin/headDashboard.jsp" />

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <jsp:include page="../shared/theme2/admin/topMenu.jsp" />
            <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../shared/theme2/admin/leftMenu.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <jsp:include page="../shared/theme2/admin/topMenu2.jsp" />

                <!-- Main content -->
                <section class="content">
                    <!-- Small boxes (Stat box) -->
                    <jsp:include page="../shared/theme2/admin/rowCenter1.jsp" />
                    <!-- /.row -->
                    <!-- Main row -->
                    <div id="wrapper">

                        <div id="page-wrapper">
                            <div class="row">
                                <!-- /.col -->
                                <div class="col-md-12">
                                    <div class="box box-success box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><fmt:message key="msg.TituloPaginaEditarPerfil" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <div class="col-xs-6">
                                                <table>
                                                    <form class="form-Registro" method="POST" action="validarEditarPerfil.htm" >

                                                        <div class="form-group">
                                                            <label for="idUsuario" > <fmt:message key="msg.IdUsuario" />: </label>
                                                            <input class="form-control" type="text" readonly name="idUsuario" value ="${user.getIdUsuario()}" id="idUsuario" /> 
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="Telefono" > <fmt:message key="msg.Telefonos" />:  </label><br>
                                                        </div>

                                                        <c:forEach items="${listTel}" var="tel">
                                                            <input  class="form-control" type="text"  name="telefono" value ="<c:out value="${tel.getTelefonoArea()}" />" id="telefonos" /> 

                                                        </c:forEach>
                                                        <div class="form-group">
                                                            <label for="nombres" > <fmt:message key="msg.Nombres" />:  </label>
                                                            <input  class="form-control" type="text"  name="nombres"  id="nombre" required placeholder="first name" value="${account.getFirst_name()}" /> <br>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="apellidos" > <fmt:message key="msg.Apellidos" />:  </label>
                                                            <input  class="form-control" type="text"  name="apellidos"  id="apellidos" required placeholder="last name" value="${account.getLast_name()}" /><br>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="direccion" ><fmt:message key="msg.Direccion" />:  </label>
                                                            <input  class="form-control" type="text"  name="direccion"  id="direccion" required placeholder="address" value="${account.getAddress1()}" /><br>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="ciudad" > <fmt:message key="msg.Ciudad" />:  </label>
                                                            <input  class="form-control" type="text"  name="ciudad"  id="city" required placeholder="city" value="${account.getCity()}" /><br>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="ciudad" > <fmt:message key="msg.Pais" />:  </label>
                                                            <input  class="form-control" type="text"  name="pais"  id="country" required placeholder="city" value="${user.getPais()}" /><br>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="codigo" > <fmt:message key="msg.CodigoPostal" />:  </label>
                                                            <input type="num"  class="form-control"  name="codigoPostal"  id="nombre" required placeholder="postal code" value="${account.getPostal_code()}" /><br>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="email" > <fmt:message key="msg.Correo" />:  </label>
                                                            <input type="email"  class="form-control" name="email"  id="nombre" required placeholder="example@example.com" value="${account.getEmail()}" /><br>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="languaje"  <fmt:message key="msg.LenguajeOperador" />: </label>
                                                            <select name="languaje"  required  class="form-control" >
                                                                <option value="Es"><fmt:message key="msg.Espa" />:</option> 
                                                                <option value="En"><fmt:message key="msg.Ingles" />:</option> 
                                                            </select><br>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="notify Email" ><fmt:message key="msg.NotificacionesCorreo" />:</label>
                                                            <input type="checkbox"  name="notifyEmail"  /><br>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="flag" ><fmt:message key="msg.NotificacionesBandera" />:</label>
                                                            <input type="checkbox"  name="notifyFlag"  /><br>
                                                        </div>
                                                        <div class="form-group">
                                                            <button  type="submit"class="btn btn-primary form-group" ><fmt:message key="msg.BotonConfirmar" /></button>
                                                            <button type="reset" class="btn btn-danger form-group"><fmt:message key="msg.BotonReiniciar" /></button>
                                                        </div>
                                                    </form>
                                                </table>

                                                <div id="Error">
                                                    <Br>
                                                    <center>

                                                        <h5>
                                                            ${mensaje}
                                                        </h5>

                                                    </center>

                                                </div>

                                                <!-- /.box-body -->
                                            </div>

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
        <jsp:include page="../shared/theme2/admin/footer.jsp" />

    </div>
    <!-- /.content-wrapper -->
    <div class="control-sidebar-bg"></div>
</div>
</body>
</html>
