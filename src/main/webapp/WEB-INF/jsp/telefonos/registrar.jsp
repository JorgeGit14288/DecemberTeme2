<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <title><fmt:message key="msg.TituloPaginaRegistro" /></title>

        <jsp:include page="../shared/user/headLogin.jsp" />
        <script>
            function validar() {
                if (document.form.password.value != document.form.confirmPassword.value)
                {
                    alert('¡Debe escribir el mismo password');
                    document.form.password.focus();
                    return false;
                    // 
                } else
                {
                    /* Si todo está OK se prosigue con lo que sea: */
                    alert('¡registrando usuario!');
                    document.form.submit;
                    return true;
                }
            }
        </script>

    </head>

    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-green">
                        <div class="panel-heading">
                            <center> <h3 class="panel-title"><fmt:message key="msg.TituloPanelRegistro" /></h3></center> 
                        </div>
                        <div class="panel-body">
                            <form name="form" class="form-Registro" method="POST" onSubmit="return validar()" action="validarRegistro.htm" >
                                <center>      <label>  <h4 class="form-signin-heading"><fmt:message key="msg.IngreseDatos" /></h4> </label>    </center>     
                                <label for="codigoArea" ><fmt:message key="msg.CodigoArea" /></label>
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
                                <label for="Telefono" class="sr-only"><fmt:message key="msg.Telefono" /></label>
                                <input type="tel" name="telefono" id="telefono" class="form-control" placeholder="<fmt:message key="msg.EjemploTelefono" />" required autofocus>
                                <label for="inputPassword" class="sr-only"><fmt:message key="msg.Password" /></label>
                                <input type="password" name="password"  id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.Password" />" required >
                                <label for="confirmPassword" class="sr-only"><fmt:message key="msg.ConfirmarPassword" /></label>
                                <input type="password" name="confirmPassword" id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.ConfirmarPassword" />" required>



                                <div class="checkbox">

                                    <label>
                                        <input type="checkbox" value="remember-me"> <fmt:message key="msg.Recuerdame" />
                                    </label>
                                </div>
                                <input class="btn btn-lg btn-success btn-block" type="submit" name="btnenvio"value="<fmt:message key="msg.BotonAceptar" />" >
                            </form>
                            <div>
                                <center>

                                    <br>
                                    <a href="recuperar.htm"><fmt:message key="msg.RecuperarCuenta" /></a>

                                    <br>
                                    <a href="login.htm"><fmt:message key="msg.RegresarLogin" /></a>

                                    <br>
                                </center>
                            </div>

                            <div id="Error">
                                <Br>
                                <center>
                                    <h4>
                                        <label> ${mensaje}</label>
                                    </h4>

                                </center>

                            </div>

                        </div>
                    </div>
                </div>
            </div>




    </body>

</html>
