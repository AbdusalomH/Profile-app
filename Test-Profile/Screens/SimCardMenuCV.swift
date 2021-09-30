//
//  SimCardMenuCV.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/28/21.
//

import UIKit

class SimCardMenuCV: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
