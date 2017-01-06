
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
        <title><fmt:message key="msg.TituloPaginaConfirmarCodigo" /></title>
        <jsp:include page="../shared/theme3/user/headLogin.jsp" />
        <jsp:include page="../shared/theme2/user/headDashboard.jsp" />
        <script>
            function validar() {
                if (document.form.password.value != document.form.confirmPassword.value)
                {
                    alert('¡The passwords do not match, please try again');
                    document.form.password.focus();
                    return false;
                    // 
                } else
                {
                    /* Si todo está OK se prosigue con lo que sea: */
                    alert('Successful change, enter the system with your new data');
                    document.form.submit;
                    return true;
                }
            }
        </script>

    </head>

    <body class="login-img3-body">

        <div class="container">
            <center> <img src="${pageContext.request.contextPath}/resources/image/logo.png" /> </center>

            <form name="form" class="login-form" method="POST"  onsubmit="return validar()" action="validarNewPassword.htm">        
                <div class="login-wrap">
                    <center> 
                        <label><fmt:message key="msg.IngreseNuevoPassword" /><br> </label>
                    </center>

                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon_phone"></i></span>
                        <label for="Codigo" class="sr-only"><fmt:message key="msg.Codigo" /></label>
                        <label for="Telefono" class="sr-only">Telefono</label>
                        <input type="tel" value="${sessionScope.usuario}" readonly  name="telefono" id="telefono" class="form-control" placeholder="Numero de telefono" required autofocus>

                    </div>

                    <div class="input-group">
                       <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                        <label for="inputPassword" class="sr-only">Password</label>
                        <input type="password" name="password"  id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.Password" />" required >
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                        <label for="confirmPassword" class="sr-only">Confiramar Password</label>
                        <input type="password" name="confirmPassword" id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.ConfirmarPassword" />" required>                    </div>
                    <input  class="btn btn-primary btn-lg btn-block" type="submit"  name="btnenvio"value="<fmt:message key="msg.Confirmar" />" >                    

                    <div>
                        <center>
                            <br>
                            <a href="login.htm"><fmt:message key="msg.RegresarLogin" /></a>

                        </center>
                    </div>
                    <% String msj = (String) request.getAttribute("mensaje");
                                                if (msj != null) {
                                            %>
                                            <div id="Error" class="alert alert-success">
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
