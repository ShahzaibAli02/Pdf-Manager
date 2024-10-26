
//  Grid2.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 8/5/24.
//
import Foundation
import SwiftUI
import UIKit

struct Grid2: View {
    
//    @ObservedObject var userData: UserEntryData
    @State private var selectedButton: String = "Heart Rate" // Start with Heart Rate selected
    @Binding  var symbols: [Symbol] 
    let imageHeight = 350.0
    var body: some View {
        VStack {
            
            // Adjust as needed
            GeometryReader { geo in
                ZStack {
                    Image("Grid2 Image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: imageHeight)
                        .edgesIgnoringSafeArea(.all)
            
                    // Display symbols at their respective positions
                    ForEach(symbols.indices, id: \.self) { index in
                        let symbol = symbols[index]
                        getSymbolView(for: symbol.type)
                            .position(symbol.relativePosition)
                    }
                }
                
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onEnded { value in
                            let location = value.location
                            
                            // Get the actual frame of the image
                            let imageFrame = geo.frame(in: .local)
                            let imageAspectRatio = UIImage(named: "Grid2 Image")!.size.width /  UIImage(named: "Grid2 Image")!.size.height
                            
                            let actualImageWidth = min(geo.size.width, imageAspectRatio * imageHeight)
                            
                            // Convert the gesture location relative to the image's frame
                            let relativeX = (location.x - ((geo.size.width-actualImageWidth)/2)) / actualImageWidth
                            let relativeY = (location.y - imageFrame.minY) / imageHeight
                            
                            // Ensure the gesture is within the image bounds
                            if relativeX >= 0 && relativeX <= 1 && relativeY >= 0 && relativeY <= 1 {
                                if selectedButton != "" {
                                    let actualX = relativeX * actualImageWidth
                                    let actualY = relativeY * imageHeight
                                    
                                    print("Gesture within image bounds: (\(actualX), \(actualY))")
                                    
                                    // Create symbol at the relative position
                                    let symbol = Symbol(type: selectedButton, relativePosition:CGPoint(x: location.x, y: location.y),
                                                        actualPosition:CGPoint(x: actualX, y: actualY)
                                                        , height: imageHeight , width: actualImageWidth)
                                    symbols.append(symbol)
//                                    userData.symbols = symbols
//                                    msymbols = symbols
                                    // Capture snapshot after symbol added
                                    saveSnapshot(geo: geo)
                                }
                            } else {
                                print("Gesture outside image bounds")
                            }
                        }
                )
            }.frame(maxHeight: 350)
            
            
            // Buttons to select the symbol type
            HStack(spacing: 20) {
                Button(action: {
                    selectedButton = "Systolic"
                }) {
                    Text("Systolic")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 120)
                        .background(selectedButton == "Systolic" ? (Color(red: 0.54, green: 0.68, blue: 0.97)) : (Color(red: 0.48, green: 0.47, blue: 0.47)))
                        .cornerRadius(15)
                }
                
                Button(action: {
                    selectedButton = "Heart Rate"
                }) {
                    Text("Heart Rate")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 120)
                        .background(selectedButton == "Heart Rate" ? (Color(red: 0.54, green: 0.68, blue: 0.97)) : (Color(red: 0.48, green: 0.47, blue: 0.47)))
                        .cornerRadius(15)
                }
                
                Button(action: {
                    selectedButton = "Diastolic"
                }) {
                    Text("Diastolic")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 120)
                        .background(selectedButton == "Diastolic" ? (Color(red: 0.54, green: 0.68, blue: 0.97)) : (Color(red: 0.48, green: 0.47, blue: 0.47)))
                        .cornerRadius(15)
                }
                
