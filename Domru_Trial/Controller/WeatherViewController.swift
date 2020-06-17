import UIKit
import Alamofire
import RealmSwift

class WeatherViewController: UIViewController, UITableViewDelegate {
    
    let realm = try!Realm()
    
    @IBOutlet weak var table: UITableView!
    
    var weatherManager = WeatherManager()
    
    var weatherForecasts = [Forecasts]()
    
    var position = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        weatherManager.delegate = self
        weatherManager.performRequest()
        
        table.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
     
    }
    
    

}



extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager,weather: WeatherModel) {
        DispatchQueue.main.async{
            self.weatherForecasts = weather.forecasts
            self.table.reloadData()
            
            var dbObj = WeatherDB()
//            for i in weather.forecasts{
//               dbObj.forecasts.append()
//            }
            
            
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
        cell.date.text = forecast.date
        cell.dayTemp.text = "Daytime \(forecast.parts.day_short.temp)°C"
        cell.dayPic.image = UIImage(systemName: forecast.parts.day_short.getPic)
        cell.nightTemp.text = "Night \(forecast.parts.night_short.temp)°C"
        cell.dayPic.image = UIImage(systemName: forecast.parts.night_short.getPic)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell cliked value is \(indexPath.row)")

        let cell = tableView.cellForRow(at: indexPath)
        position = indexPath.row
        performSegue(withIdentifier: "segueToHour", sender: cell)

      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToHour") {
            let byHourViewController = segue.destination as! ByHourViewController
            byHourViewController.position = String(position)
            byHourViewController.hours = weatherForecasts[position].hours
        }
    }
    
}


