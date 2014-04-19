<?php
require_once('common/includes/class.httprequest.php');
require_once('common/admin/admin_menu.php');

$version = "4.0";

$page = new Page('Ship Display tool - Settings');

$html .= "<p>Ship Display Tool Admin page.<br />Version: ".$version."</p>";
$html .= "<p>Created by Spark's.<br />Updated by Darismel Abishai.</p>";


$backgroundimg = config::get('ship_display_back');
if($backgroundimg == "") {
	$backgroundimg = "#222222";
}
$html .= "<br />
<form name=\"add\" action=\"?a=settings_ship_display_tool&amp;step=add\" method=\"post\">
	<table>
		<tr>
			<td>Background Color:</td><td><input type='text' name='sel_back' value='".$backgroundimg."' /></td>
		</tr>
		<tr>
			<td></td><td>Example: #ffffff</td>
		</tr>
		<tr>
			<td><input type=\"submit\" value=\"save\" /></td><td></td>
		</tr>
	</table>
</form>
";




$html .= "<br /><br />Remember to report bugs to this post: <a href='http://eve-id.net/forum/viewtopic.php?f=505&t=17295'>http://eve-id.net/forum/viewtopic.php?f=505&t=17295</a>.<br /><br />Thanks";





if ($_POST) {
  $tool_back = $_POST["sel_back"];
  
  
  config::set('ship_display_back', $tool_back);
  
  Header("Location: ?a=settings_ship_display_tool");
}



$page->setContent($html);
$page->addContext($menubox->generate());
$page->generate();
?>
