//
//  RealmDB.swift
//  Domru_Trial
//
//  Created by Peter Yakovlev on 17.06.2020.
//  Copyright © 2020 Peter Yakovlev. All rights reserved.
//

import Foundation
import RealmSwift

class WeatherDB: Object {
    @objc dynamic var now_dt = ""
    let forecasts = List<ForecastsDB>()
}

class ForecastsDB: Object {
    @objc dynamic var date = ""
    let hours = List<HourDB>()
    @objc dynamic var parts: PartsDB? = nil
}

class PartsDB: Object {
    @objc dynamic var day_short: DayShortDB? = nil
    @objc dynamic var night_short: NightShortDB? = nil
}

class DayShortDB: Object{
    @objc dynamic var temp = 0
    @objc dynamic var icon = ""
}

class NightShortDB: Object {
    @objc dynamic var temp = 0
    @objc dynamic var icon = ""
}

class HourDB: Object {
    @objc dynamic var hour = ""
    @objc dynamic var temp = 0
    @objc dynamic var icon = ""
}
