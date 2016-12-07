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

        <title><fmt:message key="msg.TituloPaginaConfirmarTelefono" /></title>

        <jsp:include page="../shared/user/headLogin.jsp" />

    </head>

    <body>
        <jsp:include page="../shared/user/topMenu.jsp" />

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-green">
                        <div class="panel-heading">
                            <center>    <h3 class="panel-title"><fmt:message key="msg.PanelNombreConfirmarTel" /></h3></center>
                        </div>
                        <div class="panel-body">
                            <form method="POST" action="validarPhone.htm">
                                <center> 
                                    <label><fmt:message key="msg.IngreseCodigo" /><br> <c:out value="${codigo}" /></label>
                                </center>
                                <input class="form-control" type="number" name="codigo" placeholder="<fmt:message key="msg.CodigoEjemplo" />" required="" >
                                <br>
                                <button class="btn btn-lg btn-success btn-block" type="submit"><fmt:message key="msg.BotonConfirmar" /></button>
                            </form>
                            <div>
                                <center>

                                    <br>
                                    <a href="login.htm"><fmt:message key="msg.RegresarLogin" /></a>

                                    <br>
                                </center>
                            </div>

                            <div id="Error">
                                <Br>
                                <center>
                                    <h4>
                                        ${mensaje}
                                    </h4>
                                    <br>
                                </center>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </body>

</html>
l>