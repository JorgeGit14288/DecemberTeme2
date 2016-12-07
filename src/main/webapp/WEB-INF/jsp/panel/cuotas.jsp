
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title><fmt:message key="msg.TituloPaginaCuotas" /></title>
        <jsp:include page="../shared/user/headDashboard.jsp" flush="true" />

    </head>

    <body>
        <div id="wrapper">
            <div>
                <jsp:include page="../shared/user/headLeftMenu.jsp" flush="true" />
            </div>
            <div id="page-wrapper">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><fmt:message key="msg.PanelNombreCuotas" /></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <jsp:include page="../shared/user/rowCenter1.jsp" flush="true" />
                <div class="row">
                    <!-- CONTENIDO DINAMICO -->
                    <div class="col-lg-8">
                        <!-- /.panel -->
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <i class="fa fa-money fa-fw"></i> <label><fmt:message key="msg.PanelNombreCuotas" /></label>
                                <div class="pull-right">
                                    <div class="btn-group">

                                    </div>
                                </div>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="row">
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

                                  

                                </div>
                            </div>
                            <!-- /.panel-body -->
                        </div>

                    </div>
                    <!-- /.col-lg-8 -->
                    <!-- CONTENIDO DINAMICO -->
                    <div class="col-lg-4">
                        <jsp:include page="../shared/user/rightPanel.jsp" flush="true" />
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->
        </div>

    </body>

</html>
