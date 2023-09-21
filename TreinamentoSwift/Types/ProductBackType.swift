//
//  ProductBackType.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 14/09/23.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [ProductBack]
}

struct ProductBack: Decodable {
    let id_product: String
    let images: ProductImages
    let qtd_estoque: Int
    let nome: String
    let sizes: [String]
    let categoria: String
    let description: String
    let price: Double
}

struct ProductImages: Decodable {
    let principal: String
    let others: [String]
}

