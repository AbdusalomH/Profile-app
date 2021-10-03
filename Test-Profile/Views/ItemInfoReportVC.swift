//
//  ItemInfoReport.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/29/21.
//

import UIKit

class ItemInfoReportVC: UIViewController {
        
    let stackView           = UIStackView()
    let itemInfoViewOne     = BalanceInfo()
    let ItemInfoViewTwo     = BalanceInfo()
    let ItemInfoViewThree   = BalanceInfo()
    
    var tarifInfoModel: TarifInfoModel!
    
    init(tarifInfo: TarifInfoModel) {
        super.init(nibName: nil, bundle: nil)
        self.tarifInfoModel = tarifInfo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        layoutUI()
        configureStackView()
    }
    
    
    private func configureBackgroundView(){
        view.layer.cornerRadius = 18
    }
    
    
    private func configureStackView(){
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(ItemInfoViewTwo)
        stackView.addArrangedSubview(ItemInfoViewThree)
        
    }
    
    
    private func layoutUI(){
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding:CGFloat = 0
        stackView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            
        ])
    }
}

