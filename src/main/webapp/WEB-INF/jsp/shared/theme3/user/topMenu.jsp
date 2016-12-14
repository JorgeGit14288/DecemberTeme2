<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<ul class="nav pull-right top-menu">
    <!-- task notificatoin start -->
    <!-- user login dropdown start-->
    <li class="dropdown">
        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
            <span class="profile-ava">
                <img alt="" src="img/avatar1_small.jpg">
            </span>
            <span class="username"> <fmt:message key="msg.Lenguaje" />     ${idioma} </span>
            <b class="caret"></b>
        </a>
        <ul class="dropdown-menu extended logout">
            <div class="log-arrow-up"></div>
            
            <li><a href="cambiarLenguaje.htm?lenguaje=es"><i class="fa fa-language fa-fw"></i><fmt:message key="msg.Es" /></a>
            </li>
           
            <li><a href="cambiarLenguaje.htm?lenguaje=en"><i class="fa fa-language fa-fw"></i><fmt:message key="msg.En" /></a>
            </li>
        </ul>
    </li>
    <!-- user login dropdown end -->
</ul>
<!-- notificatoin dropdown end-->