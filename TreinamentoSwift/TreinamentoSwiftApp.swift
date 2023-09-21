//
//  TreinamentoSwiftApp.swift
//  TreinamentoSwift
//
//  Created by Noah Rissatti Menezes Rodrigues on 11/09/23.
//

import SwiftUI

@main
struct TreinamentoSwiftApp: App {
    @StateObject var cartManager = CartManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
        }
    }
}
