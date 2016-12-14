<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<div class="panel panel-red">
    <div class="panel-heading">
        <i class="fa fa-money fa-fw"></i> <fmt:message key="msg.RecargarSaldo" />
    </div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        
        
         <button type="button" target="_blank" onclick="window.location.href = 'postRecargar.htm?amount=5'" target="_blank" class="btn btn-info btn-circle btn-lg"><i class="">$5</i>
        </button>
        <button type="button" target="_blank" onclick="location.href = 'postRecargar.htm?amount=10' " class="btn btn-primary btn-circle btn-lg"><i class="">$10</i>
        </button>
        <button type="button" target="_blank" onclick="location.href = 'postRecargar.htm?amount=15' " class="btn btn-warning btn-circle btn-lg"><i class="">$15</i>
        </button>
        <button type="button" target="_blank" onclick="location.href = 'postRecargar.htm?amount=20' " class="btn btn-success btn-circle btn-lg"><i class="">$20</i>
        </button>
        <button type="button" target="_blank" onclick="location.href = 'postRecargar.htm?amount=30' " class="btn btn-danger btn-circle btn-lg"><i class="">$30</i>
        </button>

        <!-- /.list-group -->

    </div>
    <!-- /.panel-body -->
</div>
<div class="panel panel-yellow">
    <div class="panel-heading">
        <i class="fa fa-bell fa-fw"></i> <fmt:message key="msg.DetallesCuenta" />
    </div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        <div class="list-group">
            <a href="#" class="list-group-item">
                <i class="fa fa-phone fa-fw"></i> <fmt:message key="msg.Telefono" />
                <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getTelefono()}</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <i class="fa fa-money fa-fw"></i> <fmt:message key="msg.SaldoActual" />
                <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getSaldo()}</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <i class="fa fa-check fa-fw"></i> <fmt:message key="msg.IdUsuario" />
                <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getIdUsuaro()}</em>
                </span>
            </a><a href="#" class="list-group-item">
                <i class="fa fa-arrow-circle-o-right fa-fw"></i> <fmt:message key="msg.Nombres" />
                <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getNombres()}</em>
                </span>
            </a>
        </a><a href="#" class="list-group-item">
        <i class="fa fa-flag fa-fw"></i> <fmt:message key="msg.Pais" />
        <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getCiudad()}</em>
        </span>
    </a>

    <a href="#" class="list-group-item">
        <i class="fa fa-home fa-fw"></i><fmt:message key="msg.Email" />
        <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getEmail()}</em>
        </span>
    </a>

    <a href="historial.htm" class="list-group-item">
        <i class="fa fa-tasks fa-fw"></i> <fmt:message key="msg.Historial" />
        <span class="pull-right text-muted small"><em>Ver Historial</em>
        </span>
    </a>

    <a href="#" class="list-group-item">
        <i class="fa fa-shopping-cart fa-fw"></i> <fmt:message key="msg.RecargarSaldo" />
        <span class="pull-right text-muted small"><em><fmt:message key="msg.IrRecargar" /></em>
        </span>
    </a>
    <a href="cuotas.htm" class="list-group-item">
        <i class="fa fa-money fa-fw"></i> <fmt:message key="msg.Cuotas" />
        <span class="pull-right text-muted small"><em><fmt:message key="msg.VerCuotas" /></em>
        </span>
    </a>
</div>
<!-- /.list-group -->

</div>
<!-- /.panel-body -->
</div>
<!-- /