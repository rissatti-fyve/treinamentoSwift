//
//  ListProducts.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 11/09/23.
//

import SwiftUI

struct ListProducts: View {
    let list: [ProductBack]
    let columns = [GridItem(), GridItem()]
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        if list.isEmpty {
            Text("Nenhum produto disponível") // Mostra o texto quando a lista estiver vazia
                .foregroundColor(.gray)
                .font(.subheadline)
                .padding()
        } else {
            LazyVGrid(columns: columns) {
                ForEach(list, id: \.id_product) { product in
                    NavigationLink(destination: DetailsProductView(product: product)) {
                        ProductCard(Product: product)
                    }
                }
            }
        }
    }
}


//struct ListProducts_Previews: PreviewProvider {
//    static var previews: some View {
//        ListProducts()
//    }
//}
