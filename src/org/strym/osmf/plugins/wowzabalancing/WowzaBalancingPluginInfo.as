/**
 * Created with IntelliJ IDEA.
 * User: mexxik
 * Date: 10/5/12
 * Time: 3:06 PM
 * To change this template use File | Settings | File Templates.
 */
package org.strym.osmf.plugins.wowzabalancing {
import org.osmf.media.MediaFactoryItem;
import org.osmf.media.PluginInfo;

public class WowzaBalancingPluginInfo extends PluginInfo {
    public function WowzaBalancingPluginInfo() {
        var items:Vector.<MediaFactoryItem> = new Vector.<MediaFactoryItem>();
        items.push(new WowzaBalancingFactoryItem());

        super(items);
    }
}
}
