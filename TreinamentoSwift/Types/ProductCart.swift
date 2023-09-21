//
//  File.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 15/09/23.
//
import Foundation

struct ProductCart: Decodable {
    let id_product: String
    let size: String
    let qtd_product: Int
    let image: String
    let date_expiration: String
    let category: String
    let amount: Double
    let id_user: String
    let actived: Bool
    let name: String
}
