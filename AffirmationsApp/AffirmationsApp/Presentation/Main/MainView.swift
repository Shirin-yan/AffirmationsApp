//
//  ContentView.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 31.07.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainVM()
    
    @State var currentIndex = 0
    @State var settingsPrsented = false
    @State var viewId = UUID()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            GeometryReader { proxy in
                TabView {
                    ForEach(vm.affirmations.indices, id: \.self) { ind in
                        Text(vm.affirmations[ind].getAffirmationText())
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }.rotationEffect(.degrees(-90))
                        .frame(width: proxy.size.width, height: proxy.size.height)
                }.frame( width: proxy.size.height, height: proxy.size.width)
                    .rotationEffect(.degrees(90), anchor: .topLeading)
                    .offset(x: proxy.size.width)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            Button {
                settingsPrsented.toggle()
            } label: {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }.frame(width: 40, height: 40, alignment: .center)
                .padding(.all, 10)
        }.background(
            Image(Defaults.bgColor)
                .resizable()
                .ignoresSafeArea()
                .id(viewId)
        ).sheet(isPresented: $settingsPrsented, onDismiss: {
            withAnimation {
                vm.setupData()
                currentIndex = 0
                viewId = UUID()
            }
        },  content: {
            SettingsView(isPresented: $settingsPrsented, categories: vm.categories)
        })
    }
}

#Preview {
    MainView()
}
