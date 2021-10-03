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
        itemInfoViewOne.setItemInfoType(IteminfoType: .min, withCount: tarifInfoModel.followers )
        ItemInfoViewTwo.setItemInfoType(IteminfoType: .gigabait, withCount: tarifInfoModel.publicRepos)
        ItemInfoViewThree.setItemInfoType(IteminfoType: .sms, withCount: tarifInfoModel.publicGists )
    }

}
