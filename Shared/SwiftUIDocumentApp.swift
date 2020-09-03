//
//  SwiftUIDocumentApp.swift
//  Shared
//
//  Created by Holger Mayer on 02.09.20.
//

import SwiftUI

@main
struct SwiftUIDocumentApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: {
            SwiftUIDocumentDocument()
         }) { file in
             ContentView(document: file.document)
         }
    }
}
