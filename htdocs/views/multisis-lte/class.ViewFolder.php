<?php
/**
 * Implementation of ViewFolder view
 *
 * @category   DMS
 * @package    SeedDMS
 * @license    GPL 2
 * @version    @version@
 * @author     Uwe Steinmann <uwe@steinmann.cx>
 * @copyright  Copyright (C) 2002-2005 Markus Westphal,
 *             2006-2008 Malcolm Cowe, 2010 Matteo Lucarelli,
 *             2010-2012 Uwe Steinmann
 * @version    Release: @package_version@
 */
/**
 * Include parent class
 */
require_once("class.Bootstrap.php");
/**
 * Include class to preview documents
 */
require_once("SeedDMS/Preview.php");
/**
 * Class which outputs the html page for ViewFolder view
 *
 * @category   DMS
 * @package    SeedDMS
 * @author     Markus Westphal, Malcolm Cowe, Uwe Steinmann <uwe@steinmann.cx>
 * @copyright  Copyright (C) 2002-2005 Markus Westphal,
 *             2006-2008 Malcolm Cowe, 2010 Matteo Lucarelli,
 *             2010-2012 Uwe Steinmann
 * @version    Release: @package_version@
 */

function buscarDocumentosCaducados($baseDatos,$usuario,$days,$dms,$cachedir,$previewwidth,$timeout,$id_numero_declaratoria)
	{
		$startts = strtotime("midnight", time());//fecha de la consulta
		$informwatcher=FALSE;
		//echo "Checking for documents expiring between ".date('Y-m-d', $startts)." and ".date('Y-m-d', $startts+($days-1)*86400)."\n";

                //de cada usuario obtengo los grupos a los cuales pertences
		        //echo "Usuario: ".$usuario->getFullname()."\n";
				$groups = $usuario->getGroups();
				$groupids = array();
				foreach($groups as $group)
				{
				   $groupids[] = $group->getID();
				}

				///hacemos la consulta como tal
				//construyo la consulta

				if (!$baseDatos->createTemporaryTable("ttstatid") || !$baseDatos->createTemporaryTable("ttcontentid")) 
				{
	echo getMLText("internal_error_exit")."\n";
	exit;
                }
	//echo "creada tabla temporal";
					/**$queryStr = "SELECT DISTINCT a.*, tblDocumentStatusLog.* FROM `tblDocuments` a ".
		"LEFT JOIN `tblDocumentContent` ON `a`.`id` = `tblDocumentContent`.`document` ".
		"LEFT JOIN `tblNotify` b ON a.id=b.target ".
		"LEFT JOIN `tblDocuments` ON `tblDocuments`.`id` = `tblDocumentContent`.`document` ".
		"LEFT JOIN `tblDocumentStatus` ON `tblDocumentStatus`.`documentID` = `tblDocumentContent`.     `document` ".
		"LEFT JOIN `tblDocumentStatusLog` ON `tblDocumentStatusLog`.`statusID` = `tblDocumentStatus`.  `statusID` ".
		"LEFT JOIN `ttstatid` ON `ttstatid`.`maxLogID` = `tblDocumentStatusLog`.`statusLogID` ".
		"WHERE (a.`owner` = '".$usuario->getID()."' ".
		($informwatcher ? " OR ((b.userID = '".$usuario->getID()."' ".
		($groupids ? "or b.groupID in (".implode(',', $groupids).")" : "").") ".
		"AND b.targetType = 2) " : "").
		") AND a.`expires` < '".($startts + $days*86400)."' ".
		"AND a.`expires` > '".($startts)."' ";
		**/


		$queryStr2 = "SELECT `tblDocuments`.* FROM `tblDocuments`".
		"WHERE `tblDocuments`.`owner` = '".$usuario->getID()."' ".
		"AND `tblDocuments`.`expires` < '".($startts + $days*86400)."' ".
		"AND `tblDocuments`.`expires` > '".($startts)."'";
			
	       //llamo a bd
		//echo "Query q estoy haciendo: ".$queryStr2;
			$resArr = $baseDatos->getResultArray($queryStr2);
			if (is_bool($resArr) && !$resArr) 
			{
				echo getMLText("internal_error_exit")."\n";
				exit;
			}
			return $resArr;
			      
	}
 function imprimirTipos() //imprime los tipos de clasificacion que se usan en el formulario de multisubida
{
	
  $titulos=array("Total","Parcial");
	//echo " <select class=\"form-control select\"  name=\"titulosObtenidos[]\">";
  echo "<option disabled selected value>Seleccione una opción</option>";
    foreach ($titulos as $doc) 
    {
		echo "<option value=\"".$doc."\">".$doc."</option>";
	} //fin del bucle

	//echo "</select>";

}

function getUserFromFolder($id_folder) //dado un id de folder, me devuelve el id del usuario (oficial) de esa carpeta
{
	//echo "Función getDefaultUserFolder. Se ha pasado con argumento: ".$id_usuario;
	$id_user=0;
	 $settings = new Settings(); //acceder a parámetros de settings.xml con _antes
  	$driver=$settings->_dbDriver;
    $host=$settings->_dbHostname;
    $user=$settings->_dbUser;
    $pass=$settings->_dbPass;
    $base=$settings->_dbDatabase;
	$manejador=new SeedDMS_Core_DatabaseAccess($driver,$host,$user,$pass,$base);
	$estado=$manejador->connect();
	//echo "Conectado: ".$estado;
	if($estado!=1)
	{
		echo "out.viewFolder.php[getDefaultUserFolder]Error: no se pudo conectar a la BD";
	}	
	//query de consulta:
	//$miQuery="SELECT homefolder FROM seeddms.tblusers WHERE id=".$id_usuario;
	$miQuery="SELECT id FROM tblUsers WHERE homefolder=$id_folder";
	//echo "mi query: ".$miQuery;
	$resultado=$manejador->getResultArray($miQuery);
	$id_user=$resultado[0]['id'];
	//echo "id_folder: ".$id_folder;
	return $id_user;
}

 function imprimirParametrosShort($tabla,$columna,$id,$db)
{
 $consultar="SELECT id, $columna FROM $tabla WHERE idUsuario=$id";
          //echo "Consultar: ".$consultar;
     $res1 = $db->getResultArray($consultar);
  	$serial=$tabla."_".$id;

// comienzo bucle
  echo "<option disabled selected value>Seleccione un elemento de la lista</option>";

    foreach ($res1 as $doc) 
    {
    	$valor=$doc[$columna];
  	    $idRegistro=$doc['id']; //id único de la entrada en la tabla
    	echo "<option value=\"".$valor."\">".$valor."</option>";
    }


}// fin de imprimir parametros shorti

 function imprimirParametros($tabla,$columna,$id,$db,$inputID,$inputName)
{
 $consultar="SELECT id, $columna FROM $tabla WHERE idUsuario=$id";
          //echo "Consultar: ".$consultar;
     $res1 = $db->getResultArray($consultar);
  	$serial=$tabla."_".$id;
echo " <select class=\"form-control chzn-select\" id=\"$inputID\" name=\"$inputName\">";
// comienzo bucle
  echo "<option disabled selected value>Seleccione un elemento de la lista</option>";

    foreach ($res1 as $doc) 
    {
    	$valor=$doc[$columna];
  	    $idRegistro=$doc['id']; //id único de la entrada en la tabla
    	echo "<option value=\"".$valor."\">".$valor."</option>";
    }


	echo "</select>";
}// fin de imprimir países

