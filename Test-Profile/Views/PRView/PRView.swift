//
//  PRView.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 10/2/21.
//

import UIKit

class PRView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
 
    }
}
