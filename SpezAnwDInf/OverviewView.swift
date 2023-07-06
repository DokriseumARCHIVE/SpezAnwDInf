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
    var isFav: Bool?
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
    @State private var favourite = [LocalNote]()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(localNotes) { note in // note ist hier eine konstante Struktur
                    var note = note // mutable copy
                    /*@START_MENU_TOKEN@*/Text(note.noteText)/*@END_MENU_TOKEN@*/
                        .background(note.isFav == true ? .orange : .gray)
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                print("gelöscht")
                            } label: {
                                Label("Löschen", systemImage: "trash")
                            }
                            Button(role: .none) {
                                print("Favourite")
                                favourite.append(note)
                                print(favourite.count)
                                note.isFav = true
                            } label: {
                                Label("Favourite", systemImage: "star")
                            }
                            .tint(.blue)
                        }
                }
            }
            .navigationTitle("Übersicht")
            Text("Favoriten: \(favourite.count)")
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