                // Undo button
                Button(action: {
                    undoLastSymbol() // Call undo function
                    saveSnapshot(geo: nil) // Capture snapshot after undo
                }) {
                    Image(systemName: "arrow.uturn.backward")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(Color(red: 0.48, green: 0.47, blue: 0.47))
                        .cornerRadius(20)
                }
            }
            .padding()
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            /*
             if let chartImage = userData.ChartVitalsImage {
             Image(uiImage: chartImage)
             .resizable()
             .aspectRatio(contentMode: .fill)
             .frame(maxWidth: 300, maxHeight: 400)
             //  .edgesIgnoringSafeArea(.all)
             //  .clipped()
             .offset(x: 0, y: 250)
             } else {
             Text("No Image Available")
             .frame(maxWidth: 400, maxHeight: 375) // Same size as the scaled-down image
             .background(Color.gray.opacity(0.5))
             .offset(x: 0, y: 250)
             }
             
             */
            
        } // End of Main VStack
    }
    
    
    
    
    //---------------------------------------------------------
    //---------------------------------------------------------
    
    
    // Function to remove the last symbol added
    private func undoLastSymbol() {
        if !symbols.isEmpty {
            symbols.removeLast() // Removes the last symbol from the array
        }
    }
    
    // Helper function to get the appropriate symbol view
    func getSymbolView(for type: String) -> some View {
        switch type {
        case "Systolic":
            return AnyView(SystolicSymbol())
        case "Heart Rate":
            return AnyView(HeartRateSymbol())
        case "Diastolic":
            return AnyView(
                DiastolicSymbol()
                    .stroke(Color.blue, lineWidth: 2)
                    .frame(width: 60, height: 60)
            )
        default:
            return AnyView(EmptyView())
        }
    }
    
    // Save snapshot of the current view
    private func saveSnapshot(geo: GeometryProxy?) {
        // Ensure the view has time to update before capturing the snapshot
        DispatchQueue.main.async {
            if let uiImage = getSnapshot(geo: geo) {
                // Assign the snapshot to the UserEntryData's @Published variable
//                userData.ChartVitalsImage = uiImage
            }
        }
    }
    
    
    
    // Helper function to convert SwiftUI view to UIImage
    private func getSnapshot(geo: GeometryProxy?) -> UIImage? {
        let controller = UIHostingController(rootView: self.body)
        let view = controller.view
        
        // Ensure the view fits the geometry size
        view?.bounds = CGRect(origin: .zero, size: geo?.size ?? .zero)
        view?.backgroundColor = .clear
        
        // Render the view as an image
        let renderer = UIGraphicsImageRenderer(size: geo?.size ?? .zero)
        return renderer.image { _ in
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
    }
}

// Define a struct to hold symbol data
struct Symbol: Identifiable, Equatable {
    let id = UUID()
    var type: String
    var relativePosition: CGPoint
    var actualPosition: CGPoint
    var height: CGFloat
    var width: CGFloat
}

// Symbol views
struct SystolicSymbol: View {
    var body: some View {
        Image(systemName: "checkmark")
            .font(.system(size: 60))
            .foregroundColor(Color(red: 0.54, green: 0.68, blue: 0.97))
            .padding(.top)
    }
}

struct DiastolicSymbol: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let centerX = rect.midX
        let centerY = rect.midY
        let lineLength = min(rect.width, rect.height) * 0.6
        let leftPoint = CGPoint(x: centerX - (lineLength / 2), y: centerY + (lineLength / 2))
        let topPoint = CGPoint(x: centerX, y: centerY - (lineLength / 2))
        let rightPoint = CGPoint(x: centerX + (lineLength / 2), y: centerY + (lineLength / 2))
        
        path.move(to: leftPoint)
        path.addLine(to: topPoint)
        path.addLine(to: rightPoint)
        
        return path
    }
}

struct HeartRateSymbol: View {
    var body: some View {
        Text("•")
            .font(.system(size: 60))
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0.54, green: 0.68, blue: 0.97))
    }
}


// Preview
struct Grid2_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of UserEntryData for the preview
        let userData = UserEntryData()
        // Pass the instance to this view
//        Grid2(userData: userData)
    }
}
