
<div class="panel panel-red">
    <div class="panel-heading">
        <i class="fa fa-money fa-fw"></i> Recargar Saldo
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
        <i class="fa fa-bell fa-fw"></i> Detalles de la Cuenta
    </div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        <div class="list-group">
            <a href="#" class="list-group-item">
                <i class="fa fa-phone fa-fw"></i> Telefono
                <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getTelefono()}</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <i class="fa fa-money fa-fw"></i> Saldo Actual
                <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getSaldo()}</em>
                </span>
            </a>
            <a href="#" class="list-group-item">
                <i class="fa fa-check fa-fw"></i> Id Usuario
                <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getIdUsuaro()}</em>
                </span>
            </a><a href="#" class="list-group-item">
                <i class="fa fa-arrow-circle-o-right fa-fw"></i> Nombres
                <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getNombres()}</em>
                </span>
            </a>
        </a><a href="#" class="list-group-item">
        <i class="fa fa-flag fa-fw"></i> Pais
        <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getCiudad()}</em>
        </span>
    </a>

    <a href="#" class="list-group-item">
        <i class="fa fa-home fa-fw"></i> Email
        <span class="pull-right text-muted small"><em>${sessionScope.cuenta.getEmail()}</em>
        </span>
    </a>

    <a href="historial.htm" class="list-group-item">
        <i class="fa fa-tasks fa-fw"></i> Historial
        <span class="pull-right text-muted small"><em>Ver Historial</em>
        </span>
    </a>

    <a href="#" class="list-group-item">
        <i class="fa fa-shopping-cart fa-fw"></i> Recargar Saldo
        <span class="pull-right text-muted small"><em>Realizar Recarga</em>
        </span>
    </a>
    <a href="cuotas.htm" class="list-group-item">
        <i class="fa fa-money fa-fw"></i> Cuotas
        <span class="pull-right text-muted small"><em>Lista de Precios</em>
        </span>
    </a>
</div>
<!-- /.list-group -->

</div>
<!-- /.panel-body -->
</div>
<!-- /