//
//  OverviewView.swift
//  SpezAnwDInf
//
//  Created by Dustin on 06.07.23.
//

import SwiftUI
import MapKit

struct LocalNote: Hashable, Identifiable {
    // == => Hashable muss immer vergleichbar sein
    static func == (lhs: LocalNote, rhs: LocalNote) -> Bool {
        return lhs.noteText == rhs.noteText
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(noteText)
    }
    // Hashable => man kann ein Hashwert machen - etwas soll eindeutig sein, bevorzugt bei Identitätsprüfung
    // Identifiable =>
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var noteText: String
    var discription: String?
    
    
}

// Test zur ...
let coord = CLLocationCoordinate2D(
    latitude: 52.457878,
    longitude: 13.526298
)

struct OverviewView: View {
    @State private var localNotes = [
        LocalNote(coordinate: coord, noteText: "erste Notiz"),
        LocalNote(coordinate: coord, noteText: "zweite Notiz"),
        LocalNote(coordinate: coord, noteText: "dritte Notiz")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(localNotes) { note in
                    /*@START_MENU_TOKEN@*/Text(note.noteText)/*@END_MENU_TOKEN@*/
                }
                .navigationTitle("Übersicht")
//                Text("Eins")
//                Text("Zwei")
//                Text("Drei")
            }
        }
        
//        WindowGroup {
//            TabView {
//                ContentView()
//                    .tabItem {
//                        Label("Map", systemImage: "globe")
//                    }
//                OverviewView()
//                    .tabItem {
//                        Label("Overview", systemImage: "list.clipbaord")
//                    }
//            }
//        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
