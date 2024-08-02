//
//  SettingsView.swift
//  AffirmationsApp
//
//  Created by Shirin-Yan on 02.08.2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage(DefaultsKey.gender.rawValue) var gender = Defaults.gender
    @AppStorage(DefaultsKey.bgColor.rawValue) var bgColor = Defaults.bgColor
    @AppStorage(DefaultsKey.category.rawValue) var category = Defaults.category
    
    @Binding var isPresented: Bool
    var categories: [CategoryWithTranslations] = []
    
    var body: some View {
        VStack {            
            List {
                DisclosureGroup(LocalizedStringKey("cats")) {
                    ForEach(categories) { data in
                        Button {
                            Defaults.category = Int(data.category.id ?? 0)
                        } label: {
                            HStack {
                                if category == Int(data.category.id ?? 0) {
                                    Image(systemName: "largecircle.fill.circle")
                                        .foregroundStyle(.purple)
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundStyle(.gray)
                                }
                                
                                Text(LocalizedStringKey(data.getCategoryName()))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                
                
                DisclosureGroup(LocalizedStringKey("background")) {
                    ForEach(Bg.allCases, id: \.rawValue) { data in
                        Button {
                            Defaults.bgColor = data.rawValue
                        } label: {
                            HStack {
                                Image(data.rawValue)
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .cornerRadius(6)
                                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(bgColor == data.rawValue ? Color.purple : Color.clear, lineWidth: 2))
                                
                                Text(LocalizedStringKey(data.rawValue))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                
                DisclosureGroup(LocalizedStringKey("gender")) {
                    ForEach(Gender.allCases, id: \.rawValue) { data in
                        Button {
                            Defaults.gender = data.rawValue
                        } label: {
                            HStack {
                                if gender == data.rawValue {
                                    Image(systemName: "largecircle.fill.circle")
                                        .foregroundStyle(.purple)
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundStyle(.gray)
                                }
                                
                                Text(LocalizedStringKey(data.rawValue))
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
                
                Link(LocalizedStringKey("lang"), destination: URL(string: UIApplication.openSettingsURLString)!)
                    .accentColor(.black)
            }
            
            Button {
                isPresented = false
            } label: {
                Text("save")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(25)
            } .padding()
        }.accentColor(.purple)
    }
}

#Preview {
    SettingsView(isPresented: .constant(true))
}
