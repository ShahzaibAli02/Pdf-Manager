//
//  Procedure.swift
//  ARK
//
//  Created by Shahzaib Ali on 25/10/2024.
//

import PDFKit

class Procedure : ObservableObject, Identifiable{
    let mID = UUID()
    @Published var symbols: [Symbol] = []
    var monitorsPdfDocument: PDFDocument = {
        guard let url = Bundle.main.url(forResource: "ARKPDF_Monitors", withExtension: "pdf"),
              let document = PDFDocument(url: url) else {
            fatalError("Unable to load PDF document.")
        }
        return document
    }()
    
    var medicationPdfDocument: PDFDocument = {
        guard let url = Bundle.main.url(forResource: "ARKPDF_Medication", withExtension: "pdf"),
              let document = PDFDocument(url: url) else {
            fatalError("Unable to load PDF document.")
        }
        return document
    }()
    var fluidsPdfDocument: PDFDocument = {
        guard let url = Bundle.main.url(forResource: "ARKPDF_Fluids", withExtension: "pdf"),
              let document = PDFDocument(url: url) else {
            fatalError("Unable to load PDF document.")
        }
        return document
    }()
   
}
