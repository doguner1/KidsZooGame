//
//  mainView.swift
//  KidsZoo
//
//  Created by Doğu GNR on 12.03.2024.
//

import SwiftUI

struct mainView: View {
    @AppStorage("Paging") var paging:Int = 0
    
    
    
    var body: some View {
        ZStack {
            Color("2thColor")
            VStack {
                mainViewTabBar()
                    .padding(.top,10)
                MatchedItemView()
                    .padding(.top,150)
                
              
                
                Spacer()
                
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
