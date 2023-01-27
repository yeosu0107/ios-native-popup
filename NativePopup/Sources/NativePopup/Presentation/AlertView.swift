//
//  AlertView.swift
//  
//
//  Created by sungwoo.yeo on 2023/01/19.
//

import SwiftUI

struct AlertView: View {
    @ObservedObject private var alertViewModel: AlertViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    init(alertInfo: AlertInfo, delegate: NativePopupProtocol?) {
        alertViewModel = AlertViewModel()
        alertViewModel.showAlert(alertInfo: alertInfo, delegate: delegate)
    }
    
    var body: some View {
        EmptyView()
            .alert(isPresented: $alertViewModel.showAlertFlag) {
                if alertViewModel.alertInfo.alertType == AlertType.onebtn {
                    return Alert(title: Text(alertViewModel.alertInfo.title), message: Text(alertViewModel.alertInfo.message), dismissButton: .default(Text(alertViewModel.alertInfo.okBtn ?? "OK")) {
                        alertViewModel.onOk()
                        alertViewModel.dismissAlert()
                    })
                } else {
                    return Alert(title: Text(alertViewModel.alertInfo.title), message: Text(alertViewModel.alertInfo.message), primaryButton: .default(Text(alertViewModel.alertInfo.okBtn ?? "OK")) {
                        alertViewModel.onOk()
                        alertViewModel.dismissAlert()
                    }, secondaryButton: .cancel(Text(alertViewModel.alertInfo.cancelBtn ?? "CANCEL")) {
                        alertViewModel.onCancel()
                        alertViewModel.dismissAlert()
                    })
                }
            }
            .onReceive(alertViewModel.viewDismissPublisher) { shouldDismiss in
                if shouldDismiss {
                    self.presentationMode.wrappedValue.dismiss()
                    NotificationCenter.default.post(name: NSNotification.Name("dismissModal"), object: nil)
                }
            }
    }
}

/*
struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
*/
