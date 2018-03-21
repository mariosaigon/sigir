<?php
/**
 * Implementation of MyDocuments view
 *
 * @category   DMS
 * @package    SeedDMS
 * @license    GPL 2
 * @version    @version@
 * @author     Uwe Steinmann <uwe@steinmann.cx> DMS with modifications of José Mario López Leiva
 * @copyright  Copyright (C) 2017 José Mario López Leiva
 *             marioleiva2011@gmail.com    
 				San Salvador, El Salvador, Central America

 *             
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
 * Class which outputs the html page for MyDocuments view
 *
 * @category   DMS
 * @package    SeedDMS
 * @author     Markus Westphal, Malcolm Cowe, Uwe Steinmann <uwe@steinmann.cx>
 * @copyright  Copyright (C) 2002-2005 Markus Westphal,
 *             2006-2008 Malcolm Cowe, 2010 Matteo Lucarelli,
 *             2010-2012 Uwe Steinmann
 * @version    Release: @package_version@
 */
 /**
 Función que muestra los documentos próximos a caducar de todos los usuarios
 mostrarTodosDocumentos(lista_usuarios,dias)
 -dias: documentos que van a caducar dentro de cúantos días
 */
function getDefaultUserFolder($id_usuario) //dado un id de usuario, me devuelve el id del folder de inicio de ese usuario
{
	//echo "Función getDefaultUserFolder. Se ha pasado con argumento: ".$id_usuario;
	$id_folder=0;
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
	$miQuery="SELECT homefolder FROM tblUsers WHERE id=".$id_usuario;
	//echo "mi query: ".$miQuery;
	$resultado=$manejador->getResultArray($miQuery);
	$id_folder=$resultado[0]['homefolder'];
	//echo "id_folder: ".$id_folder;
	return $id_folder;
}
function obtenerFechaRevocacion($documento) //ddodo un id de documento que ha sido revocada la reserva,
//me da la fecha de la resolución del IAIP
{
	//echo "Función getDefaultUserFolder. Se ha pasado con argumento: ".$id_usuario;
	$fecha=0;
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
		UI::exitError(getMLText("document_title", array("documentname" => getMLText("invalid_doc_id"))),getMLText("class.IndiceDesclasificados: No se pudo conectar a la BD"));
	}	
	//query de consulta:
	//$miQuery="SELECT fechaResolucion FROM seeddms.revocacionreservas WHERE idDocumento=".$documento;
	$miQuery="SELECT fechaResolucion FROM revocacionReservas WHERE idDocumento=".$documento;
	//echo "mi query: ".$miQuery;
	$resultado=$manejador->getResultArray($miQuery);
	//echo "fecha= ".$fecha;
    if(!$resultado)
	{
		UI::exitError(getMLText("document_title", array("documentname" => getMLText("invalid_doc_id"))),getMLText("Indice desclasificados: Parece ser que hubo un error obteniendo la fecha de revocación de la reserva del documento."));
	}
	$fecha=$resultado[0]['fechaResolucion'];
	//echo "id_folder: ".$id_folder;
	return $fecha;
}

class SeedDMS_View_IndiceDesclasificados extends SeedDMS_Bootstrap_Style 
{
 /**
 Método que muestra los documentos próximos a caducar sólo de 
 **/
	

