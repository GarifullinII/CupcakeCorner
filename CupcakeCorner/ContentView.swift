//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Ildar Garifullin on 17/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        VStack{
            NavigationStack {
                Form {
                    Section {
                        Picker("Select your cake type", selection: $order.type) {
                            ForEach(Order.types.indices, id: \.self) {
                                Text(Order.types[$0])
                            }
                        }
                        
                        Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                    }
                    
                    Section {
                        Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                        
                        if order.specialRequestEnabled {
                            Toggle("Add extra frosting", isOn: $order.extraFrosting)
                            
                            Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                        }
                    }
                    
                    Section {
                        NavigationLink("Delivery details") {
                            AddressView(order: order)
                        }
                    }
                }
                .navigationTitle("Cupcake Corner")
            }
        }
    }
    
    //    func loadData() async {
    //        // Создание URL, который хотим прочитать
    //        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
    //            print("Invalid URL")
    //            return
    //        }
    //        // Получение данных для этого URL
    //        do {
    //            let (data, _) = try await URLSession.shared.data(from: url)
    //            // Декодирование результата обработки этих данных в Response структуру
    //            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
    //                results = decodedResponse.results
    //            }
    //        } catch {
    //            print("Invalid data")
    //        }
    //    }
}

#Preview {
    ContentView()
}
