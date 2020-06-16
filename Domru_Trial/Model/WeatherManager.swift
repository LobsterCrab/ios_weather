import Foundation
import Alamofire

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager,weather:WeatherModel)
    func didFailWithError(error:Error)
}

struct WeatherManager{
    
    var delegate: WeatherManagerDelegate?
    
    let headers:HTTPHeaders = [
        "X-Yandex-API-Key": "b8acd32f-ac8e-4691-aa53-48c1ad944b9a"
    ]
    
    func performRequest(){
    AF.request("https://api.weather.yandex.ru/v1/forecast?lat=58.0092&lon=56.2270&limit=7",headers:headers).responseJSON { response in
        if let safeData = response.data{
            if let weather = self.parseJSON(safeData){
             self.delegate?.didUpdateWeather(self, weather:weather)
                }else{
                    print("something went wrong")
                }
            }
        }
    }
    
    //MARK: - Parsing Json to Swift Objects
    func parseJSON(_ weatherData:Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(WeatherData.self,from: weatherData)
            
            let temp = decodedData.now_dt
            let forecasts = decodedData.forecasts
            
            
            let weather = WeatherModel(tempNow: temp,forecasts:forecasts)
            
            
            return weather
        }catch {
            self.delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
        
    }
    
    
}
