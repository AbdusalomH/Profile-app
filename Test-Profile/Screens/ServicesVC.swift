//
//  ServicesVC.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/28/21.
//

import UIKit

class ServicesVC: UIViewController {
    
    var username: String?
    
    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.username = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = username
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