	function show() 
	{ /* {{{ */
		$dms = $this->params['dms'];
		$user = $this->params['user'];
		$orderby = $this->params['orderby'];
		$showInProcess = $this->params['showinprocess'];
		$cachedir = $this->params['cachedir'];
		$workflowmode = $this->params['workflowmode'];
		$previewwidth = $this->params['previewWidthList'];
		$timeout = $this->params['timeout'];
		$id_numero_declaratoria = $this->params['id_numero_declaratoria'];
		$id_fecha_clasificacion = $this->params['id_fecha_clasificacion'];
		$caduca_en=$this->params['caduca_en'];
		$formato=$this->params['formato'];
		$valor_exacto=$this->params['exacto'];
		$fueChequeado=$this->params['fue_chequeado'];
		//echo "caduca en: ".$caduca_en;
		$db = $dms->getDB();
		$previewer = new SeedDMS_Preview_Previewer($cachedir, $previewwidth, $timeout);


		if($user->isAdmin())
		{
			$this->htmlStartPage("píndice de desclasificación de todos los entes obligados", "skin-blue sidebar-mini sidebar-collapse");
		}
		else
		{
			$this->htmlStartPage("índice de desclasificación del ente obligado ", "skin-blue layout-top-nav");
		}
		$this->containerStart();
		$this->mainHeader();
		if($user->isAdmin())
		{
			$this->mainSideBar();
		}
		$this->contentStart();
          
		?>
    <div class="gap-10"></div>
    <div class="row">
    <div class="col-md-12">

    <?php
    $this->startBoxPrimary("Índice de desclasificación  entes obligados. Haga click en las cabeceras de la tabla que se muestra a continuación para ordenar ascendente o descendentemente la tabla");
    $listaDocumentosUsuario=$user->getDocuments();
	//obtengo lista de todos los usuarios
	$miPropioID=$user->getID();
	//echo "miPropioID: ".$miPropioID;
    /////////////////
    //comprobación 1: generar la lista de desclasificación, pero solo para el ente si lo ve un oficial
	if(!$user->isAdmin() && !$user->isGuest())
	{ 
    				$this->contentContainerStart(); //añade internamente un <div class="well">
    				echo "<div class=\"box-body table-responsive no-padding\">";
         			  echo "<table id =\"tablaDesclasificados\" class=\"table table-hover table-striped\">";
         			  print "<thead>\n<tr>\n";
                  echo "<th>Nombre del documento</th>";
                  echo "<th>Fecha de desclasificación</th>";
                  echo "<th>Causa desclasificación</th>";
                  print "</tr>\n</thead>\n<tbody>\n";
				foreach ($listaDocumentosUsuario as $documento) //recorro los documentos del usuario, y tomo aquellos documentos que ya expiraron
					{
						$nombre_documento=$documento->getName();
						if($documento->hasExpired())
						{      
							$id_documento=$documento->getID();
							
							$fechaVencimientoReserva=$documento->getExpires();
							$fechaVencimientoReserva=date('d/m/Y', $fechaVencimientoReserva);
				                echo "<tr>";
				             print "<td> <a href=\"out.ViewDocument.php?documentid=".$id_documento."&currenttab=revapp\">". $nombre_documento ."</a></td>\n"; 
				           
				                  echo "<td>".$fechaVencimientoReserva."</td>";
				                  echo "<td>Vencimiento del plazo de reserva (Art. 20 LAIP)</td>";
				                 
				               echo "</tr>";
            
						}//fin if

						 $content=$documento->getLatestContent();
						//echo "content: ".$content;
						$status=$content->getStatus();
						//print_r($status);
						$estado=$status['status'];
						if($estado==S_OBSOLETE) //revocado por IAIP, O EN lenguaje seeddms, OBSOLETO
						//recordemos que el estado obsoleto le he cambiado la denominación como
						//revocado por IAIP
						{
							$fechaDes=obtenerFechaRevocacion($documento->getID()); //fecha del estado más reciente
							$componentes=explode("-", $fechaDes);
							$año=$componentes[0];
								$mes=$componentes[1];
									$dia=$componentes[2];
							$fechaDesclasificacion=$dia."/".$mes."/".$año;
							echo "<tr>"; //inicia la entrada
				             print "<td> <a href=\"out.ViewDocument.php?documentid=".$id_documento."&currenttab=revapp\">". $nombre_documento ."</a></td>\n"; 
				           
				                  echo "<td>".$fechaDesclasificacion."</td>";
				                  echo "<td><a href=\"/LAIP.pdf\"> Revocación de la reserva por parte del IAIP (extinción de sus causas: Art. 20 LAIP)</a></td>";
				                 
				               echo "</tr>"; //termina la entrada
						}
						
					}//fin foreach

					 echo "</table>";
            echo "</div>";
					
    				$this->contentContainerEnd();

	} //fin comprobación 1
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*COMPROBACION 2:  generar el índice de desclasificados de TODOS LOS ENTES*/

	if($user->isAdmin())
	{
		//recorro todos los usuarios (bucle 1), para cada usuario saco sus documentos (bucle 2), cada documento, veo si está caducado o revocado, y lo pongo, para cada ente.
		$this->contentContainerStart(); //añade internamente un <div class="well">
		$listaOficiales = $dms->getAllUsers();
		foreach ($listaOficiales as $oficial ) //bucle 1
		{
			if(!$oficial->isGuest() && !$oficial->isAdmin()) // no tomo como oficial administradores e invitados
			{
				$idF=getDefaultUserFolder($oficial->getID());
				$fold=$dms->getFolder($idF);
				$nombreEnte=$fold->getName();
						echo "<div class=\"box\">";
            echo "<div class=\"box-header with-border\">";
              echo "<h3 class=\"box-title\">".$nombreEnte."</h3>";
            echo "</div>";
            echo "<div class=\"box-body\">";
             echo "<table class=\"table table-bordered\">";
                echo "<tr>";
                 
                  echo "<th>Nombre del documento</th>";
                  echo "<th>Fecha de desclasificación</th>";
                  echo "<th>Causa desclasificación</th>";
                echo "</tr>";
				$documentosOficial=$oficial->getDocuments();
				$numeroDocumentosEnIndice=0;
				foreach ($documentosOficial as $documento) 
				{
					$id_documento=$documento->getID();
							$nombre_documento=$documento->getName();
					if($documento->hasExpired())
						{    
					     
							
							$fechaVencimientoReserva=$documento->getExpires();
							$fechaVencimientoReserva=date('d/m/Y', $fechaVencimientoReserva);
				                echo "<tr>"; //inicia la entrada
				             print "<td> <a href=\"out.ViewDocument.php?documentid=".$id_documento."&currenttab=revapp\">". $nombre_documento ."</a></td>\n"; 
				           
				                  echo "<td>".$fechaVencimientoReserva."</td>";
				                  echo "<td>Vencimiento del plazo de reserva (Art. 20 LAIP)</td>";
				                 
				               echo "</tr>"; //termina la entrada
						$numeroDocumentosEnIndice++;
            
						}//fin if
					//verifico si el documento ha sido desclasificado por mandato del IAIP
					   $content=$documento->getLatestContent();
						//echo "content: ".$content;
						$status=$content->getStatus();
						//print_r($status);
						$estado=$status['status'];
						if($estado==S_OBSOLETE) //revocado por IAIP, O EN lenguaje seeddms, OBSOLETO
						//recordemos que el estado obsoleto le he cambiado la denominación como
						//revocado por IAIP
						{
							$fechaDes=obtenerFechaRevocacion($documento->getID()); //fecha del estado más reciente
							$componentes=explode("-", $fechaDes);
							$año=$componentes[0];
								$mes=$componentes[1];
									$dia=$componentes[2];
							$fechaDesclasificacion=$dia."/".$mes."/".$año;
							echo "<tr>"; //inicia la entrada
				             print "<td> <a href=\"out.ViewDocument.php?documentid=".$id_documento."&currenttab=revapp\">". $nombre_documento ."</a></td>\n"; 
				           
				                  echo "<td>".$fechaDesclasificacion."</td>";
				                  echo "<td><a href=\"/LAIP.pdf\"> Revocación de la reserva por parte del IAIP (extinción de sus causas: Art. 20 LAIP)</a></td>";
				                 
				               echo "</tr>"; //termina la entrada
						}

				}
				if($numeroDocumentosEnIndice==0) //la entidad no tiene ninguna entrada en el índice de desclasificación
				{
					echo "<div class=\"alert alert-warning alert-dismissible\">";
                echo "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>";
                echo "<h4><i class=\"icon fa fa-ban\"></i>¡Sin índice de desclasificación!</h4> 
                Este ente obligado aún no tiene entradas en el índices de documentos desclasificados.
              </div>";
				}
				echo "</table>";
            echo "</div>";
            echo "</div>";
			}//fin de comprobar que no tomo invitados ni administrador
			//cierre de la tabla	               
			
		} //fin bucle 1
       $this->contentContainerEnd();
	}//fin comprobación 
	
$this->endsBoxPrimary();
?>
		
		</div>
		</div>
		</div>
		<?php
		$this->contentEnd();
		$this->mainFooter();		
		$this->containerEnd();
			echo '<script src="../styles/multisis-lte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>';
        echo '<script src="../styles/multisis-lte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>';
		echo "<script type='text/javascript' src='../tablasDinamicas.js'></script>";
		$this->htmlEndPage();
	} /* }}} */
}
?>
