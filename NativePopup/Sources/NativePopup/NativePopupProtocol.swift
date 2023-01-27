//
//  NativePopupProtocol.swift
//  
//
//  Created by sungwoo.yeo on 2023/01/27.
//

import Foundation

@objc public protocol NativePopupProtocol: AnyObject {
    @objc func OnOK()
    @objc func OnCancel()
}
