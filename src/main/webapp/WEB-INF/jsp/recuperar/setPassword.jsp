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
        <title><fmt:message key="msg.TituloPaginaCambiarPassword" /></title>
        <jsp:include page="../shared/user/headLogin.jsp" />
        <script>
            function validar() {
                if (document.form.password.value != document.form.confirmPassword.value)
                {
                    alert('¡los datos de los campos no coinciden, intente de nuevo');
                    document.form.password.focus();
                    return false;
                    // 
                } else
                {
                    /* Si todo está OK se prosigue con lo que sea: */
                    alert('¡Cambio exitoso, se redigira a la pantalla de  login para que ingrese sus nuevos datos!');
                    document.form.submit;
                    return true;
                }
            }
        </script>

    </head>
    <body>
        <jsp:include page="../shared/user/topMenu.jsp" />
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-yellow">
                        <div class="panel-heading">
                            <center><h3 class="panel-title"><fmt:message key="msg.TituloPanelCambiarPassword" /></h3></center> 
                        </div>
                        <div class="panel-body">
                            <form name="form" class="form-Registro" method="POST" onsubmit="return validar()" action="validarNewPassword.htm" >

                                <label for="Telefono" class="sr-only">Telefono</label>
                                <input type="tel" value="${sessionScope.usuario}" readonly  name="telefono" id="telefono" class="form-control" placeholder="Numero de telefono" required autofocus>
                                <label for="inputPassword" class="sr-only">Password</label>
                                <input type="password" name="password"  id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.Password" />" required >
                                <label for="confirmPassword" class="sr-only">Confiramar Password</label>
                                <input type="password" name="confirmPassword" id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.ConfirmarPassword" />" required>
                                <input class="btn btn-lg btn-warning btn-block" type="submit" name="btnenvio"value="<fmt:message key="msg.BotonConfirmar" />" >
                            </form>

                        </div> <!-- /container -->
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
                                <h5>
                                    ${mensaje}
                                </h5>
                            </center>
                        </div>
                        <div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
