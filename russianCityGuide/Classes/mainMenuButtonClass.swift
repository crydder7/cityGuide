import Foundation
import UIKit

class CityButton : UIButton{
    let city : City
//    let name : String
//    let photo : UIImage
    let currentVC : UIViewController
    let currentScroll : UIScrollView?
    static var allCities = [UIButton]()
    static var sizeX = 400
    static let sizeY = 350
    
    init(city:City, currentVC : UIViewController, currentScroll: UIScrollView?) {
        self.city = city
        self.currentVC = currentVC
        self.currentScroll = currentScroll
        super.init(frame: CGRect(x: 0, y: 0, width: CityButton.sizeX, height: CityButton.sizeY))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButton(){
        self.translatesAutoresizingMaskIntoConstraints = false
        if currentScroll != nil{
            CityButton.sizeX = Int(currentScroll!.bounds.width) - 10
            currentScroll?.addSubview(self)
            if CityButton.allCities.isEmpty{
                self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(CityButton.sizeY)))
                self.addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(CityButton.sizeX)))
                NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: currentScroll, attribute: .leadingMargin, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: currentScroll, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: currentScroll, attribute: .top, multiplier: 1, constant: 25).isActive = true
                NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: currentScroll, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            } else {
                self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(CityButton.sizeY)))
                self.addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(CityButton.sizeX)))
                NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: currentScroll, attribute: .leadingMargin, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: currentScroll, attribute: .trailingMargin, multiplier: 1, constant: 5).isActive = true
                NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: CityButton.allCities.last, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
                NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: currentScroll, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            }
        } else{
            CityButton.sizeX = Int(currentVC.view.bounds.width) - 10
            currentVC.view.addSubview(self)
            if CityButton.allCities.isEmpty{
                NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: currentVC.view, attribute: .top, multiplier: 1, constant: 30).isActive = true
                NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: currentVC.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            } else {
                NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: CityButton.allCities.last, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
                NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: currentVC.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
            }
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
