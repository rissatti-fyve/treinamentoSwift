//
//  AddressType.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 18/09/23.
//

import Foundation

struct AddressType: Decodable{
    let cep: String
    let street: String
    let neighborhood: String
    let city: String
    let state: String
    let freight: String
}