class SeedDMS_View_ViewFolder extends SeedDMS_Bootstrap_Style {
	function getAccessModeText($defMode) { /* {{{ */
		switch($defMode) {
			case M_NONE:
				return getMLText("access_mode_none");
				break;
			case M_READ:
				return getMLText("access_mode_read");
				break;
			case M_READWRITE:
				return getMLText("access_mode_readwrite");
				break;
			case M_ALL:
				return getMLText("access_mode_all");
				break;
		}
	} /* }}} */
	function printAccessList($obj) { /* {{{ */
		$accessList = $obj->getAccessList();
		if (count($accessList["users"]) == 0 && count($accessList["groups"]) == 0)
			return;
		$content = '';
		for ($i = 0; $i < count($accessList["groups"]); $i++)
		{
			$group = $accessList["groups"][$i]->getGroup();
			$accesstext = $this->getAccessModeText($accessList["groups"][$i]->getMode());
			$content .= $accesstext.": ".htmlspecialchars($group->getName());
			if ($i+1 < count($accessList["groups"]) || count($accessList["users"]) > 0)
				$content .= "<br />";
		}
		for ($i = 0; $i < count($accessList["users"]); $i++)
		{
			$user = $accessList["users"][$i]->getUser();
			$accesstext = $this->getAccessModeText($accessList["users"][$i]->getMode());
			$content .= $accesstext.": ".htmlspecialchars($user->getFullName());
			if ($i+1 < count($accessList["users"]))
				$content .= "<br />";
		}
		if(count($accessList["groups"]) + count($accessList["users"]) > 3) {
			$this->printPopupBox(getMLText('list_access_rights'), $content);
		} else {
			echo $content;
		}
	} /* }}} */
	function js() { /* {{{ */
		$user = $this->params['user'];
		$folder = $this->params['folder'];
		$orderby = $this->params['orderby'];
		$expandFolderTree = $this->params['expandFolderTree'];
		$enableDropUpload = $this->params['enableDropUpload'];
		header('Content-Type: application/javascript; charset=UTF-8');
		parent::jsTranslations(array('cancel', 'splash_move_document', 'confirm_move_document', 'move_document', 'splash_move_folder', 'confirm_move_folder', 'move_folder'));
		
?>

function folderSelected(id, name) {
	window.location = '../out/out.ViewFolder.php?folderid=' + id;
}

function checkForm() {
	msg = new Array();
	if (document.form1.name.value == "") msg.push("<?php printMLText("js_no_name");?>");
	if (document.form1.comment.value == "") msg.push("<?php printMLText("js_no_comment");?>");
	if (msg != "") {
  	noty({
  		text: msg.join('<br />'),
  		type: 'error',
      dismissQueue: true,
  		layout: 'topRight',
  		theme: 'defaultTheme',
			_timeout: 1500,
  	});
		return false;
	}
	else
		return true;
}

function checkForm2() {
	msg = new Array();
	if (document.form2.name.value == "") msg.push("<?php printMLText("js_no_name");?>");
	if (document.form2.comment.value == "") msg.push("<?php printMLText("js_no_comment");?>");
	/*if (document.form2.expdate.value == "") msg.push("<?php printMLText("js_no_expdate");?>");*/
	if (document.form2.theuserfile.value == "") msg.push("<?php printMLText("js_no_file");?>");
	if (msg != "") {
  	noty({
  		text: msg.join('<br />'),
  		type: 'error',
      dismissQueue: true,
  		layout: 'topRight',
  		theme: 'defaultTheme',
			_timeout: 1500,
  	});
		return false;
	}
	else
		return true;
}

$(document).ajaxStart(function() { Pace.restart(); });
//  $('.ajax').click(function(){
//    $.ajax({url: '#', success: function(result){
//    $('.ajax-content').html('<hr>Ajax Request Completed !');
//  }});
//});

$(document).ready(function(){
	
	$('body').on('submit', '#form1', function(ev){
		if(!checkForm()) {
			ev.preventDefault();
		} else {
			$("#box-form1").append("<div class=\"overlay\"><i class=\"fa fa-refresh fa-spin\"></i></div>");
		}
	});

	$('body').on('submit', '#form2', function(ev){
		if(!checkForm2()){
			ev.preventDefault();
		} else {
			$("#box-form2").append("<div class=\"overlay\"><i class=\"fa fa-refresh fa-spin\"></i></div>");
		}
	});

	$("#form1").validate({
		invalidHandler: function(e, validator) {
			noty({
				text:  (validator.numberOfInvalids() == 1) ? "<?php printMLText("js_form_error");?>".replace('#', validator.numberOfInvalids()) : "<?php printMLText("js_form_errors");?>".replace('#', validator.numberOfInvalids()),
				type: 'error',
				dismissQueue: true,
				layout: 'topRight',
				theme: 'defaultTheme',
				timeout: 1500,
			});
		},
		messages: {
			name: "<?php printMLText("js_no_name");?>",
			comment: "<?php printMLText("js_no_comment");?>"
		},
	});

	$("#form2").validate({
		invalidHandler: function(e, validator) {
			noty({
				text:  (validator.numberOfInvalids() == 1) ? "<?php printMLText("js_form_error");?>".replace('#', validator.numberOfInvalids()) : "<?php printMLText("js_form_errors");?>".replace('#', validator.numberOfInvalids()),
				type: 'error',
				dismissQueue: true,
				layout: 'topRight',
				theme: 'defaultTheme',
				timeout: 1500,
			});
		},
		messages: {
			name: "<?php printMLText("js_no_name");?>",
			comment: "<?php printMLText("js_no_comment");?>",
			/*expdate: "<?php printMLText("js_no_expdate");?>",*/
			theuserfile: "<?php printMLText("js_no_file");?>",
		},
	});

	$("#add-folder").on("click", function()
	{
 		  $("#div-add-folder").show('slow');
  });

  $("#cancel-add-folder").on("click", function(){
 		  $("#div-add-folder").hide('slow');
  });

  $("#add-document").on("click", function()
  {
	   
 		  $("#div-add-document").show('slow');
  });
  
  $("#add-acta-inexistencia").on("click", function()
  {
	   
 		  $("#div-add-pene").show('slow');
  });

   $("#add-multiple-document").on("click", function()
  {
	   
 		  $("#div-add-multiple-reservas").show('slow');
  });

  
  
  $(".cancel-add-document").on("click", function(){
 		  $("#div-add-document").hide('slow');
  });

  $(".move-doc-btn").on("click", function(ev){
  	id = $(ev.currentTarget).attr('rel');
 		$("#table-move-document-"+id).show('slow');
  });

  $(".cancel-doc-mv").on("click", function(ev){
  	id = $(ev.currentTarget).attr('rel');
 		$("#table-move-document-"+id).hide('slow');
  });

  $(".move-folder-btn").on("click", function(ev){
  	id = $(ev.currentTarget).attr('rel');
 		$("#table-move-folder-"+id).show('slow');
  });

  $(".cancel-folder-mv").on("click", function(ev){
  	id = $(ev.currentTarget).attr('rel');
 		$("#table-move-folder-"+id).hide('slow');
  });
  
/* ---- Para animar los formularios de subida y sus 3 pestañas al darle a la flechita que apunta hacia la derecha

CAMBIADO: 12/09/17 JOSE MARIO LOPEZ LEIVA---- */
 /* ---- subida de declaratorias de reserva (normal) ---- */
  $("#btn-next-1").on("click", function(){
  	$("#nav-tab-1").removeClass("active");
  	$("#nav-tab-2").addClass("active");
  	$('html, body').animate({scrollTop: 0}, 800);
  });

  $("#btn-next-2").on("click", function(){
  	$("#nav-tab-2").removeClass("active");
  	$("#nav-tab-3").addClass("active");
  	$('html, body').animate({scrollTop: 0}, 800);
  });
  
   /* ---- subida de actas de inexistencia---- */
  $("#btn-next-1_acta").on("click", function(){
  	$("#nav-tab-1_acta").removeClass("active");
  	$("#nav-tab-2_acta").addClass("active");
  	$('html, body').animate({scrollTop: 0}, 800);
  });

  $("#btn-next-2_acta").on("click", function(){
  	$("#nav-tab-2_acta").removeClass("active");
  	$("#nav-tab-3_acta").addClass("active");
  	$('html, body').animate({scrollTop: 0}, 800);
  });
   /* ---- FIN SCROLL CON FLECHA A LA DERECHA---- */
  
  
  

  /* ---- For document previews ---- */

  $(".preview-doc-btn").on("click", function(){
  	$("#div-add-folder").hide();
		$("#div-add-document").hide();
  	$("#folder-content").hide();

  	var docID = $(this).attr("id");
  	var version = $(this).attr("rel");
  	$("#doc-title").text($(this).attr("title"));
  	$("#document-previewer").show('slow');
  	$("#iframe-charger").attr("src","../pdfviewer/web/viewer.html?file=..%2F..%2Fop%2Fop.Download.php%3Fdocumentid%3D"+docID+"%26version%3D"+version);
  });

  $(".close-doc-preview").on("click", function(){
  	$("#document-previewer").hide();
  	$("#iframe-charger").attr("src","");
  	$("#folder-content").show('slow');
  });
  


});
<?php
		if ($enableDropUpload && $folder->getAccessMode($user) >= M_READWRITE) {
			echo "SeedDMSUpload.setUrl('../op/op.Ajax.php');";
			echo "SeedDMSUpload.setAbortBtnLabel('".getMLText("cancel")."');";
			echo "SeedDMSUpload.setEditBtnLabel('".getMLText("edit_document_props")."');";
			echo "SeedDMSUpload.setMaxFileSize(".SeedDMS_Core_File::parse_filesize(ini_get("upload_max_filesize")).");";
			echo "SeedDMSUpload.setMaxFileSizeMsg('".getMLText("uploading_maxsize")."');";
		}
		$this->printDeleteFolderButtonJs();
		$this->printDeleteDocumentButtonJs();
		$this->printKeywordChooserJs("form2");
		$this->printFolderChooserJs("form3");
		$this->printFolderChooserJs("form4");
	} /* }}} */

