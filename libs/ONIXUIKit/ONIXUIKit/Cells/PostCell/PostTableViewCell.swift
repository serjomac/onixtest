//
//  PostTableViewCell.swift
//  ONIXUIKit
//
//  Created by Jonathan Macías on 30/10/22.
//

import UIKit
import ONIXAssets

public class PostTableViewCell: UITableViewCell {
    
    // MARK: - OULETS
    @IBOutlet weak var postImageVew: UIView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var postName: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var comentsCountLabel: UILabel!
    
    
    // MARK: - PROPIEDADES
    public static let cellId = "PostTableViewCell"
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setupViewContent()
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public static func getNib() -> UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: cellId, bundle: bundle)
    }
    
    func setupViewContent() {
        postImageVew.layer.shadowColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        postImageVew.layer.shadowOpacity = 0.5
        postImageVew.layer.shadowOffset = .zero
        postImageVew.layer.shadowRadius = 5
        postImageVew.layer.cornerRadius = 10.0
    }
    
    public func setupCell(postName: String, postDescription: String, authorName: String, urlImage: String, commentsCount: String) {
        self.postName.text = postName
        postDescriptionLabel.text = postName
        authorNameLabel.text = authorName
        comentsCountLabel.text = commentsCount
        postImage.image = .postPlaceholderImage
        //postImage.loadFrom(URLAddress: urlImage)
    }
    
}
