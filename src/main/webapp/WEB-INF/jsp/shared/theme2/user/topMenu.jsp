<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<header class="main-header">
    <!-- Logo -->
    <a href="panel.htm" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>I</b>C</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>InterCity</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->

        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>

        </a>




        <div class="navbar-custom-menu ">

            <ul class="nav navbar-nav ">
                <li class="dropdown">
                    <a class="dropdown-toggle bg-red" data-toggle="dropdown" href="#">
                        <span class="bg-red">
                            <fmt:message key="msg.SaldoActual" />  $  ${sessionScope.cuenta.getSaldo()}
                        </span>
                    </a>

                    <!-- /.dropdown-user -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-flag-checkered"> </i>     <fmt:message key="msg.Lenguaje" />     ${idioma}   <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="cambiarLenguajeEscritorio.htm?lenguaje=es"><i class="fa fa-language fa-fw"></i><fmt:message key="msg.Es" /></a>
                        </li>
                        <li><a href="cambiarLenguajeEscritorio.htm?lenguaje=en"><i class="fa fa-language fa-fw"></i><fmt:message key="msg.En" /></a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->

                <li class=""><a href="servicioCliente.htm"><i class="fa fa-phone fa-fw"></i><fmt:message key="msg.ServicioCliente" /></a>

                <li class="dropdown">
                    <a class="dropdown-toggle " data-toggle="dropdown" href="#">
                        <i class="fa fa-question-circle"> </i>     <fmt:message key="msg.Ayuda" />      <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="dids.htm"><i class="fa fa-language fa-fw"></i><fmt:message key="msg.NumerosAcceso" /></a>
                        </li>
                        <li><a href="ayuda.htm"><i class="fa fa-language fa-fw"></i><fmt:message key="msg.Ayuda" /></a>
                        <li><a href="acercaDe.htm"><i class="fa fa-language fa-fw"></i><fmt:message key="msg.AcercaDe" /></a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="perfil.htm"><i class="fa fa-user fa-fw"></i><fmt:message key="msg.PerfilUsuario" /></a>
                        </li>
                        <li><a href="cambiarPassword.htm"><i class="fa fa-spinner fa-fw"></i><fmt:message key="msg.CambiarPassword" /></a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout.htm"><i class="fa fa-sign-out fa-fw"></i><fmt:message key="msg.Salir" /></a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </div>
    </nav>
</header>