//
//  SearchBar.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 11/09/23.
//

import SwiftUI

struct SearchBar: View {
    @State var value: String = ""
    
    @Binding var productsSearched: [ProductBack]
    
    var body: some View {
        TextField("", text: $value, onCommit: {
            SearchDataCart(productName: value)
        })
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color("Border"), lineWidth: 1)
        )
        .overlay(
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("Placement"))
                    .padding(.leading, 8)
                    .padding(.trailing, 4)
                Text("Pesquisar")
                    .foregroundColor(Color("Placement"))
                    .font(.system(size: 16))
                Spacer()
            }
                .opacity(value.isEmpty ? 1.0 : 0.0)
        )
        .padding(.vertical, 5)
        .padding(.horizontal, 5)
    }
    
    func SearchDataCart(productName: String) {
        let formattedProductName = productName.replacingOccurrences(of: " ", with: "%20")
        let urlString = "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/products/name?search=\(formattedProductName)"
        
        guard let url = URL(string: urlString) else {
            return
        }
       
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let products = try JSONDecoder().decode([ProductBack].self, from: data)
                    DispatchQueue.main.async {
                        self.productsSearched = products
                    }
                } catch {
                    print("Erro ao decodificar o JSON: \(error)")
                }
            }
        }.resume()
    }
}


    
//    struct SearchBar_Previews: PreviewProvider {
//        static var previews: some View {
//            SearchBar()
//        }
//    }
