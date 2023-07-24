//
//  EmoKidsApp.swift
//  EmoKids
//
//  Created by Luthfi Asmara on 23/06/23.
//

import SwiftUI

 @main
struct EmoKidsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack{
                RecordView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .navigationDestination(for: Menu.self) { item in
                        RoutePage.instance.GetRoutes(item: item)
                    }
                
            }
        }
                
    }
}

//struct Previews_EmoKidsApp_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
