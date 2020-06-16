
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
    let temp: Double
    let icon: String
}

struct NightShort: Codable{
    let temp: Double
    let icon: String
}

struct Hour: Codable{
    let hour: String
    let temp: Double
    let icon: String
}

struct Quick: Codable{
    let temp: Double
    let icon: String
    let cond: String
}
