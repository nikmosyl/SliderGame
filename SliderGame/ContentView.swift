//
//  ContentView.swift
//  SliderGame
//
//  Created by nikita on 12.03.24.
//

import SwiftUI

struct ContentView: View {
    @State private var difference = 100
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к \(targetValue)")
            
            UISliderRepresentation(
                difference: $difference,
                sliderValue: $currentValue
            )
            
            Button(action: check) {
                Text("Проверь мения")
            }
            .alert("Ваш результат: \(computeScore())", isPresented: $showAlert, actions: {})
            
            Button(action: reset) {
                Text("Начать заново")
            }
            
            
        }
        .padding()
    }
    
    private func check() {
        difference = computeScore()
        showAlert.toggle()
    }
    
    private func reset() {
        targetValue = Int.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
