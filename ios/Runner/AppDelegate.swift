import UIKit
import Flutter
import Firebase
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate:  FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyB_kIX5UrOzY9KC14LVNRAIsZCkx3xBXeA")
    FirebaseApp.configure()
    	if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
