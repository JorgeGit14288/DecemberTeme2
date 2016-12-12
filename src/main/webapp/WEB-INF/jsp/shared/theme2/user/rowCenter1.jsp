<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<div class="row">
    <div class="col-lg-3 col-xs-6">    
        <!-- small box -->
        <a  href="perfil.htm" class="small-box bg-aqua">
            <div class="inner">

                <h2><fmt:message key="msg.PerfilUsuario" /></h2>
            </div>
            <div class="icon">
                <i class="fa fa-user"></i>
            </div>
            <div  class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></div>
        </a>
    </div>

    <div class="col-lg-3 col-xs-6">    
        <!-- small box -->
        <a  href="historial.htm" class="small-box bg-green">
            <div class="inner">

                <h2><fmt:message key="msg.HistorialLlamadas" /></h2>
            </div>
            <div class="icon">
                <i class="fa fa-phone"></i>
            </div>
            <div  class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></div>
        </a>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">    
        <!-- small box -->
        <a  href="Recargas.htm." class="small-box bg-yellow">
            <div class="inner">

                <h2><fmt:message key="msg.HistorialRecargas" /></h2>
            </div>
            <div class="icon">
                <i class="fa fa-money"></i>
            </div>
            <div  class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></div>
        </a>
    </div>
   
    <!-- ./col -->
    
    <div class="col-lg-3 col-xs-6">    
        <!-- small box -->
        <a  href="Recargar.htm." class="small-box bg-red">
            <div class="inner">

                <h2><fmt:message key="msg.RecargarSaldo" /></h2>
            </div>
            <div class="icon">
                <i class="fa fa-credit-card"></i>
            </div>
            <div  class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></div>
        </a>
    </div>
    <!-- ./col -->
</div>