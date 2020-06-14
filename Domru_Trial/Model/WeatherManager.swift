//
//  WeatherManager.swift
//  Domru_Trial
//
//  Created by Peter Yakovlev on 14.06.2020.
//  Copyright © 2020 Peter Yakovlev. All rights reserved.
//

import Foundation
import Alamofire

//https://api.weather.yandex.ru/v1/forecast?lat=58.0092&lon=56.2270

//X-Yandex-API-Key    b8acd32f-ac8e-4691-aa53-48c1ad944b9a

struct WeatherManager{
    
    let headers:HTTPHeaders = [
        "X-Yandex-API-Key": "b8acd32f-ac8e-4691-aa53-48c1ad944b9a"
    ]
    
func cuntBag(){
    AF.request("https://api.weather.yandex.ru/v1/forecast?lat=58.0092&lon=56.2270",headers:headers).response { response in
        debugPrint(response)
        }
    
    }
    
    
}
