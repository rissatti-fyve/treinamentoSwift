//
//  Mocks.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 11/09/23.
//

import Foundation

let mockProducts: [ProductType] = [
    ProductType(
        id: 1,
        image: "Shoe1",
        category: "Sapatos",
        name: "Tênis nike esporte",
        price: 399.99,
        descont: 699.99,
        images: ["Shoe1","Shoe1","Shoe1","Shoe1","Shoe1","Shoe1","Shoe1","Shoe1"],
        description: "O tênis branco da Nike, parte da nova linha, combina estilo e conforto. Seu design minimalista e elegante é perfeito para qualquer ocasião, enquanto a tecnologia avançada oferece um ajuste perfeito e amortecimento de alto desempenho.",
        sizes: ["37","38","39"]
    ),
    ProductType(
        id: 2,
        image: "Shoe2",
        category: "Sapatos",
        name: "Tênis nike esporte branco corrida",
        price: 1999.99,
        descont: nil,
        images: ["Shoe2","Shoe2","Shoe2","Shoe2","Shoe2","Shoe2","Shoe2"],
        description: "O tênis branco da Nike, parte da nova linha, combina estilo e conforto. Seu design minimalista e elegante é perfeito para qualquer ocasião, enquanto a tecnologia avançada oferece um ajuste perfeito e amortecimento de alto desempenho.",
        sizes: ["37"]
    
    ),
    ProductType(
        id: 3,
        image: "Shoe3",
        category: "Sapatos",
        name: "Tênis nike esporte vermelho casual masculino",
        price: 599.99,
        descont: nil,
        images: ["Shoe3","Shoe3","Shoe3","Shoe3","Shoe3","Shoe3"],
        description: "O tênis branco da Nike, parte da nova linha, combina estilo e conforto. Seu design minimalista e elegante é perfeito para qualquer ocasião, enquanto a tecnologia avançada oferece um ajuste perfeito e amortecimento de alto desempenho.",
        sizes: ["39","40"]
    )
]
