//
//  SwiftUIDocumentDocument.swift
//  Shared
//
//  Created by Holger Mayer on 02.09.20.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "com.example.plain-text")
    }
}

class SwiftUIDocumentDocument: ReferenceFileDocument {
    @Published var text: String

    init(text: String = "Hello, world!") {
        self.text = text
    }

    static var readableContentTypes: [UTType] { [.exampleText] }

    required init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func snapshot(contentType: UTType) throws -> String {
        return self.text
    }

    func write(snapshot: String, to fileWrapper: inout FileWrapper, contentType: UTType) throws {
        let data = snapshot.data(using: .utf8)!
        fileWrapper = FileWrapper(regularFileWithContents: data)
    }
}
