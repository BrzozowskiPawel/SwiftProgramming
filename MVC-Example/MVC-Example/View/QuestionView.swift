//
//  QuestionView.swift
//  MVC-Example
//
//  Created by Paweł Brzozowski on 20/01/2022.
//

import UIKit

class QuestionView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var questiontextLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        // Loading from created QuestionView.xib
        Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)
        
        // Add content view to main view
        addSubview(contentView)
        
        // ContetntView will take whole space of view
        contentView.frame = self.bounds
        
        // autoresizing
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
}
