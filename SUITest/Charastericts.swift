//
//  Charastericts.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct Charastericts: View {
    
    @Binding var carModel: CarModel
    
    let screenSize: CGSize
    let title: String
    let carChar: CarModel.CarChars
    
    private let colorOne: UIColor = #colorLiteral(red: 0.1051462963, green: 0.1051462963, blue: 0.1051462963, alpha: 1)
    private let colorTwo: UIColor = #colorLiteral(red: 0.2450832725, green: 0.2420780361, blue: 0.2473421693, alpha: 1)
    private let titleTextColor = #colorLiteral(red: 0.9355103374, green: 0.9472873807, blue: 0.947080195, alpha: 1)
    private let numberTextColor = #colorLiteral(red: 0, green: 0.8241430521, blue: 0.8518514037, alpha: 1)
    
    private var value: String {
        switch carChar {
        case .tank:
            return "\(carModel.tank)"
        case .respect:
            return "\(carModel.respect)"
        case .vehicle:
            return "\(carModel.vehicle)/300"
        case .maxDist:
            return "\(carModel.maxDist)km"
        }
    }
    
    private var image: String {
        switch carChar {
        case .tank:
            return "metalTank"
        case .respect:
            return "metalFist"
        case .vehicle:
            return "metalGears"
        case .maxDist:
            return "maxDist"
        }
    }
    
    var rectWidth: CGFloat {
        screenSize.width * 0.45
    }
    
    var rectHeight: CGFloat {
        (screenSize.width * 0.3 * 0.7)
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            LinearGradient(colors: [Color(colorOne), Color(colorTwo)], startPoint: UnitPoint(x: 0.4, y: 0), endPoint: UnitPoint(x: 1, y: 1)).cornerRadius(10)
                .frame(width: rectWidth, height: rectHeight)
            ZStack {
                Image(image)
                    .resizable()
                    .frame(width: rectWidth * 0.5, height: rectHeight * 0.8)
                    .opacity(0.1)
                Image(image)
                    .resizable()
                    .frame(width: rectWidth * 0.25, height: rectHeight * 0.4)
                    .padding(.trailing, rectWidth * 0.15)
            }
            .padding(.trailing, rectWidth * 0.5)
            VStack(spacing: 5) {
                Text(title)
                    .foregroundColor(Color(titleTextColor))
                    .font(Font(UIFont.systemFont(ofSize: 13, weight: .regular)))
                Text(value)
                    .foregroundColor(Color(numberTextColor))
                    .font(Font(UIFont.systemFont(ofSize: 18, weight: .bold)))
            }
            .padding(.trailing, (rectWidth * 0.5) * 0.12)
        }
    }
}

struct Charastericts_Previews: PreviewProvider {
    static var previews: some View {
        Charastericts(carModel: .constant(CarModel.getCar()), screenSize: UIScreen.main.bounds.size, title: "Vehicle inspection", carChar: CarModel.CarChars.tank)
    }
}
