//
//  SizeSelector.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 12/09/23.
//

import SwiftUI

struct SizeSelector: View {
    let sizes: [String]
    @Binding var selectedSize: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tamanhos")
                .font(.title3)
                .foregroundColor(.black)
                .fontWeight(.bold)
            
            HStack {
                ForEach(sizes, id: \.self) { size in
                    Button(action: {
                        if selectedSize == size {
                            selectedSize = nil
                        } else {
                            selectedSize = size
                        }
                    }) {
                        Text(size)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.horizontal, 22)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(selectedSize == size ? Color.black : Color("Border"), lineWidth: 1)
                            )
                    }
                    .background(selectedSize == size ? Color("Surface") : Color.white)
                }
            }
        }
    }
}


