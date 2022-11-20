//
//  TotalExp.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct TotalExp: View {
    
    var level: Int
    var expirience: Int
    
    var rectHeight: CGFloat
    var rectWidth: CGFloat
    
    private let colorForQuad = #colorLiteral(red: 0, green: 0.8452739716, blue: 0.8071792126, alpha: 1)
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 2)
                .frame(width: rectWidth, height: rectHeight)
            HStack {  
                ZStack { 
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: rectHeight, height: rectHeight - 2)
                        .foregroundColor(Color(colorForQuad))
                        .padding(.leading, 1)
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: rectHeight, height: rectHeight - 2)
                        .foregroundColor(Color(.white))
                        .padding(.leading, 1)
                        .mask { 
                            Text("\(level)")
                                .font(Font(UIFont.systemFont(ofSize: 24, weight: .medium)))
                        }
                }
                Image("infinity")
                    .resizable()
                    .frame(width: rectHeight * 0.7, height: rectHeight * 0.7)
                Text(verbatim: "\(expirience)")
                    .font(Font(UIFont.systemFont(ofSize: 22, weight: .medium)))
                    .foregroundColor(.white.opacity(0.6))
            }
        }
    }
}

struct TotalExp_Previews: PreviewProvider {
    static var previews: some View {
        TotalExp(level: 2, expirience: 27328, rectHeight: 30, rectWidth: 140)
    }
}
