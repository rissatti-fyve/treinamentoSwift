//
//  AddressStep.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 13/09/23.
//

import SwiftUI

struct AddressStep: View {
    @State private var cep = ""
    @State private var logradouro = ""
    @State private var numero = ""
    @State private var bairro = ""
    @State private var complemento = ""
    @State private var cidade = ""
    @State private var estado = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            VStack{
                    LoadingBar(quantitySteps: 3, actualStep: 2)
                    InputTitled(
                        title: "CEP",
                        size: 1.0,
                        padding: 24.0,
                        required: true,
                        onCommit: {
                            SearchAddressByCep(cep: cep)
                        },
                        value: $cep
                    )
                    HStack(spacing: 12){
                        InputTitled(title: "Logradouro", size: 2/3,padding: 16, required: true, onCommit: {}, value: $logradouro)
                        InputTitled(title: "Número", size: 1/3,padding: 16,required: true, onCommit: {}, value: $numero)
                    }
                    InputTitled(title: "Bairro", size: 1,padding: 24, required: false, onCommit: {}, value: $bairro)
                    InputTitled(title: "Complemento", size: 1,padding: 24, required: false, onCommit: {}, value: $complemento)
                    HStack(spacing: 12){
                        InputTitled(title: "Cidade", size: 2/3,padding: 16, required: true, onCommit: {}, value: $cidade)
                        InputTitled(title: "Estado", size: 1/3,padding: 16, required: true, onCommit: {}, value: $estado)
                    }
                .padding(.top,12)
            }
        Spacer()
            Divider()
            NavigationLink(
                destination: Completed()
            )
            {
                HStack{
                    Text("Continuar")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(Color.black)
                .cornerRadius(8)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text(.init(systemName: "chevron.down"))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 12))
            })
            .navigationTitle("Endereço")
            .padding(.horizontal,16)
            .padding(.top,6)
    }
    
    func SearchAddressByCep(cep: String) {
        let formattedProductName = cep.replacingOccurrences(of: ".", with: "")
        let urlString = "https://rluihpcsg3.execute-api.us-east-1.amazonaws.com/v1/-cep?cep=\(formattedProductName)"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let address = try JSONDecoder().decode(AddressType.self, from: data)
                    DispatchQueue.main.async {
                        self.logradouro = address.street
                        self.bairro = address.neighborhood
                        self.cidade = address.city
                        self.estado = address.state
                    }
                } catch {
                    print("Erro ao decodificar o JSON: \(error)")
                }
            }
        }.resume()
    }
}


struct AddressStep_Previews: PreviewProvider {
    static var previews: some View {
        AddressStep()
    }
}
