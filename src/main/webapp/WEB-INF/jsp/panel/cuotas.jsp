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
                                                                <option class="item" data-value="${country}"><i class="af flag"></i>${country}</option>
                                                                <option class="item" data-value="Afghanistan"><i class="af flag"></i>Afghanistan</option>
                                                                <option class="item" data-value="Aland Islands"><i class="ax flag"></i>Aland Islands</option>
                                                                <option class="item" data-value="Albania"><i class="al flag"></i>Albania</option>
                                                                <option class="item" data-value="Algeria"><i class="dz flag"></i>Algeria</option>
                                                                <option class="item" data-value="American Samoa"><i class="as flag"></i>American Samoa</option>
                                                                <option class="item" data-value="Andorra"><i class="ad flag"></i>Andorra</option>
                                                                <option class="item" data-value="Angola"><i class="ao flag"></i>Angola</option>
                                                                <option class="item" data-value="Anguilla"><i class="ai flag"></i>Anguilla</option>
                                                                <option class="item" data-value="Antigua"><i class="ag flag"></i>Antigua</option>
                                                                <option class="item" data-value="Argentina"><i class="ar flag"></i>Argentina</option>
                                                                <option class="item" data-value="Armenia"><i class="am flag"></i>Armenia</option>
                                                                <option class="item" data-value="Aruba"><i class="aw flag"></i>Aruba</option>
                                                                <option class="item" data-value="Australia"><i class="au flag"></i>Australia</option>
                                                                <option class="item" data-value="Austria"><i class="at flag"></i>Austria</option>
                                                                <option class="item" data-value="Azerbaijan"><i class="az flag"></i>Azerbaijan</option>
                                                                <option class="item" data-value="Bahamas"><i class="bs flag"></i>Bahamas</option>
                                                                <option class="item" data-value="Bahrain"><i class="bh flag"></i>Bahrain</option>
                                                                <option class="item" data-value="Bangladesh"><i class="bd flag"></i>Bangladesh</option>
                                                                <option class="item" data-value="Barbados"><i class="bb flag"></i>Barbados</option>
                                                                <option class="item" data-value="Belarus"><i class="by flag"></i>Belarus</option>
                                                                <option class="item" data-value="Belgium"><i class="be flag"></i>Belgium</option>
                                                                <option class="item" data-value="Belize"><i class="bz flag"></i>Belize</option>
                                                                <option class="item" data-value="Benin"><i class="bj flag"></i>Benin</option>
                                                                <option class="item" data-value="Bermuda"><i class="bm flag"></i>Bermuda</option>
                                                                <option class="item" data-value="Bhutan"><i class="bt flag"></i>Bhutan</option>
                                                                <option class="item" data-value="Bolivia"><i class="bo flag"></i>Bolivia</option>
                                                                <option class="item" data-value="Bosnia"><i class="ba flag"></i>Bosnia</option>
                                                                <option class="item" data-value="Botswana"><i class="bw flag"></i>Botswana</option>
                                                                <option class="item" data-value="Bouvet Island"><i class="bv flag"></i>Bouvet Island</option>
                                                                <option class="item" data-value="Brazil"><i class="br flag"></i>Brazil</option>
                                                                <option class="item" data-value="British Virgin Islands"><i class="vg flag"></i>British Virgin Islands</option>
                                                                <option class="item" data-value="Brunei"><i class="bn flag"></i>Brunei</option>
                                                                <option class="item" data-value="Bulgaria"><i class="bg flag"></i>Bulgaria</option>
                                                                <option class="item" data-value="Burkina Faso"><i class="bf flag"></i>Burkina Faso</option>
                                                                <option class="item" data-value="Burma"><i class="ar flag"></i>Burma</option>
                                                                <option class="item" data-value="Burundi"><i class="bi flag"></i>Burundi</option>
                                                                <option class="item" data-value="Caicos Islands"><i class="tc flag"></i>Caicos Islands</option>
                                                                <option class="item" data-value="Cambodia"><i class="kh flag"></i>Cambodia</option>
                                                                <option class="item" data-value="Cameroon"><i class="cm flag"></i>Cameroon</option>
                                                                <option class="item" data-value="Canada"><i class="ca flag"></i>Canada</option>
                                                                <option class="item" data-value="Cape Verde"><i class="cv flag"></i>Cape Verde</option>
                                                                <option class="item" data-value="Cayman Island"><i class="ky flag"></i>Cayman Islands</option>
                                                                <option class="item" data-value="Central African Republic"><i class="cf flag"></i>Central African Republic</option>
                                                                <option class="item" data-value="Chad"><i class="td flag"></i>Chad</option>
                                                                <option class="item" data-value="Chile"><i class="cl flag"></i>Chile</option>
                                                                <option class="item" data-value="China"><i class="cn flag"></i>China</option>
                                                                <option class="item" data-value="Christmas Island"><i class="cx flag"></i>Christmas Island</option>
                                                                <option class="item" data-value="Cocos Islands"><i class="cc flag"></i>Cocos Islands</option>
                                                                <option class="item" data-value="Colombia"><i class="co flag"></i>Colombia</option>
                                                                <option class="item" data-value="Comoros"><i class="km flag"></i>Comoros</option>
                                                                <option class="item" data-value="Congo Brazzaville"><i class="cg flag"></i>Congo Brazzaville</option>
                                                                <option class="item" data-value="Congo"><i class="cd flag"></i>Congo</option>
                                                                <option class="item" data-value="Cook Islands"><i class="ck flag"></i>Cook Islands</option>
                                                                <option class="item" data-value="Costa Rica"><i class="cr flag"></i>Costa Rica</option>
                                                                <option class="item" data-value="Cote optionoire"><i class="ci flag"></i>Cote optionoire</option>
                                                                <option class="item" data-value="Croatia"><i class="hr flag"></i>Croatia</option>
                                                                <option class="item" data-value="Cuba"><i class="cu flag"></i>Cuba</option>
                                                                <option class="item" data-value="Cyprus"><i class="cy flag"></i>Cyprus</option>
                                                                <option class="item" data-value="Czech Republic"><i class="cz flag"></i>Czech Republic</option>
                                                                <option class="item" data-value="Denmark"><i class="dk flag"></i>Denmark</option>
                                                                <option class="item" data-value="Djibouti"><i class="dj flag"></i>Djibouti</option>
                                                                <option class="item" data-value="Dominica"><i class="dm flag"></i>Dominica</option>
                                                                <option class="item" data-value="Dominican Republic"><i class="do flag"></i>Dominican Republic</option>
                                                                <option class="item" data-value="Ecuador"><i class="ec flag"></i>Ecuador</option>
                                                                <option class="item" data-value="Egypt"><i class="eg flag"></i>Egypt</option>
                                                                <option class="item" data-value="El Salvador"><i class="sv flag"></i>El Salvador</option>
                                                                <option class="item" data-value="England"><i class="gb flag"></i>England</option>
                                                                <option class="item" data-value="Equatorial Guinea"><i class="gq flag"></i>Equatorial Guinea</option>
                                                                <option class="item" data-value="Eritrea"><i class="er flag"></i>Eritrea</option>
                                                                <option class="item" data-value="Estonia"><i class="ee flag"></i>Estonia</option>
                                                                <option class="item" data-value="Ethiopia"><i class="et flag"></i>Ethiopia</option>
                                                                <option class="item" data-value="European Union"><i class="eu flag"></i>European Union</option>
                                                                <option class="item" data-value="Falkland Islands"><i class="fk flag"></i>Falkland Islands</option>
                                                                <option class="item" data-value="Faroe Islands"><i class="fo flag"></i>Faroe Islands</option>
                                                                <option class="item" data-value="Fiji"><i class="fj flag"></i>Fiji</option>
                                                                <option class="item" data-value="Finland"><i class="fi flag"></i>Finland</option>
                                                                <option class="item" data-value="France"><i class="fr flag"></i>France</option>
                                                                <option class="item" data-value="French Guiana"><i class="gf flag"></i>French Guiana</option>
                                                                <option class="item" data-value="French Polynesia"><i class="pf flag"></i>French Polynesia</option>
                                                                <option class="item" data-value="French Territories"><i class="tf flag"></i>French Territories</option>
                                                                <option class="item" data-value="Gabon"><i class="ga flag"></i>Gabon</option>
                                                                <option class="item" data-value="Gambia"><i class="gm flag"></i>Gambia</option>
                                                                <option class="item" data-value="Georgia"><i class="ge flag"></i>Georgia</option>
                                                                <option class="item" data-value="Germany"><i class="de flag"></i>Germany</option>
                                                                <option class="item" data-value="Ghana"><i class="gh flag"></i>Ghana</option>
                                                                <option class="item" data-value="Gibraltar"><i class="gi flag"></i>Gibraltar</option>
                                                                <option class="item" data-value="Greece"><i class="gr flag"></i>Greece</option>
                                                                <option class="item" data-value="Greenland"><i class="gl flag"></i>Greenland</option>
                                                                <option class="item" data-value="Grenada"><i class="gd flag"></i>Grenada</option>
                                                                <option class="item" data-value="Guadeloupe"><i class="gp flag"></i>Guadeloupe</option>
                                                                <option class="item" data-value="Guam"><i class="gu flag"></i>Guam</option>
                                                                <option class="item" data-value="Guatemala"><i class="gt flag"></i>Guatemala</option>
                                                                <option class="item" data-value="Guinea-Bissau"><i class="gw flag"></i>Guinea-Bissau</option>
                                                                <option class="item" data-value="Guinea"><i class="gn flag"></i>Guinea</option>
                                                                <option class="item" data-value="Guyana"><i class="gy flag"></i>Guyana</option>
                                                                <option class="item" data-value="Haiti"><i class="ht flag"></i>Haiti</option>
                                                                <option class="item" data-value="Heard Island"><i class="hm flag"></i>Heard Island</option>
                                                                <option class="item" data-value="Honduras"><i class="hn flag"></i>Honduras</option>
                                                                <option class="item" data-value="Hong Kong"><i class="hk flag"></i>Hong Kong</option>
                                                                <option class="item" data-value="Hungary"><i class="hu flag"></i>Hungary</option>
                                                                <option class="item" data-value="Iceland"><i class="is flag"></i>Iceland</option>
                                                                <option class="item" data-value="India"><i class="in flag"></i>India</option>
                                                                <option class="item" data-value="Indian Ocean Territory"><i class="io flag"></i>Indian Ocean Territory</option>
                                                                <option class="item" data-value="Indonesia"><i class="id flag"></i>Indonesia</option>
                                                                <option class="item" data-value="Iran"><i class="ir flag"></i>Iran</option>
                                                                <option class="item" data-value="Iraq"><i class="iq flag"></i>Iraq</option>
                                                                <option class="item" data-value="Ireland"><i class="ie flag"></i>Ireland</option>
                                                                <option class="item" data-value="Israel"><i class="il flag"></i>Israel</option>
                                                                <option class="item" data-value="Italy"><i class="it flag"></i>Italy</option>
                                                                <option class="item" data-value="Jamaica"><i class="jm flag"></i>Jamaica</option>
                                                                <option class="item" data-value="Japan"><i class="jp flag"></i>Japan</option>
                                                                <option class="item" data-value="Jordan"><i class="jo flag"></i>Jordan</option>
                                                                <option class="item" data-value="Kazakhstan"><i class="kz flag"></i>Kazakhstan</option>
                                                                <option class="item" data-value="Kenya"><i class="ke flag"></i>Kenya</option>
                                                                <option class="item" data-value="Kiribati"><i class="ki flag"></i>Kiribati</option>
                                                                <option class="item" data-value="Kuwait"><i class="kw flag"></i>Kuwait</option>
                                                                <option class="item" data-value="Kyrgyzstan"><i class="kg flag"></i>Kyrgyzstan</option>
                                                                <option class="item" data-value="Laos"><i class="la flag"></i>Laos</option>
                                                                <option class="item" data-value="Latvia"><i class="lv flag"></i>Latvia</option>
                                                                <option class="item" data-value="Lebanon"><i class="lb flag"></i>Lebanon</option>
                                                                <option class="item" data-value="Lesotho"><i class="ls flag"></i>Lesotho</option>
                                                                <option class="item" data-value="Liberia"><i class="lr flag"></i>Liberia</option>
                                                                <option class="item" data-value="Libya"><i class="ly flag"></i>Libya</option>
                                                                <option class="item" data-value="Liechtenstein"><i class="li flag"></i>Liechtenstein</option>
                                                                <option class="item" data-value="Lithuania"><i class="lt flag"></i>Lithuania</option>
                                                                <option class="item" data-value="Luxembourg"><i class="lu flag"></i>Luxembourg</option>
                                                                <option class="item" data-value="Macau"><i class="mo flag"></i>Macau</option>
                                                                <option class="item" data-value="Macedonia"><i class="mk flag"></i>Macedonia</option>
                                                                <option class="item" data-value="Madagascar"><i class="mg flag"></i>Madagascar</option>
                                                                <option class="item" data-value="Malawi"><i class="mw flag"></i>Malawi</option>
                                                                <option class="item" data-value="Malaysia"><i class="my flag"></i>Malaysia</option>
                                                                <option class="item" data-value="Maloptiones"><i class="mv flag"></i>Maloptiones</option>
                                                                <option class="item" data-value="Mali"><i class="ml flag"></i>Mali</option>
                                                                <option class="item" data-value="Malta"><i class="mt flag"></i>Malta</option>
                                                                <option class="item" data-value="Marshall Islands"><i class="mh flag"></i>Marshall Islands</option>
                                                                <option class="item" data-value="Martinique"><i class="mq flag"></i>Martinique</option>
                                                                <option class="item" data-value="Mauritania"><i class="mr flag"></i>Mauritania</option>
                                                                <option class="item" data-value="Mauritius"><i class="mu flag"></i>Mauritius</option>
                                                                <option class="item" data-value="Mayotte"><i class="yt flag"></i>Mayotte</option>
                                                                <option class="item" data-value="Mexico"><i class="mx flag"></i>Mexico</option>
                                                                <option class="item" data-value="Micronesia"><i class="fm flag"></i>Micronesia</option>
                                                                <option class="item" data-value="Moldova"><i class="md flag"></i>Moldova</option>
                                                                <option class="item" data-value="Monaco"><i class="mc flag"></i>Monaco</option>
                                                                <option class="item" data-value="Mongolia"><i class="mn flag"></i>Mongolia</option>
                                                                <option class="item" data-value="Montenegro"><i class="me flag"></i>Montenegro</option>
                                                                <option class="item" data-value="Montserrat"><i class="ms flag"></i>Montserrat</option>
                                                                <option class="item" data-value="Morocco"><i class="ma flag"></i>Morocco</option>
                                                                <option class="item" data-value="Mozambique"><i class="mz flag"></i>Mozambique</option>
                                                                <option class="item" data-value="Namibia"><i class="na flag"></i>Namibia</option>
                                                                <option class="item" data-value="Nauru"><i class="nr flag"></i>Nauru</option>
                                                                <option class="item" data-value="Nepal"><i class="np flag"></i>Nepal</option>
                                                                <option class="item" data-value="Netherlands Antilles"><i class="an flag"></i>Netherlands Antilles</option>
                                                                <option class="item" data-value="Netherlands"><i class="nl flag"></i>Netherlands</option>
                                                                <option class="item" data-value="New Caledonia"><i class="nc flag"></i>New Caledonia</option>
                                                                <option class="item" data-value="New Guinea"><i class="pg flag"></i>New Guinea</option>
                                                                <option class="item" data-value="New Zealand"><i class="nz flag"></i>New Zealand</option>
                                                                <option class="item" data-value="Nicaragua"><i class="ni flag"></i>Nicaragua</option>
                                                                <option class="item" data-value="Niger"><i class="ne flag"></i>Niger</option>
                                                                <option class="item" data-value="Nigeria"><i class="ng flag"></i>Nigeria</option>
                                                                <option class="item" data-value="Niue"><i class="nu flag"></i>Niue</option>
                                                                <option class="item" data-value="Norfolk Island"><i class="nf flag"></i>Norfolk Island</option>
                                                                <option class="item" data-value="North Korea"><i class="kp flag"></i>North Korea</option>
                                                                <option class="item" data-value="Northern Mariana Islands"><i class="mp flag"></i>Northern Mariana Islands</option>
                                                                <option class="item" data-value="Norway"><i class="no flag"></i>Norway</option>
                                                                <option class="item" data-value="Oman"><i class="om flag"></i>Oman</option>
                                                                <option class="item" data-value="Pakistan"><i class="pk flag"></i>Pakistan</option>
                                                                <option class="item" data-value="Palau"><i class="pw flag"></i>Palau</option>
                                                                <option class="item" data-value="Palestine"><i class="ps flag"></i>Palestine</option>
                                                                <option class="item" data-value="Panama"><i class="pa flag"></i>Panama</option>
                                                                <option class="item" data-value="Paraguay"><i class="py flag"></i>Paraguay</option>
                                                                <option class="item" data-value="Peru"><i class="pe flag"></i>Peru</option>
                                                                <option class="item" data-value="Philippines"><i class="ph flag"></i>Philippines</option>
                                                                <option class="item" data-value="Pitcairn Islands"><i class="pn flag"></i>Pitcairn Islands</option>
                                                                <option class="item" data-value="Poland"><i class="pl flag"></i>Poland</option>
                                                                <option class="item" data-value="Portugal"><i class="pt flag"></i>Portugal</option>
                                                                <option class="item" data-value="Puerto Rico"><i class="pr flag"></i>Puerto Rico</option>
                                                                <option class="item" data-value="Qatar"><i class="qa flag"></i>Qatar</option>
                                                                <option class="item" data-value="Reunion"><i class="re flag"></i>Reunion</option>
                                                                <option class="item" data-value="Romania"><i class="ro flag"></i>Romania</option>
                                                                <option class="item" data-value="Russia"><i class="ru flag"></i>Russia</option>
                                                                <option class="item" data-value="Rwanda"><i class="rw flag"></i>Rwanda</option>
                                                                <option class="item" data-value="Saint Helena"><i class="sh flag"></i>Saint Helena</option>
                                                                <option class="item" data-value="Saint Kitts and Nevis"><i class="kn flag"></i>Saint Kitts and Nevis</option>
                                                                <option class="item" data-value="Saint Lucia"><i class="lc flag"></i>Saint Lucia</option>
                                                                <option class="item" data-value="Saint Pierre"><i class="pm flag"></i>Saint Pierre</option>
                                                                <option class="item" data-value="Saint Vincent"><i class="vc flag"></i>Saint Vincent</option>
                                                                <option class="item" data-value="Samoa"><i class="ws flag"></i>Samoa</option>
                                                                <option class="item" data-value="San Marino"><i class="sm flag"></i>San Marino</option>
                                                                <option class="item" data-value="Sandwich Islands"><i class="gs flag"></i>Sandwich Islands</option>
                                                                <option class="item" data-value="Sao Tome"><i class="st flag"></i>Sao Tome</option>
                                                                <option class="item" data-value="Saudi Arabia"><i class="sa flag"></i>Saudi Arabia</option>
                                                                <option class="item" data-value="Senegal"><i class="sn flag"></i>Senegal</option>
                                                                <option class="item" data-value="Serbia"><i class="rs flag"></i>Serbia</option>
                                                                <option class="item" data-value="Seychelles"><i class="sc flag"></i>Seychelles</option>
                                                                <option class="item" data-value="Sierra Leone"><i class="sl flag"></i>Sierra Leone</option>
                                                                <option class="item" data-value="Singapore"><i class="sg flag"></i>Singapore</option>
                                                                <option class="item" data-value="Slovakia"><i class="sk flag"></i>Slovakia</option>
                                                                <option class="item" data-value="Slovenia"><i class="si flag"></i>Slovenia</option>
                                                                <option class="item" data-value="Solomon Islands"><i class="sb flag"></i>Solomon Islands</option>
                                                                <option class="item" data-value="Somalia"><i class="so flag"></i>Somalia</option>
                                                                <option class="item" data-value="South Africa"><i class="za flag"></i>South Africa</option>
                                                                <option class="item" data-value="South Korea"><i class="kr flag"></i>South Korea</option>
                                                                <option class="item" data-value="Spain"><i class="es flag"></i>Spain</option>
                                                                <option class="item" data-value="Sri Lanka"><i class="lk flag"></i>Sri Lanka</option>
                                                                <option class="item" data-value="Sudan"><i class="sd flag"></i>Sudan</option>
                                                                <option class="item" data-value="Suriname"><i class="sr flag"></i>Suriname</option>
                                                                <option class="item" data-value="Svalbard"><i class="sj flag"></i>Svalbard</option>
                                                                <option class="item" data-value="Swaziland"><i class="sz flag"></i>Swaziland</option>
                                                                <option class="item" data-value="Sweden"><i class="se flag"></i>Sweden</option>
                                                                <option class="item" data-value="Switzerland"><i class="ch flag"></i>Switzerland</option>
                                                                <option class="item" data-value="Syria"><i class="sy flag"></i>Syria</option>
                                                                <option class="item" data-value="Taiwan"><i class="tw flag"></i>Taiwan</option>
                                                                <option class="item" data-value="Tajikistan"><i class="tj flag"></i>Tajikistan</option>
                                                                <option class="item" data-value="Tanzania"><i class="tz flag"></i>Tanzania</option>
                                                                <option class="item" data-value="Thailand"><i class="th flag"></i>Thailand</option>
                                                                <option class="item" data-value="Timorleste"><i class="tl flag"></i>Timorleste</option>
                                                                <option class="item" data-value="Togo"><i class="tg flag"></i>Togo</option>
                                                                <option class="item" data-value="Tokelau"><i class="tk flag"></i>Tokelau</option>
                                                                <option class="item" data-value="Tonga"><i class="to flag"></i>Tonga</option>
                                                                <option class="item" data-value="Trinidad"><i class="tt flag"></i>Trinidad</option>
                                                                <option class="item" data-value="Tunisia"><i class="tn flag"></i>Tunisia</option>
                                                                <option class="item" data-value="Turkey"><i class="tr flag"></i>Turkey</option>
                                                                <option class="item" data-value="Turkmenistan"><i class="tm flag"></i>Turkmenistan</option>
                                                                <option class="item" data-value="Tuvalu"><i class="tv flag"></i>Tuvalu</option>
                                                                <option class="item" data-value="Uganda"><i class="ug flag"></i>Uganda</option>
                                                                <option class="item" data-value="Ukraine"><i class="ua flag"></i>Ukraine</option>
                                                                <option class="item" data-value="United Arab Emirates"><i class="ae flag"></i>United Arab Emirates</option>
                                                                <option class="item" data-value="United States"><i class="us flag"></i>United States</option>
                                                                <option class="item" data-value="Uruguay"><i class="uy flag"></i>Uruguay</option>
                                                                <option class="item" data-value="Us Minor Islands"><i class="um flag"></i>Us Minor Islands</option>
                                                                <option class="item" data-value="Us Virgin Islands"><i class="vi flag"></i>Us Virgin Islands</option>
                                                                <option class="item" data-value="Uzbekistan"><i class="uz flag"></i>Uzbekistan</option>
                                                                <option class="item" data-value="Vanuatu"><i class="vu flag"></i>Vanuatu</option>
                                                                <option class="item" data-value="Vatican City"><i class="va flag"></i>Vatican City</option>
                                                                <option class="item" data-value="Venezuela"><i class="ve flag"></i>Venezuela</option>
                                                                <option class="item" data-value="Vietnam"><i class="vn flag"></i>Vietnam</option>
                                                                <option class="item" data-value="Wallis and Futuna"><i class="wf flag"></i>Wallis and Futuna</option>
                                                                <option class="item" data-value="Western Sahara"><i class="eh flag"></i>Western Sahara</option>
                                                                <option class="item" data-value="Yemen"><i class="ye flag"></i>Yemen</option>
                                                                <option class="item" data-value="Zambia"><i class="zm flag"></i>Zambia</option>
                                                                <option class="item" data-value="Zimbabwe"><i class="zw flag"></i>Zimbabwe</option>
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
