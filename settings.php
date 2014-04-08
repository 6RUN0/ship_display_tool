<?php
require_once('common/includes/class.httprequest.php');
require_once('common/admin/admin_menu.php');

$version = "3.1";

$page = new Page('Ship Display tool - Settings');

$html .= "<p>Version: " & printf($version) & "</p>";
$html .= "Ship Display Tool Admin page.<br />Created by Spark's.<br />Updated by Darismel Abishai.";


$backgroundimg = config::get('ship_display_back');
if($backgroundimg == "") {
	$backgroundimg = "#222222";
}
$html .= "<br />
<form name=\"add\" action=\"?a=settings_ship_tool_kb&amp;step=add\" method=\"post\"><br /><br />
	<div style='float:left; width:100%;'><p>Select your mod background colour in html code.<br /><br /><input type='text' name='sel_back' value='".$backgroundimg."' /><br />Example: #ffffff</p></div>
	<div style='float:left; width:100%;'><p><input type=\"submit\" value=\"save\" /></p></div>
</form>
";




$html .= "<br /><br />Remember to report bugs to this post: <a href='http://eve-id.net/forum/viewtopic.php?f=505&t=17295'>http://eve-id.net/forum/viewtopic.php?f=505&t=17295</a>.<br /><br />Thanks";





if ($_POST) {
  $tool_back = $_POST["sel_back"];
  
  
  config::set('ship_display_back', $tool_back);
  
  Header("Location: ?a=settings_ship_tool_kb");
}



$page->setContent($html);
$page->addContext($menubox->generate());
$page->generate();
?>
