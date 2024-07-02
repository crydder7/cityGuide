import UIKit

class weatherScreen: UIViewController, CityProtocol {
    
    let weatherTitle = UILabel()
    let weather = UILabel()
    var city: City!
    let load = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        load.startAnimating()
        load.center = view.center
        view.addSubview(load)
        load.hidesWhenStopped = true
        setupTitle()
        setupWeather()
        
    }
    
    func setupWeather(){
        parseJson(str: "https://api.weatherapi.com/v1/current.json?key=b4024a0f93904be5a48154154242906&q=\(city.name)&aqi=no") { data in
            let weather = Weather(location: data!.location, current: data!.current)
            let str = "https:\(weather.current.condition.icon)"
            guard let url = URL(string: str) else { return }
            DispatchQueue.main.async{
                self.weather.text = "\(weather.current.temp_c)°C"
//                self.downloadImage(from: url)
                self.load.stopAnimating()
            }
        }
        
        view.addSubview(weather)
//        weather.translatesAutoresizingMaskIntoConstraints = false
//        weather.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
//        weather.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        weather.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        weather.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
//        weather.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        weather.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        
        weather.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        weather.textAlignment = .center
        weather.font = .systemFont(ofSize: 30)
        weather.center = view.center
    }
    
    func setupTitle(){
        weatherTitle.text = "Погода в городе"
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
        weatherTitle.layer.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
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
    
//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
//    
//    func downloadImage(from url: URL){
//        print("Download Started")
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            // always update the UI from the main thread
//            DispatchQueue.main.async {
//                self.icon.image = UIImage(data: data)
//            }
//        }
//    }
    
}
