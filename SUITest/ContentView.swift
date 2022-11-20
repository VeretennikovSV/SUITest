//
//  ContentView.swift
//  SUITest
//
//  Created by Сергей Веретенников on 18/11/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var carList = CarModel.setCars()
    @State var selectedCarIndex = 0 
    @State private var isVechSelected = true
    
    private let titleColor = #colorLiteral(red: 0, green: 0.9917858243, blue: 1, alpha: 1)
    
    private let maintananceColorOne = #colorLiteral(red: 0.7873573303, green: 0.461594224, blue: 0.04746560007, alpha: 1)
    private let maintananceColorTwo = #colorLiteral(red: 1, green: 0.8025889993, blue: 0.3961946368, alpha: 1)
    
    private let optionsColorOne = #colorLiteral(red: 0.1430546939, green: 0.1406646371, blue: 0.1411331594, alpha: 1)
    private let optionsColorTwo = #colorLiteral(red: 0.3923513889, green: 0.3857977986, blue: 0.3870830238, alpha: 1)
    
    private let backgroundColor = #colorLiteral(red: 0.2216426432, green: 0.1916041374, blue: 0.2199437022, alpha: 1)
    
    private let buttonColorOne: UIColor = #colorLiteral(red: 0, green: 0.8241430521, blue: 0.8518514037, alpha: 1)
    private let buttonColorTwo: UIColor = #colorLiteral(red: 0, green: 0.611340642, blue: 0.6318454742, alpha: 1)
    
    private let switchCarTapped = PassthroughSubject<UUID, Never>()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(backgroundColor)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .ignoresSafeArea()
                Image("garage")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.top, geo.size.height / 3.2)
                VStack(spacing: 20) {
                    HStack(alignment: .center) {
                        Image("strazi")
                            .resizable()
                            .frame(width: 100, height: 30)
                        Text("GARAGE")
                            .font(Font(UIFont.systemFont(ofSize: 24, weight: .bold)))
                            .foregroundColor(Color(titleColor))
                            .shadow(color: Color(titleColor), radius: 5)
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                            
                        Image("strazi")
                            .resizable()
                            .frame(width: 100, height: 30)
                    }
                    
                    SelectorView(screenSize: geo.size, isVechSelected: $isVechSelected)
                    
                    CarSelector(carList: $carList, selectedCarIndex: $selectedCarIndex, screenSize: geo.size)
                    VStack {
                        HStack {
                            Charastericts(carModel: $carList[selectedCarIndex], screenSize: geo.size, title: "Tank", carChar: CarModel.CarChars.tank)
                            Charastericts(carModel: $carList[selectedCarIndex], screenSize: geo.size, title: "Respect", carChar: CarModel.CarChars.respect)
                        }
                        HStack {
                            Charastericts(carModel: $carList[selectedCarIndex], screenSize: geo.size, title: "Vehicle inspection", carChar: CarModel.CarChars.vehicle)
                            Charastericts(carModel: $carList[selectedCarIndex], screenSize: geo.size, title: "Max distance", carChar: CarModel.CarChars.maxDist)
                        }
                    }
                    .shadow(color: .white.opacity(0.1), radius: 10, x: -10, y: -10)
                    ScrollViewReader { position in
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(carList) { list in
                                    CarPreview(currentCar: list, screenSize: geo.size)
                                        .id(list.id)
                                }
                            }
                        }
                        .scrollDisabled(true)
                        .onReceive(switchCarTapped) { out in
                            withAnimation { 
                                position.scrollTo(out, anchor: .leading)
                            }
                        }
                    }
                    .padding(.top, -40)
                    HStack {
                        VStack {
                            ZStack {
                                LinearGradient(colors: [Color(maintananceColorOne), Color(maintananceColorTwo)], startPoint: UnitPoint(x: 0.5, y: 0.2), endPoint: UnitPoint(x: 0.5, y: 1))
                                    .frame(width: geo.size.width * 0.4, height: 30)
                                    .cornerRadius(15)
                                Text("Maintanance")
                                    .font(Font(UIFont.systemFont(ofSize: 15, weight: .semibold)))
                                    .foregroundColor(.white)
                            }
                            ZStack {
                                LinearGradient(colors: [Color(optionsColorOne), Color(optionsColorTwo)], startPoint: UnitPoint(x: 0.5, y: 0.2), endPoint: UnitPoint(x: 0.5, y: 1))
                                    .frame(width: geo.size.width * 0.4, height: 30)
                                    .cornerRadius(15)
                                HStack(spacing: 2) {
                                    Image(systemName: "gearshape.fill")
                                        .foregroundColor(.white)
                                    Text("Options")
                                        .font(Font(UIFont.systemFont(ofSize: 15, weight: .semibold)))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        ZStack {
                            DoubleButton(buttonWidth: geo.size.width * 0.4, buttonHeight: geo.size.width * 0.4 / 2, buttomColor: buttonColorOne, topColor: buttonColorTwo)
                            HStack(spacing: 2) {
                                Image(systemName: "arrow.triangle.branch")
                                    .foregroundColor(.white)
                                Text("RIDE")
                                    .font(Font(UIFont.systemFont(ofSize: 20, weight: .bold)))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
        }
        .onChange(of: selectedCarIndex) { newValue in
            switchCarTapped.send(carList[newValue].id)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


