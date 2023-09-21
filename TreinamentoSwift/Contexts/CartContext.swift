//
//  CartContext.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 18/09/23.
//


import Foundation
import SwiftUI
import Combine

class CartManager: ObservableObject {
    @Published var productsCart: [ProductCart] = []

    func fetchDataCart(completion: @escaping () -> Void) {
            let userId = "001"
            let urlString = "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/cart?id_user=\(userId)"

            guard let url = URL(string: urlString) else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = data {
                    do {
                        let products = try JSONDecoder().decode([ProductCart].self, from: data)
                        DispatchQueue.main.async {
                            self.productsCart = products
                            completion() // Chama o completion handler após o carregamento dos dados
                        }
                    } catch {
                        print("Erro ao decodificar o JSON: \(error)")
                    }
                }
            }.resume()
        }


    func deleteProduct(product: ProductCart) {
        guard var urlComponents = URLComponents(string: "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/cart?") else {
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "id_user", value: "001"),
            URLQueryItem(name: "id_product", value: product.id_product),
            URLQueryItem(name: "qtd_product", value: String(product.qtd_product)),
            URLQueryItem(name: "action", value: "remove"),
            URLQueryItem(name: "size", value: product.size)
        ]

        guard let url = urlComponents.url else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro ao enviar a requisição: \(error.localizedDescription)")
            } else if let data = data {
                if let responseMessage = String(data: data, encoding: .utf8) {
                   
                }
            }
        }.resume()
        fetchDataCart{}
    }
    
    func sendPostRequest(product: ProductBack, quantity: Int, selectedSize: String) {
        guard var urlComponents = URLComponents(string: "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/cart?") else {
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "id_user", value: "001"),
            URLQueryItem(name: "id_product", value: product.id_product),
            URLQueryItem(name: "qtd_product", value: String(quantity)),
            URLQueryItem(name: "action", value: "add"),
            URLQueryItem(name: "size", value: selectedSize)
        ]

        guard let url = urlComponents.url else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro ao enviar a requisição: \(error.localizedDescription)")
            } else if let data = data {
                if let responseMessage = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                    }
                }
            }
        }.resume()
    }
    
    func countProducts() -> Int {
        return productsCart.reduce(0) { $0 + $1.qtd_product }
    }
    
    func calculateTotalPrice() -> Double {
        return productsCart.reduce(0.0) { $0 + ($1.amount * Double($1.qtd_product)) }
    }
}



