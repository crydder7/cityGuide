import Foundation
import UIKit

class City{
    let name : String
    let picForButton : UIImage
    let description : String
    let photos : [UIImage]
    var lat: Float = 0.0
    var lon: Float = 0.0
    
    init(name: String, picForButton: UIImage, description: String, photos:[UIImage]) {
        self.name = name
        self.picForButton = picForButton
        self.description = description
        self.photos = photos
    }
}
