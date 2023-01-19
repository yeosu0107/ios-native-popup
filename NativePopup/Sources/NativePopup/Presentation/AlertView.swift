//
//  AlertView.swift
//  
//
//  Created by sungwoo.yeo on 2023/01/19.
//

import SwiftUI

struct AlertView: View {
    @State private var showAlert = false
    @State private var alertInfo = AlertInfo.empty
    
    var body: some View {
        EmptyView()
            .alert(isPresented: $showAlert) {
                if alertInfo.alertType == AlertType.onebtn {
                    return Alert(title: Text(alertInfo.title), message: Text(alertInfo.message), dismissButton: .default(Text(alertInfo.okBtn ?? "OK")) {
                        print("ok1!!!!")
                    })
                } else {
                    return Alert(title: Text(alertInfo.title), message: Text(alertInfo.message), primaryButton: .default(Text(alertInfo.okBtn ?? "OK")) {
                        print("ok2!!!!")
                    }, secondaryButton: .cancel(Text(alertInfo.cancelBtn ?? "CANCEL")) {
                        print("cancel!!!!")
                    })
                }
            }
    }
}

extension AlertView {
    func showAlert(alertInfo: AlertInfo) {
        self.alertInfo = alertInfo
        self.showAlert = true
    }
}

/*
struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
*/
