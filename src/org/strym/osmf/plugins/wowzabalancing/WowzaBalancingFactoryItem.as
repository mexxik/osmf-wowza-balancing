/**
 * Created with IntelliJ IDEA.
 * User: mexxik
 * Date: 10/5/12
 * Time: 3:11 PM
 * To change this template use File | Settings | File Templates.
 */
package org.strym.osmf.plugins.wowzabalancing {
import org.osmf.media.MediaElement;
import org.osmf.media.MediaFactoryItem;
import org.osmf.media.MediaResourceBase;
import org.osmf.media.URLResource;
import org.osmf.net.NetLoader;
import org.strym.osmf.plugins.wowzabalancing.net.WowzaBalancingNetConnectionFactory;

public class WowzaBalancingFactoryItem extends MediaFactoryItem {
    public function WowzaBalancingFactoryItem() {
        super(  "org.strym.osmf.plugins.pseudostreaming.WowzaBalancingFactoryItem",
                canHandleResource,
                createMediaElement);
    }

    private function canHandleResource(resource:MediaResourceBase):Boolean {
        var urlResource:URLResource = resource as URLResource;

        return urlResource.url.indexOf("rtmp://") == 0;
    }

    private function createMediaElement():MediaElement {
        var netLoader:NetLoader = new NetLoader(new WowzaBalancingNetConnectionFactory());
        var videoElement:WowzaBalancingVideoElement = new WowzaBalancingVideoElement(null, netLoader);

        return videoElement;
    }
}
}
