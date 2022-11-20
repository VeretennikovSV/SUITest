//
//  LevelCircle.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct LevelCircle: View {
    
    var level: Int
    var progress: CGFloat
    
    var side: CGFloat
    
    private let color = #colorLiteral(red: 0.02340020984, green: 0.02311299182, blue: 0.02361599915, alpha: 1)
    private let progressColor = #colorLiteral(red: 0.1013698801, green: 1, blue: 0.9752175212, alpha: 1)
    private let gradientColorOne = #colorLiteral(red: 0.3888519406, green: 0.3888519406, blue: 0.3888519406, alpha: 1)
    private let gradientColorTwo = #colorLiteral(red: 0.8221414089, green: 0.8221413493, blue: 0.8221413493, alpha: 1)
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .frame(width: side, height: side)
                .foregroundColor(Color(color))
                
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(progressColor))
                .rotationEffect(Angle(degrees: 270))
                .frame(width: side, height: side)
                .shadow(color: Color(progressColor), radius: 7)
            Circle()
                .frame(width: 7, height: 7)
                .foregroundColor(Color(.white))
                .offset(x: 0, y: -side / 2)
                .shadow(color: .white ,radius: 20)
                .animation(.easeInOut(duration: 1.5))
            
            Text("\(level)")
                .font(Font(UIFont.systemFont(ofSize: 30, weight: .heavy)))
                .overlay { 
                    LinearGradient(colors: [Color(gradientColorTwo), Color(gradientColorOne)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                        .mask { 
                            Text("\(level)")
                                .font(Font(UIFont.systemFont(ofSize: 30, weight: .heavy)))
                        }
                }
        }
    }
}

struct LevelCircle_Previews: PreviewProvider {
    static var previews: some View {
        LevelCircle(level: 3, progress: 0.2, side: 50)
    }
}
