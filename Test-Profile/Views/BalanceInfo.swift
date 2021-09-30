//
//  BalanceInfo.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/29/21.
//

import UIKit

enum ItemInfoType {
    case min, gigabait, sms
}

class BalanceInfo: UILabel {
    
    let titleLabel      = UILabel()
    let countLabel      = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
        addSubview(titleLabel)
        addSubview(countLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textAlignment = .center
        countLabel.textAlignment = .center
        

        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        countLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        NSLayoutConstraint.activate([

            countLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            countLabel.heightAnchor.constraint(equalToConstant: 24),
            countLabel.widthAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.widthAnchor.constraint(equalToConstant: 80)

        ])
    }
    
    func setItemInfoType(IteminfoType: ItemInfoType, withCount count: Int) {
        
        switch  IteminfoType {
        case .min:
            titleLabel.text       = "Минута"
        case .gigabait:
            titleLabel.text       = "Гигабайт"
        case .sms:
            titleLabel.text       = "SMS"
        }
        countLabel.text           = String(count)
    }
}

