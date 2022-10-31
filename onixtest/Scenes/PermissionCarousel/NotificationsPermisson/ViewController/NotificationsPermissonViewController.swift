//
//  NotificationsPermissonViewController.swift
//  onixtest
//
//  Created by Jonathan Macías on 30/10/22.
//

import UIKit
import ONIXUIKit

class NotificationsPermissonViewController: UIViewController {
    
    // MARK: - OULETS
    @IBOutlet weak var contentView: UIView!
    
    
    // MARK: - PROPIEDADES
    var viewModel: NotificationsPermissonViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
    func setup() {
        self.navigationController?.isNavigationBarHidden = true
        let viewCarousel = CarouselPermissonView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)).loadViewFromNib() as! CarouselPermissonView
        viewCarousel.setup(image: .notificationsPermisson, title: "Enable push notifications", subtitle: "Enable push notifications to let send you personal news and updates.", titlePrimaryButton: "Enable", titleSecondaryButton: "Cancel")
        viewCarousel.delegate = self
        contentView.addSubview(viewCarousel)
    }
}

extension NotificationsPermissonViewController: CarouselPermissonViewDelegate {
    func didTapPrimaryButton() {
        viewModel?.verifyNotifiactionsPermisson(completionHandler: { [weak self] result in
            guard let self = self else { return }
            if result {
                DispatchQueue.main.async {
                    self.viewModel?.router?.route(route: .locationPermisson, context: self)
                }
            } else {
                print("No tiene permisos")
            }
        })
    }
    
    func didTapSecondaryButton() {
        self.viewModel?.router?.route(route: .locationPermisson, context: self)
    }
    
    
}
