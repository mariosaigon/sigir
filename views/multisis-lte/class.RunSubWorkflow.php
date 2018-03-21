<?php
/**
 * Implementation of RunSubWorkflow view
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
 * Class which outputs the html page for RunSubWorkflow view
 *
 * @category   DMS
 * @package    SeedDMS
 * @author     Markus Westphal, Malcolm Cowe, Uwe Steinmann <uwe@steinmann.cx>
 * @copyright  Copyright (C) 2002-2005 Markus Westphal,
 *             2006-2008 Malcolm Cowe, 2010 Matteo Lucarelli,
 *             2010-2012 Uwe Steinmann
 * @version    Release: @package_version@
 */
class SeedDMS_View_RunSubWorkflow extends SeedDMS_Bootstrap_Style {

	function show() { /* {{{ */
		$dms = $this->params['dms'];
		$user = $this->params['user'];
		$folder = $this->params['folder'];
		$document = $this->params['document'];
		$subworkflow = $this->params['subworkflow'];

		$latestContent = $document->getLatestContent();

		$this->htmlStartPage(getMLText("run_subworkflow"), "skin-blue sidebar-mini");
		$this->containerStart();
		$this->mainHeader();
		$this->mainSideBar();
		$this->contentStart();		

		//echo $this->getDefaultFolderPathHTML($folder, true, $document);

		//// Document content ////
		echo "<div class=\"row\">";
		echo "<div class=\"gap-20\"></div>";
		echo "<div class=\"col-md-12\">";
		$this->startBoxPrimary(getMLText("run_subworkflow"));

		$currentstate = $latestContent->getWorkflowState();
		$wkflog = $latestContent->getWorkflowLog();
		$workflow = $latestContent->getWorkflow();

		$msg = "The document is currently in state: ".$currentstate->getName()."<br />";
		if($wkflog) {
			foreach($wkflog as $entry) {
				if($entry->getTransition()->getNextState()->getID() == $currentstate->getID()) {
					$enterdate = $entry->getDate();
					$enterts = makeTsFromLongDate($enterdate);
				}
			}
			$msg .= "The state was entered at ".$enterdate." which was ";
			$msg .= getReadableDuration((time()-$enterts))." ago.<br />";
		}
		$msg .= "The document may stay in this state for ".$currentstate->getMaxTime()." sec.";
		$this->infoMsg($msg);

		//$this->contentContainerStart();
		// Display the Workflow form.
?>
	<div class="row">
	<div class="col-md-4">
	<form method="POST" action="../op/op.RunSubWorkflow.php" name="form1">
	<?php echo createHiddenFieldWithKey('runsubworkflow'); ?>
	<table>
	<tr><td></td><td>
	<input type='hidden' name='documentid' value='<?php echo $document->getId(); ?>'/>
	<input type='hidden' name='version' value='<?php echo $latestContent->getVersion(); ?>'/>
	<input type='hidden' name='subworkflow' value='<?php echo $subworkflow->getID(); ?>'/>
	<input type='submit' class="btn btn-primary" value='<?php printMLText("run_subworkflow"); ?>'/>
	</td></tr></table>
	</form>
	</div>
	<div id="workflowgraph" class="col-md-8">
	<iframe src="out.WorkflowGraph.php?workflow=<?php echo $subworkflow->getID(); ?>" width="100%" height="400" style="border: 1px solid #AAA;"></iframe>
	</div>
	</div>
<?php
		$this->endsBoxPrimary();

		if($wkflog) {
			$this->contentContainerStart();
			echo "<table class=\"table table-bordered table-condensed\">";
			echo "<tr><th>".getMLText('action')."</th><th>Start state</th><th>End state</th><th>".getMLText('date')."</th><th>".getMLText('user')."</th><th>".getMLText('comment')."</th></tr>";
			foreach($wkflog as $entry) {
				echo "<tr>";
				echo "<td>".getMLText('action_'.$entry->getTransition()->getAction()->getName())."</td>";
				echo "<td>".$entry->getTransition()->getState()->getName()."</td>";
				echo "<td>".$entry->getTransition()->getNextState()->getName()."</td>";
				echo "<td>".$entry->getDate()."</td>";
				echo "<td>".$entry->getUser()->getFullname()."</td>";
				echo "<td>".$entry->getComment()."</td>";
				echo "</tr>";
			}
			echo "</table>\n";
			$this->contentContainerEnd();
		}

		echo "</div>";
		echo "</div>"; 
		echo "</div>"; // Ends row
		$this->contentEnd();
		$this->mainFooter();		
		$this->containerEnd();
		$this->htmlEndPage();
	} /* }}} */
}
?>