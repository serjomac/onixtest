//
//  Images.swift
//  ONIXAssets
//
//  Created by Jonathan Macías on 29/10/22.
//

import UIKit

public extension UIImage {
    static var cameraPermisson: UIImage {
        .imageFromLocalBundle(named: "camera_permisson")
    }
    static var locationPermisson: UIImage {
        .imageFromLocalBundle(named: "location_permisson")
    }
    static var notificationsPermisson: UIImage {
        .imageFromLocalBundle(named: "notifications_permisson")
    }
    static var postPlaceholderImage: UIImage {
        .imageFromLocalBundle(named: "post_image")
    }
    static var noSearchResult: UIImage {
        .imageFromLocalBundle(named: "no_search_result")
    }
}

public extension UIColor {
    static var primaryColor: UIColor {
        colorFromLocalBundle(named: "primary-color")
    }
    static var secundaryColor: UIColor {
        .colorFromLocalBundle(named: "secundary-color")
    }
    static var grey: UIColor {
        .colorFromLocalBundle(named: "grey")
    }
    static var transparent: UIColor {
        .colorFromLocalBundle(named: "transparent")
    }
}
