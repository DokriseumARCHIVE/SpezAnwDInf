//
//  HeadlineView.swift
//  SpezAnwDInf
//
//  Created by Dustin on 06.07.23.
//

import SwiftUI

struct HeadlineView: View {
    var body: some View {
        HStack {
            Image(systemName: "global")
                .imageScale(.large)
                .foregroundColor(.black)
            Text("LocalNote")
                .font(.title)
        }
        .padding(.horizontal)
        .background(Color(red: 0.9, green: 0.9, blue: 0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
    }
}

struct HeadlineView_Preview: PreviewProvider {
    static var previews: some View {
        HeadlineView()
    }
}
