//
//  CarouselPermissonView.swift
//  ONIXUIKit
//
//  Created by Jonathan Macías on 30/10/22.
//

import UIKit

public protocol CarouselPermissonViewDelegate {
    func didTapPrimaryButton()
    func didTapSecondaryButton()
}

public class CarouselPermissonView: UIView {

    // MARK: - OULETS
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var secondaryButton: UIButton!
    
    // MARK: - PROPIEDADES
    public var delegate: CarouselPermissonViewDelegate?
    var viewContent: UIView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        //initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initView() {
        viewContent = loadViewFromNib()
        addSubview(viewContent)
    }
    
    public func setup(image: UIImage?, title: String, subtitle: String, titlePrimaryButton: String, titleSecondaryButton: String) {
        imageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
        /*primaryButton.setTitle(titlePrimaryButton, for: .normal)
        primaryButton.backgroundColor = .primaryColor
        primaryButton.setTitleColor(.white, for: .normal)
        */
        ONIXButton.personalizeButtonEnable(primaryButton, withSizeFont: 20.0, withBold: false, title: titlePrimaryButton)
        ONIXButton.personalizeSecundaryButtonEnable(secondaryButton, withSizeFont: 20.0, withBold: false, title: titleSecondaryButton)        
    }
    
    @IBAction func primaryActionButton(_ sender: Any) {
        guard let delegate = delegate else {
            return
        }
        delegate.didTapPrimaryButton()
    }
    @IBAction func secondaryActionButton(_ sender: Any) {
        guard let delegate = delegate else {
            return
        }
        delegate.didTapSecondaryButton()
    }
    
    public func loadViewFromNib() -> UIView? {
        let bundleName = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CarouselPermissonView", bundle: bundleName)
        guard let contentView = nib.instantiate(withOwner: nil, options: nil).first as? UIView else {
            return nil
        }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return contentView
        
    }
}
