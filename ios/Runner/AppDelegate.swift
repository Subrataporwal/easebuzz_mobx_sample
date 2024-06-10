import UIKit
import Flutter
import Easebuzz

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, PayWithEasebuzzCallback {
    var payResult: FlutterResult!
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Ensure Flutter plugins are registered
        GeneratedPluginRegistrant.register(with: self)
        
        // Initialize Flutter method channel
        self.initializeFlutterChannelMethod()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    // Initialize Flutter channel
    func initializeFlutterChannelMethod() {
        guard let controller = window?.rootViewController as? FlutterViewController else {
            fatalError("rootViewController is not type FlutterViewController")
        }

        let methodChannel = FlutterMethodChannel(name: "easebuzz", binaryMessenger: controller.binaryMessenger)
        
        methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            guard call.method == "payWithEasebuzz" else {
                result(FlutterMethodNotImplemented)
                return
            }
            
            self?.payResult = result
            self?.initiatePaymentAction(call: call)
        }
    }
    
    // Initiate payment action and call payment gateway
    func initiatePaymentAction(call: FlutterMethodCall) {
        if let orderDetails = call.arguments as? [String: String] {
            let payment = Payment(customerData: orderDetails)
            let paymentValid = payment.isValid().validity
            
            if !paymentValid {
                let errorResponse = setErrorResponseDictError("Invalid records", errorMessage: "Invalid order details", result: "Invalid request")
                self.payResult(errorResponse)
            } else {
                PayWithEasebuzz.setUp(pebCallback: self)
                PayWithEasebuzz.invokePaymentOptionsView(paymentObj: payment, isFrom: self)
            }
        } else {
            // Handle error
            let errorResponse = setErrorResponseDictError("Empty error", errorMessage: "Invalid validation", result: "Invalid request")
            self.payResult(errorResponse)
        }
    }
    
    // Payment callback to handle response
    func PEBCallback(data: [String: AnyObject]) {
        DispatchQueue.main.async {
            if data.count > 0 {
                self.payResult(data)
            } else {
                let errorResponse = self.setErrorResponseDictError("Empty error", errorMessage: "Empty payment response", result: "payment_failed")
                self.payResult(errorResponse)
            }
        }
    }
    
    // Create error response dictionary when something goes wrong
    func setErrorResponseDictError(_ error: String?, errorMessage: String?, result: String?) -> [AnyHashable: Any] {
        var dict: [AnyHashable: Any] = [:]
        var dictChild: [AnyHashable: Any] = [:]
        dictChild["error"] = "\(error ?? "")"
        dictChild["error_msg"] = "\(errorMessage ?? "")"
        dict["result"] = "\(result ?? "")"
        dict["payment_response"] = dictChild
        return dict
    }
}
