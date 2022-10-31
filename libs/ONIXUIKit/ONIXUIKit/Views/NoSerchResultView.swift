//
//  NoSerchResultView.swift
//  ONIXUIKit
//
//  Created by Jonathan Macías on 31/10/22.
//

import UIKit
import ONIXAssets

public class NoSerchResultView: UIView {
    
    // MARK: - OULETS
    @IBOutlet weak var imageView: UIImageView!
    var viewContent: UIView!

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func loadViewFromNib() -> UIView? {
        let bundleName = Bundle(for: type(of: self))
        let nib = UINib(nibName: "NoSearchResultView", bundle: bundleName)
        guard let contentView = nib.instantiate(withOwner: nil, options: nil).first as? UIView else {
            return nil
        }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return contentView
        
    }
    
    public func setupImage(image: UIImage) {
        imageView.image = image
    }

}
