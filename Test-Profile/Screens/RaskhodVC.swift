//
//  RaskhodVC.swift
//  Test-Profile
//
//  Created by Abdusalom Hojiev on 9/28/21.
//

import UIKit
import Charts

class RaskhodVC: UIViewController, ChartViewDelegate {
    
    
    var Raskodi: RaskhodModel!
    var pieChart = PieChartView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        pieChart.delegate = self

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        pieChart.frame      = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width)
        pieChart.center     = view.center
        pieChart.centerText = "Расходы"

        view.addSubview(pieChart)
        getRaskhodi()
    }
    
    override func viewDidLayoutSubviews() {
 
    }
    
    
    func getRaskhodNumbers(raskhodi: RaskhodModel) {
        

        let set = PieChartDataSet(entries: [
        
            PieChartDataEntry(value: Double(raskhodi.followers), label: "За звонки"),
            PieChartDataEntry(value: Double(raskhodi.publicRepos), label: "За интернет")
        ])
        
        set.colors = ChartColorTemplates.joyful()
        let data = PieChartData(dataSet: set)
    
        pieChart.data = data
        pieChart.chartDescription?.text = "Текущий месяц"
 
    }
    
    
    func getRaskhodi() {
    
        NetworkManager.shared.getRaskod { [weak self] result in
            guard let self = self else { return }
            //self.showLoadingView()

            switch result {
            case .success(let raskhodi):
                //self.removeLoadingView()
                
                DispatchQueue.main.async {
                    self.getRaskhodNumbers(raskhodi: raskhodi)
                }
                
          
            case .failure(let error):
                print(error)
            
            }
            
        }

    }

}
