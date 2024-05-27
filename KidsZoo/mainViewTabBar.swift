//
//  mainViewTabBar.swift
//  KidsZoo
//
//  Created by Doğu GNR on 12.03.2024.
//


import SwiftUI
struct mainViewTabBar: View {
    @AppStorage("Paging") var Paging : Int = 0
    @State var IsSheetPresented = false
    var body: some View {
        HStack{
            Image("avatar")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70, alignment: .center)
                .clipped()
                .cornerRadius(100)
                .padding(.leading,20)
               
            Spacer()
                .font(.system(size: 20))
                .fontWeight(.semibold)
            Spacer()
            Button {
                IsSheetPresented = true
                
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .resizable()
                    .foregroundColor(Color("4thColor"))
                    .frame(width: 30, height: 30, alignment: .center)
                
            }
            .padding(.trailing,20)

            
        }
        .padding()
        .background(Color("AccentColor"))
        .sheet(isPresented: $IsSheetPresented) {
            Button {
                
                Paging=0
            } label: {
                Text("LogOut")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("4thColor"))
            }

        }
    }
}

struct mainViewTabBar_Previews: PreviewProvider {
    static var previews: some View {
        mainViewTabBar()
    }
}
