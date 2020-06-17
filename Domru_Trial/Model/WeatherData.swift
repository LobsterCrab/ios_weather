
import Foundation


struct WeatherData: Codable{
    let now_dt: String
    let forecasts:[Forecasts]
}

struct Forecasts: Codable{
    let date: String
    let hours: [Hour]
    let parts: Parts
}

struct Parts:Codable{
    let day_short: DayShort
    let night_short: NightShort
}

struct DayShort: Codable{
    let temp: Int
    let icon: String
    
    var getPic: String{
        switch icon{
        case "bkn_d":
            return "partly.cloudy.day"
        case "skc_n":
            return "sun.max"
        case "ovc_-ra":
            return "cloud.rain"
        default:
            return "cloud"
        }
       
    }
}

struct NightShort: Codable{
    let temp: Int
    let icon: String
    
    var getPic: String{
        switch icon{
        case "bkn_d":
            return "partly.cloudy.day"
        case "skc_n":
            return "sun.max"
        case "ovc_-ra":
            return "cloud.rain"
        default:
            return "cloud"
        }
       
    }
}

struct Hour: Codable{
    let hour: String
    let temp: Int
    let icon: String
    
    var getPic: String{
        switch icon{
        case "bkn_d":
            return "partly.cloudy.day"
        case "skc_n":
            return "sun.max"
        case "ovc_-ra":
            return "cloud.rain"
        default:
            return "cloud"
        }
       
    }
}

struct Quick: Codable{
    let temp: Double
    let icon: String
    let cond: String
}
