<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
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
        <jsp:include page="../shared/theme3/user/headLogin.jsp" />
        <jsp:include page="../shared/theme2/user/headDashboard.jsp" />
    </head>

    <body class="login-img3-body">
        <jsp:include page="../shared/theme3/user/topMenu.jsp" />
        <div class="container">
            <center> <img src="${pageContext.request.contextPath}/resources/image/logo.png" /> </center>
            <form class="login-form" method="POST" action="validarRecuperar.htm">        
                <div class="login-wrap">
                    <center>   <label><fmt:message key="msg.InfoPanelRecuperar" /></label><br> </center>
                    <div class="input-group">
                        <label for="codigoArea"  class="sr-only"><fmt:message key="msg.CodigoArea" /></label>
                        <select name="codigo"  required  >
                            <option value="1">Estados Unidos </option> 
                            <option value="1">Canada</option> 
                            <option value="1">Puerto Rico</option> 
                            <option value="1">Republica Dominicana</option>                         
                            <option value="502">Guatemala</option>                       
                        </select>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon_phone"></i></span>
                        <input class="form-control"  placeholder="<fmt:message key="msg.NumeroTelefonico" />" type="tel" name="telefono" id="telefono" autocomplete="on" autofocus >
                    </div>

                    <button class="btn btn-lg btn-warning btn-block" type="submit"><fmt:message key="msg.Buscar" /></button>
                    <br>
                    <center> <h3> <label> <a href="login.htm"><fmt:message key="msg.RegresarLogin" /></a> </label> </h3></center> 
                </div>
                <% String msj = (String) request.getAttribute("mensaje");
                    if (msj != null) {
                %>
                <div id="Error" class="alert alert-error">
                    <center>
                        <b> <h4><%= msj%></h4></b>
                    </center>
                </div>

                <%
                    } else {
                    }
                %>  
            </form>
        </div>
    </body>
</html>
