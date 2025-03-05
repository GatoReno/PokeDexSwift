//
//  SecondView.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import SwiftUI

struct SecondView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack(){
                TextField("Search ...", text: $searchText)
                                       .padding(10)
                                       .background(Color.gray.opacity(0.2))
                                       .cornerRadius(8)
                                       .padding(.horizontal)
                                       .onChange(of: searchText) {
                                       }
                Button("Search"){
                    
                }.padding(.trailing, 20)
            }
            Text("Second View!").padding()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top)
    }
}

#Preview {
    SecondView()
}
