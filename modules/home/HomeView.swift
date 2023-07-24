//
//  HomeView.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 23/06/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack{
            Spacer()
            Text("Halaman Home")
                .blacktext25()
                .bold()
            SpacerHeight30()
//            SmallButton(destination: .reflection, label: "Ke Reflection")
            SpacerHeight40()
            
           
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.redPastel)
        .navigationBarBackButtonHidden(true)
        
        
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
