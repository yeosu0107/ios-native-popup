import UIKit
import SwiftUI
import Foundation

private func getRootViewController() -> UIViewController? {
    //let window = UIWindow(frame: UIScreen.main.bounds)
    //let rootViewController = window.rootViewController

    let rootViewController = UIApplication.shared.windows.first?.rootViewController
    
    return rootViewController
}

private func showAlert(alertInfo: AlertInfo) -> some View {
    let alertView = AlertView()
    alertView.showAlert(alertInfo: alertInfo)
    
    return alertView
}

@_cdecl("justPrint")
public func justPrint(message: String) -> String {
    let copyMsg = "justPrint: " + message
    print(copyMsg)
    return copyMsg
}

@_cdecl("showAlert_oneBtn")
public func showAlertOneBtn(title: String, message: String, okBtn: String?) {
    let rootViewController = getRootViewController()
    if rootViewController == nil {
        print("rootViewController is nil")
        return
    }
    
    let alertView = showAlert(alertInfo: AlertInfo(alertType: .onebtn, title: title, message: message, okBtn: okBtn, cancelBtn: nil))
    let uiHostController = UIHostingController(rootView: alertView.edgesIgnoringSafeArea(.all))
    uiHostController.view.backgroundColor = .clear
    uiHostController.modalPresentationStyle = .overCurrentContext
    uiHostController.modalTransitionStyle = .crossDissolve
    NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "dismissModal"), object: nil, queue: nil) { [weak uiHostController] _ in
        uiHostController?.dismiss(animated: true, completion: nil)
    }
    
    rootViewController?.present(uiHostController, animated: true)
}

@_cdecl("showAlert_twoBtn")
public func showAlertTwoBtn(title: String, message: String, okBtn: String?, cancelBtn: String?) {
    let rootViewController = getRootViewController()
    if rootViewController == nil {
        print("rootViewController is nil")
        return
    }
    
    let alertView = showAlert(alertInfo: AlertInfo(alertType: .twobtn, title: title, message: message, okBtn: okBtn, cancelBtn: nil))
    let uiHostController = UIHostingController(rootView: alertView.edgesIgnoringSafeArea(.all))
    uiHostController.view.backgroundColor = .clear
    uiHostController.modalPresentationStyle = .overCurrentContext
    uiHostController.modalTransitionStyle = .crossDissolve
    NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "dismissModal"), object: nil, queue: nil) { [weak uiHostController] _ in
        uiHostController?.dismiss(animated: true, completion: nil)
    }
    
    rootViewController?.present(uiHostController, animated: true)
}


