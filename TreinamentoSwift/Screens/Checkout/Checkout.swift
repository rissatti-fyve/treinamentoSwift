//
//  Checkout.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import SwiftUI

struct Checkout: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            VStack{
                LoadingBar(quantitySteps: 3, actualStep: 1)
                ListProductsCart()
                    .padding(.top,12)
            }
            Divider()
            NavigationLink(
                destination: AddressStep()
            )
            {
                HStack{
                    Text("Continuar")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(Color.black)
                .cornerRadius(8)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text(.init(systemName: "chevron.down"))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
            })
            .navigationTitle("Carrinho")
            .padding(.horizontal,16)
            .padding(.top,6)
    }
    }
    


struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
    }
}
