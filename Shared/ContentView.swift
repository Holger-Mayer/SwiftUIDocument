//
//  ContentView.swift
//  Shared
//
//  Created by Holger Mayer on 02.09.20.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: SwiftUIDocumentDocument

    var body: some View {
        VStack {
            TextEditor(text: $document.text1)
            TextEditor(text: $document.text2)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(SwiftUIDocumentDocument()))
    }
}
