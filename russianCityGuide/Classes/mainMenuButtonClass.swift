import Foundation
import UIKit

class CityButton{
    let name : String
    let photo : UIImage
    let nextVC : UIViewController
    let currentVC : UIViewController
    static var allCities = [UIButton]()
    static let sizeX = Int((UIViewController().view?.bounds.width)! - 30)
    static let sizeY = 400
    
    init(name: String, photo: UIImage, currentVC: UIViewController, nextVC: UIViewController) {
        self.name = name
        self.photo = photo
        self.currentVC = currentVC
        self.nextVC = nextVC
    }
    
    func createButton()->UIButton{
        let button = UIButton()
        if CityButton.allCities.isEmpty{
            button.frame = CGRect(x: 0, y: 0, width: CityButton.sizeX, height: CityButton.sizeY)
            button.center.x = self.currentVC.view.center.x
        } else{
            
        }

        
        button.clipsToBounds = true
        button.setBackgroundImage(self.photo, for: .normal)
        
        button.setTitle(self.name, for: .normal)
        button.layer.cornerRadius = 30
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.layer.cornerRadius = 30
        button.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        button.layer.borderWidth = 5
        
        CityButton.allCities.append(button)
        

        
//        NSLayoutConstraint.activate([
//            NSLayoutConstraint.init(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150),
//            NSLayoutConstraint.init(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 75),
//            NSLayoutConstraint.init(item: button, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 120),
//            NSLayoutConstraint.init(item: button, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 100)
//        ])
        return button
    }
}
