//
//  ViewController.swift
//  Domru_Trial
//
//  Created by Peter Yakovlev on 08.06.2020.
//  Copyright © 2020 Peter Yakovlev. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let weva = WeatherManager()
        weva.cuntBag()
    }
    

}

