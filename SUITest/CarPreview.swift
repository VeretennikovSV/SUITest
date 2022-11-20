//
//  CarPreview.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct CarPreview: View {
    
    struct Colors {
        static var commonColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        static var rareColor = #colorLiteral(red: 0, green: 0.6241403818, blue: 1, alpha: 1)
        static var epicColor = #colorLiteral(red: 0.8941708207, green: 0.1713311374, blue: 1, alpha: 1)
        static var insaneColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    }
    
    var currentCar: CarModel
    let screenSize: CGSize
    
    private let colorForTitle = #colorLiteral(red: 0, green: 0.9917858243, blue: 1, alpha: 1)
    private var varietyColor: Color {
        switch currentCar.variety {
        case .common:
            return Color(Colors.commonColor)
        case .rare:
            return Color(Colors.rareColor)
        case .epic:
            return Color(Colors.epicColor)
        case .insane:
            return Color(Colors.insaneColor)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(currentCar.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenSize.width * 0.8)
                    .animation(.easeIn(duration: 5), value: 0)
                Spacer()
            }
            HStack {
                LevelCircle(level: currentCar.level, progress: currentCar.levelProgress, side: 40)
                Spacer()
                VStack(spacing: 6) {
                    Image(currentCar.brandImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 40)
                    Text("\(currentCar.title)")
                        .font(Font(UIFont.systemFont(ofSize: 30, weight: .bold)))
                        .foregroundColor(Color(colorForTitle))
                        .shadow(color: Color(colorForTitle), radius: 4)
                    Text("\(currentCar.variety.rawValue)")
                        .font(Font(UIFont.systemFont(ofSize: 25, weight: .bold)))
                        .foregroundColor(varietyColor)
                        .shadow(color: varietyColor, radius: 4)
                        .padding(.top, -10)
                    
                }
                .frame(width: screenSize.width * 0.4)
                Spacer()
                TotalExp(level: currentCar.level, expirience: currentCar.expirience, rectHeight: (screenSize.width * 0.37) * 0.2, rectWidth: screenSize.width * 0.37)
                Spacer()
            }
            .padding(.top, -40)
        }
        .frame(width: screenSize.width, height: screenSize.height * 0.4)
        .padding(.leading, screenSize.width * 0.025)
        .padding(.trailing, screenSize.width * 0.025)
    }
}

struct CarPreview_Previews: PreviewProvider {
    static var previews: some View {
        CarPreview(currentCar: CarModel.getCar(), screenSize: UIScreen.main.bounds.size)
    }
}
