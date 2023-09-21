//
//  ImageCarrousel.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 12/09/23.
//

import SwiftUI

struct ImageCarrousel: View {
    @Binding var selectedImageIndex: Int
    let imageStringURLs: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<imageStringURLs.count, id: \.self) { index in
                    if let url = URL(string: imageStringURLs[index]) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 71, height: 49)
                                    .cornerRadius(6)
                                    .clipped()
                                    .onTapGesture {
                                        selectedImageIndex = index
                                    }
                            case .failure:
                                Text("Failed to load")
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else {
                        Text("Invalid URL")
                    }
                }
            }
            .padding(.horizontal,16)
        }
    }
}
