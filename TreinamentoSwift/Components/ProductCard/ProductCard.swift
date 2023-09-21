//
//  SwiftUIView.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 11/09/23.
//

import SwiftUI

struct ProductCard: View {
    
    let Product: ProductBack
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3){
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 147)
                    .clipped()
                    .cornerRadius(4)
            } else {
                Color(white: 0.9)
                    .frame(width: 175, height: 147)
                    .onAppear(perform: loadImageFromURL)
            }
            Text(Product.categoria)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            Text(Product.nome)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            HStack{
                Text("R$ \(String(Product.price))")
                    .foregroundColor(Color("GreenPrice"))
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                //                if let descont  = Product.price {
                //                    Text("R$ \(String(descont))")
                //                        .foregroundColor(Color.gray)
                //                        .font(.subheadline)
                //                        .strikethrough(true, color: .gray)
                //                }
            }
            
        }
    }
    
    func loadImageFromURL() {
        guard let url = URL(string: Product.images.principal) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                if let uiImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = uiImage
                    }
                }
            }
        }.resume()
    }
}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCard(Product: mockProducts[0])
//    }
//}
