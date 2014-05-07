<!-- ship_display_tool.tpl -->
<link rel="stylesheet" href="{$simpleurlheader}/mods/ship_display_tool/style.css" type="text/css" media="all" />
<style type="text/css">
.sdt-tr-bg {
  background: {$ship_display_back};
}
</style>

<div id="sdt-wrapper">
  <div id="sdt-info-bar">
    <table class="sdt-table"><tbody>
      <tr>
        <th class="sdt-th">
          <span class="sdt-left">
            <a href="{$getPilotNameURL}">{$getPilotName}</a> lost a <a href="{$getPilotShipURL}">{$getPilotShip}</a> ({$getPilotShipClass}) in <a href="{$getPilotLocURL}">{$getPilotLoc}</a> - {$getPilotLocReg} ({$getPilotLocSec}) 
          </span>
        </th>
      </tr>
      <tr class="sdt-tr-bg"><td class="sdt-td-wrap">
        <table class="sdt-table"><tbody><tr>
          <td class="sdt-shipview">
            <img id="sdt-ship-img" alt="{$getPilotShip}" title="{$getPilotShip}" src="http://image.eveonline.com/Render/{$getShipIcon}_512.png" />
            <canvas id="sdt-ship-cpu" width="72" height="152"></canvas>
            <canvas id="sdt-ship-powergrid" width="152" height="72"></canvas>
            <canvas id="sdt-ship-calibration" width="65" height="102"></canvas>
            <script>
              var canvas2 = document.getElementById("sdt-ship-cpu");
              var context2 = canvas2.getContext("2d");
              context2.moveTo({$percpuxs}, {$percpuys});
              context2.quadraticCurveTo({$percpux1}, {$percpuy1}, {$percpuxe}, {$percpuye});
              context2.lineWidth = 8;
              context2.strokeStyle = "#356160"; // line color
              context2.stroke();

              var canvas3 = document.getElementById("sdt-ship-powergrid");
              var context3 = canvas3.getContext("2d");
              context3.moveTo({$perprgxs}, {$perprgys});
              context3.quadraticCurveTo({$perprgx1}, {$perprgy1}, {$perprgxe}, {$perprgye});
              context3.lineWidth = 8;
              context3.strokeStyle = "#67160a"; // line color
              context3.stroke();

              var canvas4 = document.getElementById("sdt-ship-calibration");
              var context4 = canvas4.getContext("2d");
              context4.moveTo({$percalxs}, {$percalys});
              context4.quadraticCurveTo({$percalx1}, {$percaly1}, {$percalxe}, {$percalye});
              context4.lineWidth = 8;
              context4.strokeStyle = "#4a5356";
              context4.stroke();
            </script>
            <div id="sdt-fit-view"></div>
            <div id="sdt-turret" class="sdt-icon-32"></div>
            <div id="sdt-missile" class="sdt-icon-32"></div>
            <img id="sdt-turret-count" class="weapon-count" src="{$simpleurlheader}/mods/ship_display_tool/img/turret-{$getTurUsed}.png" />
            <img id="sdt-missile-count" class="weapon-count" src="{$simpleurlheader}/mods/ship_display_tool/img/missile-{$getMisUsed}.png" />
            {if $modSlotsh}
              {foreach $modSlotsh as $value}
                <div id="sdt-high-slot-{$value@key}" class="slot"><img class="sdt-icon-40" src="{$value.iconloc}" alt="{$value.name}" title="{$value.name}" /></div>
              {/foreach}
            {/if}
            {if $modSlotsm}
              {foreach $modSlotsm as $value}
                <div id="sdt-medium-slot-{$value@key}" class="slot"><img class="sdt-icon-40" src="{$value.iconloc}" alt="{$value.name}" title="{$value.name}" /></div>
              {/foreach}
            {/if}
            {if $modSlotsl}
              {foreach $modSlotsl as $value}
                <div id="sdt-low-slot-{$value@key}" class="slot"><img class="sdt-icon-40" src="{$value.iconloc}" alt="{$value.name}" title="{$value.name}" /></div>
              {/foreach}
            {/if}
            {if $modSlotsr}
              {foreach $modSlotsr as $value}
                <div id="sdt-rig-slot-{$value@key}" class="slot"><img class="sdt-icon-40" src="{$value.iconloc}" alt="{$value.name}" title="{$value.name}" /></div>
              {/foreach}
            {/if}
            {if $modSlotss}
              {foreach $modSlotss as $value}
                <div id="sdt-sub-sys-slot-{$value@key}" class="slot"><img class="sdt-icon-40" src="{$value.iconloc}" alt="{$value.name}" title="{$value.name}" /></div>
              {/foreach}
            {/if}

            <table id="sdt-fit-calibration"><tbody>
              <tr><td>Calibration</td></tr>
              <tr><td>{$usedcal} / {$totcal}</td></tr>
            </tbody></table>

            <table id="sdt-fit-grid"><tbody>
              <tr><td>CPU</td></tr>
              <tr><td>{$usedcpu} / {$totcpu}</td></tr>
              <tr><td>Power grid</td></tr>
              <tr><td>{$usedprg} / {$totprg}</td></tr>
            </tbody></table>

            <table id="sdt-killmail-post"><tbody>
              <tr>
                <td>API:</td>
                <td>{if $extid != 0}Yes{else}No{/if}</td>
              </tr>
              <tr>
                <td>Source:</td>
                <td>{if $type == "API"}API{else if $type == "IP"}Manual{else if $type == "URL"}Fetch{/if}</td>
              </tr>
              <tr>
                <td>Damage:</td>
                <td>{$getPilotDam}</td>
              </tr>
              <tr>
                <td>Cost:</td>
                <td>{$getPilotCos} isk</td>
              </tr>
            </tbody></table>

          </td>

          <td class="sdt-bay sdt-td-img">
            <img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/dron-bay.png" alt="Dron bay" title="Dron bay" />
            {if $modSlotsd}
              {foreach $modSlotsd as $value}
                {$value.iconloc}
              {/foreach}
            {/if}
          </td>

          <td class="sdt-bay sdt-td-img">
            <img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/ammo.png" alt="Ammo" title="Ammo" />
            {if $modSlotsa}
              {foreach $modSlotsa as $value}
                {$value.iconloc}
              {/foreach}
            {/if}
          </td>
        </tr></tbody></table>
      </td></tr>
      
      <tr class="sdt-tr-bg">
        <td class="sdt-td-wrap"><table class="sdt-table"><tbody><tr>
          <td class="sdt-td-img">
            <a href="{$getPilotNameURL}"><img class="sdt-icon-64" src="{$getPilotPort}" alt="{$getPilotName}" title="{$getPilotName}" /></a>
          </td>
          <td class="sdt-td-img">
            <a href="{$getPilotCorpURL}"><img class="sdt-icon-32" src="{$getCorpPort}" alt="{$getPilotCorp}" title="{$getPilotCorp}" /></a>
            <a href="{$getPilotAllianceURL}"><img class="sdt-icon-32" src="{$getAlliPort}" alt="{$getPilotAlliance}" title="{$getPilotAlliance}" /></a>
          </td>
          <td>
            <table class="sdt-table"><tbody> 
              <tr>
                <td>Name:</td>
                <td><a href="{$getPilotNameURL}">{$getPilotName}</a></td>
              </tr>
              <tr>
                <td>Corp:</td>
                <td><a href="{$getPilotCorpURL}">{$getPilotCorp}</a></td>
              </tr>
              <tr>
                <td>Alliance:</td>
                <td><a href="{$getPilotAllianceURL}">{$getPilotAlliance}</a></td>
              </tr>
              <tr>
                <td>Date:</td>
                <td>{$getPilotDate}</td>
              </tr>
            </tbody></table>
          </td>
          <td>
            <table class="sdt-table"><tbody>
              <tr>
                <td>Ship:</td>
                <td><a href="{$getPilotShipURL}">{$getPilotShip}</a> ({$getPilotShipClass})</td>
              <tr>
                <td>Location:</td>
                <td><a href="{$getPilotLocURL}">{$getPilotLoc}</a> {$getPilotLocReg} ({$getPilotLocSec})</td>
            </tbody></table>
          </td>
        </tbody></table></td>
      </tr>
    </tbody></table>
  </div><!-- /#info-bar -->

  <div id="sdt-stat-bar">

    <table class="sdt-table"><tbody>
      {if $getCapStable}
        <tr><th class="sdt-th">
          <span class="sdt-left"><strong>Capacitor</strong></span> <span class="sdt-right sdt-ok">Stable ({$capAmountMperc}%)</span>
        </th><tr>
        <tr class="sdt-tr-bg"><td class="sdt-td-wrap">
          <table class="sdt-table"><tbody><tr>
            <td class="sdt-td-img sdt-icon-28 sdt-td-delimiter">
              <img class="sdt-icon-28"  
                {if $capAmountMperc > 0 && $capAmountMperc <= 10}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap-10.png"
                {else if $capAmountMperc > 10 && $capAmountMperc <= 20}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap-20.png"
                {else if $capAmountMperc > 20 && $capAmountMperc <= 30}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap-30.png"
                {else if $capAmountMperc > 30 && $capAmountMperc <= 40}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap-40.png"
                {else if $capAmountMperc > 40 && $capAmountMperc <= 50}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap-50.png"
                {else if $capAmountMperc > 50 && $capAmountMperc <= 60}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap-60.png"
                {else if $capAmountMperc > 60 && $capAmountMperc <= 70}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap-70.png"
                {else if $capAmountMperc > 70 && $capAmountMperc <= 80}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap-80.png"
                {else if $capAmountMperc > 80 && $capAmountMperc <= 90}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap90.png"
                {else}
                  src="{$simpleurlheader}/mods/ship_display_tool/img/cap-100.png"
                {/if}
              alt="Capacitor Stable ({$capAmountMperc}%)" title="Capacitor Stable ({$capAmountMperc}%)" />
            </td>
            <td>
              <table class="sdt-table"><tbody>
                <tr><td>{$getCapAmount} GJ / {$getCapRecharge}</td></tr>
                <tr><td>-{$totalCapUse} GJ/s +{$totalCapInjected} GJ/s</td></tr>
              </tbody></table>
            </td>
          </tr></tbody></table>
        </td></tr>
      {else}
        <tr><th class="sdt-th">
          <span class="sdt-left"><strong>Capacitor</strong></span> <span class="sdt-right sdt-fail">Depletes {$capAmountMperc}</span>
        </th></tr>
        <tr class="sdt-tr-bg"><td class="sdt-td-wrap">
          <table class="sdt-table"><tbody><tr>
            <td class="sdt-td-img sdt-icon-28 sdt-td-delimiter"><img class="sdt-icon-28" src="{$simpleurlheader}/mods/ship_display_tool/img/cap-0.png" alt="Capacitor {$capAmountMperc}" title="Capacitor {$capAmountMperc}" /></td>
            <td>
              <table class="sdt-table"><tbody>
                <tr><td><span class="cap_right">{$getCapAmount} GJ / {$getCapRecharge}</span></td></tr>
                <tr><td><span class="cap_right">-{$totalCapUse} GJ/s +{$totalCapInjected} GJ/s</span></td></tr>
              </tbody></table>
            </td>
          </tr></tbody></table>
        </td></tr>
      {/if}
    </tbody></table>

    <table class="sdt-table sdt-table-delimiter"><tbody>
      <tr><th class="sdt-th">
        <span class="sdt-left"><strong>Offense</strong></span> <span class="sdt-right">{$getDamage} dps / {$getVolley} vol</span>
      </th></tr>
      <tr class="sdt-tr-bg"><td class="sdt-td-wrap">
        <table class="sdt-table"><tbody><tr>
          <td class="sdt-td-img sdt-td-sixth"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/turret.png" alt="Turret" title="Turret" /></td>
          <td class="sdt-td-sixth">{$getTurretDamage}</td>
          <td class="sdt-td-img sdt-td-sixth"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/drones.png" alt="Drone" title="Drone" /></td>
          <td class="sdt-td-sixth">{$getDroneDamage}</td>
          <td class="sdt-td-img sdt-td-sixth"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/missile.png" alt="Missile" title="Missile" /></td>
          <td>{$getMissileDamage}</td>
        </tr></tbody></table>
      </tr></td>
    </tbody></table>

    <table class="sdt-table sdt-table-delimiter"><tbody>
      <tr><th class="sdt-th">
        <span class="sdt-left"><strong>Defense</strong></span> <span class="sdt-right">{$getEffectiveHp} hp</span>
      </th></tr>
      <tr class="sdt-tr-bg"><td class="sdt-td-wrap">
        <table class="sdt-table"><tbody>
          <tr>
            <td class="sdt-td-img"><img class="sdt-icon-32" 
              {if $getTankType == "pass"}
                src="{$simpleurlheader}/mods/ship_display_tool/img/passive-recharge.png" alt="Passive recharge" title="Passive recharge"
              {else if $getTankType == "act"}
                src="{$simpleurlheader}/mods/ship_display_tool/img/active-recharge.png" alt="Active recharge" title="Active recharge"
              {else if $getTankType == "arm" || $getTankType == "hull"}
                src="{$simpleurlheader}/mods/ship_display_tool/img/repair.png" alt="Repair" title="Repair"
              {/if}
            /></td>
            <td>{$getTankAmount} hp/s</td>
            <td class="sdt-td-img"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/r-em.png" alt="EM" title="EM" /></td>
            <td class="sdt-td-img"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/r-therm.png" alt="Thermal" title="Thermal" /></td>
            <td class="sdt-td-img"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/r-kin.png" alt="Kinetic" title="Kinetic" /></td>
            <td class="sdt-td-img"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/r-expl.png" alt="Explosive" title="Explosive" /></td>
          </tr>
          <tr>
            <td class="sdt-td-img"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/shield-hp.png" alt="Shield" title="Shield" /></td>
            <td>
              <table class="sdt-table"><tbody>
                <tr><td>{$getShieldAmount}</td></tr>
                <tr><td>{$getShieldRecharge}</td></tr>
              </tbody></table>
            </td>
            <td><div class="sdt-resist-em"><div class="sdt-resist-em-bg" style="width:{$getShieldEMPS}px;"><div class="sdt-resist-push">{$getShieldEM} %</div></div></div></td>
            <td><div class="sdt-resist-thermal"><div class="sdt-resist-thermal-bg" style="width:{$getShieldThPS}px;"><div class="sdt-resist-push">{$getShieldTh} %</div></div></div></td>
            <td><div class="sdt-resist-kinetic"><div class="sdt-resist-kinetic-bg" style="width:{$getShieldKiPS}px;"><div class="sdt-resist-push">{$getShieldKi} %</div></div></div></td>
            <td><div class="sdt-resist-explosive"><div class="sdt-resist-explosive-bg" style="width:{$getShieldExPS}px;"><div class="sdt-resist-push">{$getShieldEx} %</div></div></div></td>
          </tr>
          <tr>
            <td class="sdt-td-img"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/armor-hp.png" alt="Armor" title="Armor" /></td>
            <td>{$getArmorAmount}</td>
            <td><div class="sdt-resist-em"><div class="sdt-resist-em-bg" style="width:{$getArmorEMPS}px;"><div class="sdt-resist-push">{$getArmorEM} %</div></div></div></td>
            <td><div class="sdt-resist-thermal"><div class="sdt-resist-thermal-bg" style="width:{$getArmorThPS}px;"><div class="sdt-resist-push">{$getArmorTh} %</div></div></div></td>
            <td><div class="sdt-resist-kinetic"><div class="sdt-resist-kinetic-bg" style="width:{$getArmorKiPS}px;"><div class="sdt-resist-push">{$getArmorKi} %</div></div></div></td>
            <td><div class="sdt-resist-explosive"><div class="sdt-resist-explosive-bg" style="width:{$getArmorExPS}px;"><div class="sdt-resist-push">{$getArmorEx} %</div></div></div></td>
          </tr>
          <tr>
            <td class="sdt-td-img"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/hull-hp.png" alt="Hull" title="Hull" /></td>
            <td>{$getHullAmount}</td>
            <td><div class="sdt-resist-em"><div class="sdt-resist-em-bg" style="width:{$getHullEMPS}px;"><div class="sdt-resist-push">{$getHullEM} %</div></div></div></td>
            <td><div class="sdt-resist-thermal"><div class="sdt-resist-thermal-bg" style="width:{$getHullThPS}px;"><div class="sdt-resist-push">{$getHullTh} %</div></div></div></td>
            <td><div class="sdt-resist-kinetic"><div class="sdt-resist-kinetic-bg" style="width:{$getHullKiPS}px;"><div class="sdt-resist-push">{$getHullKi} %</div></div></div></td>
            <td><div class="sdt-resist-explosive"><div class="sdt-resist-explosive-bg" style="width:{$getHullExPS}px;"><div class="sdt-resist-push">{$getHullEx} %</div></div></div></td>
          </tr>
        </tbody></table>
      </td></tr>
    </tbody></table>

    <table class="sdt-table sdt-table-delimiter"><tbody>
      <tr><th class="sdt-th"><span class="sdt-left"><strong>Targeting</strong></span> <span class="sdt-right">{$getDistance} km</span></th></tr>
      <tr class="sdt-tr-bg"><td class="sdt-td-wrap">
        <table class="sdt-table"><tbody>
          <tr>
            <td class="sdt-td-img sdt-icon-32 sdt-td-delimiter"><img class="sdt-icon-32" 
              {if $getSensorType == "radar"}
                src="{$simpleurlheader}/mods/ship_display_tool/img/radar.png" alt="Radar" title="Radar"
              {else if $getSensorType == "gravimetric"}
                src="{$simpleurlheader}/mods/ship_display_tool/img/gravimetric.png" alt="Gravimetric" title="Gravimetric"
              {else if $getSensorType == "magnetometric"}
                src="{$simpleurlheader}/mods/ship_display_tool/img/magnetometric.png" alt="Magnetometric" title="Magnetometric"
              {else if $getSensorType == "ladar"}
                src="{$simpleurlheader}/mods/ship_display_tool/img/ladar.png" alt="Ladar" title="Ladar"
              {/if}
            /></td>
            <td>{$getSensorAmount} points</td>
            <td class="sdt-td-img sdt-icon-32 sdt-td-delimiter"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/scan-resolution.png" alt="Scan resolution" title="Scan resolution" /></td>
            <td>{$getScan} mm</td>
          </tr>
          <tr>
            <td class="sdt-td-img sdt-icon-32 sdt-td-delimiter"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/signature-radius.png" alt="Signature radius" title="Signature radius" /></td>
            <td>
              <table class="sdt-table"><tbody>
                <tr><td>{$getSigRadius} m</td></tr>
                {if $mwdSigatureAct}
                  <tr><td>{$mwdSigature} m</td></tr>
                {/if}
              </tbody></table>
            </td>
            <td class="sdt-td-img sdt-icon-32 sdt-td-delimiter"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/target.png" alt="Tageting" title="Tageting" /></td>
            <td>{$getTarget}x</td>
          </tr>
        </tbody></table>
      </td></tr>
    </tbody></table>

    <table class="sdt-table sdt-table-delimiter"><tbody>
      <tr><th class="sdt-th"><span class="sdt-left"><strong>Navigation</strong></span> <span class="sdt-right">{$getShipSpeed} m/s</span></th></tr>
      <tr class="sdt-tr-bg"><td class="sdt-td-wrap">
        <table class="sdt-table"><tbody><tr>
          <td class="sdt-td-img sdt-icon-32 sdt-td-delimiter"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/mwd.png" alt="MicroWarpdrive" title="MicroWarpdrive" /></td>
          <td>{$mwdActive}{if $mwdActiveAct} m/s{/if}</td>
          <td class="sdt-td-img sdt-icon-32 sdt-td-delimiter"><img class="sdt-icon-32" src="{$simpleurlheader}/mods/ship_display_tool/img/ab.png" alt="Afterburner" title="Afterburner" /></td>
          <td>{$abActive}{if $abActiveAct} m/s{/if}</td>
        </tr></tbody></table>
      </td></tr>
    </tbody></table>

    <table class="sdt-table sdt-table-delimiter"><tbody><tr>
      <td class="sdt-td-delimiter">
        <table class="sdt-table"><tbody>
          <tr><th class="sdt-th"><span class="sdt-left"><strong>Top Damage</strong></span></th></tr>
          <tr class="sdt-tr-bg"><td>
            <table class="sdt-table"><tbody><tr>
              <td class="sdt-td-img">
                <a href="{$topgetPilotURL}"><img class="sdt-icon-64" src="{$topgetPilotIcon}" alt="{$topgetPilotName}" title="{$topgetPilotName}" /></a>
              </td>
              <td>
                <table class="sdt-table"><tbody>
                  <tr>
                    <td class="sdt-td-img"><a href="{$topgetCorpURL}"><img class="sdt-icon-32" src="{$topgetCorpIcon}" alt="{$topgetCorpName}" title="{$topgetCorpName}" /></a></td>
                    <td class="sdt-td-img"><a href="{$topgetShipURL}"><img  class="sdt-icon-32" src="{$topgetShipIcon}" alt="{$topgetShipName}" title="{$topgetShipName}" /></a></td>
                  </tr>
                  <tr>
                    <td class="sdt-td-img">
                      {if $topgetShipID != 0}
                        <a href="{$topgetAllianceURL}"><img class="sdt-icon-32" src="{$topgetAllianceIcon}" alt="{$topgetAllianceName}" title="{$topgetAllianceName}" /></a></td>
                      {else}
                        <img class="sdt-icon-32" src="{$topgetAllianceIcon}" alt="{$topgetAllianceName}" title="{$topgetAllianceName}" />
                      {/if}
                    </td>
                    <td class="sdt-td-img">
                      {if $topgetWeaponID != 0}
                        <a href="{$topgetWeaponURL}">{$topgetWeaponIcon}</a>
                      {else}
                        {$topgetWeaponIcon}
                      {/if}
                    </td>
                  </tr>
                </tbody></table>
              </td>
            </tr></tbody></table>
          </td></tr>
        </tbody></table>
      </td>
      <td>
        <table class="sdt-table"><tbody>
          <tr><th class="sdt-th"><span class="sdt-left"><strong>Final Blow</strong></span></th></td>
          <tr class="sdt-tr-bg"><td>
            <table class="sdt-table"><tbody><tr>
              <td class="sdt-td-img">
                <a href="{$fingetPilotURL}"><img class="sdt-icon-64" src="{$fingetPilotIcon}" alt="{$fingetPilotName}" title="{$fingetPilotName}" /></a>
              </td>
              <td>
                <table class="sdt-table"></tbody>
                  <tr>
                    <td class="sdt-td-img"><a href="{$fingetCorpURL}"><img class="sdt-icon-32" src="{$fingetCorpIcon}" alt="{$fingetCorpName}" title="{$fingetCorpName}" /></a></td>
                    <td class="sdt-td-img"><a href="{$fingetShipURL}"><img class="sdt-icon-32" src="{$fingetShipIcon}" alt="{$fingetShipName}" title="{$fingetShipName}" /></a></td>
                  </tr>
                  <tr>
                    <td class="sdt-td-img">
                      {if $fingetShipID != 0}
                        <a href="{$fingetAllianceURL}"><img class="sdt-icon-32" src="{$fingetAllianceIcon}" alt="{$fingetAllianceName}" title="{$fingetAllianceName}" /></a>
                      {else}
                        <img class="sdt-icon-32" src="{$fingetAllianceIcon}" alt="{$fingetAllianceName}" title="{$fingetAllianceName}" />
                      {/if}
                    </td>
                    <td class="sdt-td-img">
                      {if $fingetWeaponID != 0}
                        <a href="{$fingetWeaponURL}">{$fingetWeaponIcon}</a>
                      {else}
                        {$fingetWeaponIcon}
                      {/if}
                    </td>
                  </tr>
                </tbody></table>
              </td>
            </tr></tbody></table>
          </td></tr>
        </tbody></table>
      </td>
    </tr></tbody></table>
  </div><!-- /#stat-bar -->
</div><!-- /#sdt-wrapper -->
<!-- /ship_display_tool.tpl -->
