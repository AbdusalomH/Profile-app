//
//  SimCardMenuCV.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/28/21.
//

import UIKit

class SimCardMenuCV: UIViewController {
    
    let tableview = UITableView()
    
    var getData: [String]       = []
    var getPeopleList: [People] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Тарифы"
        configureTableView()
        getPeople() 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func getPeople() {
        
        showLoadingView()
        
        NetworkManager.shared.getListOfPeople { [weak self] (result)  in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let people):
                self.removeLoadingView()
                self.getPeopleList = people
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            
            case .failure(let error):
                print(error)
            
            }
        }
    }

    
    func configureTableView() {
        view.addSubview(tableview)
        tableview.frame         = view.bounds
        tableview.rowHeight     = 80
        tableview.delegate      = self
        tableview.dataSource    = self
        tableview.register(SimCardTableCell.self, forCellReuseIdentifier: SimCardTableCell.reuseID)
        
    }
}

extension SimCardMenuCV: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getPeopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: SimCardTableCell.reuseID, for: indexPath) as! SimCardTableCell
        
        cell.setdata(people: getPeopleList[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
      
        let personInfo = getPeopleList[indexPath.row]
        let personInfoVC = PersonInfoVC(personInf: personInfo.avatarUrl)
        
        navigationController?.pushViewController(personInfoVC, animated: true)
    }
}





