//
//  CarSelector.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI

struct CarSelector: View {
    
    
    @Binding var carList: [CarModel]
    @Binding var selectedCarIndex: Int
    var screenSize: CGSize
    @State var colorOneForSelected = #colorLiteral(red: 0.9813590646, green: 0.5123530626, blue: 0, alpha: 1)
    @State var colorTwoForSelected = #colorLiteral(red: 0.6628436446, green: 0.3461359739, blue: 0, alpha: 1)
    @State var colorOneForNotSel = #colorLiteral(red: 0.2404925525, green: 0.237739712, blue: 0.2587802112, alpha: 1)
    @State var colorTwoForNotSel = #colorLiteral(red: 0.08288616687, green: 0.08140299469, blue: 0.08958055824, alpha: 1)
    
    var body: some View {
        HStack {
            ShinyChevron(isLeft: true, side: 40)
                .onTapGesture {
                    withAnimation { 
                        carList[selectedCarIndex].isCarSelected = false
                        if selectedCarIndex == 0 {
                            carList[carList.count - 1].isCarSelected = true
                            selectedCarIndex = carList.count - 1
                        } else {
                            carList[selectedCarIndex - 1].isCarSelected = true
                            selectedCarIndex -= 1
                        }
                    }
                }
            ForEach(carList) { list in
                ZStack {
                    DoubleButton(
                        buttonWidth: screenSize.width * 0.15, 
                        buttonHeight: screenSize.width * 0.15, 
                        buttomColor: list.isCarSelected ? colorOneForSelected : colorOneForNotSel,
                        topColor: list.isCarSelected ? colorTwoForSelected : colorTwoForNotSel
                    )
                    VStack {
                        Image(uiImage: UIImage(named: list.image) ?? UIImage())
                            .resizable()
                            .frame(width: 35, height: 25)
                            .padding(.bottom, -7)
                        Text(list.title)
                            .font(Font(UIFont.systemFont(ofSize: 10, weight: .light)))
                            .foregroundColor(Color(.white))
                    }
                }
            }
            .frame(width: screenSize.width * 0.15, height: screenSize.width * 0.6)
            ShinyChevron(isLeft: false, side: 40)
                .onTapGesture {
                    withAnimation { 
                        carList[selectedCarIndex].isCarSelected = false
                        if selectedCarIndex == carList.count - 1 {
                            carList[0].isCarSelected = true
                            selectedCarIndex = 0
                        } else {
                            carList[selectedCarIndex + 1].isCarSelected = true
                            selectedCarIndex += 1
                        }
                    }
                }
        }
        .frame(width: screenSize.width * 0.9, height: 50)
    }
}

struct CarSelector_Previews: PreviewProvider {
    static var previews: some View {
        CarSelector(carList: .constant(CarModel.setCars()), selectedCarIndex: .constant(0), screenSize: UIScreen.main.bounds.size)
    }
}
