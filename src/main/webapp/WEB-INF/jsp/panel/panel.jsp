<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> <fmt:message key="msg.TituloPaginaEscritorio" /></title>



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
                        <fmt:message key="msg.Escritorio" />
                        <small></small>

                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="panel.htm"><i class="fa fa-dashboard"></i> <fmt:message key="msg.Inicio" /></a></li>
                        <li class="active"><fmt:message key="msg.Escritorio" /></li>
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
                                    <div id="result">
                                        <% String msj = (String) request.getAttribute("mensaje");
                                            if (msj != null) {
                                        %>
                                        <div id="Error" class="alert alert-warning">
                                            <center>
                                                <b> <h4><%= msj%></h4></b>
                                            </center>
                                        </div>

                                        <%
                                            } else {
                                            }
                                        %>  



                                    </div>
                                    <div class="box box-primary box-solid">
                                        <div class="box-header with-border">
                                            <h3 class="box-title"><fmt:message key="msg.Recargar" /></h3>

                                            <div class="box-tools pull-right">
                                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <!-- /.box-tools -->
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <p><fmt:message key="msg.DescripcionRecargar" /></p>
                                            <jsp:include page="../shared/theme2/user/rowRecargar.jsp" flush="true" />
                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                </div>
                                <!-- /.col -->

                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <!-- /.col -->
                                <div class="col-md-12">
                                    <div class="box box-warning box-solid">
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
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <form name="form" method="POST" action="postPanel.htm" role="form">
                                                        <div class="col-xs-4">
                                                            <label><fmt:message key="msg.Pais" /></label>
                                                            <select name="country"  required  ><br>
                                                                <option value="${country}"> <fmt:message key="msg.Actual" /> ${country}  </option> 
                                                                <option value="Estados Unidos">Estados Unidos </option> 
                                                                <option value="Canada">Canada</option> 
                                                                <option value="Puesto Rico">Puerto Rico</option> 
                                                                <option value="Republica Dominicana">Republica Dominicana</option> 
                                                                <option value="Peru">Peru</option>
                                                                <option value="Mexico">Mexico</option>
                                                                <option value="Cuba">Cuba</option>
                                                                <option value="Chile">Chile</option>
                                                                <option value="Guatemala">Guatemala</option>
                                                                <option value="El Salvador">El Salvador</option>
                                                                <option value="Honduras">Honduras</option>
                                                                <option value="Nicaragua">Nicaragua</option>
                                                                <option value="Costa Rica">Costa Rica</option>
                                                                <option value="Panama">Panama</option>
                                                            </select>
                                                        </div>

                                                        <div class="col-xs-4">
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
                                                        <div class="col-xs-2">
                                                            <label></label>
                                                            <button  type="submit" id = "btncuotas" name="btncuotas" onclick="" class="btn btn-success"><fmt:message key="msg.VerCuotas" /> </button>

                                                        </div> 
                                                    </form>
                                                    <!-- /.consulta retornada por post -->
                                                </div>
                                                <div id="result">

                                                    ${resultado}

                                                </div>
                                            </div>
                                            <!-- /.row -->

                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                    <!-- /.box -->
                                </div>
                                <!-- /.col -->

                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <!-- =========================================================== -->
                        </div>
                        <!-- /#page-wrapper -->
                    </div>
                    <!-- /.row (main row) -->

                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <div class="control-sidebar-bg"></div>
            <jsp:include page="../shared/theme2/user/footer.jsp" />
        </div>
    </body>
</html>
