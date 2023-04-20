//
//  ContentView.swift
//  CurrencyCalculatorApp
//
//  Created by Michał Krzysteczko on 18/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    var currencies = ["PLN","EUR","USD"]
    @State var currency_from : Int
    @State var currency_to : Int
    @State var amount : String = "0.0"
    
    var calc : [[(Double)->Double]] =
        [[ { $0 }, { $0/4.5 }, { $0/4.0 }],
         [ { $0 * 4.5 }, { $0 } , { $0/0.8 }],
         [ { $0 * 4.0} , { $0 * 1.2 }, { $0 }]
        ]
    
    var body: some View {
        VStack{
            
            Text("Currency Calculator")
                .font(.largeTitle)
                .bold()
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(30.0)
            
            Image(systemName: "dollarsign.arrow.circlepath")
                .foregroundColor(.red)
                .font(.system(size: 46.0)).padding([.top, .leading, .trailing])
            
            HStack
            {
                Text("\(self.currencies[currency_from])")
                    .font(.subheadline)
                    .italic()
                    .padding()
                
                Image(systemName: "arrow.forward")
                
                Text("\(self.currencies[currency_to])")
                    .font(.subheadline)
                    .italic()
                    .padding()
            }
            
            HStack{
                TextField("From:", text: $amount)
                .padding().background(Color.init(red: 0.9, green: 0.9, blue: 0.9)).cornerRadius(30.0)
                
                Image(systemName: "arrow.forward")
                
                Text("\(self.calc[self.currency_from][self.currency_to](Double(amount) ?? 0.0))")
                .padding().background(Color.init(red: 0.8, green: 0.9, blue: 0.8)).cornerRadius(30.0)
            }
            
            Spacer()
            
            HStack{
                HStack(alignment: .center)
                {
                    Text("From:")
                    Picker("From:", selection: $currency_from, content: {
                        ForEach( 0 ..< 3 ){
                            Text("\(self.currencies[$0])")
                        }
                    })
                }

                HStack(alignment: .center)
                {
                    Text("To:")
                    Picker("To:", selection: $currency_to, content: {
                        ForEach( 0 ..< 3 ){
                            Text("\(self.currencies[$0])")
                        }
                    })
                }
            }
        }
        .padding()
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currency_from: 0, currency_to:  0)
    }
}
