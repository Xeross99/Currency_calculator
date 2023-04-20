//
//  CurrencyCalculatorAppApp.swift
//  CurrencyCalculatorApp
//
//  Created by Michał Krzysteczko on 18/04/2023.
//

import SwiftUI

@main
struct CurrencyCalculatorAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(currency_from: 0, currency_to:  0)
        }
    }
}
