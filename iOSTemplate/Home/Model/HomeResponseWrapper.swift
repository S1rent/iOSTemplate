//
//  HomeResponse.swift
//  iOSTemplate
//
//  Created by Phillip MacBook Pro on 31/07/24.
//

import Foundation

public struct HomeResponseWrapper: Decodable {
    public let categories: [HomeResponse]
    
    internal enum CodingKeys: String, CodingKey {
        case categories = "categories"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.categories = try container.decode([HomeResponse].self, forKey: .categories)
    }
}

public struct HomeResponse: Decodable {
    public let idCategory: String?
    public let strCategory: String?
    public let strCategoryThumb: String?
    public let strCategoryDescription: String?
    
    internal enum CodingKeys: String, CodingKey {
        case idCategory = "categories"
        case strCategory = "strCategory"
        case strCategoryThumb = "strCategoryThumb"
        case strCategoryDescription = "strCategoryDescription"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.idCategory = try container.decodeIfPresent(String.self, forKey: .idCategory)
        self.strCategory = try container.decodeIfPresent(String.self, forKey: .strCategory)
        self.strCategoryThumb = try container.decodeIfPresent(String.self, forKey: .strCategoryThumb)
        self.strCategoryDescription = try container.decodeIfPresent(String.self, forKey: .strCategoryDescription)
    }
}


