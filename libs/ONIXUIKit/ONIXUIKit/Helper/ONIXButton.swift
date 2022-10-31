//
//  ONIXButton.swift
//  ONIXUIKit
//
//  Created by Jonathan Macías on 29/10/22.
//

import UIKit

public class ONIXButton: NSObject {
    public static func personalizeButtonEnable(_ button: UIButton, withSizeFont size: Float, withBold bold: Bool, title: String) {
        button.titleLabel?.text = title
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = .white
        button.setTitleColor(.white, for: .normal)
        button.applyGradient(colours: [.primaryColor, .secundaryColor])
        button.isEnabled = true
    }
    
    public static func personalizeSecundaryButtonEnable(_ button: UIButton, withSizeFont size: Float, withBold bold: Bool, title: String) {
        button.titleLabel?.text = title
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = .gray
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .transparent
        button.isEnabled = true
    }
}

extension UIButton {
    func applyGradient(colours: [UIColor]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.colors = colours.map { $0.cgColor }
        gradient.cornerRadius = 25.0
        self.layer.insertSublayer(gradient, at: 0)
    }
}
