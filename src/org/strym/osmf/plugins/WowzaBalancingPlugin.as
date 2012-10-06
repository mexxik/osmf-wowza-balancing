/**
 * Created with IntelliJ IDEA.
 * User: mexxik
 * Date: 10/5/12
 * Time: 3:05 PM
 * To change this template use File | Settings | File Templates.
 */
package org.strym.osmf.plugins {
import flash.display.Sprite;

import org.osmf.media.PluginInfo;

import org.strym.osmf.plugins.wowzabalancing.WowzaBalancingPluginInfo;

public class WowzaBalancingPlugin extends Sprite {

    private var _pluginInfo:WowzaBalancingPluginInfo;

    public function WowzaBalancingPlugin() {
        _pluginInfo = new WowzaBalancingPluginInfo();

        super();
    }

    public function get pluginInfo():PluginInfo {
        return _pluginInfo;
    }
}
}
