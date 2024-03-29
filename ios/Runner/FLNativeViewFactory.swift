import Foundation
import Flutter
import UIKit

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    init(_ messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }
    
    func createNativeView(view _view: UIView){
            _view.backgroundColor = UIColor.red
            let nativeLabel = UILabel()
            nativeLabel.text = "Native text from iOS"
            nativeLabel.textColor = UIColor.white
            nativeLabel.textAlignment = .center
            nativeLabel.frame = CGRect(x: 120, y: 70, width: 200, height: 40)
            _view.addSubview(nativeLabel)
        }
    
    
}


