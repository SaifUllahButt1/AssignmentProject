//
//  ResponseModel.swift
//  DemoApp
//
//  Created by Saif on 30/08/2024.
//

import Foundation

struct ResponseModel: Decodable {
    let results: [Model]
}

struct Model: Decodable, Identifiable {
    var id: UUID = UUID()
    let created_at: String?
    let price: String?
    let name: String?
    let uid: String?
    let image_ids: [String]?
    let image_urls: [String]?
    let image_urls_thumbnails: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case created_at = "createdAt"
        case price
        case name
        case uid
        case image_ids = "imageIds"
        case image_urls = "imageUrls"
        case image_urls_thumbnails = "imageUrlsThumbnails"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at)
        price = try container.decodeIfPresent(String.self, forKey: .price)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        uid = try container.decodeIfPresent(String.self, forKey: .uid)
        image_ids = try container.decodeIfPresent([String].self, forKey: .image_ids)
        image_urls = try container.decodeIfPresent([String].self, forKey: .image_urls)
        image_urls_thumbnails = try container.decodeIfPresent([String].self, forKey: .image_urls_thumbnails)
    }
}
