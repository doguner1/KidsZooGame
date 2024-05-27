//
//  KidsZooApp.swift
//  KidsZoo
//
//  Created by Doğu GNR on 11.03.2024.
//


import SwiftUI

@main
struct KidsZooApp: App {
    //property
   
    @AppStorage("Paging") var paging:Int = 0
    init(){
        paging=0
    }
    
    //body
    var body: some Scene {
        WindowGroup {
            if paging == 0 {
                LoginPage()
            }
            else if paging==1 {
            SignUpPage()
                
            }else{
                mainView()
            }
            
        
        }
    }
}
