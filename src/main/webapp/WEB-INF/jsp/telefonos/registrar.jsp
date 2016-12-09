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

        <title><fmt:message key="msg.TituloPaginaRegistrar" /></title>

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
         <script type="text/javascript">

            function checkifempty()
            {
                if (!document.form.condicion.checked)
                {
                    document.form.btnenvio.disabled = true;
                    
                } else
                {
                    document.form.btnenvio.disabled = false;
                }

            }
        </script>

    </head>

    <body>
        <jsp:include page="../shared/user/topMenu.jsp" />

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-green">
                        <div class="panel-heading">
                            <center> <h3 class="panel-title"><fmt:message key="msg.TituloPanelRegistro" /></h3></center> 
                        </div>
                        <div class="panel-body">
                            <form name="form" class="form-Registro" method="POST" onSubmit="return validar()" action="validarRegistro.htm" >
                                    
                                 <label for="codigoArea" ><fmt:message key="msg.CodigoArea" /></label>
                                <input name="codigo" list="listapaises">
                                <datalist id="listapaises">
                                     <option value="1"> United States </option> 
                                        <option value="1"> Canada</option> 
                                        <option value="1"> Puerto Rico</option> 
                                        <option value="1"> Republica Dominicana</option> 
                                        
                                </datalist>
                                <label for="Telefono" class="sr-only"><fmt:message key="msg.Telefono" /></label>
                                <input type="tel" name="telefono" id="telefono" class="form-control" placeholder="<fmt:message key="msg.EjemploTelefono" />" required autofocus>
                                <label for="inputPassword" class="sr-only"><fmt:message key="msg.Password" /></label>
                                <input type="password" name="password"  id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.Password" />" required >
                                <label for="confirmPassword" class="sr-only"><fmt:message key="msg.ConfirmarPassword" /></label>
                                <input type="password" name="confirmPassword" id="inputPassword" class="form-control" placeholder="<fmt:message key="msg.ConfirmarPassword" />" required>
                                <label for="nombres" class="sr-only"><fmt:message key="msg.ConfirmarPassword" /></label>
                                <input type="text" name="nombres" id="nombres" class="form-control" placeholder="<fmt:message key="msg.Nombres" />" required>
                                <label for="nombres"class="sr-only"><fmt:message key="msg.ConfirmarPassword" /></label>
                                <input type="text" name="apellidos" id="apellidos" class="form-control" placeholder="<fmt:message key="msg.Apellidos" />" required>
                                 <div class="checkbox">
                                        <label>
                                             <input type="checkbox" name="condicion" id="condicion" onclick="checkifempty()"/> <fmt:message key="msg.YoAcepto" />   <a target="_blank"  href="politicas.htm"><fmt:message key="msg.TerminosYCondiciones" /> </a>
                                        </label>
                                    </div>
         
                                             <input class="btn btn-lg btn-success btn-block" type="submit" disabled="true" name="btnenvio"value="<fmt:message key="msg.BotonRegistrar" />" >
                            </form>
   \

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
