//
//  ContentView.swift
//  TreinamentoSwift
//
//  Created by Noah '' Menezes Rodrigues on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var openSheetContext: OpenSheetContext
    @EnvironmentObject var cartManager: CartManager
    
    @State var productsBack: [ProductBack] = []
    @State var isLoading = true
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0) {
                Header(productsSearched: $productsBack)
                Divider()
                HStack{
                    Text("Todos produtos")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                    Text("(3 produtos)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                    Spacer()
                    Button{
                         fetchData()
                    } label: {
                        Text("Visualizar todos")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                }
                .padding(.top,12)
                .padding(.horizontal,16)
                if isLoading {
                    ScrollView{
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(0..<3, id: \.self) { _ in
                                ProductCardSkeleton()
                            }
                        }}
                    .padding(.horizontal, 16)
                    .padding(.top,12)
                }else {
                    ScrollView {
                        ListProducts(list: productsBack)
                            .padding(.top, 12)
                    }}
                if cartManager.countProducts() > 0 {
                    CartBar(isShowingPopUp:$openSheetContext.OpenSheetContext)
                }
                Divider()
                HStack{
                    IconTitled(iconString: "square.grid.2x2", title: "Listagem")
                    Spacer()
                    IconTitled(iconString: "list.bullet.rectangle.portrait", title:"Pedidos" )
                }.padding(.horizontal, 40)
                    .padding(.top, 12)
            }
        }
        .onAppear {
            fetchData()
            cartManager.fetchDataCart{}
        }
    }
    
    func fetchData(){
        guard let url = URL(string: "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/products") else{
            return
        }
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error{
                print(error.localizedDescription)
            }
            else if let data = data {
                let products = try? JSONDecoder().decode(ProductResponse.self, from: data)
                DispatchQueue.main.async {
                    productsBack = products?.products ?? []
                    isLoading = false
                }
            }
        }.resume()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
