<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
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

        <title><fmt:message key="msg.TituloPaginaRecuperar" /></title>

        <jsp:include page="../shared/user/headLogin.jsp" />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-yellow">
                        <div class="panel-heading">
                            <center>  <h3 class="panel-title"><fmt:message key="msg.PanelNombreValidarTelefono" /></h3></center> 
                        </div>
                        <div class="panel-body">
                            <center>
                                <form class="form-Registro"  method="POST" action="validarRecuperarPhone.htm">
                                    <label><fmt:message key="msg.InforPanelConfimarTelefono" /><c:out value="${codigo}" /></label><br>
                                    <input type="number" class="form-control" name="codigo" placeholder="<fmt:message key="msg.CodigoEjemplo" />" required="" >
                                    <br>
                                    <button class="btn btn-lg btn-warning btn-block" type="submit"  ><fmt:message key="msg.BotonEnviarCodigo" /></button>
                                </form>
                                <div>
                                    <center>

                                        <br>
                                        <a href="login.htm"><fmt:message key="msg.RegresarLogin" /></a>

                                        <br>
                                    </center>
                                </div>
                            </center>
                        </div> <!-- /container -->
                        <div id="Error">
                            <Br>
                            <center>
                                <h4>
                                    ${mensaje}
                                </h4>

                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>