//
//  ShinyChevron.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct ShinyChevron: View {
    
    var isLeft = false
    var side: CGFloat = 50
    var chevronColor = #colorLiteral(red: 0, green: 0.8241430521, blue: 0.8518514037, alpha: 1)
    var colorForCircle = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: side / 2)
                .frame(width: side, height: side)
                .foregroundColor(Color(colorForCircle))
            Image(uiImage: UIImage(systemName: isLeft ? "chevron.backward" : "chevron.forward") ?? UIImage())
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(chevronColor))
                .frame(width: side * 0.25, height: side * 0.4)
                .shadow(color: Color(chevronColor), radius: 5)
        }
    }
}

struct ShinyChevron_Previews: PreviewProvider {
    static var previews: some View {
        ShinyChevron()
    }
}
