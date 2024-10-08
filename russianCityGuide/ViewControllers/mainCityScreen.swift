import UIKit

class mainCityScreen: UIViewController, CityProtocol {
    
    weak var city: City?
    let mainLabel = UILabel()
    let info = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backColor")
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if city != nil{
                dispCityName()
                dispCityInfo()
            }
        }
    }
    
    func dispCityName(){
        self.mainLabel.text = "Информация о городе"
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainLabel)
        mainLabel.textColor = UIColor(named: "textColor")
        mainLabel.widthAnchor.constraint(equalToConstant: view.frame.size.width - 70).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        mainLabel.center.x = view.center.x
        mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.textAlignment = .center
        mainLabel.layer.backgroundColor = UIColor(named: "AccentColor")?.cgColor
        mainLabel.layer.cornerRadius = 30
    }
    
    func dispCityInfo(){
        self.info.text = self.city?.descOfCity
        info.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(info)
        info.textColor = UIColor(named: "textColor")
        info.widthAnchor.constraint(equalToConstant: view.frame.size.width - 50).isActive = true
        info.heightAnchor.constraint(equalToConstant: 150).isActive = true
        info.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20).isActive = true
        info.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        info.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        info.backgroundColor = UIColor(named: "backColor")
        info.isEditable = false
        info.layer.cornerRadius = 27
        info.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        info.layer.borderWidth = 3
        info.font = .systemFont(ofSize: 27)
    }

}
