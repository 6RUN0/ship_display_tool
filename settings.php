<?php
require_once('common/includes/class.httprequest.php');
require_once('common/admin/admin_menu.php');

$version = 'CURRENT';

$page = new Page('Ship Display tool - Settings');

$html .= "<p>Ship Display Tool Admin page.<br />Version: ${version} </p>";
$html .= "<p>Created by Spark's.<br />Updated by Darismel Abishai.<br />Patched by Boris Blade Artrald.</p>";


$backgroundimg = config::get('ship_display_back');
if($backgroundimg == '') {
  $backgroundimg = '#222222';
}
$html .= '<br />
<form name="add" action="?a=settings_ship_display_tool&amp;step=add" method="post">
  <table>
    <tr>
      <td>Background Color:</td><td><input type="text" name="sel_back" value="' . $backgroundimg . '" /></td>
    </tr>
    <tr>
      <td></td><td>Example: #ffffff (for more see: <a href="http://htmlbook.ru/css/background">ru</a> <a href="http://www.w3schools.com/cssref/css3_pr_background.asp">en</a>)</td>
    </tr>
    <tr>
      <td><input type="submit" value="save" /></td><td></td>
    </tr>
  </table>
</form>
';

$html .= '<br /><br /><a href="https://github.com/6RUN0/ship_display_tool/issues/new">Send problem report</a>.<br /><br />Thanks';

if ($_POST) {
  $tool_back = $_POST["sel_back"];
  config::set('ship_display_back', $tool_back);
  Header("Location: ?a=settings_ship_display_tool");
}

$page->setContent($html);
$page->addContext($menubox->generate());
$page->generate();
