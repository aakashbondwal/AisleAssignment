//
//  mainTabView.swift
//  AisleAssignment
//
//  Created by Aakash  Bondwal  on 17/08/23.
//

import SwiftUI

struct mainTabView: View {
    
    @State var token: String = "";
    @ObservedObject var notesViewModel = NotesViewModel();

    var body: some View {
        TabView {
            
            DiscoverView()
                .tabItem {
                    Image(systemName: "square.split.2x2.fill")
                    Text("Discover")
                }
            
            NotesScreen()
                .tabItem {
                    Image(systemName: "envelope.fill")
                    Text("Notes")
                }.badge(9)
            
            
            
            MatchesView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Matches")
                }.badge(50)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
        }.tint(.black)
            .onAppear {
                notesViewModel.getNotes(token: token)
            }
    }
}

struct mainTabView_Previews: PreviewProvider {
    static var previews: some View {
        mainTabView()
    }
}
