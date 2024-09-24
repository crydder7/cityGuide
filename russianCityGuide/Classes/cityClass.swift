import Foundation
import UIKit
import RealmSwift

class City:Object{
    @Persisted var name : String
    @Persisted var nameOfPic : String
    @Persisted var descOfCity : String
    @Persisted var lat: Float
    @Persisted var lon: Float
    
//    init(name: String, picForButton: UIImage, descOfCity: String) {
//        self.name = name
//        self.picForButton = picForButton
//        self.descOfCity = descOfCity
//    }
}
