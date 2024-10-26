//
//  PDFImageAnnotation.swift
//  ARK
//
//  Created by Shahzaib Ali on 24/10/2024.
//
import PDFKit
import UIKit

class PDFImageAnnotation: PDFAnnotation {
    
    var image: UIImage?
    
    convenience init(_ image: UIImage?, bounds: CGRect, properties: [AnyHashable : Any]?) {
        // Use .widget instead of .stamp to avoid the default box around the annotation
        self.init(bounds: bounds, forType: PDFAnnotationSubtype.widget, withProperties: properties)
        self.image = image
    }
    
    override func draw(with box: PDFDisplayBox, in context: CGContext) {
        super.draw(with: box, in: context)
        
        // Check if there's an image to draw
        guard let cgImage = image?.cgImage else { return }
        
        // Save the current context state
        context.saveGState()
        
        // Move to the annotation's origin
        context.translateBy(x: bounds.origin.x, y: bounds.origin.y)
        
        // No need to flip the context - just draw the image directly
        context.draw(cgImage, in: CGRect(origin: .zero, size: bounds.size))
        
        // Restore the context state
        context.restoreGState()
    }
}
