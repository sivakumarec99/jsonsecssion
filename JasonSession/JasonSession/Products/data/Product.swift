//
//  Product.swift
//  JasonSession
//
//  Created by JIDTP1408 on 24/02/25.
//

import Foundation

struct ProductResponse : Codable {
    var products : [Product]?
    let total : Int?
    let skip : Int?
    let limit : Int?

    enum CodingKeys: String, CodingKey {

        case products = "products"
        case total = "total"
        case skip = "skip"
        case limit = "limit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products = try values.decodeIfPresent([Product].self, forKey: .products)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        skip = try values.decodeIfPresent(Int.self, forKey: .skip)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
    }

}


struct Product : Codable,Identifiable {
    let id : Int?
    let title : String?
    let description : String?
    let category : String?
    let price : Double?
    let discountPercentage : Double?
    let rating : Double?
    let stock : Int?
    let tags : [String]?
    let brand : String?
    let sku : String?
    let weight : Int?
    let dimensions : Dimensions?
    let warrantyInformation : String?
    let shippingInformation : String?
    let availabilityStatus : String?
    let reviews : [Reviews]?
    let returnPolicy : String?
    let minimumOrderQuantity : Int?
    let meta : Meta?
    let images : [String]?
    let thumbnail : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case description = "description"
        case category = "category"
        case price = "price"
        case discountPercentage = "discountPercentage"
        case rating = "rating"
        case stock = "stock"
        case tags = "tags"
        case brand = "brand"
        case sku = "sku"
        case weight = "weight"
        case dimensions = "dimensions"
        case warrantyInformation = "warrantyInformation"
        case shippingInformation = "shippingInformation"
        case availabilityStatus = "availabilityStatus"
        case reviews = "reviews"
        case returnPolicy = "returnPolicy"
        case minimumOrderQuantity = "minimumOrderQuantity"
        case meta = "meta"
        case images = "images"
        case thumbnail = "thumbnail"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        discountPercentage = try values.decodeIfPresent(Double.self, forKey: .discountPercentage)
        rating = try values.decodeIfPresent(Double.self, forKey: .rating)
        stock = try values.decodeIfPresent(Int.self, forKey: .stock)
        tags = try values.decodeIfPresent([String].self, forKey: .tags)
        brand = try values.decodeIfPresent(String.self, forKey: .brand)
        sku = try values.decodeIfPresent(String.self, forKey: .sku)
        weight = try values.decodeIfPresent(Int.self, forKey: .weight)
        dimensions = try values.decodeIfPresent(Dimensions.self, forKey: .dimensions)
        warrantyInformation = try values.decodeIfPresent(String.self, forKey: .warrantyInformation)
        shippingInformation = try values.decodeIfPresent(String.self, forKey: .shippingInformation)
        availabilityStatus = try values.decodeIfPresent(String.self, forKey: .availabilityStatus)
        reviews = try values.decodeIfPresent([Reviews].self, forKey: .reviews)
        returnPolicy = try values.decodeIfPresent(String.self, forKey: .returnPolicy)
        minimumOrderQuantity = try values.decodeIfPresent(Int.self, forKey: .minimumOrderQuantity)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        images = try values.decodeIfPresent([String].self, forKey: .images)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
    }

}

struct Meta : Codable {
    let createdAt : String?
    let updatedAt : String?
    let barcode : String?
    let qrCode : String?

    enum CodingKeys: String, CodingKey {

        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case barcode = "barcode"
        case qrCode = "qrCode"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        barcode = try values.decodeIfPresent(String.self, forKey: .barcode)
        qrCode = try values.decodeIfPresent(String.self, forKey: .qrCode)
    }

}

struct Dimensions : Codable {
    let width : Double?
    let height : Double?
    let depth : Double?

    enum CodingKeys: String, CodingKey {

        case width = "width"
        case height = "height"
        case depth = "depth"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        width = try values.decodeIfPresent(Double.self, forKey: .width)
        height = try values.decodeIfPresent(Double.self, forKey: .height)
        depth = try values.decodeIfPresent(Double.self, forKey: .depth)
    }

}

struct Reviews : Codable {
    let rating : Int?
    let comment : String?
    let date : String?
    let reviewerName : String?
    let reviewerEmail : String?

    enum CodingKeys: String, CodingKey {

        case rating = "rating"
        case comment = "comment"
        case date = "date"
        case reviewerName = "reviewerName"
        case reviewerEmail = "reviewerEmail"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
        comment = try values.decodeIfPresent(String.self, forKey: .comment)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        reviewerName = try values.decodeIfPresent(String.self, forKey: .reviewerName)
        reviewerEmail = try values.decodeIfPresent(String.self, forKey: .reviewerEmail)
    }

}
