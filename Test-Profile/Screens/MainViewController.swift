//
//  LoginViewController.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/28/21.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var tarifi: [GetTarif] = []
    var tarifiName: [List] = []
    var tarigInfo: TarifInfoModel!
    

    let phoneNumberLabel   = UILabel()
    let imageService       = UIButton()
    let contanerGeneral    = PRView()
    let containerHeader    = PRView()
    let containerFooter    = UIView()
    let containerMain      = PRView()
    let containerButton    = PRView()
    let backgroundImage    = UIImageView()
     
    let tarifDetails       = UILabel()
    let prizifKupit        = UILabel()
    let nastroiSvyaz       = UIButton()
     
    let contanainerStack   = PRView()
    let stackviewItem      = UIStackView()
     
    let simCardButton      = PRButton()
    let internetHomeButton = PRButton()
    
    let simcardImage       = UIImageView()
    let simcardLabel       = UILabel()
    
    let internetImage      = UIImageView()
    let internetLabel      = UILabel()
    
    var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        UIConfigure()
        configureCollectionView()
        goToCall()
        configureContainerOne()
        nastroySvyazTapped()
        configureSimcardMenu()
        configureBottonMenu()
        configureSimcartButtonNavigation()
        getTarif()
        getBalanceInfo()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        configureViewheigt()

    }
    
    
    func configureViewheigt(){
        let height = view.frame.size.height
        view.frame.size.height = height
    }
  
    
    func UIConfigure() {
        view.addSubview(phoneNumberLabel)
        view.addSubview(imageService)

        phoneNumberLabel.layer.borderWidth                          = 1
        phoneNumberLabel.layer.borderColor                          = UIColor.systemGray4.cgColor
        phoneNumberLabel.layer.cornerRadius                         = 10
        phoneNumberLabel.textColor                                  = .label
        phoneNumberLabel.font                                       = UIFont.systemFont(ofSize: 15)
        phoneNumberLabel.textAlignment                              = .center
        phoneNumberLabel.adjustsFontSizeToFitWidth                  = true
     
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints  = false
        imageService.translatesAutoresizingMaskIntoConstraints      = false
        
        imageService.setImage(UIImage(named: "operator"), for: .normal)
        imageService.setTitleColor(.systemYellow, for: .normal)

        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 25),
            phoneNumberLabel.widthAnchor.constraint(equalToConstant: 150),
            
            imageService.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageService.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            imageService.heightAnchor.constraint(equalToConstant: 30),
            imageService.widthAnchor.constraint(equalToConstant: 30)

        ])
    }
    
    
    func getTarif() {
        showLoadingView()
        NetworkManager.shared.getFollowers { [weak self] (result) in
            
            guard let self = self else {return}
            self.removeLoadingView()
            
            switch result {
            
            case .success(let tarifs):
                
            self.tarifi.append(tarifs)
            self.tarifiName = tarifs.list
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func goToCall() {
        
        imageService.addTarget(self, action: #selector(serviceCallButtonTapped), for: .touchUpInside)
        
    }
    
    
    @objc func serviceCallButtonTapped() {
        if let url = URL(string: "tel://+992927777173") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url , options: [:], completionHandler: nil)
            }else {
                print("not able to open")
            }
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tarifiName.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCell.reuseID, for: indexPath) as! menuCell

        cell.setData()
        
        let tarifName = tarifiName[indexPath.row]
        let tarifCount = tarifName.main.temp
        
        
        cell.balanceText.text = tarifName.name
        cell.curentBalance.text = String(tarifCount)
        
        
        cell.details.addTarget(self, action: #selector(gotoSimcard), for: .touchUpInside)
        cell.addMoney.addTarget(self, action: #selector(gotoFinance), for: .touchUpInside)
        return cell
    }
    
    
    @objc func gotoFinance() {
        let finance = ServicesVC(username: "Finance")
        navigationController?.pushViewController(finance, animated: true)
    }
    
    
    @objc func gotoSimcard() {
        let simcard = SimCardMenuCV()
        navigationController?.pushViewController(simcard, animated: true)
    }
    
    
    func configureCollectionView() {
        
        let padding: CGFloat    = 5
        let viewidth: CGFloat   = view.bounds.width - 100
    
        let layout              = UICollectionViewFlowLayout()
        collectionView          = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection  = .horizontal
        layout.itemSize         = CGSize(width: viewidth, height: 150)
        layout.sectionInset     = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(menuCell.self, forCellWithReuseIdentifier: menuCell.reuseID)
        collectionView.backgroundColor = UIColor.systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
           
            collectionView.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    
    func configureContainerOne() {
        view.addSubview(contanerGeneral)
        contanerGeneral.addSubview(containerMain)
        contanerGeneral.addSubview(containerHeader)
        contanerGeneral.addSubview(containerFooter)
        containerMain.addSubview(backgroundImage)
        contanerGeneral.addSubview(containerButton)
        
        containerHeader.addSubview(tarifDetails)
        containerFooter.addSubview(prizifKupit)
        containerButton.addSubview(nastroiSvyaz)
        
 

        backgroundImage.translatesAutoresizingMaskIntoConstraints   = false
        containerFooter.translatesAutoresizingMaskIntoConstraints   = false

        
        tarifDetails.translatesAutoresizingMaskIntoConstraints      = false
        prizifKupit.translatesAutoresizingMaskIntoConstraints       = false
        nastroiSvyaz.translatesAutoresizingMaskIntoConstraints      = false
        
        
        containerHeader.backgroundColor                             = .systemBackground
                        
        contanerGeneral.layer.cornerRadius                          = 20
        contanerGeneral.layer.shadowRadius                          = 9
        contanerGeneral.layer.shadowOpacity                         = 0.3
        contanerGeneral.layer.shadowOffset                          = CGSize(width: 3, height: 3)
        contanerGeneral.clipsToBounds                               = false
        

        backgroundImage.image = UIImage(named: "readytouse")
        
        containerFooter.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        
        tarifDetails.text                                            = "Ваш тариф - Мегафорс 50000"
        tarifDetails.font                                            = UIFont.boldSystemFont(ofSize: 16)
        tarifDetails.textAlignment                                   = .left
        
        prizifKupit.text                                             = "Покупайте минуты, гигабайты и SMS"
        prizifKupit.font                                             = UIFont.boldSystemFont(ofSize: 14)
        prizifKupit.textAlignment                                    = .left
        
        nastroiSvyaz.setTitle("Настроит связь", for: .normal)
        nastroiSvyaz.setTitleColor(UIColor.systemYellow, for: .normal)
        nastroiSvyaz.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        containerButton.backgroundColor = .black
        
        

        NSLayoutConstraint.activate([
            
            contanerGeneral.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            contanerGeneral.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contanerGeneral.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contanerGeneral.heightAnchor.constraint(equalToConstant: 210),
            
            backgroundImage.topAnchor.constraint(equalTo: contanerGeneral.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contanerGeneral.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contanerGeneral.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contanerGeneral.bottomAnchor),
            
            containerHeader.topAnchor.constraint(equalTo: contanerGeneral.topAnchor, constant: 0),
            containerHeader.leadingAnchor.constraint(equalTo: contanerGeneral.leadingAnchor, constant: 0),
            containerHeader.trailingAnchor.constraint(equalTo: contanerGeneral.trailingAnchor, constant: 0),
            containerHeader.heightAnchor.constraint(equalToConstant: 30),
            
            containerMain.topAnchor.constraint(equalTo: containerHeader.bottomAnchor, constant: 20),
            containerMain.leadingAnchor.constraint(equalTo: contanerGeneral.leadingAnchor, constant: 0),
            containerMain.trailingAnchor.constraint(equalTo: contanerGeneral.trailingAnchor, constant: 0),
            containerMain.heightAnchor.constraint(equalToConstant: 80),
            
            containerFooter.topAnchor.constraint(equalTo: containerMain.bottomAnchor, constant: 0),
            containerFooter.leadingAnchor.constraint(equalTo: contanerGeneral.leadingAnchor, constant: 0),
            containerFooter.trailingAnchor.constraint(equalTo: contanerGeneral.trailingAnchor, constant: 0),
            containerFooter.heightAnchor.constraint(equalToConstant: 30),
            
            containerButton.topAnchor.constraint(equalTo: containerFooter.bottomAnchor, constant: 0),
            containerButton.leadingAnchor.constraint(equalTo: contanerGeneral.leadingAnchor, constant: 0),
            containerButton.trailingAnchor.constraint(equalTo: contanerGeneral.trailingAnchor, constant: 0),
            containerButton.bottomAnchor.constraint(equalTo: contanerGeneral.bottomAnchor, constant: 0),
            
            tarifDetails.topAnchor.constraint(equalTo: containerHeader.topAnchor, constant: 5),
            tarifDetails.leadingAnchor.constraint(equalTo: containerHeader.leadingAnchor, constant: 5),
            tarifDetails.trailingAnchor.constraint(equalTo: containerHeader.trailingAnchor, constant: -5),
            tarifDetails.heightAnchor.constraint(equalToConstant: 20),
            
            prizifKupit.topAnchor.constraint(equalTo: containerFooter.topAnchor, constant: 5),
            prizifKupit.leadingAnchor.constraint(equalTo: containerFooter.leadingAnchor, constant: 5),
            prizifKupit.trailingAnchor.constraint(equalTo: containerFooter.trailingAnchor, constant: -5),
            prizifKupit.heightAnchor.constraint(equalToConstant: 20),
            
            nastroiSvyaz.topAnchor.constraint(equalTo: containerButton.topAnchor, constant: 0),
            nastroiSvyaz.leadingAnchor.constraint(equalTo: containerButton.leadingAnchor, constant: 0),
            nastroiSvyaz.trailingAnchor.constraint(equalTo: containerButton.trailingAnchor, constant: 0),
            nastroiSvyaz.bottomAnchor.constraint(equalTo: containerButton.bottomAnchor, constant: 0),
 
        ])
    }
    
    
    func nastroySvyazTapped() {
        
        nastroiSvyaz.addTarget(self, action: #selector(svyazTappped), for: .touchUpInside)
    }
    
    
    @objc func svyazTappped() {
        
        let svyaVC = ServicesVC(username: "Sim-card setting")
        
        navigationController?.pushViewController(svyaVC, animated: true)
        
    }
    
    
    func add(chilvVC: UIViewController, to containerView: UIView) {
        addChild(chilvVC)
        containerView.addSubview(chilvVC.view)
        chilvVC.view.frame = containerView.bounds
        chilvVC.didMove(toParent: self)
    }
    
    
    func configureSimcardMenu() {
        
        view.addSubview(contanainerStack)
        contanainerStack.addSubview(stackviewItem)

        stackviewItem.translatesAutoresizingMaskIntoConstraints     = false
        
        simcardLabel.translatesAutoresizingMaskIntoConstraints      = false
        simcardImage.translatesAutoresizingMaskIntoConstraints      = false
        internetLabel.translatesAutoresizingMaskIntoConstraints     = false
        internetImage.translatesAutoresizingMaskIntoConstraints     = false
        
        
        stackviewItem.axis                                          = .horizontal
        stackviewItem.distribution                                  = .fillEqually
        stackviewItem.spacing                                       = 10
        
        
        stackviewItem.addArrangedSubview(simCardButton)
        stackviewItem.addArrangedSubview(internetHomeButton)
        
        simCardButton.backgroundColor = .systemBackground
        internetHomeButton.backgroundColor = .systemBackground
        
       
        simCardButton.addSubview(simcardImage)
        simCardButton.addSubview(simcardLabel)
        
        
        internetHomeButton.addSubview(internetImage)
        internetHomeButton.addSubview(internetLabel)
        

        
        NSLayoutConstraint.activate([
        
            contanainerStack.topAnchor.constraint(equalTo: contanerGeneral.bottomAnchor, constant: 30),
            contanainerStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contanainerStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contanainerStack.heightAnchor.constraint(equalToConstant: 100),
            
            stackviewItem.topAnchor.constraint(equalTo: contanainerStack.topAnchor, constant: 0),
            stackviewItem.leadingAnchor.constraint(equalTo: contanainerStack.leadingAnchor, constant: 0),
            stackviewItem.trailingAnchor.constraint(equalTo: contanainerStack.trailingAnchor, constant: 0),
            stackviewItem.bottomAnchor.constraint(equalTo: contanainerStack.bottomAnchor, constant: 0),
            
            simcardImage.topAnchor.constraint(equalTo: simCardButton.topAnchor, constant: 10),
            simcardImage.leadingAnchor.constraint(equalTo: simCardButton.leadingAnchor, constant: 20),
            simcardImage.widthAnchor.constraint(equalToConstant: 40),
            simcardImage.heightAnchor.constraint(equalToConstant: 40),
            
            simcardLabel.topAnchor.constraint(equalTo: simcardImage.bottomAnchor, constant: 10),
            simcardLabel.leadingAnchor.constraint(equalTo: simCardButton.leadingAnchor, constant: 20),
            simcardLabel.trailingAnchor.constraint(equalTo: simCardButton.trailingAnchor, constant: -50),
            simcardLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
            internetImage.topAnchor.constraint(equalTo: internetHomeButton.topAnchor, constant: 10),
            internetImage.leadingAnchor.constraint(equalTo: internetHomeButton.leadingAnchor, constant: 20),
            internetImage.widthAnchor.constraint(equalToConstant: 40),
            internetImage.heightAnchor.constraint(equalToConstant: 40),
            
            internetLabel.topAnchor.constraint(equalTo: internetImage.bottomAnchor, constant: 10),
            internetLabel.leadingAnchor.constraint(equalTo: internetHomeButton.leadingAnchor, constant: 20),
            internetLabel.trailingAnchor.constraint(equalTo: internetHomeButton.trailingAnchor, constant: -50),
            internetLabel.heightAnchor.constraint(equalToConstant: 30),
            
        
        ])
        
    }
    
    
    func configureBottonMenu() {
    
        simcardImage.image          = UIImage(systemName: "esim.fill")
        simcardImage.tintColor      = .systemYellow
        internetImage.image         = UIImage(systemName: "wifi")
        internetHomeButton.tintColor      = .systemYellow
         
        simcardLabel.text           = "Новая Sim-карта"
        simcardLabel.numberOfLines  = 2
        simcardLabel.font           = UIFont.systemFont(ofSize: 12)
        simcardLabel.textAlignment  = .left
        
        
        internetLabel.text          = "Домашний интренет"
        internetLabel.numberOfLines = 2
        internetLabel.font          = UIFont.systemFont(ofSize: 12)
        internetLabel.textAlignment = .left
  
    }
    
    
    func configureSimcartButtonNavigation() {
        simCardButton.addTarget(self, action: #selector(goToNewSimcard), for: .touchUpInside)
        internetHomeButton.addTarget(self, action: #selector(goToHomeInternet), for: .touchUpInside)
   
    }
    
    
    @objc func goToNewSimcard() {
        let newSimcard = SimCardMenuCV()
        navigationController?.pushViewController(newSimcard, animated: true)
    }
    
    
    @objc func goToHomeInternet() {
        let newInternetHome = ServicesVC(username: "Home internet")
        navigationController?.pushViewController(newInternetHome, animated: true)
    }
    
    func getBalanceInfo() {
        
        NetworkManager.shared.getTarifInfo { [weak self] result in
            guard let self = self else {return}
            switch result {
            
            
            case .success(let infoBalance):
                
                self.tarigInfo = infoBalance
                DispatchQueue.main.async {
                    self.configureContainerOne()
                    let reportData = ReportInfoVCDetails(tarifInfo: self.tarigInfo)
                    self.add(chilvVC: reportData, to: self.backgroundImage)
                    self.phoneNumberLabel.text = String("\(self.tarigInfo.id)")

                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}








