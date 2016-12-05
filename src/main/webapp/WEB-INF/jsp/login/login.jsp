
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

        <title>LOGIN</title>

        <jsp:include page="../shared/user/headLogin.jsp" />

    </head>

    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-primary">
                        <div class="panel-heading">
                            <center> <h2 class="panel-title"><fmt:message key="msg.Login" /></h2></center> 
                        </div>
                        <div class="panel-body">
                            <form role="form" method="POST" action="validarLogin.htm">
                                <fieldset>
                                   <label for="codigoArea" ><fmt:message key="msg.CodigoArea" /></label>
                                    <select name="codigo"  required  ><br>
                                        <option value="1">(+1) United States </option> 
                                        <option value="1">(+1) Canada</option> 
                                        <option value="1">(+1) Puerto Rico</option> 
                                        <option value="1">(+1) Republica Dominicana</option> 
                                        <option value="51">(+51) Peru</option>
                                        <option value="52">(+52) Mexico</option>
                                        <option value="53">(+53) Cuba</option>
                                        <option value="56">(+56) Chile</option>
                                        <option value="502">(+502) Guatemala</option>
                                        <option value="503">(+503) El Salvador</option>
                                        <option value="504">(+504) Honduras</option>
                                        <option value="505">(+505) Nicaragua</option>
                                        <option value="506">(+506) Costa Rica</option>
                                        <option value="507">(+507) Panama</option>
                                    </select>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="<fmt:message key="msg.NumeroTelefonico" />" name="telefono" required type="text" autofocus >
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="<fmt:message key="msg.Password" />" name="password" type="password" value="" required>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me"><fmt:message key="msg.Recuerdame" />
                                        </label>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <button class="btn btn-lg btn-primary btn-block" type="submit"><fmt:message key="msg.Logear" /></button>
                                </fieldset>
                            </form>
                            <div>
                                <center>

                                    <br>
                                    <a href="recuperar.htm"><fmt:message key="msg.Recuperar" /></a>

                                    <br>
                                    <a href="registrar.htm"><fmt:message key="msg.Registrarse" /></a>
                                    <br><br>
                                    <a href="cambiarLenguaje.htm?lenguaje=en">Ingles</a>
                                    
                                    <a href="cambiarLenguaje.htm?lenguaje=es">Español</a>
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
        </div>



    </body>

</html>
