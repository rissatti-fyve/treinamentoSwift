//
//  ProductCardSkeleton.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 15/09/23.
//

import SwiftUI

struct ProductCardSkeleton: View {
    @State private var isLoading = true

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(white: 0.9))
                .frame(width: 160, height: 140) // Quadrado grande no topo
                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
            
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(white: 0.9))
                .frame(width: 140, height: 12)
                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
            
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(white: 0.9))
                .frame(width: 140, height: 12)
                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
            
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(white: 0.9))
                .frame(width: 140, height: 12)
                .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
        }
        .onAppear() {
            self.isLoading = true
        }
        .onDisappear() {
            self.isLoading = false
        }
    }
}

struct ProductCardSkeleton_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardSkeleton()
    }
}
