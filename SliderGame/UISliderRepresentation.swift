//
//  UISliderRepresentation.swift
//  SliderGame
//
//  Created by nikita on 12.03.24.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var targetValue: Int
    @Binding var sliderValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red
        slider.value = Float(sliderValue)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didSlideDone),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = uiView
            .thumbTintColor?
            .withAlphaComponent(1 - abs((Double(targetValue) - sliderValue))/100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $sliderValue)
    }
    
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func didSlideDone(sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

#Preview {
    UISliderRepresentation(
        targetValue: .constant(33),
        sliderValue: .constant(77)
    )
}
