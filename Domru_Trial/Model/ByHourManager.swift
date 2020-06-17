//
//  ByHourManager.swift
//  Domru_Trial
//
//  Created by Peter Yakovlev on 16.06.2020.
//  Copyright © 2020 Peter Yakovlev. All rights reserved.
//

import Foundation

protocol ByHourManagerDelegate {
    func updateByHour(_ byHourManager: ByHourManager,hours:[Hour])
}

struct ByHourManager{
    
    var delegate: ByHourManagerDelegate?
    var hoursNew: [Hour]
    
    init(hours:[Hour]) {
       hoursNew = hours
    }
    
    func doTheThing(){
        self.delegate?.updateByHour(self,hours:hoursNew)
    }
    

}
