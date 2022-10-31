//
//  ONIXButton.swift
//  onixtest
//
//  Created by Jonathan Macías on 29/10/22.
//

import UIKit
import ONIXAssets

public class ONIXButton {
    public static func personalizeButtonEnable(_ button: UIButton, withSizeFont size: Float, withBold bold: Bool, title: String) {
        button.titleLabel?.text = title
        button.layer.cornerRadius = 30.0
        button.titleLabel?.textColor = .white
        button.backgroundColor = .primaryColor
        button.isEnabled = true
    }
    
    public static func personalizeSecundaryButtonEnable(_ button: UIButton, withSizeFont size: Float, withBold bold: Bool, title: String) {
        button.titleLabel?.text = title
        button.titleLabel?.textColor = .gray
        button.backgroundColor = .transparent
        button.isEnabled = true
    }
}
