//
//  Export2.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 8/12/24.
//

import SwiftUI
import PDFKit

struct Export2: View {
    
    func combinePDFs() -> PDFDocument? {
        guard let pdf1URL = Bundle.main.url(forResource: "ARKPDF_Medication", withExtension: "pdf"),
              let pdf2URL = Bundle.main.url(forResource: "ARKPDF_Fluids", withExtension: "pdf"),
              let pdf1 = PDFDocument(url: pdf1URL),
              let pdf2 = PDFDocument(url: pdf2URL) else {
            return nil
        }
        
        let combinedPDF = PDFDocument()
        
        // Add all pages from the first PDF
        for i in 0..<pdf1.pageCount {
            if let page = pdf1.page(at: i) {
                combinedPDF.insert(page, at: combinedPDF.pageCount)
            }
        }
        
        // Add all pages from the second PDF
        for i in 0..<pdf2.pageCount {
            if let page = pdf2.page(at: i) {
                combinedPDF.insert(page, at: combinedPDF.pageCount)
            }
        }
        
        return combinedPDF
    }
    
    var body: some View {
        PDFKitView(pdfDocument: combinePDFs())
            .edgesIgnoringSafeArea(.all)
    }
}

struct PDFKitView: UIViewRepresentable {
    let pdfDocument: PDFDocument?
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = pdfDocument
    }
}

#Preview {
    Export2()
}
