import UIKit

class weatherScreen: UIViewController, CityProtocol {
    
    let weatherTitle = UILabel()
    let weather = UILabel()
    weak var city: City?
    let load = UIActivityIndicatorView(style: .large)
    let icon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        view.backgroundColor = UIColor(named: "backColor")
        load.startAnimating()
        load.center = view.center
        view.addSubview(load)
        load.hidesWhenStopped = true
        setupTitle()
        setupWeather()
        createImage()
    }
    
    func setupWeather(){
        weather.text = "Сейчас: "
        parseJson(str: "https://api.weatherapi.com/v1/current.json?key=b4024a0f93904be5a48154154242906&q=\(city!.name)&aqi=no") { data in
            guard let data = data else {
                print("error with data")
                DispatchQueue.main.async{ [weak self] in
                    guard let self = self else { return }
                    self.weather.text! += "Load error"
                    icon.image = UIImage(named: "unknown")
                    self.load.stopAnimating()
                }
                return
            }
            let weather = Weather(location: data.location, current: data.current)
            DispatchQueue.main.async{ [weak self] in
                guard let self = self else { return }
                self.city?.lat = weather.location.lat
                self.city?.lon = weather.location.lon
                self.weather.text! += "\(weather.current.temp_c)°C"
                self.weather.font = UIFont(name: "RubikMonoOne-Regular", size: 17)
                if weather.current.is_day == 1{
                    icon.image = UIImage(named: "\(weather.current.condition.code)d")
                } else{
                    icon.image = UIImage(named: "\(weather.current.condition.code)n")
                }
                if icon.image == nil {
                    icon.image = UIImage(named: "unknown")
                }
                self.load.stopAnimating()
            }
        }
        
        view.addSubview(weather)
        weather.adjustsFontSizeToFitWidth = true
        weather.translatesAutoresizingMaskIntoConstraints = false
        weather.widthAnchor.constraint(equalToConstant: 200).isActive = true
        weather.heightAnchor.constraint(equalToConstant: 100).isActive = true
        weather.topAnchor.constraint(equalTo: weatherTitle.bottomAnchor, constant: 25).isActive = true
        weather.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weather.textAlignment = .center
    }
    
    func setupTitle(){
        weatherTitle.text = "Погода в городе"
        weatherTitle.textColor = UIColor(named: "textColor")
        view.addSubview(weatherTitle)
        weatherTitle.translatesAutoresizingMaskIntoConstraints = false
        weatherTitle.widthAnchor.constraint(equalToConstant: view.frame.size.width - 70).isActive = true
        weatherTitle.heightAnchor.constraint(equalToConstant: 70).isActive = true
        weatherTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        weatherTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 35).isActive = true
        weatherTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -35).isActive = true
        weatherTitle.textAlignment = .center
        weatherTitle.layer.cornerRadius = 30
        weatherTitle.adjustsFontSizeToFitWidth = true
        weatherTitle.layer.backgroundColor = UIColor(named: "AccentColor")?.cgColor
    }
    
    func parseJson(str:String, comp: @escaping (Weather?)->Void){
        guard let url = URL(string: str) else { return }
        let task = URLSession.shared.dataTask(with: url) { Data, resp, error in
            if error != nil{
                comp(nil)
                return
            }
            guard let data = Data else { comp(nil); return }
            let parser = JSONDecoder()
            do{
                let weather = try parser.decode(Weather.self, from: data)
                comp(weather)
            } catch{
                comp(nil)
                print("Error in data")
                return
            }
        }
        task.resume()
    }
    
    func createImage(){
        icon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(icon)
//        icon.backgroundColor = UIColor(named: "AccentColor")
        icon.widthAnchor.constraint(equalToConstant: 120).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 120).isActive = true
        icon.topAnchor.constraint(equalTo: weather.bottomAnchor, constant: 30).isActive = true
        icon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    //MARK: -async/await JSON parsing
    func parseJSON(url:URL) async throws -> Weather{
        let req = URLRequest(url: url)
        let (data,_) = try await URLSession.shared.data(for: req)
        let weather = try JSONDecoder().decode(Weather.self, from: data)
        return weather
    }
    
}
