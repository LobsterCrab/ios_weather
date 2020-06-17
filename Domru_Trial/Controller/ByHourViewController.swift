//
//  ByHourViewController.swift
//  Domru_Trial
//
//  Created by Peter Yakovlev on 16.06.2020.
//  Copyright © 2020 Peter Yakovlev. All rights reserved.
//

import Foundation
import UIKit

class ByHourViewController: UIViewController, UITableViewDelegate{
    

    var position = String()
    
    @IBOutlet weak var table: UITableView!
    var hours = [Hour]()
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
            table.dataSource = self
            table.delegate = self
      
            
            table.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
       }
    
    
}

extension ByHourViewController: ByHourManagerDelegate {
    
    func updateByHour(_ byHourManager: ByHourManager,hours: [Hour]) {
        DispatchQueue.main.async{
            self.hours = hours
            self.table.reloadData()
        }
    }
    
    
}

extension ByHourViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hour = hours[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
        cell.date.text = hour.hour
        cell.dayTemp.text = "Daytime \(hour.temp)°C"
        cell.dayPic.image = UIImage(systemName: hour.getPic)
        cell.nightTemp.text = ""
        return cell
    }
    
    
    
}
