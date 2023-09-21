//
//  InputTitled.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import SwiftUI

struct InputTitled: View {
    let title: String
    let size: Double
    let padding: Double
    let required: Bool
    let onCommit: () -> Void
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.caption)
                .foregroundColor(Color("TextSecundary"))
                .fontWeight(.medium)
            TextField(title, text: $value, onCommit: {
                onCommit()
            })
                .font(.system(size: 16))
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color("Border"), lineWidth: 1)
                )
            if value.isEmpty && required{
                            Text("Esse campo é obrigatório")
                                .foregroundColor(.gray)
                                .font(.system(size: 9))
                                .multilineTextAlignment(.leading)
                        }
        }
        .frame(width: (UIScreen.main.bounds.width * size) - padding)
    }
}

//struct InputTitled_Previews: PreviewProvider {
//    static var previews: some View {
//        InputTitled(title: "Estado", value: <#T##Binding<String>#>)
//    }
//}
