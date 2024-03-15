//
//  UISliderRepresentation.swift
//  SliderGame
//
//  Created by nikita on 12.03.24.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var value: Double
    
    let alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red
                
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didSlideDone),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
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
    UISliderRepresentation(value: .constant(50), alpha: 0.5)
}
