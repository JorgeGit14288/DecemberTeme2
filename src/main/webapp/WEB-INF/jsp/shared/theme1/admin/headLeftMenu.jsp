<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="panelAdmin.htm">  <strong>  InterCity WebApp         <small class="text text-primary"> ${sessionScope.usuario}</small> </strong>  </a>

    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="editarPerfil.htm"><i class="fa fa-user fa-fw"></i><fmt:message key="msg.PerfilUsuario" /></a>
                </li>
                <li><a href="recuperarPhone.htm"><i class="fa fa-gear fa-fw"></i><fmt:message key="msg.CambiarPassword" /></a>
                </li>
                <li class="divider"></li>
                <li><a href="logout.htm"><i class="fa fa-sign-out fa-fw"></i><fmt:message key="msg.Salir" /></a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <ul class="nav navbar-top-links navbar-right">
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
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                    <!-- /input-group -->
                </li>
                <li>
                    <a href="panelAdmin.htm"><i class="fa fa-dashboard fa-fw"></i> ${sessionScope.tipoUsuario} Dashboard</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-phone-square fa-fw"></i> <fmt:message key="msg.Historial" /><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="historial.htm"><fmt:message key="msg.HistorialLlamadas" /> </a>
                        </li>
                        <li>
                            <a href="recargas.htm"><fmt:message key="msg.HistorialRecargas" /></a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-user fa-fw"></i><fmt:message key="msg.PerfilUsuario" /><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="perfil.htm"><fmt:message key="msg.Perfil" /> </a>
                        </li>
                        <li>
                            <a href="editarPerfil.htm"><fmt:message key="msg.EditarPerfil" /></a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-user fa-fw"></i><fmt:message key="msg.GestionUsuarios" /><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="usuarios.htm"><fmt:message key="msg.UsuariosRegistrados" /></a>
                        </li>

                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-phone fa-fw"></i><fmt:message key="msg.GestionTelefonos" />.<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="telefonos.htm"><fmt:message key="msg.TelefonosRegistrados" /></a>
                        </li>

                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="cuotas.htm"><i class="fa fa-money fa-fw"></i> <fmt:message key="msg.VerCuotas" /></a>
                </li>
                <li>
                    <a href="logout.htm"><i class="fa fa-sign-out fa-fw"></i> <fmt:message key="msg.Salir" /></a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>