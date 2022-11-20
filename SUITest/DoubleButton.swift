//
//  DoubleButton.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct DoubleButton: View {
    
    var buttonWidth: CGFloat = 200
    var buttonHeight: CGFloat = 100
    var buttomColor: UIColor = #colorLiteral(red: 0, green: 0.9457269311, blue: 1, alpha: 1)
    var topColor: UIColor = #colorLiteral(red: 0, green: 0.5674692392, blue: 0.6079383492, alpha: 1)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(buttomColor), Color(topColor)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)).cornerRadius(20)
                .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
            
            LinearGradient(colors: [Color(topColor), Color(buttomColor)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)).cornerRadius(20)
                .frame(width: buttonWidth * 0.95, height: buttonHeight * 0.95, alignment: .center)
            
        }
    }
}

struct DoubleButton_Previews: PreviewProvider {
    static var previews: some View {
        DoubleButton()
    }
}
