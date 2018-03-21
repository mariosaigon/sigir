<?php
/**
 * Implementation of Calendar view
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
 * Class which outputs the html page for Calendar view
 *
 * @category   DMS
 * @package    SeedDMS
 * @author     Markus Westphal, Malcolm Cowe, Uwe Steinmann <uwe@steinmann.cx>
 * @copyright  Copyright (C) 2002-2005 Markus Westphal,
 *             2006-2008 Malcolm Cowe, 2010 Matteo Lucarelli,
 *             2010-2012 Uwe Steinmann
 * @version    Release: @package_version@
 */
class SeedDMS_View_Calendar extends SeedDMS_Bootstrap_Style {

	function generateCalendarArrays() { /* {{{ */
		$this->monthNames = array( getMLText("january"),
												 getMLText("february"),
												 getMLText("march"),
												 getMLText("april"),
												 getMLText("may"), 
												 getMLText("june"),
												 getMLText("july"), 
												 getMLText("august"), 
												 getMLText("september"), 
												 getMLText("october"), 
												 getMLText("november"), 
												 getMLText("december") );
												
		$this->dayNamesLong = array( getMLText("sunday"),
													 getMLText("monday"),
													 getMLText("tuesday"),
													 getMLText("wednesday"), 
													 getMLText("thursday"),
													 getMLText("friday"), 
													 getMLText("saturday") );
		/* Set abbreviated weekday names. If no translation is availabe, use
		 * the first three chars from the long name
		 */
		$this->dayNames = array( getMLText("sunday_abbr", array(), substr($this->dayNamesLong[0], 0, 3)),
													 getMLText("monday_abbr", array(), substr($this->dayNamesLong[1], 0, 3)),
													 getMLText("tuesday_abbr", array(), substr($this->dayNamesLong[2], 0, 3)),
													 getMLText("wednesday_abbr", array(), substr($this->dayNamesLong[3], 0, 3)), 
													 getMLText("thursday_abbr", array(), substr($this->dayNamesLong[4], 0, 3)),
													 getMLText("friday_abbr", array(), substr($this->dayNamesLong[5], 0, 3)), 
													 getMLText("saturday_abbr", array(), substr($this->dayNamesLong[6], 0, 3)) );
	
	} /* }}} */

	// Calculate the number of days in a month, taking into account leap years.
	function getDaysInMonth($month, $year) { /* {{{ */
		if ($month < 1 || $month > 12) return 0;

		$daysInMonth = array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		$d = $daysInMonth[$month - 1];

		if ($month == 2){
		
			if ($year%4 == 0){
			
				if ($year%100 == 0){
				
					if ($year%400 == 0) $d = 29;
				}
				else $d = 29;
			}
		}
		return $d;
	} /* }}} */

	// Adjust dates to allow months > 12 and < 0 and day<0 or day>days of the month
	function adjustDate(&$day,&$month,&$year) { /* {{{ */
		$d=getDate(mktime(12,0,0, $month, $day, $year));
		$month=$d["mon"];
		$day=$d["mday"];
		$year=$d["year"];
	} /* }}} */

