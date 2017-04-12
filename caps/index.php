<?php

  session_start();
  include_once ("../conf/functions.php");
  validarSession();
  $_SESSION["language_select"] = "es";

  $KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";
  require $KoolControlsFolder."/KoolAjax/koolajax.php";
  require $KoolControlsFolder."/KoolGrid/koolgrid.php";
  require $KoolControlsFolder."/KoolCalendar/koolcalendar.php"; 



  $koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax";  

  $link=conectDBReturn();
  $ds = new MySQLDataSource($link);
  
  $ds->SelectCommand = "SELECT * FROM capacitacion";

  $ds->UpdateCommand = "UPDATE capacitacion SET fechaInicio='@fechaInicio', fechaFinalizacion='@fechaFinalizacion', sede='@sede', capacitadores='@capacitadores', noAsistentes='@noAsistentes', convenio_idconvenio='@convenio_idconvenio' WHERE idcapacitacion=@idcapacitacion";
  // $ds->DeleteCommand = "DELETE FROM capacitacion WHERE idcapacitacion=@idcapacitacion";

  $ds->InsertCommand = "INSERT INTO capacitacion (fechaInicio,fechaFinalizacion,sede,capacitadores,noAsistentes,convenio_idconvenio) VALUES ('@fechaInicio','@fechaFinalizacion','@sede','@capacitadores','@noAsistentes','@convenio_idconvenio')";
  
  $grid = new KoolGrid("grid");

  $grid->scriptFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid";
  $grid->styleFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid/styles/office2010blue"; 

  $grid->AjaxEnabled = true;
  $grid->AjaxLoadingImage =  "../lib/KoolPHPSuite/KoolControls/KoolAjax/loading/5.gif"; 
  $grid->DataSource = $ds;
  $grid->MasterTable->Pager = new GridPrevNextAndNumericPager();
  $grid->Width = "860px";
  $grid->ColumnWrap = true;
  $grid->PageSize  = 40;
  $grid->AllowEditing = true;
  $grid->AllowDeleting = false;
  $grid->AllowResizing = true;
  $grid->MasterTable->ShowFunctionPanel = true; 


  class MyInsertTemplate implements GridTemplate
  {

    function Render($_row)
    {
      $KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

      $fechaInicio = new KoolDatePicker("fechaInicio"); //Create calendar object
      $fechaInicio->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
      $fechaInicio->styleFolder="default";             
      $fechaInicio->Init();


      $fechaFinalizacion = new KoolDatePicker("fechaFinalizacion"); //Create calendar object
      $fechaFinalizacion->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
      $fechaFinalizacion->styleFolder="default";             
      $fechaFinalizacion->Init();



      $html  = '<table align="left" style="width:49%; float:left;">
                  <tr>
                    <td align="right">Convenio:</td>
                    <td align="left" style="padding-left:10px;">
                      <select id="convenio_idconvenio" name="convenio_idconvenio">
                        <option value="">Seleccione un convenio</option>';

                        $sql="SELECT * FROM convenio ORDER BY idconvenio";
                        $res=mysql_query($sql);
                        if(!$res)
                          echo mysql_error();
                        
                        while($fil=mysql_fetch_assoc($res))
                        {
                          $html.='<option value="'.$fil["idconvenio"].'">'.dameNombreEstadoConvenio($fil["idconvenio"])." - ".convierteTimeStampCorto($fil["fechaFirma"])." - $ ".separarMiles($fil["montoTotalConvenio"]).'</option>';
                        }

      $html.='        </select>
                    </td>
                  </tr>


                  
                  <tr>
                    <td align="right">Fecha de inicio:</td>
                    <td align="left" style="padding-left:10px;">
                    '.$fechaInicio->Render().'
                    </td>
                  </tr>




                  <tr>
                    <td align="right">Fecha de fin:</td>
                    <td align="left" style="padding-left:10px;">
                    '.$fechaFinalizacion->Render().'
                    </td>
                  </tr>

                  <tr>
                    <td colspan="2" align="center" style="padding-top:10px;">
                      <input type="button" value="Cancelar" onclick="grid_cancel_insert(this)" />
                    </td>
                  </tr>

                </table>';




      $html  .= '<table align="right" style="width:49%; float:right;">';
    
      $html  .= '<tr>
                  <td align="right">Sede:</td>
                  <td align="left" style="padding-left:10px;">
                    <input type="text" name="sede" id="sede" >
                  </td>
                </tr>';


      $html  .= '<tr>
                  <td align="right">Capacitadores:</td>
                  <td align="left" style="padding-left:10px;">
                    <input type="text" name="capacitadores"  id="capacitadores" >
                  </td>
                </tr>';

          $html  .= '<tr>
                  <td align="right">Número de asistentes:</td>
                  <td align="left" style="padding-left:10px;">
                    <input type="text" name="noAsistentes"  id="noAsistentes" >
                  </td>
                </tr>';

          $html  .='<tr>
                    <td colspan="2" align="center" style="padding-top:10px;">
                      <input type="button" value="Aceptar" onclick="grid_confirm_insert(this)" />
                    </td>
                  </tr>';

      $html  .= '</table>';

      $html .='<div style="clear:both;"></div>';
      return $html;
    }
    function GetData($_row)
    {

        $fechaInicio=$_POST["fechaInicio"];
        $fechaInicio=explode("/",$fechaInicio);
        $fechaInicio=$fechaInicio[2]."-".$fechaInicio[1]."-".$fechaInicio[0];

        $fechaFinalizacion=$_POST["fechaFinalizacion"];
        $fechaFinalizacion=explode("/",$fechaFinalizacion);
        $fechaFinalizacion=$fechaFinalizacion[2]."-".$fechaFinalizacion[1]."-".$fechaFinalizacion[0];

        return array("convenio_idconvenio"=>$_POST["convenio_idconvenio"],"fechaInicio"=>$fechaInicio,"fechaFinalizacion"=>$fechaFinalizacion,"sede"=>$_POST["sede"],"capacitadores"=>$_POST["capacitadores"],"noAsistentes"=>$_POST["noAsistentes"]);
    }   
  }
  
  $grid->MasterTable->InsertSettings->Mode = "Template";
  $grid->MasterTable->InsertSettings->Template = new MyInsertTemplate();



  
  $column = new GridBoundColumn();
  $column->HeaderText = "Id";
  $column->DataField = "idcapacitacion";
  $column->ReadOnly = true;
  $grid->MasterTable->AddColumn($column);




  $column = new GridDropDownColumn();
  $column->HeaderText = "Convenio";
  $column->DataField = "convenio_idconvenio";
  $todos=dameGridTable("convenio","idconvenio");
  if (empty($todos)) 
  {
    $column->AddItem("No hay convenios", "");
  } 
  else 
  {
    foreach($todos as $indice => $registro)
      $column->AddItem($registro["idconvenio"],$registro["idconvenio"]);
  }
  $grid->MasterTable->AddColumn($column);



  $datepicker = new KoolDatePicker("datepicker"); //Create calendar object
  $datepicker->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
  $datepicker->styleFolder="default";
  $datepicker->DateFormat="m/d/Y";
  $datepicker->CalendarSettings->FocusedDate=mktime(0,0,0,1,1,2009);// Set focused date in 12/15/2009
  $datepicker->Value = "1/1/2009 00:00:00";
  $datepicker->CalendarSettings->ShowToday=true;//Not show today
  $datepicker->Init();



  $column = new GridDateTimeColumn();
  $column->Picker = $datepicker;
  $column->HeaderText = "Fecha de inicio";
  $column->DataField = "fechaInicio";
  //$column->Picker->DateFormat = "M d, Y";  
  $grid->MasterTable->AddColumn($column);



  $column = new GridDateTimeColumn();
  $column->Picker = $datepicker;
  $column->HeaderText = "Fecha de Finalización";
  $column->DataField = "fechaFinalizacion";
  //$column->Picker->DateFormat = "M d, Y";
  $grid->MasterTable->AddColumn($column);




  $column = new GridBoundColumn();
  $column->HeaderText = "Sede";
  $column->DataField = "sede";
  $grid->MasterTable->AddColumn($column);




  $column = new GridBoundColumn();
  $column->HeaderText = "Capacitadores";
  $column->DataField = "capacitadores";
  $grid->MasterTable->AddColumn($column);



  $column = new GridBoundColumn();
  $column->HeaderText = "Número de asistentes";
  $column->DataField = "noAsistentes";
  $grid->MasterTable->AddColumn($column);


  $grid->AutoGenerateEditColumn = true;


  
  $column = new GridEditDeleteColumn();
  
  //$grid->MasterTable->AllowFiltering = true;

  $grid->Localization->Load("../lib/KoolPHPSuite/KoolControls/KoolGrid/localization/es.xml");
  $grid->Process();
?>

<html>
  <head>
    <title>FIPAGO - Capacitaciones</title>
    <meta charset="UTF-8">

    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../styles.css">    

    <script language="javascript" src="../functions.js"></script>
    <script language="javascript" src="./functions.js"></script>

  </head>


  <body>
    
    <div id="menuLateral">
      <img src="<?php echo RUTA; ?>img/logo.jpg" style="width:100%;">
      <div class="itemMenu" onclick="cargaModulo('home');">Inicio</div>
        <?php
          cargaModulos();
        ?>
      <div class="itemMenu" onclick="cargaModulo('logout');">Salir</div>
    </div>



    <div id="containerPrincipal">
        
        <div class='titulos'>Capacitaciones</div>
        <div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
        <div style="clear:both;"></div> 


        <div class="tablaCentrada">
          <form id="form1" method="post">       

            <?php 
              echo $koolajax->Render();
              echo $grid->Render();
            ?>

          </form>
        </div>

    </div>
    <div style="clear:both;"></div>
    
  </body>

</html>