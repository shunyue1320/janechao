//
//  ContentView.swift
//  janechao
//
//  Created by 郭健波 on 2023/6/17.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}


struct ContentView: View {
    let food = Food.examples
    @State private var selectedFood: Food?
    
    var body: some View {
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            Text("今天吃什么？")
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood!.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
                    .id(selectedFood!.name)
                    .transition(.asymmetric(
                        insertion: .opacity
                                    .animation(.easeInOut(duration: 0.5).delay(0.2)),
                        removal: .opacity
                                    .animation(.easeInOut(duration: 0.4))))
            }
            
            Button {
                selectedFood = food.shuffled().first { $0 != selectedFood }
            } label: {
                Text(selectedFood == .none ? "告诉我" : "换一个").frame(width: 200)
                    .animation(.none, value: selectedFood)
                    .transformEffect(.identity)
            }.padding(.bottom, -15)
            
            Button {
                selectedFood = .none
            } label: {
                Text("重置").frame(width: 200)
            }.buttonStyle(.bordered)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .font(.title)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut(duration: 0.6), value: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
