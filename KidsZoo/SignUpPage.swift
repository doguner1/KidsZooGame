//
//  SignUpPage.swift
//  KidsZoo
//
//  Created by Doğu GNR on 11.03.2024.
//

import SwiftUI

struct SignUpPage: View {
    
    //property
    @State var Username : String = ""
    @State var Password :String = ""
    @State var Country : String = ""
    @State var ChildAge : String = ""
    @AppStorage("Paging") var paging:Int = 0
    @AppStorage("userName") var AccountUsername : String = ""
    @AppStorage("Password") var AccountPassWord : String = ""
    
    //body
    
    var body: some View {
        ZStack{
            
            Image("background1")
                .resizable()
                .scaledToFill()
            
            VStack{
                
                TextField("UserName", text: $Username)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(12)
                    .padding(.horizontal,30)
                    .padding(.bottom,20)
                
                TextField("Password", text: $Password)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(12)
                    .padding(.horizontal,30)
                    .padding(.bottom,20)
                
                TextField("Country", text: $Country)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(12)
                    .padding(.horizontal,30)
                    .padding(.bottom,20)
                
                TextField("childAge", text: $ChildAge)
                    .padding()
                    .background(Color("AccentColor"))
                    .cornerRadius(12)
                    .padding(.horizontal,30)
                    .padding(.bottom,20)
                
                
                Button {
                    if Username != "" && Password != "" {
                        
                        AccountUsername = Username
                        AccountPassWord = Password
                        
                        paging = 0
                    }
                    
                } label: {
                    
                    Text("Sign Up")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50, alignment: .center)
                        .background(Color("4thColor"))
                        .cornerRadius(12)
                        .padding()
                    
                }

                
                
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
