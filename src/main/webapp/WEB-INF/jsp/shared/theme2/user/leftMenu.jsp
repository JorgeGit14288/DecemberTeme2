
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/resources/theme2/adminltemaster/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.usuario}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> ${sessionScope.cuenta.getNombres()}</a>
            </div>
        </div>
        <!-- search form -->

        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header"><fmt:message key="msg.Menu" /></li>
            <li class="active treeview">
                <a href="panel.htm">
                    <i class="fa fa-dashboard"></i> <span><fmt:message key="msg.Escritorio" /></span>

                </a>

            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i>
                    <span><fmt:message key="msg.Historial" /></span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="historial.htm"><i class="fa fa-phone"></i><fmt:message key="msg.HistorialLlamadas" /></a></li>
                    <li><a href="recargas.htm"><i class="fa fa-money"></i><fmt:message key="msg.HistorialRecargas" /></a></li>

                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i>
                    <span> <fmt:message key="msg.PerfilUsuario" /></span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="perfil.htm"><i class="fa fa-user-secret"></i> <fmt:message key="msg.Perfil" /></a></li>
                    <li><a href="editarPerfil.htm"><i class="fa fa-user-plus"></i><fmt:message key="msg.EditarPerfil" /></a></li>

                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i>
                    <span> <fmt:message key="msg.Ayuda" /></span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="dids.htm"><i class="fa fa-user-plus"></i><fmt:message key="msg.Dids" /></a></li>             
                    <li><a href="servicioCliente.htm"><i class="fa fa-phone"></i><fmt:message key="msg.ServicioCliente" /></a></li>
                    <li><a href="ayuda.htm"><i class="fa fa-circle"></i> <fmt:message key="msg.Ayuda" /></a></li>

                </ul>
            </li>
            <li class="treeview">
                <a href="cuotas.htm">
                    <i class="fa fa-money"></i> <span><fmt:message key="msg.VerCuotas" /></span>

                </a>

            </li>


            <li><a href="logout.htm"><i class="fa fa-sign-out"></i> <span> <fmt:message key="msg.CerrarSesion" /></span></a></li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>