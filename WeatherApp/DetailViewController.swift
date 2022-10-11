//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Berkay Ozcan on 30/09/2022.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var sehirAdi: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    var secilenSehir = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sehirAdi.text = secilenSehir
        getTodayResult(sehirIsmi: secilenSehir)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func getTodayResult(sehirIsmi : String){
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(sehirIsmi)&appid=0f6112b1d663b03202ffabe9788c51ef"){
            let request = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error?.localizedDescription ?? "error")
                }else if let incomingData = data {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        DispatchQueue.main.async {
                            if let cityLabel = jsonResponse["name"] as? String{
                                self.weather.text = cityLabel
                            }
                            
                            if let main = jsonResponse["main"] as? [String:Any] {
                                if let temp = main["temp"] as? Double{
                                    self.currentTemp.text = String(Int(temp-273.15))
                                }
                                if let feelslike = main["feels_like"] as? Double{
                                    self.feelsLike.text = String(Int(feelslike-273.15))
                                }
                            }
                            
                            if let wind = jsonResponse["wind"] as? [String:Any]{
                                if let speed = wind["speed"] as? Double {
                                    self.windSpeed.text = String(speed)
                                }
                            }
                        
                            
                            
                        }
                        
                    
                    
                    
                    }catch{
                        
                    }
                    
                    
                }
            }
            dataTask.resume()
        }
    }
    
    

}
