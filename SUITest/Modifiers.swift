//
//  Modifiers.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct ShinyBorder: ViewModifier {
    let color: Color
    let lineWidth: Int
    
    func body(content: Content) -> some View {
        applyShadow(content: AnyView(content), lineWidth: lineWidth)
    } 
    
    func applyShadow(content: AnyView, lineWidth: Int) -> AnyView {
        if lineWidth == 0 {
            return content
        } else {
            return applyShadow(content: AnyView(content.shadow(color: color, radius: 1)), lineWidth: lineWidth - 1)
        }
    }
}

extension View {
    func shinyBorder(color: Color, lineWidth: Int) -> some View {
        self.modifier(ShinyBorder(color: color, lineWidth: lineWidth))
    }
}
