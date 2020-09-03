//
//  ContentView.swift
//  Shared
//
//  Created by Holger Mayer on 02.09.20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var document: SwiftUIDocumentDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: SwiftUIDocumentDocument())
    }
}
