//
//  PRLabel.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 10/2/21.
//

import UIKit

class PRLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    


}
