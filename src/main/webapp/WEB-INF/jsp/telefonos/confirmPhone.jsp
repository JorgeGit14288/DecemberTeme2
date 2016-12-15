
<%@ page session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title><fmt:message key="msg.TituloPaginaRegistrar" /></title>
        <jsp:include page="../shared/theme3/user/headLogin.jsp" />

    </head>

    <body class="login-img3-body">

        <div class="container">

            <form name="form" class="login-form" method="POST"  method="POST" action="validarPhone.htm">        
                <div class="login-wrap">
                    <center> 
                        <label><fmt:message key="msg.IngreseCodigo" /><br> ${codigo}</label>
                    </center>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon_phone"></i></span>
                        <label for="Codigo" class="sr-only"><fmt:message key="msg.Codigo" /></label>
                        <input class="form-control" type="number" name="codigo" placeholder="<fmt:message key="msg.CodigoEjemplo" />" required="" >
                    </div>
                    <input  class="btn btn-primary btn-lg btn-block" type="submit"  name="btnenvio"value="<fmt:message key="msg.BotonConfirmar" />" >                    
                </div>
                <div>
                    <center>
                        <br>
                        <a href="login.htm"><fmt:message key="msg.RegresarLogin" /></a>

                    </center>
                </div>
                <div id="Error">
                    <center>
                        <h4>
                            <label> ${mensaje}</label>
                        </h4>
                    </center>
                </div>
            </form>
        </div>
    </body>
</html>
