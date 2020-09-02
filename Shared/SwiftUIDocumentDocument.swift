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
        UTType(importedAs: "de.h-mayer.demo-doc")
    }
}

struct SwiftUIDocumentDocument: FileDocument {
    var text1: String
    var text2: String

    let firstFileName = "TextA.data"
    let secondFileName = "TextB.data"
    
    init(text1: String = "Hello, HAL!", text2: String = "Hello, Dave!") {
        self.text1 = text1
        self.text2 = text2
    }

    static var readableContentTypes: [UTType] { [.exampleText] }

    init(configuration: ReadConfiguration) throws {
        let fileWrapper = configuration.file
        
        guard let text1FileWrapper = fileWrapper.fileWrappers![firstFileName],
              let text1Data = text1FileWrapper.regularFileContents,
              let string1 = String(data: text1Data, encoding: .utf8)
              else {
            throw CocoaError(.fileReadCorruptFile)
        }
        
        guard let text2FileWrapper = fileWrapper.fileWrappers![secondFileName],
              let text2Data = text2FileWrapper.regularFileContents,
              let string2 = String(data: text2Data, encoding: .utf8)
              else {
            throw CocoaError(.fileReadCorruptFile)
        }

 
        text1 = string1
        text2 = string2
        
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
               
        let contentsFileWrapper = FileWrapper(directoryWithFileWrappers: [:])
  
        wrapString(text1, fileName: firstFileName, contentsFileWrapper: contentsFileWrapper)

        wrapString(text2, fileName: secondFileName, contentsFileWrapper: contentsFileWrapper)

        return contentsFileWrapper
    }
    
    private func wrapString(_ string : String, fileName : String, contentsFileWrapper : FileWrapper){
        let data = string.data(using: .utf8)!

        let textFileWrapper = FileWrapper(regularFileWithContents: data)
        textFileWrapper.preferredFilename = fileName
        contentsFileWrapper.addFileWrapper(textFileWrapper)
    }
}

