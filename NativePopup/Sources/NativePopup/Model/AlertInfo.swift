//
//  AlertInfo.swift
//  
//
//  Created by sungwoo.yeo on 2023/01/19.
//

import Foundation

enum AlertType {
    case onebtn
    case twobtn
}

struct AlertInfo {
    let alertType: AlertType
    let title: String
    let message: String
    let okBtn: String?
    let cancelBtn: String?
}

extension AlertInfo {
    static var empty: AlertInfo = AlertInfo(alertType: .onebtn, title: "Error", message: "An unknown error has occurred.", okBtn: "ok", cancelBtn: nil)
}
