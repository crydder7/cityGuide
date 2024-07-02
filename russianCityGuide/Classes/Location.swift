//
//  Location.swift
//  russianCityGuide
//
//  Created by lonely. on 30.06.2024.
//

import Foundation

struct Location:Decodable{
    let name : String
    let region : String
    let country : String
    let lat : Float
    let lon : Float
    let tz_id : String
    let localtime_epoch : Int
    let localtime: String
}
