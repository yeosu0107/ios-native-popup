//
//  NativePopupManager.swift
//  
//
//  Created by sungwoo.yeo on 2023/01/27.
//

import UIKit
import SwiftUI
import Foundation

public class NativePopupManager: NSObject {
    private func getRootViewController() -> UIViewController? {
        let rootViewController = UIApplication.shared.windows.first?.rootViewController
        
        return rootViewController
    }
    
    private func getAlertView(alertInfo: AlertInfo, delegate: NativePopupProtocol?) -> some View {
        let alertView = AlertView(alertInfo: alertInfo, delegate: delegate)
        return alertView
    }
    
    private func showAlertView(alertType: AlertType,title: String, message: String, ok: String?, cancel: String?, delegate: NativePopupProtocol?) {
        let rootViewController = getRootViewController()
        if rootViewController == nil {
            print("rootViewController is nil")
            return
        }
        
        let alertView = getAlertView(alertInfo: AlertInfo(alertType: alertType , title: title, message: message, okBtn: ok, cancelBtn: cancel), delegate: delegate)
        let uiHostController = UIHostingController(rootView: alertView.edgesIgnoringSafeArea(.all))
        uiHostController.view.backgroundColor = .clear
        uiHostController.modalPresentationStyle = .overCurrentContext
        uiHostController.modalTransitionStyle = .crossDissolve
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "dismissModal"), object: nil, queue: nil) { [weak uiHostController] _ in
            uiHostController?.dismiss(animated: true, completion: nil)
        }

        rootViewController?.present(uiHostController, animated: true)
    }
    
    public func showAlert(title: String, message: String, ok: String?, delegate: NativePopupProtocol?) {
        self.showAlertView(alertType: AlertType.onebtn, title: title, message: message, ok: ok, cancel: nil, delegate: delegate)
    }
    
    public func showAlert(title: String, message: String, ok: String?, cancel: String?, delegate: NativePopupProtocol?) {
        self.showAlertView(alertType: AlertType.twobtn, title: title, message: message, ok: ok, cancel: cancel, delegate: delegate)
    }
    
    public func showToast(message: String, duration: Double) {
        print("not support yet")
    }
}
