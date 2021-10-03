//
//  PersonInfoVC.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 10/3/21.
//

import UIKit

class PersonInfoVC: UIViewController {
    
    let imageLogo   = PersonImage(frame: .zero)
    let textLabel   = PRLabel()
    let activButton = PRButton()
    
    
    var personInfo: String?
    
    init(personInf: String) {
        super.init(nibName: nil, bundle: nil)
        self.personInfo = personInf
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureUI()
        getImage(getimage: personInfo!)
        buttonActivation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureUI() {
        
        view.addSubview(imageLogo)
        view.addSubview(textLabel)
        view.addSubview(activButton)
        
        textLabel.text = "Text message here"
        textLabel.font = UIFont.systemFont(ofSize: 16)
        
        activButton.setTitle("Активировать", for: .normal)
        activButton.backgroundColor = .systemYellow
        

        NSLayoutConstraint.activate([
        
            imageLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageLogo.heightAnchor.constraint(equalToConstant: 200),
            imageLogo.widthAnchor.constraint(equalToConstant: 200),
            
            textLabel.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.heightAnchor.constraint(equalToConstant: 50),
            textLabel.widthAnchor.constraint(equalToConstant: 120),
            
            activButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            activButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            activButton.heightAnchor.constraint(equalToConstant: 50),
            activButton.widthAnchor.constraint(equalToConstant: 200)

        ])
    }
    
    
    func getImage(getimage: String) {

        imageLogo.dowloadImage(from: getimage)
    }
    
    
    func buttonActivation() {
        
        activButton.addTarget(self, action: #selector(active), for: .touchUpInside)
 
    }
    
    
    @objc func active() {
        
        let alert = UIAlertController(title: "Активировать", message: "Вы действительно хотите активировать услугу", preferredStyle: .alert)
        
        let add = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
  
    }
}

