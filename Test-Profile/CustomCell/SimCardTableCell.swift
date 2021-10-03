//
//  SimCardTableCell.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 10/1/21.
//

import UIKit

class SimCardTableCell: UITableViewCell {
    
    static let reuseID = "cell"
    
    let avatarImage     = PersonImage(frame: .zero)
    let usernameLabel   = UILabel()
    let activateButton  = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setdata(people: People) {
        
        usernameLabel.text = people.login
        avatarImage.dowloadImage(from: people.avatarUrl)
        activateButton.setTitle("Смотреть", for: .normal)

    }
    
    
    private func configure() {
        
        addSubview(avatarImage)
        addSubview(usernameLabel)
        addSubview(activateButton)
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints  = false
        activateButton.translatesAutoresizingMaskIntoConstraints = false
        
        usernameLabel.textAlignment         = .left
        activateButton.layer.cornerRadius   = 5
        activateButton.titleLabel?.font     = UIFont.systemFont(ofSize: 14)
        activateButton.backgroundColor      = .systemYellow
        avatarImage.tintColor               = .systemYellow

        
        NSLayoutConstraint.activate([
            
            avatarImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            avatarImage.heightAnchor.constraint(equalToConstant: 50),
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 24),
            usernameLabel.widthAnchor.constraint(equalToConstant: 150),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            activateButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            activateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            activateButton.widthAnchor.constraint(equalToConstant: 100),
            activateButton.heightAnchor.constraint(equalToConstant: 30)

        ])
    }
}
