//
//  AlertViewModel.swift
//  NativePopup
//
//  Created by sungwoo.yeo on 2023/01/26.
//

import Foundation
import Combine

class AlertViewModel: ObservableObject {
    @Published var showAlertFlag = false
    @Published var alertInfo = AlertInfo.empty
    var delegate: NativePopupProtocol?
    
    var viewDismissPublisher = PassthroughSubject<Bool, Never>()
    
    private var shouldDismissView = false {
        didSet {
            viewDismissPublisher.send(shouldDismissView)
        }
    }
    
    private func dismissView() {
        DispatchQueue.main.async {
            self.showAlertFlag = false
            self.shouldDismissView = true
        }
    }
    
    func showAlert(alertInfo: AlertInfo, delegate: NativePopupProtocol?) {
        self.alertInfo = alertInfo
        self.showAlertFlag = true
        self.delegate = delegate
    }
    
    func dismissAlert() {
        dismissView()
    }
    
    func onOk() {
        delegate?.OnOK()
    }
    
    func onCancel() {
        delegate?.OnCancel()
    }
}
