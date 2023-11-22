//
//  ContentView.swift
//  tipkit_demo
//
//  Created by Ariel Merino on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colors = MockData.colors
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(colors, id: \.self){
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill($0.gradient)
                        .frame(height: 100)
                        .contextMenu{
                            Button("Favorite", systemImage: "star"){
                                print("Favorite")
                            }
                            Button("Mark as done", systemImage: "checkmark"){
                                print("Mark as done")
                            }
                        }
                    
                }
            }
            .padding()
            .navigationTitle("Colors")
            .toolbar{
                Button{
                    colors.insert(.random, at: 0)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

extension Color{
    static var random: Color{
        return Color(red:
                        .random(in: 0...1),
                     green:
                        .random(in: 0...1),
                     blue:
                        .random(in: 0...1)
        )
    }
}
struct MockData{
    static let colors = [Color.random,
                         Color.random,
                         Color.random,
                         Color.random]
}

#Preview {
    ContentView()
}
