//
//  menuCell.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/28/21.
//

import UIKit

class menuCell: UICollectionViewCell {
    
    static let reuseID = "menuCell"
    
    let balanceText     = UILabel()
    let balanceImage    = UIImageView()
    let curentBalance   = UILabel()
    let details         = UIButton()
    let addMoney        = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setData() {
        details.setTitle("Подробнее", for: .normal)
        addMoney.setTitle("Купить", for: .normal)
    }
    


    
    private func configure() {
        
        addSubview(balanceText)
        addSubview(curentBalance)
        addSubview(details)
        addSubview(addMoney)
        addSubview(balanceImage)
        
        balanceText.translatesAutoresizingMaskIntoConstraints   = false
        curentBalance.translatesAutoresizingMaskIntoConstraints = false
        details.translatesAutoresizingMaskIntoConstraints       = false
        addMoney.translatesAutoresizingMaskIntoConstraints      = false
        balanceImage.translatesAutoresizingMaskIntoConstraints  = false
        
        balanceImage.image             = UIImage(systemName: "slider.vertical.3")
    
        balanceText.sizeToFit()
        curentBalance.font             = UIFont.boldSystemFont(ofSize: 24)
        
        addMoney.setTitleColor(UIColor.black, for: .normal)
        addMoney.titleLabel?.font      = UIFont.systemFont(ofSize: 18, weight: .medium)
        addMoney.layer.cornerRadius    = 10
        addMoney.backgroundColor       = UIColor.white

        details.setTitleColor(UIColor.black, for: .normal)
        details.titleLabel?.font       = UIFont.systemFont(ofSize: 16)
        details.layer.cornerRadius     = 10
        details.backgroundColor        = UIColor.white
        
        backgroundColor                = .systemYellow
        
        layer.cornerRadius             = 20
        layer.shadowRadius             = 6
        layer.shadowOpacity            = 0.2
        layer.shadowOffset             = CGSize(width: 2, height: 2)
        clipsToBounds                  = false

        NSLayoutConstraint.activate([
        
            balanceText.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            balanceText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            balanceText.heightAnchor.constraint(equalToConstant: 30),
            balanceText.widthAnchor.constraint(equalToConstant: 150),
            
            balanceImage.centerYAnchor.constraint(equalTo: balanceText.centerYAnchor),
            balanceImage.leadingAnchor.constraint(equalTo: balanceText.trailingAnchor, constant: 5),
            balanceImage.heightAnchor.constraint(equalToConstant: 20),
            balanceImage.widthAnchor.constraint(equalToConstant: 20),
            
            curentBalance.topAnchor.constraint(equalTo: balanceText.bottomAnchor, constant: 30),
            curentBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            curentBalance.heightAnchor.constraint(equalToConstant: 30),
            curentBalance.widthAnchor.constraint(equalToConstant: 150),
            
            details.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            details.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            details.heightAnchor.constraint(equalToConstant: 20),
            details.widthAnchor.constraint(equalToConstant: 200),
            
            addMoney.centerYAnchor.constraint(equalTo: curentBalance.centerYAnchor, constant: 0),
            addMoney.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            addMoney.heightAnchor.constraint(equalToConstant: 26),
            addMoney.widthAnchor.constraint(equalToConstant: 100)

        ])
    }
}
