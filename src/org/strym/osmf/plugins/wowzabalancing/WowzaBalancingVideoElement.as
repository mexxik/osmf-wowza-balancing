/**
 * Created with IntelliJ IDEA.
 * User: mexxik
 * Date: 10/5/12
 * Time: 3:29 PM
 * To change this template use File | Settings | File Templates.
 */
package org.strym.osmf.plugins.wowzabalancing {
import org.osmf.elements.VideoElement;
import org.osmf.media.MediaResourceBase;
import org.osmf.net.NetLoader;

public class WowzaBalancingVideoElement extends VideoElement {
    public function WowzaBalancingVideoElement(resource:MediaResourceBase = null, loader:NetLoader = null) {
        super(resource, loader);
    }
}
}
