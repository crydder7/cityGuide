import Foundation
import UIKit

class CityButton : UIButton{
    let city : City
    static var allCities = [UIButton]()
    let view : UIView
    static var sizeX = 400
    static let sizeY = 350
    
    init(city:City, view : UIView) {
        self.city = city
        self.view = view
        super.init(frame: CGRect(x: 0, y: 0, width: CityButton.sizeX, height: CityButton.sizeY))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButton(){
        self.translatesAutoresizingMaskIntoConstraints = false
        CityButton.sizeX = Int(view.bounds.width) - 12
        view.addSubview(self)
        self.widthAnchor.constraint(equalToConstant: CGFloat(CityButton.sizeX)).isActive = true
        self.heightAnchor.constraint(equalToConstant: CGFloat(CityButton.sizeY)).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 6).isActive = true
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        if CityButton.allCities.isEmpty{
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            } else {
            self.topAnchor.constraint(equalTo: CityButton.allCities.last!.bottomAnchor, constant: 20).isActive = true
        }
        
        self.clipsToBounds = true
        self.setBackgroundImage(self.city.picForButton, for: .normal)
        
        self.setTitle(self.city.name, for: .normal)
        self.titleLabel?.font = UIFont(name: "RubikMonoOne-Regular", size: 25)
        self.titleLabel?.backgroundColor = .init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        self.layer.cornerRadius = 30
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.layer.cornerRadius = 30
        self.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.layer.borderWidth = 5
        
        CityButton.allCities.append(self)
    }
}
