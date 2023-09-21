//
//  ProductTypes.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 11/09/23.
//

import Foundation

struct ProductType: Identifiable{
    let id: Int
    let image: String
    let category: String
    let name: String
    let price: Double
    let descont: Double?
    let images: [String]
    let description: String
    let sizes: [String]
    
    var formattedPrice: String {
        return "R$ " + price.formatPrice()
      }
}