	// Generate the HTML for a given month
	function getMonthHTML($month, $year) { /* {{{ */
		if (!isset($this->monthNames)) $this->generateCalendarArrays();
		if (!isset($this->dayNames)) $this->generateCalendarArrays();

		$startDay = $this->firstdayofweek;

		$day=1;
		$this->adjustDate($day,$month,$year);

		$daysInMonth = $this->getDaysInMonth($month, $year);
		$date = getdate(mktime(12, 0, 0, $month, 1, $year));

		$first = $date["wday"];
		$monthName = $this->monthNames[$month - 1];

		$s  = "<table class=\"table\">\n";
		
		$s .= "<tr>\n";
		$s .= "<td style=\"border-top: 0px;\" colspan=\"7\"><a href=\"../out/out.Calendar.php?mode=m&year=".$year."&month=".$month."\">".$monthName."</a></td>\n"; ;
		$s .= "</tr>\n";

		$s .= "<tr>\n";
		$s .= "<th class=\"header\">" . $this->dayNames[($startDay)%7] . "</th>\n";
		$s .= "<th class=\"header\">" . $this->dayNames[($startDay+1)%7] . "</th>\n";
		$s .= "<th class=\"header\">" . $this->dayNames[($startDay+2)%7] . "</th>\n";
		$s .= "<th class=\"header\">" . $this->dayNames[($startDay+3)%7] . "</th>\n";
		$s .= "<th class=\"header\">" . $this->dayNames[($startDay+4)%7] . "</th>\n";
		$s .= "<th class=\"header\">" . $this->dayNames[($startDay+5)%7] . "</th>\n";
		$s .= "<th class=\"header\">" . $this->dayNames[($startDay+6)%7] . "</th>\n";
		$s .= "</tr>\n";

		// We need to work out what date to start at so that the first appears in the correct column
		$d = $startDay + 1 - $first;
		while ($d > 1) $d -= 7;

		// Make sure we know when today is, so that we can use a different CSS style
		$today = getdate(time());

		while ($d <= $daysInMonth)
		{
			$s .= "<tr>\n";       
				
			for ($i = 0; $i < 7; $i++){
			
				$class = ($year == $today["year"] && $month == $today["mon"] && $d == $today["mday"]) ? "today" : "";
				$s .= "<td class=\"$class\">";   
						
				if ($d > 0 && $d <= $daysInMonth){

					$s .= "<a href=\"../out/out.Calendar.php?mode=w&year=".$year."&month=".$month."&day=".$d."\">".$d."</a>";
							}
				else $s .= "&nbsp;";
				
				$s .= "</td>\n";       
				$d++;
			}
			$s .= "</tr>\n";    
		}

		$s .= "</table>\n";

		return $s;  	
	} /* }}} */

	function printYearTable($year) { /* {{{ */
		print "<table class=\"table-condensed\">\n";
		print "<tr>";
		print "<td valign=\"top\">" . $this->getMonthHTML(1 , $year) ."</td>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(2 , $year) ."</td>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(3 , $year) ."</td>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(4 , $year) ."</td>\n";
		print "</tr>\n";
		print "<tr>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(5 , $year) ."</td>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(6 , $year) ."</td>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(7 , $year) ."</td>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(8 , $year) ."</td>\n";
		print "</tr>\n";
		print "<tr>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(9 , $year) ."</td>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(10, $year) ."</td>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(11, $year) ."</td>\n";
		print "<td valign=\"top\">" . $this->getMonthHTML(12, $year) ."</td>\n";
		print "</tr>\n";
		print "</table>\n";
	} /* }}} */

	function js() { /* {{{ */
		header('Content-Type: application/javascript');
	} /* }}} */

