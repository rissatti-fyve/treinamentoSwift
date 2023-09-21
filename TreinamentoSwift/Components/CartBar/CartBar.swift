//
//  CartBar.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import SwiftUI

struct CartBar: View {
    @Binding var isShowingPopUp: Bool
    @EnvironmentObject var cartManager: CartManager
    
    var formattedPrice: String {
        return String(format: "R$ %.2f", cartManager.calculateTotalPrice())
       }

    var body: some View {
        NavigationLink(destination: Checkout()){
            HStack {
                Image(systemName: "cart")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .overlay(
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 15, height: 15)
                                .offset(x: 10, y: -10)

                            Text("\(cartManager.countProducts())")
                                .font(.system(size: 8, weight: .medium))
                                .foregroundColor(.black)
                                .offset(x: 10, y: -10)
                        }
                    )
                Text("Visualizar carrinho")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                Text("\(formattedPrice)")
                    .foregroundColor(.white)
            }
            .onAppear{cartManager.fetchDataCart {}}
            .frame(maxWidth: .infinity)
            .padding(14)
            .padding(.vertical, 2)
            .background(Color.black)
        }
        }
    }

//struct CartBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CartBar(isSHowingPopUp: false)
//    }
//}
