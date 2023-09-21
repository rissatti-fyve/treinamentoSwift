//
//  HeaderCheckout.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import SwiftUI

struct HeaderCheckout: View {
    let title: String
    let actualStep: Int
    
    var body: some View {
        VStack{
            HStack{
                Button{
                 
                } label:
                {
                    Text(.init(systemName: "chevron.down"))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                Spacer()
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal,32)
            .padding(.vertical, 8)
            LoadingBar(quantitySteps: 3, actualStep: actualStep)
        }
    }
}

struct HeaderCheckout_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCheckout(title: "Endereço", actualStep: 1)
    }
}
