import UIKit
import SwiftUI
import Foundation


private func showAlert(alertInfo: AlertInfo) -> some View {
    let alertView = AlertView()
    alertView.showAlert(alertInfo: alertInfo)
    
    return alertView
}

@_cdecl("justPrint")
public func justPrint(message: String) {
    print(message)
}

@_cdecl("showAlert_oneBtn")
public func showAlert(title: String, message: String, okBtn: String?) -> UIViewController {
    let alertView = showAlert(alertInfo: AlertInfo(alertType: .onebtn, title: title, message: message, okBtn: okBtn, cancelBtn: nil))
    let uiHostController = UIHostingController(rootView: alertView.edgesIgnoringSafeArea(.all))
    uiHostController.view.backgroundColor = .clear
    uiHostController.modalPresentationStyle = .overCurrentContext
    uiHostController.modalTransitionStyle = .crossDissolve
    NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "dismissModal"), object: nil, queue: nil) { [weak uiHostController] _ in
        uiHostController?.dismiss(animated: true, completion: nil)
    }
    return uiHostController
}

@_cdecl("showAlert_twoBtn")
public func showAlert(title: String, message: String, okBtn: String?, cancelBtn: String?) -> UIViewController {
    let alertView = showAlert(alertInfo: AlertInfo(alertType: .twobtn, title: title, message: message, okBtn: okBtn, cancelBtn: nil))
    let uiHostController = UIHostingController(rootView: alertView.edgesIgnoringSafeArea(.all))
    uiHostController.view.backgroundColor = .clear
    uiHostController.modalPresentationStyle = .overCurrentContext
    uiHostController.modalTransitionStyle = .crossDissolve
    NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "dismissModal"), object: nil, queue: nil) { [weak uiHostController] _ in
        uiHostController?.dismiss(animated: true, completion: nil)
    }
    return uiHostController
}


