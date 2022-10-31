//
//  PermisonCarouselViewController.swift
//  onixtest
//
//  Created by Jonathan Macías on 29/10/22.
//

import UIKit
import ONIXAssets
import ONIXUIKit

class CameraPermissonViewController: UIViewController {
    
    // MARK: - OULETS
    @IBOutlet weak var contentView: UIView!
    
    
    // MARK: - PROPIEDADES
    var viewModel: CameraPermissonViewModel?

    // MARK: - CICLO DE VIDA
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
    func setup() {
        let viewCarousel = CarouselPermissonView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)).loadViewFromNib() as! CarouselPermissonView
        viewCarousel.setup(image: .cameraPermisson, title: "Camera Access", subtitle: "Please allow access to your camera to take photos", titlePrimaryButton: "Allow", titleSecondaryButton: "Cancel")
        viewCarousel.delegate = self
        contentView.addSubview(viewCarousel)
    }
    
    // MARK: - ACTIONS
    
}

extension CameraPermissonViewController: CarouselPermissonViewDelegate {
    func didTapPrimaryButton() {
        viewModel?.verifyAuthorizationCamera(completionHandler: { [weak self] result in
            guard let self = self else { return }
            if result {
                DispatchQueue.main.async {
                    self.viewModel?.router?.route(route: .notificationsPermisson, context: self)
                }
            } else {
                print("No tiene permisos")
            }
        })
    }
    
    func didTapSecondaryButton() {
        self.viewModel?.router?.route(route: .notificationsPermisson, context: self)
    }
}
