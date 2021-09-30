//
//  ItemInfoReporVCDetails.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/29/21.
//

import UIKit

class ReportInfoVCDetails: ItemInfoReportVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    func configure(){
        itemInfoViewOne.setItemInfoType(IteminfoType: .min, withCount: 455)
        ItemInfoViewTwo.setItemInfoType(IteminfoType: .gigabait, withCount: 45)
        ItemInfoViewThree.setItemInfoType(IteminfoType: .sms, withCount: 334)
    }

}
