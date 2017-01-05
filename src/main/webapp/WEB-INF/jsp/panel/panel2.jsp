<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><fmt:message key="msg.TituloPaginaCuotas" /></title>

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
                        <fmt:message key="msg.Cuotas" />
                        <small></small>

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="panel.htm"><i class="fa fa-dashboard"></i> <fmt:message key="msg.Escritorio" /></a></li>
                        <li class="active"><fmt:message key="msg.Cuotas" /></li>
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
                                <div class="col-lg-12">
                                    <div class="box box-success box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><fmt:message key="msg.TituloVentanaCuotas" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <div class="col-lg-12">
                                                <form name="form" method="POST" action="postCuotas.htm" role="form">
                                                    <div class="col-md-6">


                                                        <div class="form-group col-xs-6">
                                                            <label><fmt:message key="msg.Pais" /></label>
                                                            <select name="country"  required  class="form-control select2" style="width: 100%;">
                                                                <option selected="selected"><fmt:message key="msg.Actual" /> ${country} </option>
                                                                <option value="${country}"> <fmt:message key="msg.Actual" /> ${country}  </option> 
                                                                <option value="Estados Unidos">Estados Unidos </option> 
                                                                <option value="Canada"> Canada</option> 
                                                                <option value="Puesto Rico">Puerto Rico</option> 
                                                                <option value="Republica Dominicana">Republica Dominicana</option> 
                                                                <option value="Peru">Peru</option>
                                                                <option value="Mexico">Mexico</option>
                                                                <option value="Cuba">Cuba</option>
                                                                <option value="Chile">Chile</option>
                                                                <option value="Guatemala"> Guatemala</option>
                                                                <option value="El Salvador">El Salvador</option>
                                                                <option value="Honduras">Honduras</option>
                                                                <option value="Nicaragua">Nicaragua</option>
                                                                <option value="Costa Rica">Costa Rica</option>
                                                                <option value="Panama">Panama</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-xs-6">

                                                            <label><fmt:message key="msg.MontoDeRecarga" /></label>

                                                            <select name="amount" id="amount">
                                                                <option selected value="${amount}"> <fmt:message key="msg.RecargaDe" /> $ ${amount} </option>
                                                                <option value="5">$5</option> 
                                                                <option value="10">$10</option> 
                                                                <option value="15">$15 </option> 
                                                                <option value="15">$20 </option> 
                                                                <option value="20">$25</option> 
                                                                <option value="30">$30</option> 
                                                                <option value="50">$50</option> 
                                                                <option value="100">$100</option> 
                                                            </select>
                                                        </div>
                                                       
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group col-xs-6">

                                                            <br>
                                                            <button  type="submit" id = "btncuotas" name="btncuotas" onclick="" class="btn btn-success"><fmt:message key="msg.VerCuotas" /> </button>
                                                        </div>

                                                    </div>


                                                </form>
                                                <!-- /.consulta retornada por post -->
                                            </div>

                                            <div id="result">

                                                ${resultado}

                                            </div>
                                        </div>
                                        <!-- /.row -->
                                        <div id="result">
                                            <% String msj = (String) request.getAttribute("mensaje");
                                                if (msj != null) {
                                            %>
                                            <div id="Error" class="alert alert-success">
                                                <center>
                                                    <b> <h4><%= msj%></h4></b>
                                                </center>
                                            </div>

                                            <%
                                                } else {
                                                }
                                            %>  
                                            <!-- /.box-body -->
                                        </div>

                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>

                        </div>
                        <!-- /.row -->

                        <
                        <!-- =========================================================== -->
                    </div>
                    <!-- /#page-wrapper -->
                </section>
                <!-- /.content -->

            </div>
            <!-- /.row (main row) -->
            <!-- /.content-wrapper -->
            <div class="control-sidebar-bg"></div>
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
