//
//  NotesScreen.swift
//  AisleAssignment
//
//  Created by Aakash  Bondwal  on 17/08/23.
//

import SwiftUI
import Kingfisher
import Alamofire

struct NotesScreen: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Notes")
                    .font(.system(size: 27))
                    .fontWeight(.heavy)
                
                Text("Personal messages to you")
                    .bold()
                    .font(.system(size: 18))
                
                
                //free note view
                FreeNotesItemView()
                
                
                
                //upgrade option to view
                
                HStack {
                    VStack(alignment: .leading,spacing: 6) {
                        Text("Interested In You")
                            .font(.system(size: 22))
                            .fontWeight(.heavy)
                        
                        Text("Premium members can view all their likes at once")
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                    }.multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        
                    
                    
                    Spacer()
                    
                    //upgrade button
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Upgrade")
                            .bold()
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.yellow)
                            .cornerRadius(30)
                    })
                }
                
                
                //subcribe notes
                
                HStack(spacing: 15){
                    ForEach((0...1), id: \.self) {_ in
                        UpgradeNotesItemView()
                        
                       
                        
                    }
                }
                
                
            }.padding(.horizontal)
        }
    }
}

struct NotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotesScreen()
    }
}
