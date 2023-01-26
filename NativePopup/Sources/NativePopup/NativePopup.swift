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
    let alertView = AlertView(alertInfo: alertInfo)
    return alertView
}

private func unsafePtrToString(input: UnsafePointer<CChar>) -> String {
    if let str = String(validatingUTF8: input) {
        return str
    } else {
        return ""
    }
}

@_cdecl("justPrint")
public func justPrint(message: UnsafePointer<CChar>) {
    let msg = unsafePtrToString(input: message)
    print("justPrint: " + msg)
}

@_cdecl("showAlert_oneBtn")
public func showAlertOneBtn(title: UnsafePointer<CChar>, message: UnsafePointer<CChar>, okBtn: UnsafePointer<CChar>) {
    
    let titleStr = unsafePtrToString(input: title)
    let messageStr = unsafePtrToString(input: message)
    let okBtnStr = unsafePtrToString(input: okBtn)
    
    
    let rootViewController = getRootViewController()
    if rootViewController == nil {
        print("rootViewController is nil")
        return
    }
    
    let alertView = showAlert(alertInfo: AlertInfo(alertType: .onebtn, title: titleStr, message: messageStr, okBtn: okBtnStr, cancelBtn: nil))
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
public func showAlertTwoBtn(title: UnsafePointer<CChar>, message: UnsafePointer<CChar>, okBtn: UnsafePointer<CChar>, cancelBtn: UnsafePointer<CChar>) {
    
    let titleStr = unsafePtrToString(input: title)
    let messageStr = unsafePtrToString(input: message)
    let okBtnStr = unsafePtrToString(input: okBtn)
    let cancelBtnStr = unsafePtrToString(input: cancelBtn)
    
    let rootViewController = getRootViewController()
    if rootViewController == nil {
        print("rootViewController is nil")
        return
    }
    
    let alertView = showAlert(alertInfo: AlertInfo(alertType: .twobtn, title: titleStr, message: messageStr, okBtn: okBtnStr, cancelBtn: cancelBtnStr))
    let uiHostController = UIHostingController(rootView: alertView.edgesIgnoringSafeArea(.all))
    uiHostController.view.backgroundColor = .clear
    uiHostController.modalPresentationStyle = .overCurrentContext
    uiHostController.modalTransitionStyle = .crossDissolve
    NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "dismissModal"), object: nil, queue: nil) { [weak uiHostController] _ in
        uiHostController?.dismiss(animated: true, completion: nil)
    }
    
    rootViewController?.present(uiHostController, animated: true)
}


