//
//  HeroHeaderUIView.swift
//  Netflix
//
//  Created by Paweł Brzozowski on 16/02/2022.
//

import UIKit

class HeroHeaderUIView: UIView {

    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true // Avoid overflow
        imageView.image = UIImage(named: "moviePoster")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        // Add gradient to the View
        layer.addSublayer(gradientLayer)
    }
    
    private func applyConstraints() {
        let playButtonConstraintes = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(playButtonConstraintes)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add image to the View
        addSubview(heroImageView)
        
        // Apply gradient
        addGradient()
        
        // Add play button
        addSubview(playButton)
        
        // Apply constarints
        applyConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
