//
//  PermisonCarouselViewModel.swift
//  onixtest
//
//  Created by Jonathan Macías on 29/10/22.
//

import Foundation
import AVFoundation

class CameraPermissonViewModel {
    
    var router: CameraPermissonRouter?
    
    init() {
        router = CameraPermissonRouter(viewModel: self)
    }
    
    func verifyAuthorizationCamera(completionHandler: @escaping(Bool) -> Void) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
            completionHandler(true)
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        completionHandler(true)
                    } else {
                        completionHandler(false)
                    }
                }
            
            case .denied:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    completionHandler(true)
                } else {
                    completionHandler(false)
                }
            }
            case .restricted: // The user can't grant access due to restrictions.
                completionHandler(false)
        }
    }
}
