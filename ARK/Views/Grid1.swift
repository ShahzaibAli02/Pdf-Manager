//
//  Grid1.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 8/4/24.
//

import SwiftUI
import PDFKit

struct PDFKitGridView1: UIViewRepresentable {
    let pdfDocument: PDFDocument

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayDirection = .vertical
        pdfView.usePageViewController(true, withViewOptions: nil)
        pdfView.backgroundColor = .lightGray
        pdfView.isUserInteractionEnabled = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // No need to update anything here
    }
}



struct Grid1: View { 
    var pdfDocument: PDFDocument {
        // Ensure the PDF is in your main bundle
        guard let url = Bundle.main.url(forResource: "ARKPDF_grid1", withExtension: "pdf"),
              let document = PDFDocument(url: url) else {
            fatalError("Unable to load PDF document.")
        }
        return document
    }

    var body: some View {
        PDFKitGridView1(pdfDocument: pdfDocument)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Grid1()
}




