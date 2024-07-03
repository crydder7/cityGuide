//
//  Temperature.swift
//  russianCityGuide
//
//  Created by lonely. on 30.06.2024.
//

import Foundation

struct Temperature:Decodable{
    let temp_c : Float
    let is_day : Int
    let condition : Condition
}
