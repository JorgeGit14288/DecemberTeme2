<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>InterCity| <fmt:message key="msg.TituloPaginaEscritorio" /></title>

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
                <jsp:include page="../shared/theme2/user/topMenu2.jsp" />

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
                                            <h3 class="box-title"><fmt:message key="msg.NombrePanelHistorial1" /></h3>

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
                                                    <div class="col-xs-4">
                                                        <label><fmt:message key="msg.Pais" /></label>
                                                        <select name="country"  required  ><br>
                                                            <option value="${country}"> <fmt:message key="msg.PaisActual" /> ${country}  </option> 
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
                                                            <option value="15">15 </option> 
                                                            <option value="20">$25</option> 
                                                            <option value="30">$30</option> 
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
                                        <div id="result">
                                            <div id="Error" class=" alert alert-success">
                                                <center>
                                                    <strong>${mensaje}</strong>
                                                </center>
                                            </div>

                                            <!-- /.box-body -->
                                        </div>

                                    </div>

                                    <!-- /.box-body -->
                                </div>
                                <!-- /.box -->
                            </div>

                        </div>
                        <!-- /.row -->

                    </div>
                    <!-- /.row -->

                    <!-- =========================================================== -->
            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
    <jsp:include page="../shared/theme2/user/footer.jsp" />

</div>
<!-- /.content-wrapper -->
<div class="control-sidebar-bg"></div>
</div>
</body>
</html>
