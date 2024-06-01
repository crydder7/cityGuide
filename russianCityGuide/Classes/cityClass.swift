import Foundation
import UIKit

class City{
    let name : String
    let picForButton : UIImage
    let description : String
    let photos : [UIImage]
    
    init(name: String, picForButton: UIImage, description: String, photos:[UIImage]) {
        self.name = name
        self.picForButton = picForButton
        self.description = description
        self.photos = photos
    }
}
