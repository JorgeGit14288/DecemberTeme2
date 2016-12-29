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
        <title><fmt:message key="msg.TituloPaginaLogin" /></title>
        <jsp:include page="../shared/theme3/user/headLogin.jsp" />
       
    </head>

    <body class="login-img3-body">
        <jsp:include page="../shared/theme3/user/topMenu.jsp" />
        <div class="container">
            <center> <img src="${pageContext.request.contextPath}/resources/image/logo.png" /> </center>
            <form class="login-form" method="POST" action="validarLogin.htm">        
                <div class="login-wrap">
                    <p class="login-img"><i class="icon_lock_alt"></i></p>
                   <label for="codigoArea"  class="sr-only"><fmt:message key="msg.CodigoArea" /></label>
                                <select name="codigo"  required  >
                                    <option value="1">+1 Estados Unidos </option> 
                                    <option value="1">+1 Canada</option> 
                                    <option value="1">+1 Puerto Rico</option> 
                                    <option value="1">+1 Republica Dominicana</option> 
                                    <option value="51">+51 Peru</option>
                                    <option value="52">+52 Mexico</option>
                                    <option value="53">+53 Cuba</option>
                                    <option value="56">+56 Chile</option>
                                    <option value="502">+502 Guatemala</option>
                                    <option value="503">+503 El Salvador</option>
                                    <option value="504">+504 Honduras</option>
                                    <option value="505">+505 Nicaragua</option>
                                    <option value="506">+506 Costa Rica</option>
                                    <option value="507">+507 Panama</option>
                                </select>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon_phone"></i></span>
                        <input class="form-control"  placeholder="<fmt:message key="msg.NumeroTelefonico" />" name="telefono" required type="tel" autocomplete="on" autofocus >
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                        <input class="form-control" placeholder="<fmt:message key="msg.Password" />" name="password" type="password" value="" required>
                    </div>
                    <label class="checkbox">
                        <input name="remember" type="checkbox" value="Remember Me"><fmt:message key="msg.Recuerdame" />
                        <span class="pull-right"> <a href="recuperar.htm"> <fmt:message key="msg.OlvidoSuPassword" /></a></span>
                    </label>
                    <button class="btn btn-primary btn-lg btn-block" type="submit"><fmt:message key="msg.Ingresar" /></button>
                    <center> <h3> <a href="registrar.htm"><fmt:message key="msg.Registrarse" /></a></h3> </center>
                </div>
                <div id="Error">
                    <Br>
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
