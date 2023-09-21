//
//  CardProductCart.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import SwiftUI

struct CardProductCart: View {
    var product: ProductCart
    @State private var image: UIImage? = nil
    @State var quantity: Int = 1
    
    @ObservedObject var cartManager: CartManager
    var body: some View {
        HStack{
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 97 ,height: 108)
                    .cornerRadius(6)
                    .clipped()
            }else {
                Text("")
                    .onAppear(perform: loadImageFromURL)
            }
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                HStack{
                    Text("R$ \(String(product.amount))")
                        .foregroundColor(Color("GreenPrice"))
                        .font(.system(size: 12))
//                    if let descont  = product.descont {
//                        Text("R$ \(String(descont))")
//                            .foregroundColor(Color.gray)
//                            .font(.system(size: 12))
//                            .strikethrough(true, color: .gray)
//                    }
                }
                Spacer()
                HStack{
                    Counter(value: $quantity , isSmall: true)
                    Spacer()
                    Button{
                        cartManager.deleteProduct(product: product)
                    } label: {
                        Text(.init(systemName: "trash.circle"))
                            .font(.system(size: 30))
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding(.horizontal,16)
        .frame(height: 108)
        .onAppear{
            quantity = product.qtd_product
        }
    }
    
    func loadImageFromURL() {
        guard let url = URL(string: product.image) else {
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

//struct CardProductCart_Previews: PreviewProvider {
//    static var previews: some View {
//        CardProductCart(product: mockProducts[1])
//    }
//}
