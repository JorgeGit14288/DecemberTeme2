
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!-- /.row -->
<div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-user fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">1</div>
                        <div><fmt:message key="msg.PerfilUsuario" /></div>
                    </div>
                </div>
            </div>
            <a href="perfil.htm">
                <div class="panel-footer">
                    <span class="pull-left"> <fmt:message key="msg.VerDetalles" /></span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-green">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-phone-square fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">2</div>
                        <div><fmt:message key="msg.HistorialLlamadas" /></div>
                    </div>
                </div>
            </div>
            <a href="historial.htm">
                <div class="panel-footer">
                    <span class="pull-left"><fmt:message key="msg.VerDetalles" /></span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
            
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-yellow">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-credit-card  fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">3</div>
                        <div><fmt:message key="msg.HistorialRecargas" /></div>
                    </div>
                </div>
            </div>
            <a href="recargas.htm">
                <div class="panel-footer">
                    <span class="pull-left"><fmt:message key="msg.VerHistorial" /></span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>  
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-red">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-shopping-cart fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">4</div>
                        <div><fmt:message key="msg.RecargarSaldo" /></div>
                    </div>
                </div>
            </div>
            <a href="#">
                <div class="panel-footer">
                    <span class="pull-left"><fmt:message key="msg.IrRecargar" /></span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                </div>
            </a>
            
        </div>
    </div>
</div>
<!-- /.row -->

