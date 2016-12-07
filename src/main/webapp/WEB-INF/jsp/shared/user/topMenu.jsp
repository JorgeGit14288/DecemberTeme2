<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
      <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-flag-checkered"> </i>     <fmt:message key="msg.Lenguaje" />     ${idioma}   <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="cambiarLenguaje.htm?lenguaje=es"><i class="fa fa-language fa-fw"></i><fmt:message key="msg.Es" /></a>
                </li>
                <li><a href="cambiarLenguaje.htm?lenguaje=en"><i class="fa fa-language fa-fw"></i><fmt:message key="msg.En" /></a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
</nav>