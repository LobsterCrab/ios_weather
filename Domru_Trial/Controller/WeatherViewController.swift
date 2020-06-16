import UIKit
import Alamofire


class WeatherViewController: UIViewController {
    
 
    
    @IBOutlet weak var table: UITableView!
    
    var weatherManager = WeatherManager()
    
    var weatherForecasts = [Forecasts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        weatherManager.delegate = self
        weatherManager.performRequest()
        
         table.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
     
    }
    

}

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel) {
        DispatchQueue.main.async{
            self.weatherForecasts = weather.forecasts
            print("is this even working?")
            self.table.reloadData()
            
        }
    }
    
    func didFailWithError(error:Error) {
        print(error)
    }
    
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecast = weatherForecasts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
        cell.label.text = forecast.parts.day_short.icon
        return cell
    }
}


