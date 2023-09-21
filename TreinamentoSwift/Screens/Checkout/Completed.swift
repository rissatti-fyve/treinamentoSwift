//
//  Completed.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import SwiftUI

struct Completed: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
                LoadingBar(quantitySteps: 3, actualStep: 3)
                Text(.init(systemName: "checkmark.seal"))
                    .font(.system(size: 70))
                    .fontWeight(.light)
                VStack(alignment: .center){
                    Text("Pedido finalizado com sucesso")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Para acompanhar os seus pedidos basta acessar o menu pedidos dentro do aplicativo")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
            }
            .padding(.horizontal,16)
            .padding(.top,42)
        }
        Spacer()
        Divider()
            HStack{
                Text("Continuar")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(Color.black)
            .cornerRadius(8)
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
            .navigationTitle("Endereço")
            .padding(.horizontal,16)
            .padding(.top,6)
    }
    
}

struct Completed_Previews: PreviewProvider {
    static var previews: some View {
        Completed()
    }
}
