//
//  ContentView.swift
//  SpezAnwDInf
//
//  Created by Dustin on 22.06.23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var addable = true
    @State var showSheet = false
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 52.457878,
            longitude: 13.526298),
        latitudinalMeters: 100,
        longitudinalMeters: 100
    )
    
    var body: some View {
        VStack {
            HeadlineView()
                .padding()
            Spacer()
            Map(coordinateRegion: $coordinateRegion)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding()
                .frame(minWidth: 380, maxHeight: 420)
            Spacer()
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(addable == true ? .blue : .gray)
                .padding(.top)
                .onTapGesture {
                    if addable {
                        showSheet = true
                    }
                    addable.toggle()
                }
            Spacer()
        }
        .sheet(isPresented: $showSheet) {
            Text("Show Sheet")
        }
    }
        
//    @State private var counter = 0 // @State wichtig, damit onTabGesture veränderbar wird
//    private let viewSize:CGFloat = 80
//    var body: some View {
//        VStack {
//            Text("Count: \(counter)")
//                .padding()
//                .fontWeight(.bold)
//                .font(.largeTitle)
//                .foregroundColor(.white)
//                .background(.blue)
//                .clipShape(Capsule()) // muss immer nach .background() kommen, nie davor
//            Spacer()
//            Rectangle()
//                .frame(width: self.viewSize, height: self.viewSize)
//                .foregroundColor(.blue)
//                .offset(y: 20.0 * CGFloat(counter))
//                .shadow(radius: CGFloat(counter))
//            Spacer()
//            Image(systemName: "plus.circle.fill")
//                .resizable()
//                .frame(width: self.viewSize, height: self.viewSize)
//                .foregroundColor(.blue)
//                .onTapGesture {
//                    self.counter += 1 // @State vor der Variable
//                }
//        }
//        .padding()
//        .background(.green)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
