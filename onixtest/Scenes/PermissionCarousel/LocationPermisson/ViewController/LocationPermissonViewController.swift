//
//  LocationPermissonViewController.swift
//  onixtest
//
//  Created by Jonathan Macías on 30/10/22.
//

import UIKit
import ONIXUIKit

class LocationPermissonViewController: UIViewController {
    
    // MARK: OULETS
    @IBOutlet weak var contentView: UIView!
    
    
    // MARK: - PROPIEDADES
    var viewModel: LocationPermissonViewModel?

    // MARK: - CICLO DE VIDA
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
    func setup() {
        self.navigationController?.isNavigationBarHidden = true
        let viewCarousel = CarouselPermissonView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)).loadViewFromNib() as! CarouselPermissonView
        viewCarousel.setup(image: .locationPermisson, title: "Enable location services", subtitle: "We wants to access your location only to provide a better experience by helping you find new friends nearby.", titlePrimaryButton: "Enable", titleSecondaryButton: "Cancel")
        viewCarousel.delegate = self
        contentView.addSubview(viewCarousel)
    }

}

extension LocationPermissonViewController: CarouselPermissonViewDelegate {
    func didTapPrimaryButton() {
        let isLocationPermisson = viewModel?.verifyLocationPermisson()
        if isLocationPermisson ?? false {
            print("Ya tiene permisos")
        } else {
            viewModel?.router?.route(route: .posts, context: self)
            print("No tiene permisos")
        }
    }
    
    func didTapSecondaryButton() {
        
    }
}
