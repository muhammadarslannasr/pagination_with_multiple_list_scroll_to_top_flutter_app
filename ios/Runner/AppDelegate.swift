import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let controller = FlutterViewController()
    
      let channel = FlutterMethodChannel(name: "com.example/native",binaryMessenger: controller.binaryMessenger)
      
      channel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          
          let methodName: String = call.method
          
          if(methodName == "getNativeData"){
              result("Hello from iOS Native Code!")
          }
      })
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
