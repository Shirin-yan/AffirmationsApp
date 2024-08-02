//
//  SelectPreferencesView.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 01.08.2024.
//

import SwiftUI

struct SelectPreferencesView: View {
    @StateObject var vm = SelectPreferencesVM()
    @State var selectedInd = -1
    
    var body: some View {
        VStack {
            Spacer()
            if selectedInd == -1 {
                VStack {
                    Text(LocalizedStringKey("onboard_title"))
                        .font(.system(size: 44, weight: .black))
                        .foregroundStyle(.black.opacity(0.6))
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(maxHeight: .infinity, alignment: .center)
                }
            } else {
                TabView(selection: $selectedInd, content:  {
                    selectCategoryView()
                        .padding()
                        .tag(0)
                    selectBgView()
                        .padding()
                        .tag(1)
                    selectGenderView()
                        .padding()
                        .tag(2)
                }).tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
            }
            
            Button {
                if selectedInd < 2 {
                    withAnimation {
                        selectedInd += 1
                    }
                } else {
                    vm.saveData()
                    Defaults.onboardingShown = true
                }
            } label: {
                Text(LocalizedStringKey("continue"))
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(225)
            } .padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                VStack {
                    if selectedInd < 0 {
                        Image("onboard-img")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    } else {
                        Color.black.opacity(0.8)
                    }
                }.ignoresSafeArea()
            )
    }
    
    @ViewBuilder func selectCategoryView() -> some View {
        VStack {
            Image("love")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)

            Text(LocalizedStringKey("choose_cat"))
                .font(.system(size: 24, weight: .black))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
            
            ForEach(vm.categories) { data in
                SelectionCardView(title: data.getCategoryName(),
                                  selected: vm.selectedCategory?.getCategoryName() ?? "")
                .onTapGesture {
                    vm.selectedCategory = data
                }
            }
        }.padding(.vertical, 40)
    }
    
    @ViewBuilder func selectGenderView() -> some View {
            VStack {
                Image("love")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)

                Text(LocalizedStringKey("choose_gender"))
                    .font(.system(size: 24, weight: .black))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()

                ForEach(vm.gender, id: \.rawValue) { data in
                    SelectionCardView(title: data.rawValue, selected: vm.selectedGender)
                        .onTapGesture {
                            vm.selectedGender = data.rawValue
                        }
                }
                
            }.padding(.vertical, 40)
    }
    
    @ViewBuilder func selectBgView() -> some View {
            VStack {
                Image(vm.selectedBg)
                    .resizable()
                    .cornerRadius(20)
                
                Text(LocalizedStringKey("choose_gender"))
                    .font(.system(size: 24, weight: .black))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()

                ForEach(Bg.allCases, id: \.rawValue) { data in
                    SelectionCardView(title: data.rawValue, selected: vm.selectedBg)
                        .onTapGesture {
                            vm.selectedBg = data.rawValue
                        }
                }
                
            }.padding(.vertical, 40)
    }
}

#Preview {
    SelectPreferencesView()
}