	function show() { /* {{{ */
		$dms = $this->params['dms'];
		$db = $dms->getDB();
		$user = $this->params['user'];
		$folder = $this->params['folder'];
		$orderby = $this->params['orderby'];
		$enableFolderTree = $this->params['enableFolderTree'];
		$enableClipboard = $this->params['enableclipboard'];
		$enableDropUpload = $this->params['enableDropUpload'];
		$expandFolderTree = $this->params['expandFolderTree'];
		$showtree = $this->params['showtree'];
		$cachedir = $this->params['cachedir'];
		$workflowmode = $this->params['workflowmode'];
		$enableRecursiveCount = $this->params['enableRecursiveCount'];
		$maxRecursiveCount = $this->params['maxRecursiveCount'];
		$previewwidth = $this->params['previewWidthList'];
		$timeout = $this->params['timeout'];
		$folderid = $folder->getId();
		$baseServer=$this->params['settings']->_httpRoot;
		$this->htmlAddHeader('<link href="../styles/'.$this->theme.'/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet">'."\n", 'css');
		$this->htmlAddHeader('<script type="text/javascript" src="../styles/'.$this->theme.'/plugins/datatables/jquery.dataTables.min.js"></script>'."\n", 'js');
		$this->htmlAddHeader('<script type="text/javascript" src="../styles/'.$this->theme.'/plugins/datatables/dataTables.bootstrap.min.js"></script>'."\n", 'js');
		$this->htmlAddHeader('<script type="text/javascript" src="../styles/'.$this->theme.'/validate/jquery.validate.js"></script>'."\n", 'js');
		
		echo $this->callHook('startPage');
		if($user->isAdmin())
		{
			$this->htmlStartPage("página de inicio del sistema de gestión", "skin-blue sidebar-mini sidebar-collapse");
		}
		else
		{
			$this->htmlStartPage("página de inicio del ente obligado ".$folder->getName(), "skin-blue layout-top-nav");
		}
		
		$this->containerStart();
		$this->mainHeader();
		if($user->isAdmin())
		{
			$this->mainSideBar($folder->getID(),0,0);
		}
		
		$previewer = new SeedDMS_Preview_Previewer($cachedir, $previewwidth, $timeout);
		echo $this->callHook('preContent');
		$this->contentStart();	

		echo $this->getFolderPathHTML($folder);
		echo "<div class=\"row\">";
		if($user->isGuest())
		{
			echo ' <ol class="breadcrumb">
          <li><a href="/index.php"><i class="fa fa-dashboard"></i> Inicio</a></li>
           <li class="active">Directorio de índices de reserva</li>
        </ol>';
		}
		////////////////////// INICIO MINI DASHBOARD ////////////////
		if(!$user->isAdmin() && !$user->isGuest())
		{
			$usuario_particular=$dms->getUser($user->getID());
		$id_numero_declaratoria=6;
		$resultados30=buscarDocumentosCaducados($db,$usuario_particular,30,$dms,$cachedir,$previewwidth,$timeout,$id_numero_declaratoria);
		$conteo30=intval(count($resultados30));
		$array30=array();
		foreach ($resultados30 as $r30) 
		{
			$rubro=$r30['id'];
			$array30[]=$rubro;
		}
		//// 7 meses
		$resultados7=buscarDocumentosCaducados($db,$usuario_particular,213,$dms,$cachedir,$previewwidth,$timeout,$id_numero_declaratoria);
		$conteo7=intval(count($resultados7));
		$array7=array();
		foreach ($resultados7 as $r7) 
		{
			$rubro=$r7['id'];
			$array7[]=$rubro;
		}



		echo ' <div class="col-md-3 col-sm-6 col-xs-12"> </div>';	


		echo ' <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua">
            <span class="info-box-icon"><i class="fa fa-hourglass"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Reservas a vencer en los próximos 7 meses</span>';
              echo "<span class=\"info-box-number\">".$conteo7."</span>";

             echo '<div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">';
                    echo "Nºs de declaratorias:<br>";
                    foreach ($array7 as $k) 
                    {
                    	echo $k."; ";
                    }
                    echo "</span>";
                  echo '</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>';	

        echo '<div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-red">
            <span class="info-box-icon"><i class="fa fa-hourglass-end"></i></span>
            <div class="info-box-content">';
              echo "<span class=\"info-box-text\">Reservas a vencer en los próximos 30 días</span>";
              echo "<span class=\"info-box-number\">".$conteo30."</span>";

              echo '<div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">';
                  echo "Nºs de declaratorias:";
                    foreach ($array30 as $k) 
                    {
                    	echo $k."; ";
                    }
                    echo "</span>";
            echo '</div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>';
		}

		if($user->isGuest())
		{
			echo '<div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-check"></i> Directorio de índices de reserva</h4>
                Indicación: navegue por la lista de entes obligados, del cual podrá ver el índice de reserva actual.
              </div>';
		}	
	
        // FIN MINI DASHBOARD ///////////////7
		//// Add Folder ////
		echo "<div class=\"col-md-12 div-hidden\" id=\"div-add-folder\">";
		echo "<div class=\"box box-success div-green-border\" id=\"box-form1\">";
    echo "<div class=\"box-header with-border\">";
    echo "<h3 class=\"box-title\">".getMLText("add_subfolder")."</h3>";
    echo "<div class=\"box-tools pull-right\">";
    echo "<button type=\"button\" class=\"btn btn-box-tool\" data-widget=\"remove\"><i class=\"fa fa-times\"></i></button>";
    echo "</div>";
    echo "<!-- /.box-tools -->";
    echo "</div>";
    echo "<!-- /.box-header -->";
    echo "<div class=\"box-body\">";

    ?>
    <form class="form-horizontal" action="../op/op.AddSubFolder.php" id="form1" name="form1" method="post">
			<?php echo createHiddenFieldWithKey('addsubfolder'); ?>
			<input type="hidden" name="folderid" value="<?php print $folder->getId();?>">
			<input type="hidden" name="showtree" value="<?php echo showtree();?>">
			<input type="hidden" name="idUser" id="idUser" value="<?php print $user->getID();?>">
			<div class="box-body">

				<div class="form-group">
					<label class="col-sm-2 control-label"><?php printMLText("name");?>:</label>
					<div class="col-sm-10"><input class="form-control" type="text" name="name" size="60" required></div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label"><?php printMLText("comment");?>:</label>
					<div class="col-sm-10"><textarea class="form-control" name="comment" rows="4" cols="80"></textarea></div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label"><?php printMLText("sequence");?>:</label>
					<div class="col-sm-10">
						<?php $this->printSequenceChooser($folder->getSubFolders('s')); if($orderby != 's') echo "<br />".getMLText('order_by_sequence_off');?>
					</div>
				</div>
				<?php
					$attrdefs = $dms->getAllAttributeDefinitions(array(SeedDMS_Core_AttributeDefinition::objtype_folder, SeedDMS_Core_AttributeDefinition::objtype_all));
					if($attrdefs) {
						foreach($attrdefs as $attrdef) {
						?>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo htmlspecialchars($attrdef->getName()); ?>:</label>
							<div class="col-sm-10"><?php $this->printAttributeEditField($attrdef, '') ?></div>
						</div>
						<?php
						}
					}
				?>
				<div class="box-footer">
					<a id="cancel-add-folder" type="button" class="btn btn-default"><?php echo getMLText("cancel"); ?></a type="button">
					<button type="submit" class="btn btn-info pull-right"><i class="fa fa-save"></i> <?php printMLText("save")?></button>
				</div>
		</div>
		</form>

    <?php
    echo "</div>";
    echo "<!-- /.box-body -->";
    echo "</div>";
		echo "</div>";
		//// Add Document //// (Declaratoria de reserva)
		echo "<div class=\"col-md-12 div-hidden\" id=\"div-add-document\">";
		echo "<div class=\"box box-warning div-bkg-color\" id=\"box-form2\">";
    echo "<div class=\"box-header with-border\">";
    echo "<h3 class=\"box-title\">".getMLText("add_document")."</h3>";
    echo "<div class=\"box-tools pull-right\">";
    echo "<button type=\"button\" class=\"btn btn-box-tool\" data-widget=\"remove\"><i class=\"fa fa-times\"></i></button>";
    echo "</div>";
    echo "<!-- /.box-tools -->";
    echo "</div>";
    echo "<!-- /.box-header -->";
    echo "<div class=\"box-body\">";
    ?>

   	<form action="../op/op.AddDocument.php" enctype="multipart/form-data" method="post" id="form2" name="form2">
		<?php echo createHiddenFieldWithKey('adddocument'); ?>
		<input type="hidden" name="folderid" value="<?php print $folderid; ?>">
		<input type="hidden" name="showtree" value="<?php echo showtree();?>">
			<div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
          <li class="active" id="nav-tab-1"><a href="#tab_1" data-toggle="tab" aria-expanded="true">1 - <?php echo getMLText("document_infos"); ?></a></li>
          <li class="" id="nav-tab-2"><a href="#tab_2" data-toggle="tab" aria-expanded="false">2 - <?php echo getMLText("version_info"); ?></a></li>
          <li class="" id="nav-tab-3"><a href="#tab_3" data-toggle="tab" aria-expanded="false">3 - <?php echo getMLText("add_document_notify"); ?></a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab_1">
			    	
			  <!-- 
	          <div class="form-group">
	            <label><?php echo getMLText("motivo_reserva"); ?>: <span class="is-required">*</span></label>
	            <textarea name="comment" class="form-control" rows="3" placeholder="" required></textarea>
	          </div>
			    -->
			  <!-- Write your comments here 
	          <div class="form-group">
	            <label><?php echo getMLText("keywords");?>:</label>
	            <?php $this->printKeywordChooserHtml("form2");?>
	          </div>
			  -->
			  
			  
			  
			  
			  <!-- QUe una declaratoria de reserva automáticamente se le asigne la categoría "Declaratoria de reserva (id 3 en tblcategory)" -->
	          <div class="form-group">
	        
				
	          <input type="hidden" name="categories[]" multiple="multiple" value="3">
							
				</input>
	          </div>
			  
			  
			  
			  
	          <div class="form-group" style="display:none">
	            <label><?php printMLText("sequence");?>:</label>
	            <?php $this->printSequenceChooser($folder->getDocuments('s')); if($orderby != 's') echo "<br />".getMLText('order_by_sequence_off'); ?>
	          </div>

	              <div class="form-group">
	          	<?php if($user->isAdmin()) { ?>
							<label><?php printMLText("owner");?>:</label>
							<select class="chzn-select form-control" name="ownerid">
							<?php
							$allUsers = $dms->getAllUsers();
							foreach ($allUsers as $currUser) {
								if ($currUser->isGuest())
									continue;
								print "<option value=\"".$currUser->getID()."\" ".($currUser->getID()==$user->getID() ? 'selected' : '')." data-subtitle=\"".htmlspecialchars($currUser->getFullName())."\"";
								print ">" . htmlspecialchars($currUser->getLogin()) . "</option>\n";
							}
							?>
							</select>
						<?php } ?>
	          </div>

	            <!--
	          <div class="form-group">
	          	<?php if($user->isAdmin()) { ?>
							<label><?php printMLText("owner");?>:</label>
							<select class="chzn-select form-control" name="ownerid">
							<?php
							$allUsers = $dms->getAllUsers();
							foreach ($allUsers as $currUser) {
								if ($currUser->isGuest())
									continue;
								print "<option value=\"".$currUser->getID()."\" ".($currUser->getID()==$user->getID() ? 'selected' : '')." data-subtitle=\"".htmlspecialchars($currUser->getFullName())."\"";
								print ">" . htmlspecialchars($currUser->getLogin()) . "</option>\n";
							}
							?>
							</select>
						<?php } ?>
	          </div> -->

	          <div class="form-group">
	          	<?php
				
							$attrdefs = $dms->getAllAttributeDefinitions(array(SeedDMS_Core_AttributeDefinition::objtype_document, SeedDMS_Core_AttributeDefinition::objtype_all));
							if($attrdefs) 
							{
								/*								
								1-NUMERO DE DECLARATORI
								2-RUBRO TEMÁTICO--nombre de documento = asociado a una parte del formulario, no lo busco con getAttributeDefinitionByName

								3-Tipo de clasificacion
								4-Detalle de la reserva parcial (si se selecciona "Parcial") -->NUEVO
								5-Motivo de la reserva
								6-Art. 19 LAIP
								7-Unidad administrativa que sugiere la reserva (mayo 2018)
								8-NUEVA: Unidad Generadora de la Información (mayo 2018)
								9-Autoridad que reserva
								10-Fecha de clasificación
								11-Caduca								
								*/
				$atributoNumeroDeclaratoria=$dms->getAttributeDefinitionByName("No. de Declaración de Reserva");
				$atributoTipo=$dms->getAttributeDefinitionByName("Tipo de clasificación");
				$atributoDetalle=$dms->getAttributeDefinitionByName("Detalle de la reserva parcial");
				$atributoMotivo=$dms->getAttributeDefinitionByName("Motivo de la reserva");
				$atributoLaip=$dms->getAttributeDefinitionByName("Fundamento legal (Art. 19 LAIP)");
				$atributoUnidad=$dms->getAttributeDefinitionByName("Unidad Administrativa");
				$atributoUnidadGeneradora=$dms->getAttributeDefinitionByName("Unidad Generadora de la Información");
				$atributoAutoridad=$dms->getAttributeDefinitionByName("Autoridad que reserva");
				$atributoFecha=$dms->getAttributeDefinitionByName("Fecha de clasificación");
				//normativas añadidas
				$constitucional=$dms->getAttributeDefinitionByName("Base constitucional");
				$tratados=$dms->getAttributeDefinitionByName("Tratados internacionales");
				$nacional=$dms->getAttributeDefinitionByName("Normativa nacional");
				$reglamentos=$dms->getAttributeDefinitionByName("Reglamentos o instrumentos administrativos");
				
				//creo un array donde metere los atributos en el orden que yo quiero
				$arrayOrdenado=array();
				$arrayOrdenado[]=$atributoNumeroDeclaratoria;
				$arrayOrdenado[]=$atributoTipo; //numvuel=2
				$arrayOrdenado[]=$atributoDetalle;//numvuel=3
				$arrayOrdenado[]=$atributoMotivo;//numvuel=4
				$arrayOrdenado[]=$atributoLaip;//numvuel=5
				///normativas nuevas mayo 2018
				$arrayOrdenado[]=$constitucional; //numvuel=6
				$arrayOrdenado[]=$tratados; //numvuel=7
				$arrayOrdenado[]=$nacional; //numvuel=8
				$arrayOrdenado[]=$reglamentos; //numvuel=9

				/////
				$arrayOrdenado[]=$atributoUnidad; //numvuel=10
				$arrayOrdenado[]=$atributoUnidadGeneradora; //numvuel=11
				$arrayOrdenado[]=$atributoAutoridad; //numvuel=12
				$arrayOrdenado[]=$atributoFecha; //numvuel=13
				

				


				
								$numvuel=1; //si estoy en la segunda interación, es hora de imprimir el "rubro temático" que no es atributodefinido en esta lista que estoy haciendo
								$idUsuario=$user->getID();
								foreach($arrayOrdenado as $attrdef) 
								{
									switch ($numvuel) 
									{
										case 2:
										//rubro temático Y TIPO DE CLASIFICACIÓN
													 echo "<div class=\"form-group\">";
				           					 echo "<label>".getMLText("rubro_tematico")."<span class=\"is-required\">*</span></label>";

				           					 
		               							imprimirParametros("rubros","rubro",$idUsuario,$db,"","name");

				           					 // echo "<input type=\"text\" class=\"form-control\" name=\"name\" id=\"\" placeholder=\"Indique el nombre del documento o expediente a reservar\" required>";
		               							echo "</div>";
		               							$arr = $this->callHook('editDocumentAttribute', null, $attrdef);
									if(is_array($arr)) 
									{

										
										echo "<label>".$arr[0].":</label>";
										echo $arr[1];
									} 
									else 
									{
										

											if(strcmp($attrdef->getName(), "Detalle de la reserva parcial")!=0)
											{
												echo '<label>';
											echo htmlspecialchars($attrdef->getName()); 
											echo '</label>';
											}
											$this->printAttributeEditField($attrdef, '');
															
							
									}//ein else
											break;



								
											case 10: break;

											case 11:
											//Unidad que sugiere reserva
													 echo "<div class=\"form-group\">";
					           					 echo "<label>".getMLText("unidad_sugiere")."<span class=\"is-required\">*</span></label>";			           					
			               							imprimirParametros("unidades","unidad",$idUsuario,$db,"attributes_5","attributes[5]");

					           					 // echo "<input type=\"text\" class=\"form-control\" name=\"name\" id=\"\" placeholder=\"Indique el nombre del documento o expediente a reservar\" required>";
			               							echo "</div>";
											break;

											case 12:
											//Unidad generadora de la información
													 echo "<div class=\"form-group\">";
					           					 echo "<label>".getMLText("generadora")."<span class=\"is-required\">*</span></label>";			           					
			               							imprimirParametros("unidades","unidad",$idUsuario,$db,"attributes_11","attributes[11]");

					           					 // echo "<input type=\"text\" class=\"form-control\" name=\"name\" id=\"\" placeholder=\"Indique el nombre del documento o expediente a reservar\" required>";
			               							echo "</div>";
											break;

											case 13:
											//Autoridad Y FECHA DE CLASIFICACIÓN
													 echo "<div class=\"form-group\">";
					           					 echo "<label>".getMLText("autoridad")."<span class=\"is-required\">*</span></label>";			           					
			               							imprimirParametros("autoridades","autoridad",$idUsuario,$db,"attributes_9","attributes[9]");

					           					 // echo "<input type=\"text\" class=\"form-control\" name=\"name\" id=\"\" placeholder=\"Indique el nombre del documento o expediente a reservar\" required>";
			               							echo "</div>";


			               							$arr = $this->callHook('editDocumentAttribute', null, $attrdef);
									if(is_array($arr)) 
									{

										
										echo "<label>".$arr[0].":</label>";
										echo $arr[1];
									} 
									else 
									{
										

											if(strcmp($attrdef->getName(), "Detalle de la reserva parcial")!=0)
											{
												echo '<label>';
											echo htmlspecialchars($attrdef->getName()); 
											echo '</label>';
											}
										
											$this->printAttributeEditField($attrdef, '');
															
							
									}//ein else
											break;


										default:
										//echo "VUELTA: ".$numvuel;
				
										$arr = $this->callHook('editDocumentAttribute', null, $attrdef);

									if(is_array($arr)) 
									{

										
										echo "<label>".$arr[0].":</label>";
										echo $arr[1];
									} 
									else 
									{
										
										

											if(strcmp($attrdef->getName(), "Detalle de la reserva parcial")!=0 && strcmp($attrdef->getName(), "Base constitucional")!=0 && strcmp($attrdef->getName(), "Tratados internacionales")!=0 && strcmp($attrdef->getName(), "Normativa nacional")!=0 && strcmp($attrdef->getName(), "Reglamentos o instrumentos administrativos")!=0)
											{
												echo '<label>';
											echo htmlspecialchars($attrdef->getName()); 
											echo '</label>';
											}
											$this->printAttributeEditField($attrdef, '');
																	if($numvuel==5) //caso donde imprime art. 19 pone otras legislaciones
										{
											echo "Otros instrumentos normativos (opcional). Puede seleccionar varios de la lista y a continuación indicar el nombre de la normativa:";
											echo ' <div class="form-group">
                  <div class="checkbox">
                    <label>
                      <input id="baseConstitucional" type="checkbox">
                      Base constitucional
                    </label>
                  </div>

                  <div class="checkbox">
                    <label>
                      <input id="tratadosInternacionales" type="checkbox">
                      Tratados internacionales
                    </label>
                  </div>

                  <div class="checkbox">
                    <label>
                      <input id="normativaNacional" type="checkbox">
                      Normativa nacional
                    </label>
                  </div>

                  <div class="checkbox">
                    <label>
                      <input id="reglamentosAdministrativos" type="checkbox">
                      Reglamentos o instrumentos administrativos
                    </label>
                  </div>

                </div>';
										}//fin de si es vuelta 5
															
							
									}//ein else
											break;
									} //fin del switch
																				    								     
								     $numvuel++;
								}//fin foreach
							}//fin if attreds, donde se imprimen todos los ATRIBUTOS							
							?>
						</div>
						<div class="form-group">
							<label><?php printMLText("expires");?>: <span class="is-required">*</span></label>
			        <div class="input-append date span12" id="expirationdate" data-date="" data-date-format="yyyy-mm-dd" data-date-language="<?php echo str_replace('_', '-', $this->params['session']->getLanguage()); ?>" data-checkbox="#expires">
			          <input class="form-control" size="16" name="expdate" type="text" value="">
			          <span class="add-on"></span>
			        </div>
			        
									<input type="hidden" id="expires" name="expires" value="true" checked="false">
				     
			    	</div>
			    	<div class="box-footer">
							<a type="button" class="btn btn-default cancel-add-document"><?php echo getMLText("cancel"); ?></a>
							<a id="btn-next-1" href="#tab_2" data-toggle="tab" type="button" class="btn btn-info pull-right"><?php echo getMLText("next"); ?> <i class="fa fa-arrow-right"></i></a>
						</div>
          </div>
          <!-- /.tab-pane -->
          <div class="tab-pane" id="tab_2">
		  
		  <!--
          	<div class="form-group">
	            <label><?php printMLText("version");?>:</label>
	            <input type="text" class="form-control" name="reqversion" value="1">
	          </div>
			  -->
			  
	          <?php $msg = getMLText("max_upload_size").": ".ini_get( "upload_max_filesize"); ?>
   					<?php $this->warningMsg($msg); ?>
	          <div class="form-group">
	            <label><?php printMLText("local_file");?>: <span class="is-required">*</span></label>
	            <?php
								$this->printFileChooser('userfile[]', false);
							?>
	          </div>
			  <!-- 
	          <div class="form-group">
	          	<label><?php printMLText("comment_for_current_version");?>:</label>
	          	<textarea class="form-control" name="version_comment" rows="3" cols="80"></textarea>
	          	<div class="checkbox">
	          		<label><input type="checkbox" name="use_comment" value="1" /> <?php printMLText("use_comment_of_document"); ?></label>
	          	</div>
	          </div>
			  -->
									
						<div class="box-footer">
							<a type="button" class="btn btn-default cancel-add-document"><?php echo getMLText("cancel"); ?></a>
							<a id="btn-next-2" href="#tab_3" data-toggle="tab" aria-expanded="true" type="button" class="btn btn-info pull-right"><?php echo getMLText("next"); ?> <i class="fa fa-arrow-right"></i></a>
						</div>
          </div>
              <!-- SIEMPRE ASIGNAR NOTIFICACIÓN AL ADMINISTRADOR-->
          <div class="tab-pane" id="tab_3">
          
            	<!-- QUe un acta de inexistencia se se le notifique siempre al admin (id 1 de usuario)" -->
            	<input type="hidden" name="notification_users[]" multiple="multiple" value="1"> 
				</input>
            
             <div class="alert alert-info alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info"></i> Está a punto de subir una declaratoria de reserva</h4>
                Al presionar el botón de guardado, se subirá al sistema el archivo conteniendo la justificación de la reserva junto a los parámetros de la misma. A partir de este momento, estará indexada en el sistema para que se aprobada por el IAIP (revisión de forma). Una vez aprobada, figurará en el índice de su ente obligado, y en las estadísticas que se generen a partir del mismo.
              </div>
			
						<div class="box-footer">
							<a type="button" class="btn btn-default cancel-add-document"><?php echo getMLText("cancel"); ?></a>
							<button type="submit" class="btn btn-info pull-right"><i class="fa fa-save"></i> <?php echo getMLText("save"); ?></button>
						</div>	
          </div>
          <!-- /.tab-pane -->
        </div>
        <!-- /.tab-content -->
      </div>
   	</form>
    <?php
    echo "</div>";
    echo "<!-- /.box-body -->";
    echo "</div>";
		echo "</div>";
		?>
		<!-- INICIO DE LA PARTE OCULTA "AÑADIR MULTIPLES RESERVAS" -->
<?php
		echo "<div class=\"col-md-12 div-hidden\" id=\"div-add-multiple-reservas\">";
		echo "<div class=\"box box-warning div-bkg-color\" id=\"box-multiplesReservas\">";
    echo "<div class=\"box-header with-border\">";
    echo "<h3 class=\"box-title\">"."Subir múltiples declaratorias de reserva de documentos"."</h3>";
    echo "<div class=\"box-tools pull-right\">";
    echo "<button type=\"button\" class=\"btn btn-box-tool\" data-widget=\"remove\"><i class=\"fa fa-times\"></i></button>";
    echo "</div>";
    echo "<!-- /.box-tools -->";
    echo "</div>";
    echo "<!-- /.box-header -->";
    echo "<div class=\"box-body\">";
    ?>

   	<form action="../out/out.ProcesarMulti.php" enctype="multipart/form-data" method="post" id="multiplesReservas" name="multiplesReservas">
		<?php echo createHiddenFieldWithKey('adddocument'); ?>
		<input type="hidden" name="folderid" value="<?php print $folderid; ?>">
		<input type="hidden" name="showtree" value="<?php echo showtree();?>">
			<div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
          <li class="active" id="nav-tabm-1"><a href="#tabm_1" data-toggle="tab" aria-expanded="true">Subida de múltiples reservas: <?php echo getMLText("document_infos"); ?></a></li>
         
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tabm_1">

          		<p> 
			  <input type="button" class="btn btn-primary btn-sm" id="anadeTabla" value="Añadir una nueva reserva">
			   <input type="button" class="btn btn-danger btn-sm" id="eliminaTabla" value="Eliminar la última reserva añadida">
			  <p>(Se eliminará la última entrada de la tabla)</p>
				</p>


				<!-- INICIO TABLA -->
				  <table id="tablaExperiencias" class="table table-condensed table-responsive">
                <tr>                 
                  <th>Nº declaración de reserva</th>
                  <th>Rubro temático</th>
                  <th>Tipo de clasificación</th>
                  <th>Detalle de la reserva parcial</th>
                  <th>Motivo de la reserva</th>
                  <th>Fundamento legal (Art. 19 LAIP)</th>
                  <th>Unidad administrativa que sugiere</th>
                   <th>Unidad administrativa que genera</th>
                  <th>Autoridad que reserva</th>
                  <th>Fecha de clasificación</th>
                  <th>Fecha en que caduca (según plazo de reserva)</th>
                  <th>JUSTIFICANTE adjunto</th>
                </tr>
                <tr>
                	<!-- 1 Nº declaracion -->
                  <td>
                  	<input type="text" class="form-control" name="arrayNumeros[]" id="arrayNumeros1" placeholder="Indique el identificador de la reserva..." required>               	
                  </td>
                  	<!--2 Rubro temático -->
                  <td>
                    
                    <select class="form-control select"  name="arrayRubros[]" id="arrayRubros1" required>
                     		<?php 						
						  		imprimirParametrosShort("rubros","rubro",$idUsuario,$db);
						     ?>
					</select>

                  </td>
                  	<!-- 3 Tipo de clasificación -->
                  <td>                     	
                  	    	<select class="form-control select"  name="arrayTipos[]" id="arrayTipos_1" required>
                     		<?php 						
						  		imprimirTipos();
						     ?>
						  </select>
                     
                  </td>
                  <!-- 4 Detalle de la reserva parcial -->
                  <td>
                  	<textarea  class="form-control" name="arrayParciales[]" id="arrayParciales_1" placeholder="Indique el detalle si su elección fue Parcial..." ></textarea>
                   </td>

                     <!-- 5 Motivo de la reserva -->
                  <td>
                  	<textarea  class="form-control" name="arrayMotivos[]" id="arrayMotivos1" placeholder="Escriba el motivo de la reserva..." required></textarea>
                   </td>

                     <!-- 6 Fundamento legal art. 19 -->
                  <td>
                  		<select class="form-control chzn-select"  name="arrayFundamentos[0][]" id="arrayFundamentos1" multiple="multiple" data-placeholder="Seleccione uno o varios literales de la lista..." required>

						<?php 						
						  		$atributoLaip=$dms->getAttributeDefinitionByName("Fundamento legal (Art. 19 LAIP)");
						  		$opciones = $atributoLaip->getValueSetAsArray();

						  		foreach ($opciones as $value) 
						  		{
						  			if($value) 
									{
										echo "<option value=\"".htmlspecialchars($value)."\"";
										
										echo ">".htmlspecialchars($value)."</option>";
									}
						  		}
						   ?>
						  </select>
                   </td>
                    <!-- 7 Unidad administrativa que sugiere -->
                  <td>
 

                  	 <select class="form-control select"  name="arrayUnidades[]" id="arrayUnidades1" required>
                     		<?php 						
						  		imprimirParametrosShort("unidades","unidad",$idUsuario,$db);
						     ?>
					</select>

                  </td>

                   <!-- 8 Unidad administrativa que genera la info -->
                  <td>

                  		 <select class="form-control select"  name="arrayUnidadesGene[]" id="arrayUnidadesGene1" required>
                     		<?php 						
						  		imprimirParametrosShort("unidades","unidad",$idUsuario,$db);
						     ?>
						</select>
                  </td>

                    <!-- 9 Autoridad que reserva-->
                  <td>


                  	<select class="form-control select"  name="arrayAutoridades[]" id="arrayAutoridades1" required>
                     		<?php 						
						  		imprimirParametrosShort("autoridades","autoridad",$idUsuario,$db);
						     ?>
					</select>

                  </td>

                   <!-- 10 Fecha de clasificación-->
                  <td>
                  	 <span class="input-append date datepicker" data-date="<?php echo date('Y-m-d'); ?>" data-date-format="yyyy-mm-dd" data-date-language="<?php echo str_replace('_', '-', $this->params['session']->getLanguage()); ?>">
						<input class="form-control" name="arrayFechas[]" id="arrayFechas1" type="text" value="" required>
         			 	<span class="add-on"><i class="icon-calendar"></i></span>
					</span>
                  </td>

                    <!-- 11 Fecha en que caduca-->
                  <td>
                  	 <span class="input-append date datepicker" data-date="<?php echo date('Y-m-d'); ?>" data-date-format="yyyy-mm-dd" data-date-language="<?php echo str_replace('_', '-', $this->params['session']->getLanguage()); ?>">
						<input type="text" class="form-control" name="arrayCaduca[]" id="arrayCaduca1" type="text" value="" required>
         			 	<span class="add-on"><i class="icon-calendar"></i></span>
					</span>
                  </td>

                    <!-- 12 JUSTIFICANTE ADJUNTO-->
                  <td>
                  	<input type="file" name="archivo[]" id="archivo1" required>
                  </td>

                </tr> <!-- FIN emtradas tabla -->
             
                
              </table>  <!-- FIN TABLA -->

			  

			    	<div class="box-footer">
							<a type="button" class="btn btn-default cancel-add-document"><?php echo getMLText("cancel"); ?></a>
							<button type="reset" id="resetMultiple" class="btn btn-success pull-center"><i class="icon-search"></i> <?php echo "Limpiar estos campos del formulario" ?>
			            	</button>

							<button id="terminarMulti"  type="sumbit" class="btn btn-info pull-right"><?php echo getMLText("next"); ?> <i class="fa fa-arrow-right"></i></button>
					</div><!-- FIN DE BOX FOOTER PESTAÑA MULTIPLES -->
          </div>
          <!-- /.tab-pane -->
      
          <!-- /.tab-pane -->
        </div>
        <!-- /.tab-content -->
      </div>
   	</form>
    <?php
    echo "</div>";
    echo "<!-- /.box-body -->";
    echo "</div>";
		echo "</div>";////////////////////////// FIN DE AÑADIR MULTIPLES RESERVAS
?>
		<?php				
		/**
				--------------------------
				Ojo muy importante: los "botones de los iconos con las cruces los modifico en /views/multisis-lte/class.Bootstrap.php con las lineas (ejemplo)
				$txtpath .= "<li class=\"pull-right breadcrumb-btn\"><a id=\"add-acta-inexistencia\" type=\"button\" class=\"btn btn-warning btn-sm\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"".getMLText("add_acta_inexistencia")."\"><i class=\"fa fa-plus\"></i> <i class=\"fa fa-file\"></i></a> </li>";
				
		**/		
		//////////////////añadir ACTA DE INEXISTENCIA///////////////////////////////////////////////////////////////////////////////////
		echo "<div class=\"col-md-12 div-hidden\" id=\"div-add-pene\">";
		echo "<div class=\"box box-warning div-bkg-color\" id=\"box-form2\">"; 
		// div-bkg-color es el que le da color al BORDE DE LA  "caja" donde está todoo el formulario de subir actas, el fichero /styles/multisis-lte/custon.css
    echo "<div class=\"box-header with-border\">";
    echo "<h3 class=\"box-title\">".getMLText("subir_acta_inexistencia")."</h3>";
    echo "<div class=\"box-tools pull-right\">";
    //ese fa fa times es la cruz (x) de cerrar el formulario cuando se despliega
    echo "<button type=\"button\" class=\"btn btn-box-tool\" data-widget=\"remove\"><i class=\"fa fa-times\"></i></button>"; 
    echo "</div>";
    echo "<!-- /.box-tools -->";
    echo "</div>";
    echo "<!-- /.box-header -->";
    echo "<div class=\"box-body\">";
    ?>

   	<form action="../op/op.AddDocument.php" enctype="multipart/form-data" method="post" id="form2" name="form2">
		<?php echo createHiddenFieldWithKey('adddocument'); ?>
		<input type="hidden" name="folderid" value="<?php print $folderid; ?>">
		<input type="hidden" name="showtree" value="<?php echo showtree();?>">
			<div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
          <li class="active" id="nav-tab-1_acta"><a href="#tab_1_acta" data-toggle="tab" aria-expanded="true">1 - <?php echo getMLText("document_infos"); ?></a></li>
          <li class="" id="nav-tab-2_acta"><a href="#tab_2_acta" data-toggle="tab" aria-expanded="false">2 - <?php echo getMLText("version_info"); ?></a></li>
          <li class="" id="nav-tab-3_acta"><a href="#tab_3_acta" data-toggle="tab" aria-expanded="false">3 - <?php echo getMLText("add_document_notify"); ?></a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab_1_acta">
			    	<div class="form-group">
	            <label><?php echo getMLText("name"); ?>: <span class="is-required">*</span></label>
	            <input type="text" class="form-control" name="name" id="" placeholder="" required>
	          </div>
	          	  <!--
	          <div class="form-group">
	            <label><?php echo getMLText("motivo_reserva"); ?>: <span class="is-required">*</span></label>
	            <textarea name="comment" class="form-control" rows="3" placeholder="" required></textarea>
	          </div>
			    -->
			  <!-- Write your comments here 
	          <div class="form-group">
	            <label><?php echo getMLText("keywords");?>:</label>
	            <?php $this->printKeywordChooserHtml("form2");?>
	          </div>
			  -->
	       <!-- QUe un acta de inexistencia se se le asigne la categoría "Acta de inexistencia (id 2 en tblcategory)" -->
	          <div class="form-group">
	        
				
	          <input type="hidden" name="categories[]" multiple="multiple" value="2">
							
				</input>
	          </div>
    <div class="form-group">
	          	<?php
				
							$attrdefs = $dms->getAllAttributeDefinitions(array(SeedDMS_Core_AttributeDefinition::objtype_document, SeedDMS_Core_AttributeDefinition::objtype_all));
							if($attrdefs) 
							{
								foreach($attrdefs as $attrdef) 
								{
								     if(strcmp($attrdef->getName(), "Fecha de emisión del acta de inexistencia")==0 )
								     {
								     		$arr = $this->callHook('editDocumentAttribute', null, $attrdef);
									if(is_array($arr)) {
										echo "<label>".$arr[0].":</label>";
										echo $arr[1];
									} else 
									{
							?>
							<label><?php echo htmlspecialchars($attrdef->getName()); ?></label>
							<?php $this->printAttributeEditField($attrdef, ''); ?>
							<?php
									}//ein else
								     }
								}//fin foreach
							}
							
							
							?>
						</div>

	          <div class="form-group" style="visibility: hidden">
	            <label><?php printMLText("sequence");?>:</label>
	            <?php $this->printSequenceChooser($folder->getDocuments('s')); if($orderby != 's') echo "<br />".getMLText('order_by_sequence_off'); ?>
	          </div>
	          <div class="form-group">
	          	<?php if($user->isAdmin()) { ?>
							<label><?php printMLText("owner");?>:</label>
							<select class="chzn-select form-control" name="ownerid">
							<?php
							$allUsers = $dms->getAllUsers();
							foreach ($allUsers as $currUser) {
								if ($currUser->isGuest())
									continue;
								print "<option value=\"".$currUser->getID()."\" ".($currUser->getID()==$user->getID() ? 'selected' : '')." data-subtitle=\"".htmlspecialchars($currUser->getFullName())."\"";
								print ">" . htmlspecialchars($currUser->getLogin()) . "</option>\n";
							}
							?>
							</select>
						<?php } ?>
	          </div>

	          
	      

	          		<div class="form-group">
							
			     
			        <div class="checkbox">
			        	
									<input type="checkbox" id="expires" name="expires" value="false" checked="true" style="opacity:0; position:absolute; left:9999px;">
				        
	        		</div>
			    	</div>

	   			
						
			    	<div class="box-footer">
							<a type="button" class="btn btn-default cancel-add-document"><?php echo getMLText("cancel"); ?></a>
							<a id="btn-next-1_acta" href="#tab_2_acta" data-toggle="tab" type="button" class="btn btn-info pull-right"><?php echo getMLText("next"); ?> <i class="fa fa-arrow-right"></i></a>
						</div>
          </div>

          <!-- /.tab-pane -->
          <div class="tab-pane" id="tab_2_acta">

          	<!--	
          	<div class="form-group">
	            <label><?php printMLText("version");?>:</label>
	            <input type="text" class="form-control" name="reqversion" value="1">
	          </div>
			-->
	          <?php $msg = getMLText("max_upload_size").": ".ini_get( "upload_max_filesize"); ?>
   					<?php $this->warningMsg($msg); ?>
	          <div class="form-group">
	            <label><?php printMLText("local_file");?>: <span class="is-required">*</span></label>
	            <?php
								$this->printFileChooser('userfile[]', false);
							?>
	          </div>

	          <!--
	          <div class="form-group">
	          	<label><?php printMLText("comment_for_current_version");?>:</label>
	          	<textarea class="form-control" name="version_comment" rows="3" cols="80"></textarea>
	          	<div class="checkbox">
	          		<label><input type="checkbox" name="use_comment" value="1" /> <?php printMLText("use_comment_of_document"); ?></label>
	          	</div>
	          </div>
	          	-->

						
						<div class="box-footer">
							<a type="button" class="btn btn-default cancel-add-document"><?php echo getMLText("cancel"); ?></a>
							<a id="btn-next-2_acta" href="#tab_3_acta" data-toggle="tab" aria-expanded="true" type="button" class="btn btn-info pull-right"><?php echo getMLText("next"); ?> <i class="fa fa-arrow-right"></i></a>
						</div>
          </div>
              <!-- /.tab-pane  NOTIFICACIONES -->
          <div class="tab-pane" id="tab_3_acta">
            
            	<!-- QUe un acta de inexistencia se se le notifique siempre al admin (id 1 de usuario)" -->
            	<input type="hidden" name="notification_users[]" multiple="multiple" value="1"> 
				</input>
           

            <div class="alert alert-info alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4><i class="icon fa fa-info"></i> Está a punto de subir un acta de inexistencia</h4>
                Al presionar el botón de guardado, se subirá al sistema el archivo conteniendo la justificación de la inexistencia junto a los parámetros de la misma. A partir de este momento, estará indexada en el sistema para que se aprobada por el IAIP (revisión de forma). Una vez aprobada, figurará en el índice de su ente obligado, y en las estadísticas que se generen a partir del mismo.
              </div>

						<div class="box-footer">
							<a type="button" class="btn btn-default cancel-add-document"><?php echo getMLText("cancel"); ?></a>
							<button type="submit" class="btn btn-info pull-right"><i class="fa fa-save"></i> <?php echo getMLText("save"); ?></button>
						</div>	
          </div>
          <!-- /.tab-pane -->
        </div>
        <!-- /.tab-content -->
      </div>
   	</form>
    <?php
    echo "</div>";
    echo "<!-- /.box-body -->";
    echo "</div>";
		echo "</div>";
		
		
		
	
		
		
		///// FIN DE AÑADIR ACTA DE INEXISTENCIA
		//// Folder content ////
		$subFolders = $folder->getSubFolders($orderby);
		$subFolders = SeedDMS_Core_DMS::filterAccess($subFolders, $user, M_READ);
		$documents = $folder->getDocuments($orderby);
		$documents = SeedDMS_Core_DMS::filterAccess($documents, $user, M_READ);
		
		if ((count($subFolders) > 0)||(count($documents) > 0))
		{
			echo "<div class=\"col-md-12\" id=\"folder-content\">";
			echo "<div class=\"box box-primary\">";
	    echo "<div class=\"box-body no-padding\">";
			echo "<div class=\"table-responsive\">";
			$txt = $this->callHook('folderListHeader', $folder, $orderby);
			if(is_string($txt))
				echo $txt;
			else {
				//echo "ANTES DE TABLA";

				if(count($documents) > 0)
				{
					$iduser=getUserFromFolder($folder->getID());
				echo "<a href=\"".$baseServer."out/out.GenerarDatoAbierto.php?idUser=$iduser\"<i class=\"fa fa-save\"></i>Descargar este índice de información reservada en formato CSV</a>";
				}
				print "<table id=\"viewfolder-table\" class=\"table table-hover table-striped table-condensed\">";
				print "<thead>\n<tr>\n";
				print "<th></th>\n";	
				print "<th>".getMLText("name")."</th>\n";	
				print "<th>".getMLText("status")."</th>\n";
				print "<th>".getMLText("action")."</th>\n";
				print "</tr>\n</thead>\n<tbody>\n";
			}
		  
		foreach($subFolders as $subFolder) 
		{
			$txt = $this->callHook('folderListItem', $subFolder);
			if(is_string($txt))
				echo $txt;
			else 
			{
				echo $this->folderListRow($subFolder);
			$formFol = "formFol".$subFolder->getID();
			?>
	
				<?php
			}
		}

		foreach($documents as $document) 
		{
			$document->verifyLastestContentExpriry();
			$txt = $this->callHook('documentListItem', $document, $previewer);
			if(is_string($txt))
				echo $txt;
			else 
			{
				  $content=$document->getLatestContent();
						//echo "content: ".$content;
						$status=$content->getStatus();
						//print_r($status);
						$estado=$status['status'];
						if($estado!=S_OBSOLETE && !$document->hasExpired())
						{
							echo $this->documentListRow($document, $previewer);
						}
				
			$formDoc = "formDoc".$document->getID();
				?>

				<?php
			}
		}
		if ((count($subFolders) > 0)||(count($documents) > 0)) {
			$txt = $this->callHook('folderListFooter', $folder);
			if(is_string($txt))
				echo $txt;
			else

				echo "</tbody>\n";
			 echo "<tfoot>";
               echo '<tr>';
                	print "<th></th>\n";	
				print "<th>".getMLText("name")."</th>\n";	
				print "<th>".getMLText("status")."</th>\n";
				print "<th>".getMLText("action")."</th>\n";
                 echo '</tr>';
                 echo '</tfoot>';
			echo "</table>\n";
		}
		echo "</div>";
		echo "</div>";
		echo "</div>";
		echo "</div>"; 
		} else 
		{
			echo "<div class=\"col-md-12\">";
			$this->infoMsg(getMLText("empty_folder_list"));
			echo "</div>";
		}
		//// Document preview ////
		echo "<div class=\"col-md-12 div-hidden\" id=\"document-previewer\">";
		echo "<div class=\"box box-info\">";
		echo "<div class=\"box-header with-border box-header-doc-preview\">";
    echo "<span id=\"doc-title\" class=\"box-title\"></span>";
    echo "<span class=\"pull-right\">";
    //echo "<a class=\"btn btn-sm btn-primary\"><i class=\"fa fa-chevron-left\"></i></a>";
    //echo "<a class=\"btn btn-sm btn-primary\"><i class=\"fa fa-chevron-right\"></i></a>";
    echo "<a class=\"close-doc-preview btn btn-box-tool\"><i class=\"fa fa-times\"></i></a>";
    echo "</span>";
    echo "</div>";
    echo "<div class=\"box-body\">";
    echo "<iframe id=\"iframe-charger\" src=\"\" width=\"100%\" height=\"700px\"></iframe>";
    echo "</div>";
		echo "</div>";
		echo "</div>"; // End document preview
		?>
<?php
		echo "</div>\n"; // End of row
		echo "</div>\n"; // End of container

		echo $this->callHook('postContent');

		$this->contentEnd();
		$this->mainFooter();		
		$this->containerEnd();
		echo "<script type='text/javascript' src='../formularioSubida.js'></script>";
		echo "<script type='text/javascript' src='../tablasDinamicas.js'></script>";
		echo '<script src="../styles/multisis-lte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>';
        echo '<script src="../styles/multisis-lte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>';
		$this->htmlEndPage();
	} /* }}} */
}

?>