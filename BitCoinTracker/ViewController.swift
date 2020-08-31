//
//  ViewController.swift
//  BitCoinTracker
//
//  Created by maneesh on 30/08/20.
//  Copyright © 2020 maneesh. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    @IBOutlet weak var CPView: UIView!
    @IBOutlet weak var UpdatedOnLabel: UILabel!
    @IBOutlet weak var CurrentPriceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var datesArr = [String]()
    var valuesArr = [Float]()
    var timer = Timer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "cell")
        cell.textLabel?.text = datesArr[indexPath.row]
        cell.textLabel?.textColor = .gray
        cell.textLabel?.textAlignment = .left
        cell.detailTextLabel?.text = valuesArr[indexPath.row].description + ConstantsEnum.USD_CONSTANT
        cell.detailTextLabel?.textColor = .darkGray
        cell.detailTextLabel?.textAlignment = .right
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ConstantsEnum.HISTORIC_TABLE_HEADING
    }

}

//SETUP
extension ViewController{
    
    func setup () {
        // Function to do UI setup
       scheduledTimerWithTimeInterval()
       getCurrentPrice()
       getHistoricPrice()
       self.tableView.dropShadow()
       self.CPView.dropShadow()
       self.tableView.dataSource = self
    }
    
    func scheduledTimerWithTimeInterval(){
       // Schduling timer to get tick by tick realtime data
       timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.getCurrentPrice), userInfo: nil, repeats: true)
    }

    
    
}


//Alamofire
extension ViewController{
    @objc func getCurrentPrice() {
        //Function to hit the Current Price API and update the label's accordinglyx
        BitCoinNetworking.getCurrentData{ (response, error) in
            guard let CPResponse = response else {
                return
            }
             self.CurrentPriceLabel.text = ConstantsEnum.CURRENT_PRICE_PLACEHOLDER + (CPResponse.bpi?.USD?.rate ?? "") + ConstantsEnum.USD_CONSTANT
             let date = Date()
             let format = DateFormatter()
             format.dateFormat = ConstantsEnum.DATE_FORMAT
             let formattedDate = format.string(from: date)
             self.UpdatedOnLabel.text = ConstantsEnum.LAST_UPDATED_PLACEHOLDER +  formattedDate
        }
       
    }
    
    func getHistoricPrice() {
        //Function to hit Historic Data API and set the data source
         BitCoinNetworking.getHistoricalData{ (response, error) in
                    guard let HistoricResp = response else {
                        self.tableView.reloadData()
                        return
                     }
                     for (key, value) in HistoricResp.bpi!{
                         print(value)
                         self.datesArr.append(key)
                         self.valuesArr.append(value)
                     }
                     self.tableView.reloadData()
        }
    }
}
