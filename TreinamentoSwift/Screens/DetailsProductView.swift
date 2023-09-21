//
//  DetailsProductView.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 12/09/23.
//

import SwiftUI

struct DetailsProductView: View {
    
    let product: ProductBack
    @State var quantity = 1
    @State private var selectedSize: String?
    @EnvironmentObject var cartManager: CartManager
    @State private var image: UIImage? = nil
    @State var selectdImage: Int = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 270)
                        .clipped()
                } else {
                    Color(white: 0.9)
                        .frame(width: 175, height: 147)
                        .onAppear(perform: loadImageFromURL)
                }

                ImageCarrousel(selectedImageIndex: $selectdImage, imageStringURLs: product.images.others)
                    .onChange(of: selectdImage) { _ in
                        loadImageFromURL()
                    }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(product.categoria)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text(product.nome)
                            .font(.title3)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        Text(product.description)
                            .foregroundColor(.gray)
                        SizeSelector(sizes: product.sizes, selectedSize: $selectedSize)
                            .padding(.top, 10)
                    }.padding(.horizontal, 16)
                }
                Divider()
                HStack(alignment: .center) {
                    Counter(value: $quantity, isSmall: false)
                    Button {
                        cartManager.sendPostRequest(product: product, quantity: quantity, selectedSize: selectedSize ?? "")
                        cartManager.fetchDataCart {}
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Text("Adicionar")
                                .foregroundColor(.white)
                            Spacer()
                            Text("R$" + (product.price * Double(quantity)).formatPrice())
                                .foregroundColor(.white)
                        }
                        .frame(width: (UIScreen.main.bounds.width * 3/5) - 16)
                        .padding(15)
                        .background(.black)
                        .cornerRadius(6)
                    }
                }
                .padding(.top, 10)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
    
    func loadImageFromURL() {
        guard let url = URL(string: product.images.others[selectdImage]) else {
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




//struct DetailsProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsProductView(product: ProductBack)
//    }
//}
