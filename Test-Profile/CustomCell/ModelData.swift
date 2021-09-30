//
//  ModelData.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/28/21.
//

import Foundation


struct ModelData {
    
    static var modelData: [MenuItems] = {
        
        var balance = MenuItems()
        balance.balanceType = "Баланс счета"
        balance.balanceCount = "2640 ₽"
        
        
        var internet = MenuItems()
        internet.balanceType = "Баланс интернета"
        internet.balanceCount = "28493 Mb"
        
        return [balance, internet]
    }()
  
}
