//
//  Selector.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct SelectorView: View {
    let screenSize: CGSize
    @Binding var isVechSelected: Bool
    
    var firstColor: UIColor = #colorLiteral(red: 0.06096024066, green: 0.06021251529, blue: 0.06152223051, alpha: 1)
    var secondColor: UIColor = #colorLiteral(red: 0.1511750817, green: 0.1493212581, blue: 0.1525686085, alpha: 1)
    var thirdColor: UIColor = #colorLiteral(red: 0.185153991, green: 0.1848537028, blue: 0.189404279, alpha: 1)
    
    var colorOne: UIColor = #colorLiteral(red: 0, green: 0.8241430521, blue: 0.8518514037, alpha: 1)
    var colorTwo: UIColor = #colorLiteral(red: 0, green: 0.611340642, blue: 0.6318454742, alpha: 1)
    var colorThree: UIColor = #colorLiteral(red: 0.002332023811, green: 0.4885807633, blue: 0.5048861504, alpha: 1)
    
    var body: some View {
            ZStack {
                LinearGradient(colors: [Color(firstColor), Color(secondColor), Color(thirdColor)], startPoint: UnitPoint(x: 0.4, y: 0), endPoint: UnitPoint(x: 0.41, y: 1))
                    .frame(width: screenSize.width * 0.8, height: 40).cornerRadius(30)
                
                LinearGradient(colors: [Color(colorOne), Color(colorTwo), Color(colorThree)], startPoint: UnitPoint(x: 0.3, y: 0.7), endPoint: UnitPoint(x: 1, y: 1))
                    .frame(width: screenSize.width * 0.43, height: 40).cornerRadius(30)
                    .padding(isVechSelected ? .trailing : .leading , (screenSize.width * 0.8) * 0.47)
                
                HStack(alignment: .center) {
                    HStack {
                        Image("smallCar")
                            .resizable()
                            .frame(width: 40, height: 20)
                        Text("VECHICLES")
                            .font(Font(UIFont.systemFont(ofSize: 13, weight: .semibold)))
                            .foregroundColor(Color(UIColor(.white)))
                            .lineLimit(1)
                    }
                    .frame(width: screenSize.width * 0.4)
                    .padding(.leading, 16)
                    .onTapGesture {
                        withAnimation { 
                            isVechSelected = true
                        }
                    }
                    Spacer()
                    HStack(alignment: .center) {
                        Image("carNumber")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("PLATES")
                            .font(Font(UIFont.systemFont(ofSize: 13, weight: .semibold)))
                            .foregroundColor(Color(UIColor(.white)))
                            .lineLimit(1)
                    }
                    .frame(width: screenSize.width * 0.4)
                    .padding(.trailing, 16)
                    .onTapGesture {
                        withAnimation { 
                            isVechSelected = false
                        }
                    }
                }
                .frame(width: screenSize.width * 0.8, height: 40).cornerRadius(30)
            }
        }
}

struct SelectorView_Previews: PreviewProvider {
    static var previews: some View {
        SelectorView(screenSize: UIScreen.main.bounds.size, isVechSelected: .constant(true))
    }
}

