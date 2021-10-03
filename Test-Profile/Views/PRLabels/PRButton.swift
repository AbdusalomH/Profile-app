//
//  PRButton.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 10/2/21.
//

import UIKit

class PRButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
        translatesAutoresizingMaskIntoConstraints     = false
        
        layer.cornerRadius                            = 10
        layer.shadowRadius                            = 5
        layer.shadowOpacity                           = 0.2
        layer.shadowOffset                            = CGSize(width: 1, height: 2)
        clipsToBounds                                 = false
 
    }

}
