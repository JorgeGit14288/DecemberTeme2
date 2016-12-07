
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

         <title><fmt:message key="msg.TituloPaginaEditarPerfil" /></title>

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
                         <h1 class="page-header"><fmt:message key="msg.TituloPaginaEditarPerfil" /></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

               
                <div class="row">

                    <!-- CONTENIDO DINAMICO -->


                    <div class="col-lg-8">
                        <div class="col-lg-8">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <i class=""></i> <center><label><fmt:message key="msg.TituloPanelEditarPerfil" /></label></center>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
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