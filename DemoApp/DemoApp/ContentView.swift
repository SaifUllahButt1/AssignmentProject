//
//  ContentView.swift
//  DemoApp
//
//  Created by Saif on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var listings: [Model] = []

     var body: some View {
       NavigationView {
         List(listings) { listing in
           ListCell(listing: listing)
         }
         .onAppear {
           Task {
             do {
               listings = try await NetworkingManager.fetchListings()
             } catch {
               print(error)
             }
           }
         }
       }
     }
   }

   struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
       ContentView()
     }
}

#Preview {
    ContentView()
}
