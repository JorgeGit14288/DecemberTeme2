<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><fmt:message key="msg.TituloPaginaHistorialLlamadas" /></title>

        <jsp:include page="../shared/theme2/user/headDashboard.jsp" />


    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <jsp:include page="../shared/theme2/user/topMenu.jsp" />
            <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="../shared/theme2/user/leftMenu.jsp" />

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <fmt:message key="msg.HistorialLlamadas" />
                        <small></small>

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="panel.htm"><i class="fa fa-dashboard"></i> <fmt:message key="msg.Escritorio" /></a></li>
                        <li class="active"><fmt:message key="msg.Historial" /></li>
                        <li class="active"><fmt:message key="msg.HistorialLlamadas" /></li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <!-- Small boxes (Stat box) -->
                    <jsp:include page="../shared/theme2/user/rowCenter1.jsp" />
                    <!-- /.row -->
                    <!-- Main row -->
                    <div id="wrapper">

                        <div id="page-wrapper">
                            <div class="row">
                                <!-- /.col -->
                                <div class="col-md-12">
                                    <div class="box box-success box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><fmt:message key="msg.FormularioBusqueda" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">

                                            <!-- /.panel-heading -->

                                            <div class="col-lg-8">
                                                <form name="form1" method="GET" action="getHistorial.htm" role="form">
                                                    <div class="form-group col-xs-4">
                                                        <label><fmt:message key="msg.FechaInicio" />:</label>

                                                        <div class="input-group date ">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-calendar"></i>
                                                            </div>
                                                            <input min="2016-10-01" name="startDate" required value="${startDate}" type="text"  class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                                                        </div>
                                                        <!-- /.input group -->
                                                    </div>
                                                    <!-- /.form group -->
                                                    <div class="form-group col-xs-4">
                                                        <label><fmt:message key="msg.FechaFin" />:</label>

                                                        <div class="input-group date ">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-calendar"></i>
                                                            </div>
                                                            <input  name="endDate" min="2016-10-02" value="${endDate}" required type="text"  class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                                                        </div>
                                                        <!-- /.input group -->
                                                    </div>
                                                    <!-- /.form group -->
                                                    <div class="form-group col-xs-4">
                                                        <label><fmt:message key="msg.NumeroDestino" /></label>

                                                        <div class="input-group date ">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-phone"></i>
                                                            </div>
                                                            <input type="number" name="destination" min="1" value="${destination}" class="form-control" placeholder="<fmt:message key="msg.NumeroDestinoEjemplo" />">
                                                        </div>
                                                        <!-- /.input group -->
                                                    </div>
                                                    <!-- /.form group -->
                                                    <div class="form-group col-xs-4">
                                                        <label><fmt:message key="msg.Mostrar" /></label>

                                                        <div class="input-group date ">
                                                            <div class="input-group-addon">
                                                                <i class="fa fa-list"></i>
                                                            </div>
                                                            <select name="max">
                                                                <option selected value="${max}"><fmt:message key="msg.Mostrar" /> ${max}</option>

                                                                <option value="1">1 <fmt:message key="msg.Llamada" /></option> 
                                                                <option value="5">5 <fmt:message key="msg.Llamadas" /></option> 
                                                                <option value="10">10 <fmt:message key="msg.Llamadas" /></option> 
                                                                <option value="15">15 <fmt:message key="msg.Llamadas" /></option> 
                                                                <option value="25">25 <fmt:message key="msg.Llamadas" /></option> 
                                                                <option value="50">50 <fmt:message key="msg.Llamadas" /></option> 
                                                                <option value="100">100 <fmt:message key="msg.Llamadas" /></option> 

                                                            </select>
                                                        </div>
                                                        <!-- /.input group -->
                                                    </div>
                                                    <!-- /.form group -->
                                                    <div class="form-group col-xs-4">
                                                        <label><br></label>

                                                        <div class="input-group date ">
                                                            
                                                           <button type="submit" class="btn btn-success"><fmt:message key="msg.VerHistorial" /></button>
                                                        </div>
                                                        <!-- /.input group -->
                                                    </div>
                                                    <!-- /.form group -->

                                                </form>
                                            </div>
                                        </div><div id="Error" class=" alert alert-success">
                                            <center>
                                                <strong>${mensaje}</strong>
                                            </center>
                                        </div>


                                        <div class="table-striped">
                                            <table class="table table-bordered table-hover table-striped">
                                                <thead>

                                                    <tr>
                                                        <th><fmt:message key="msg.No" /></th>
                                                        <th><fmt:message key="msg.FechaHora" /></th>
                                                        <th><fmt:message key="msg.Destino" /></th>
                                                        <th><fmt:message key="msg.PaisOperador" /></th>

                                                        <th><fmt:message key="msg.Minutos" /></th>
                                                        <th><fmt:message key="msg.CostoMinuto" /></th>
                                                        <th><fmt:message key="msg.CostoTotal" /></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${llamadas}" var="llamada">
                                                        <tr class="odd gradeX">
                                                            <td><c:out value="${llamada.getNo()}" /></td>
                                                            <td><c:out value="${llamada.getInicioLLamada()}" /></td>
                                                            <td><c:out value="${llamada.getNumero()}" /></td>
                                                            <td><c:out value="${llamada.getPais_operador()}" /></td>
                                                            <td><c:out value="${llamada.getDuracionMinutos() }" /></td>
                                                            <td><c:out value="${llamada.getCostoMinuto()}" /></td>
                                                            <td><c:out value="${llamada.getCostoTotal()}" /></td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <ul class="pager">

                                                <li class="previous"><a href="getHistorial.htm?page=${pageprevius}&max=${max}&startDate=${startDate}&endDate=${endDate}&destination=${destination}">&larr; <fmt:message key="msg.Anterior" /> ${pageprevius}</a></li>
                                                <li class="list-group-item-text"><fmt:message key="msg.Pagina" />${page}</li>
                                                <li class="next"><a href="getHistorial.htm?page=${pagenext}&max=${max}&startDate=${startDate}&endDate=${endDate}&destination=${destination}"><fmt:message key="msg.Siguiente" /> ${pagenext} &rarr;</a></li>
                                            </ul>


                                        </div>

                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                </div>


                            </div>
                            <!-- /.row -->

                            <!-- =========================================================== -->
                        </div>
                        <!-- /#page-wrapper -->
                    </div>
                    <!-- /.row (main row) -->

                </section>
                <!-- /.content -->

                <!-- /.content-wrapper -->



                <div class="control-sidebar-bg"></div>

            </div>
            <jsp:include page="../shared/theme2/user/footer.jsp" />
        </div>
        <script>
            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();

                //Datemask dd/mm/yyyy
                $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
                //Datemask2 mm/dd/yyyy
                $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
                //Money Euro
                $("[data-mask]").inputmask();

                //Date range picker
                $('#reservation').daterangepicker();
                //Date range picker with time picker
                $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
                //Date range as a button
                $('#daterange-btn').daterangepicker(
                        {
                            ranges: {
                                'Today': [moment(), moment()],
                                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                                'This Month': [moment().startOf('month'), moment().endOf('month')],
                                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                            },
                            startDate: moment().subtract(29, 'days'),
                            endDate: moment()
                        },
                        function (start, end) {
                            $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                        }
                );

                //Date picker
                $('#datepicker').datepicker({
                    autoclose: true
                });
                //Date picker
                $('#datepicker2').datepicker({
                    autoclose: true
                });

                //iCheck for checkbox and radio inputs
                $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                    checkboxClass: 'icheckbox_minimal-blue',
                    radioClass: 'iradio_minimal-blue'
                });
                //Red color scheme for iCheck
                $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                    checkboxClass: 'icheckbox_minimal-red',
                    radioClass: 'iradio_minimal-red'
                });
                //Flat red color scheme for iCheck
                $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });

                //Colorpicker
                $(".my-colorpicker1").colorpicker();
                //color picker with addon
                $(".my-colorpicker2").colorpicker();

                //Timepicker
                $(".timepicker").timepicker({
                    showInputs: false
                });
            });
        </script>

    </body>
</html>
