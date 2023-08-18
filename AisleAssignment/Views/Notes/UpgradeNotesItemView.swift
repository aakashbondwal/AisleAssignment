//
//  UpgradeNotesItemView.swift
//  AisleAssignment
//
//  Created by Aakash  Bondwal  on 17/08/23.
//

import SwiftUI

struct UpgradeNotesItemView: View {
    var body: some View {
        ZStack {
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 168, height: 255)
                .blur(radius: 10)
              
            HStack {
                VStack {
                    
                    Spacer()
                    
                    Text("Meena")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .padding(.bottom)
                }
                
                
                Spacer()
            }.padding(.horizontal)
            
        }.frame(width: 168, height: 255)
            .background(Color.gray)
            .cornerRadius(20)
    }
}

struct UpgradeNotesItemView_Previews: PreviewProvider {
    static var previews: some View {
        UpgradeNotesItemView()
    }
}
