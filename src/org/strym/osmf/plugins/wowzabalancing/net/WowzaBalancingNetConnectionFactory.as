/**
 * Created with IntelliJ IDEA.
 * User: mexxik
 * Date: 10/5/12
 * Time: 3:24 PM
 * To change this template use File | Settings | File Templates.
 */
package org.strym.osmf.plugins.wowzabalancing.net {
import flash.events.NetStatusEvent;
import flash.net.NetConnection;
import flash.net.NetStreamInfo;

import org.osmf.events.NetConnectionFactoryEvent;
import org.osmf.media.MediaResourceBase;
import org.osmf.media.URLResource;
import org.osmf.net.FMSURL;
import org.osmf.net.NetConnectionCodes;
import org.osmf.net.NetConnectionFactory;
import org.osmf.net.NetNegotiator;
import org.osmf.net.StreamType;
import org.osmf.net.StreamingURLResource;

public class WowzaBalancingNetConnectionFactory extends NetConnectionFactory {

    private var _netConnection:NetConnection;
    private var _resource:URLResource;
    private var _fmsUrl:FMSURL;

    public function WowzaBalancingNetConnectionFactory() {
        addEventListener(NetConnectionFactoryEvent.CREATION_ERROR, creationErrorHandler);

        super();
    }


    override public function create(resource:URLResource):void {
        _resource = resource;
        _fmsUrl = new FMSURL(resource.url);

        _netConnection = new NetConnection();
        _netConnection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);

        _netConnection.connect(_fmsUrl.protocol + "://" + _fmsUrl.host + "/" + _fmsUrl.appName);

        //super.create(resource);
    }

    protected function netStatusHandler(event:NetStatusEvent):void {
        switch (event.info.code) {
            case NetConnectionCodes.CONNECT_SUCCESS:
                var successEvent:NetConnectionFactoryEvent = new NetConnectionFactoryEvent(NetConnectionFactoryEvent.CREATION_COMPLETE,
                                                            false,
                                                            false,
                                                            _netConnection,
                                                            _resource);

                dispatchEvent(successEvent);
                break;

            case NetConnectionCodes.CONNECT_REJECTED:
                if (event.info.hasOwnProperty("ex")) {
                    var ex:Object = event.info.ex;

                    if (_resource is StreamingURLResource) {
                        _resource.url = ex.redirect + "/" + _fmsUrl.streamName;

                        create(_resource);
                    }

                }
                else {

                }
                break;
        }
    }


    protected function creationErrorHandler(event:NetConnectionFactoryEvent):void {
    }




}
}
