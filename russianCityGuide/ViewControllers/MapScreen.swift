import UIKit
//import CoreLocation
//import CoreLocationUI
import MapKit

class MapScreen: UIViewController, CityProtocol {
    
    weak var city : City?
    let map = MKMapView()
    let titleLabel = UILabel()
    let load = UIActivityIndicatorView()
    public var lat: Float = 0.0
    public var lon: Float = 0.0
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backColor")
        load.hidesWhenStopped = true
        load.center = view.center
        load.startAnimating()
        createLabel()
        //TODO: How to wait lon & lat without endless while?
        DispatchQueue.main.async{ [ weak self ] in
            guard let self = self else { return }
            if city?.lon != 0 && city?.lat != 0{
                createMap()
                fullSizeButton()
                load.stopAnimating()
            }
        }
    }

    func createMap(){
        map.showsUserLocation = true
        map.showsScale = true
        map.region = .init(center: .init(latitude: CLLocationDegrees(city!.lat), longitude: CLLocationDegrees(city!.lon)), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))
        map.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(map)
        map.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.7)
        map.layer.borderWidth = 2
        map.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
        map.heightAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
        map.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        map.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        map.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }
    
    func createLabel(){
        titleLabel.text = "Карта города \(city?.name ?? "")"
        view.addSubview(titleLabel)
        titleLabel.textColor = UIColor(named: "textColor")
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 70).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.layer.cornerRadius = 32
        titleLabel.layer.backgroundColor = UIColor(named: "AccentColor")?.cgColor
    }
    
    func fullSizeButton(){
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "AccentColor")
        //button.setTitle("Full size map", for: .normal)
        button.setImage(UIImage(named: "fullsize"), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        button.topAnchor.constraint(equalTo: map.bottomAnchor, constant: 25).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(fullSize(sender:)), for: .touchUpInside)
        button.layer.cornerRadius = 35
    }
    
    @objc func fullSize(sender:UIButton){
        let vc = UIViewController()
        let map = MKMapView()
        map.region = self.map.region
        map.center = vc.view.center
        map.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(map)
        map.widthAnchor.constraint(equalToConstant: vc.view.frame.width).isActive = true
        map.heightAnchor.constraint(equalToConstant: vc.view.frame.width).isActive = true
        map.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        map.leadingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        map.trailingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        vc.view.backgroundColor = .gray
        self.present(vc, animated: true, completion: nil)
    }

}
