//
//  Photos.swift
//  russianCityGuide
//
//  Created by lonely. on 24.09.2024.
//

import Foundation

//class Photos: Decodable {
//    var photos: [Photo]
//}
//
//class Photo: Decodable {
//    var id: String
//    var slug: String
//    var alternative_slugs: alt_slg
//    var created_at: String
//    var updated_at: String
//    var promoted_at: String?
//    let width: Int
//    let height: Int
//    var color: String?
//    var blur_hash: String?
//    var description: String?
//    var alt_description: String?
//    var breadcrumbs: [String?]
//    var urls: Urls
//    var links: links
//    var likes: Int
//    var liked_by_user: Bool
//    var current_user_collections: [String]
//    var sponsorship: Bool?
//    var topic_submissions: [String]?
//    var asset_type: String
//    var user:User
//}
//
//struct alt_slg: Decodable {
//    var en: String
//    var es: String
//    var ja: String
//    var fr: String
//    var it: String
//    var ko: String
//    var de: String
//    var pt: String
//}
//
//class Urls: Decodable {
//    var raw: String
//    var full: String
//    var regular: String
//    var small: String
//    var thumb: String
//    var small_s3: String
//}
//
//struct links: Decodable{
//    var `self`: String
//    var html: String
//    var download: String
//    var download_location: String
//}
//
//struct User:Decodable{
//    var id: String
//}

struct ImageData: Decodable {
    let id: String
    let slug: String
    let alternativeSlugs: [String: String]
    let createdAt: String
    let updatedAt: String
    let width: Int
    let height: Int
    let color: String
    let altDescription: String?
    let urls: ImageURLs
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id, slug, alternativeSlugs = "alternative_slugs", createdAt = "created_at", updatedAt = "updated_at", width, height, color, altDescription = "alt_description", urls, user
    }
}

struct ImageURLs: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

struct User: Decodable {
    let username: String
    let name: String
    let profileImage: ProfileImage
    
    enum CodingKeys: String, CodingKey {
        case username, name, profileImage = "profile_image"
    }
}

struct ProfileImage: Decodable {
    let small: String
    let medium: String
    let large: String
}
