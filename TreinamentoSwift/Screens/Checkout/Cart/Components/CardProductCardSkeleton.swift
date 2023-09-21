//
//  CardProductCardSkeleton.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 15/09/23.
//

import SwiftUI

struct CardProductCardSkeleton: View {
    @State private var isLoading = true

    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: 10) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(white: 0.9))
                    .frame(width: geometry.size.width / 2 - 100, height: 100)
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                VStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(white: 0.9))
                        .frame(width: geometry.size.width - 220, height: 18)
                        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(white: 0.9))
                        .frame(width: geometry.size.width - 260, height: 12)
                        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(white: 0.9))
                        .frame(width: geometry.size.width - 260, height: 12)
                        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                }
            }
            .padding(.horizontal,16)
        }
        .onAppear() {
            self.isLoading = true
        }
        .onDisappear() {
            self.isLoading = false
        }
    }
}


struct CardProductCardSkeleton_Previews: PreviewProvider {
    static var previews: some View {
        CardProductCardSkeleton()
    }
}
