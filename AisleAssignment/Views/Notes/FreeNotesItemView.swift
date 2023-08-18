//
//  FreeNotesItemView.swift
//  AisleAssignment
//
//  Created by Aakash  Bondwal  on 17/08/23.
//

import SwiftUI

struct FreeNotesItemView: View {
    var body: some View {
        ZStack {
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 344, height: 344)
              
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                    
                    Text("Meena, 23")
                        .font(.system(size: 25))
                        
                    
                    
                    Text("Tap to review 50+ notes")
                }.foregroundColor(.white)
                    .bold()
                    .padding(.bottom)
                
                
                Spacer()
            }.padding(.horizontal)
            
        }.frame(width: 344, height: 344)
            .background(Color.gray)
            .cornerRadius(20)
    }
}

struct FreeNotesItemView_Previews: PreviewProvider {
    static var previews: some View {
        FreeNotesItemView()
    }
}
