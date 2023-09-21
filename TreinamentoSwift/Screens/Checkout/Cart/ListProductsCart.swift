//
//  ListProductsCart.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 14/09/23.
//

import SwiftUI

struct ListProductsCart: View {
    @State var isLoading: Bool = true
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            if isLoading {
                VStack(spacing: 12) {
                    ForEach(0..<3, id: \.self) { _ in
                        CardProductCardSkeleton()
                    }
                }
                .frame(height: 320)
            } else {
                if cartManager.productsCart.count == 0 {
                    VStack(alignment: .center){
                        Text("Seu carrinho esta vazio")
                            .fontWeight(.bold)
                        Text("Adicione seus produtos favoritos para realizar a compra")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                    }
                    .padding(.top,125)
                }else{
                    ForEach(cartManager.productsCart,id: \.id_product) { product in
                        CardProductCart(product: product, cartManager: cartManager)
                    }}
            }
        }
        .onAppear {
            cartManager.fetchDataCart {
                isLoading = false 
            }
        }
        //        struct ListProductsCart_Previews: PreviewProvider {
        //            static var previews: some View {
        //                ListProductsCart()
        //                    .environmentObject(CartContext()) /
        //        }
        //    }
    }
    
    
    
}