	function show() { /* {{{ */
		$dms = $this->params['dms'];
		$user = $this->params['user'];
		$mode = $this->params['mode'];
		$year = $this->params['year'];
		$month = $this->params['month'];
		$day = $this->params['day'];
		$this->firstdayofweek = $this->params['firstdayofweek'];

		$this->adjustDate($day,$month,$year);

		$this->htmlStartPage(getMLText("calendar"));
		$this->globalNavigation();
		$this->contentStart();
		$this->pageNavigation("", "calendar",array($day,$month,$year));

		if ($mode=="y"){

			$this->contentHeading(getMLText("year_view").": ".$year);
			
			echo "<div class=\"pagination pagination-small\">";
			echo "<ul>";
			print "<li><a href=\"../out/out.Calendar.php?mode=y&year=".($year-1)."\"><i style=\"color: black;\" class=\"icon-arrow-left\"></i></a></li>";
			print "<li><a href=\"../out/out.Calendar.php?mode=y\"><i style=\"color: black;\" class=\"icon-circle-blank\"></i></a></li>";
			print "<li><a href=\"../out/out.Calendar.php?mode=y&year=".($year+1)."\"><i style=\"color: black;\" class=\"icon-arrow-right\"></i></a></li>";
			echo "</ul>";
			echo "</div>";

			$this->contentContainerStart();
			$this->printYearTable($year);
			$this->contentContainerEnd();

		}else if ($mode=="m"){

			if (!isset($this->dayNamesLong)) $this->generateCalendarArrays();
			if (!isset($this->monthNames)) $this->generateCalendarArrays();
			
			$this->contentHeading(getMLText("month_view").": ".$this->monthNames[$month-1]. " ".$year);
			
			echo "<div class=\"pagination pagination-small\">";
			echo "<ul>";
			print "<li><a href=\"../out/out.Calendar.php?mode=m&year=".($year)."&month=".($month-1)."\"><i style=\"color: black;\" class=\"icon-arrow-left\"></i></a></li>";
			print "<li><a href=\"../out/out.Calendar.php?mode=m\"><i style=\"color: black;\" class=\"icon-circle-blank\"></i></li>";
			print "<li><a href=\"../out/out.Calendar.php?mode=m&year=".($year)."&month=".($month+1)."\"><i style=\"color: black;\" class=\"icon-arrow-right\"></i></a></li>";
			echo "</ul>";
			echo "</div>";
//			$this->contentContainerStart();
			
			$days=$this->getDaysInMonth($month, $year);
			$today = getdate(time());
			
			$events = getEventsInInterval(mktime(0,0,0, $month, 1, $year), mktime(23,59,59, $month, $days, $year));

			echo "<div class=\"row-fluid\">";
			echo "<div class=\"span2\">";
			echo "<h4><a href=\"../out/out.Calendar.php?mode=w&year=".($year)."&month=".($month)."&day=1\">".date('W', mktime(12, 0, 0, $month, 1, $year)).". ".getMLText('calendar_week')."</a></h4>";
			echo "<div class=\"well\">";
			$fd = getdate(mktime(12, 0, 0, $month, 1, $year));
			for($i=0; $i<$fd['wday']-1; $i++)
				echo "<tr><td colspan=\"2\">&nbsp;</td></tr>";
			
			for ($i=1; $i<=$days; $i++){
			
				// separate weeks
				$date = getdate(mktime(12, 0, 0, $month, $i, $year));
				if (($date["wday"]==$this->firstdayofweek) && ($i!=1)) {
					echo "</div>";
					echo "</div>";
					echo "<div class=\"span2\">";
					echo "<h4><a href=\"../out/out.Calendar.php?mode=w&year=".($year)."&month=".($month)."&day=".($i)."\">".date('W', mktime(12, 0, 0, $month, $i, $year)).". ".getMLText('calendar_week')."</a></h4>";
					echo "<div class=\"well\">";
				}
				
				// highlight today
				$class = ($year == $today["year"] && $month == $today["mon"] && $i == $today["mday"]) ? "todayHeader" : "header";
				
				echo "<h5>".$i.". - ".$this->dayNamesLong[$date["wday"]]."</h5>";
				
				if ($class=="todayHeader") $class="today";
				else $class="";
				
				$xdate=mktime(0, 0, 0, $month, $i, $year);
				foreach ($events as $event){
					echo "<div>";
					if (($event["start"]<=$xdate)&&($event["stop"]>=$xdate)){
					
						if (strlen($event['name']) > 25) $event['name'] = substr($event['name'], 0, 22) . "...";
						print "<i class=\"icon-lightbulb\"></i> <a href=\"../out/out.ViewEvent.php?id=".$event['id']."\">".htmlspecialchars($event['name'])."</a>";
					}
					echo "</div>";
				}
				
			}
			echo "</div>";
			echo "</div>\n";
			echo "</div>\n";

//			$this->contentContainerEnd();
			
		}else{

			if (!isset($this->dayNamesLong)) $this->generateCalendarArrays();
			if (!isset($this->monthNames)) $this->generateCalendarArrays();
			
			// get the week interval - TODO: $GET
			$datestart=getdate(mktime(0,0,0,$month,$day,$year));
			while($datestart["wday"]!=$this->firstdayofweek){
				$datestart=getdate(mktime(0,0,0,$datestart["mon"],$datestart["mday"]-1,$datestart["year"]));
			}
				
			$datestop=getdate(mktime(23,59,59,$month,$day,$year));
			if ($datestop["wday"]==$this->firstdayofweek){
				$datestop=getdate(mktime(23,59,59,$datestop["mon"],$datestop["mday"]+1,$datestop["year"]));
			}
			while($datestop["wday"]!=$this->firstdayofweek){
				$datestop=getdate(mktime(23,59,59,$datestop["mon"],$datestop["mday"]+1,$datestop["year"]));
			}
			$datestop=getdate(mktime(23,59,59,$datestop["mon"],$datestop["mday"]-1,$datestop["year"]));
			
			$starttime=mktime(0,0,0,$datestart["mon"],$datestart["mday"],$datestart["year"]);
			$stoptime=mktime(23,59,59,$datestop["mon"],$datestop["mday"],$datestop["year"]);
			
			$today = getdate(time());
			$events = getEventsInInterval($starttime,$stoptime);
			
			$this->contentHeading(getMLText("week_view").": ".getReadableDate(mktime(12, 0, 0, $month, $day, $year)));
			
			echo "<div class=\"pagination pagination-small\">";
			echo "<ul>";
			print "<li><a href=\"../out/out.Calendar.php?mode=w&year=".($year)."&month=".($month)."&day=".($day-7)."\"><i style=\"color: black;\" class=\"icon-arrow-left\"></i></a></li>";
			print "<li><a href=\"../out/out.Calendar.php?mode=w\"><i style=\"color: black;\" class=\"icon-circle-blank\"></i></a></li>";
			print "<li><a href=\"../out/out.Calendar.php?mode=w&year=".($year)."&month=".($month)."&day=".($day+7)."\"><i style=\"color: black;\" class=\"icon-arrow-right\"></i></a></li>";
			echo "</ul>";
			echo "</div>";
			$this->contentContainerStart();
			
			echo "<table class='table table-condensed'>\n";
			
			for ($i=$starttime; $i<$stoptime; $i += 86400){
			
				$date = getdate($i);
				
				// for daylight saving time TODO: could be better
				if ( ($i!=$starttime) && ($prev_day==$date["mday"]) ){
					$i += 3600;
					$date = getdate($i);
				}
				
				// highlight today
				$class = ($date["year"] == $today["year"] && $date["mon"] == $today["mon"] && $date["mday"]  == $today["mday"]) ? "info" : "";
				
				echo "<tr class=\"".$class."\">";
				echo "<td colspan=\"3\"><strong>".$this->dayNamesLong[$date["wday"]].", ";
				echo getReadableDate($i)."</strong></td>";
				echo "</tr>";
				
				foreach ($events as $event){
					if (($event["start"]<=$i)&&($event["stop"]>=$i)){
						echo "<tr>";
						print "<td><a href=\"../out/out.ViewEvent.php?id=".$event['id']."\">".htmlspecialchars($event['name'])."</a>";
						if($event['comment'])
							echo "<br /><em>".htmlspecialchars($event['comment'])."</em>";
						print "</td>";
						echo "<td><a class=\"btn btn-mini\" href=\"../out/out.RemoveEvent.php?id=".$event['id']."\"><i class=\"icon-remove\"></i> ".getMLText('delete')."</a></td>";
						echo "<td><a class=\"btn btn-mini\" href=\"../out/out.EditEvent.php?id=".$event['id']."\">".getMLText('update')."</a></td>";
						echo "</tr>\n";	
					}
				}
				
				$prev_day=$date["mday"];
			}
			echo "</table>\n";

			$this->contentContainerEnd();
		}

		$this->contentEnd();
		$this->htmlEndPage();
	} /* }}} */
}
?>
