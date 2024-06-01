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
        CityButton.sizeX = Int(view.bounds.width) - 10
        view.addSubview(self)
        if CityButton.allCities.isEmpty{
            self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(CityButton.sizeY)))
            self.addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(CityButton.sizeX)))
            NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 25).isActive = true
            NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            } else {
                self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(CityButton.sizeY)))
                self.addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(CityButton.sizeX)))
                NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: CityButton.allCities.last, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
                NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
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
