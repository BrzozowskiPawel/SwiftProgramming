//
//  PageCell.swift
//  AutoLayoutProgrammatically
//
//  Created by Paweł Brzozowski on 19/01/2022.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard page != nil else {
                return
            }
            print(page?.imageName)
            bearImageView.image = UIImage(named: page!.imageName)
            let attributedText = NSMutableAttributedString(string: page!.headerText, attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSMutableAttributedString(string: "\n\n\nAre your ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTestView.attributedText = attributedText
            descriptionTestView.textAlignment = .center
        }
    }
    
    private let bearImageView: UIImageView = {
        let bearImg = UIImage(named: "bear_first")
        let imageView = UIImageView(image: bearImg)
        imageView.contentMode = .scaleAspectFit
        // enable autolayou for imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let descriptionTestView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSMutableAttributedString(string: "\n\n\nAre your ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        
//        textView.text = "Join us today in our fun and games!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        
        // Disable keybaord on tap
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        // Endable autolayout
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    
    private func setUpLayout() {
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor, constant: 0).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTestView)
        descriptionTestView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTestView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTestView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTestView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}
