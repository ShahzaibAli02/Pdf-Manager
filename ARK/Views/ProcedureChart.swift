//
//  ProcedureBasicsView.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 1/21/24.
//

import SwiftUI
import PDFKit

struct ProcedureChart: View {
    
    
    @ObservedObject  var procedure:Procedure
//    @ObservedObject var userData: UserEntryData
//    @State private var monitorsPdfDocument: PDFDocument = {
//        guard let url = Bundle.main.url(forResource: "ARKPDF_Monitors", withExtension: "pdf"),
//              let document = PDFDocument(url: url) else {
//            fatalError("Unable to load PDF document.")
//        }
//        return document
//    }()
    
//    @State private var symbols: [Symbol] = []
    
//    private var medicationPdfDocument: PDFDocument = {
//        guard let url = Bundle.main.url(forResource: "ARKPDF_Medication", withExtension: "pdf"),
//              let document = PDFDocument(url: url) else {
//            fatalError("Unable to load PDF document.")
//        }
//        return document
//    }()
    
//    @State private var fluidsPdfDocument: PDFDocument = {
//        guard let url = Bundle.main.url(forResource: "ARKPDF_Fluids", withExtension: "pdf"),
//              let document = PDFDocument(url: url) else {
//            fatalError("Unable to load PDF document.")
//        }
//        return document
//    }()
    
    
    @State private var ButtonPadding1: CGFloat = 20
    @State private var isExpanded1 = false
    @State private var ButtonSymbol1 = "PlusImage"
    @State private var ButtonPaddingTop1: CGFloat = 0
    @State private var SubmitButtonWidth: CGFloat = 0
    @State private var counter = 0
    @State private var counterText = "Counter: 0"
    
    @State private var timeRemaining = 300
    @State private var timerIsActive = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var ButtonPadding2: CGFloat = 20
    @State private var isExpanded2 = false
    @State private var ButtonSymbol2 = "PlusImage"
    @State private var ButtonPaddingTop2: CGFloat = 0
    @State private var SubmitButtonWidth2: CGFloat = 0
    @State private var counter2 = 0
    @State private var counterText2 = "Counter: 0"
    
    
    @State private var ButtonPadding3: CGFloat = 20
    @State private var isExpanded3 = false
    @State private var ButtonSymbol3 = "PlusImage"
    @State private var ButtonPaddingTop3: CGFloat = 0
    @State private var SubmitButtonWidth3: CGFloat = 0
    @State private var counter3 = 0
    @State private var counterText3 = "Counter: 0"
    
    @State private var ButtonPadding4: CGFloat = 20
    @State private var isExpanded4 = false
    @State private var ButtonSymbol4 = "PlusImage"
    @State private var ButtonPaddingTop4: CGFloat = 0
    @State private var ButtonPaddingBottom4: CGFloat = 0
    @State private var SubmitButtonWidth4: CGFloat = 0
    @State private var counter4 = 0
    @State private var counterText4 = "Counter: 0"
    init(procedure: Procedure) {
        
        
        self.procedure = procedure
    
    }
    
    var body: some View {
        VStack {
            NavigationStack{
                ScrollView{
                    
                    VStack(alignment: .center, spacing: 20) {
                        
/*--------------------------------------------------------
Header
 */
//        Group{
//            // Title
//            Text("Procedure Charting")
//                .font(
//                    Font.custom("Inter", size: 20)
//                        .weight(.bold)
//                )
//                .multilineTextAlignment(.center)
//                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
//                .frame(width: 308, height: 28, alignment: .center)
//                .offset(x:0  ,y:0)
//            
//            // Progress Bar
//            HStack{
//                // Bar 1
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 24.90, height: 19)
//                    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
//                    .cornerRadius(10)
//                // Bar 2
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 143.44, height: 19)
//                    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
//                    .cornerRadius(10)
//                // Bar 3
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 82.68, height: 19)
//                    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
//                    .cornerRadius(10)
//                // Bar 4
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 24.90, height: 19)
//                    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
//                    .cornerRadius(10)
//                // Bar 5
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 289.86, height: 19)
//                    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
//                    .cornerRadius(10)
//                
//                // Bar 6
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 24.90, height: 19)
//                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
//                    .cornerRadius(10)
//                // Bar 7
//                Rectangle()
//                    .foregroundColor(.clear)
//                    .frame(width: 143.44, height: 19)
//                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
//                    .cornerRadius(10)
//                
//                
//            }
//        }
//                        
//                        
                        
/*--------------------------------------------------------
 Edit Button
*/
                        /*
            NavigationLink(destination: Review1(userData: userData)) {
            Image("PenImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipped()
                .padding(.bottom)
        }
                         */
                   
                        
                        
                        
                         
/*--------------------------------------------------------
 Monitors Main Block
*/
                ZStack(alignment: .trailing) {
                    if isExpanded1 {
// Expanded rectangle
    Rectangle()
        .foregroundColor(.clear)
        .frame(width: .infinity, height: 400)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
        .padding(.trailing)
    
    
    HStack (alignment: .top) {
        
        VStack(alignment: .leading){
     
            
            // Inside your expanded section for "Monitors"
            PDFGridMonitors(pdfDocument: procedure.monitorsPdfDocument)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))

        }
 
        
                            
        }
    } else {
// Default rectangle
        
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 713, height: 75)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
        
        
        
        HStack {
            VStack{
                    
                Text("Monitors")
                    .font(Font.custom("Inter", size: 32).weight(.bold))
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                    .frame(width: 200, height: 66, alignment: .leading)
                    .offset(x:20,y:0)
               
                
                
            }
            Text("")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                .frame(width: 90, height: 43, alignment: .leading)
                .padding(.trailing, 410.0)
        }
    }
    
HStack{
    
    Text(timeString(time: timeRemaining))
        .onReceive(timer) { _ in
            if timerIsActive && timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .foregroundColor(timeRemaining == 0 ? .red : .black)
        .frame(width: 100, height: 49) // Adjust the width as needed
        .background(.white)
        .cornerRadius(30)
        .padding(.top, ButtonPaddingTop1)
        .padding(.trailing, isExpanded1 ? 10 : 10)
   
    
    //Expand & Hide Button
    Button(action: {
        withAnimation(.easeInOut(duration: 0.4)) { // Add the withAnimation block
            timeRemaining = 300
            timerIsActive = true
            self.isExpanded1.toggle() // This toggles the state when the button is pressed
            self.ButtonPadding1 = self.isExpanded1 ? 40 : 20
            self.ButtonPaddingTop1 = self.isExpanded1 ? 300 : 0
            self.ButtonSymbol1 = self.isExpanded1 ? "MinusImage" : "PlusImage"
            self.SubmitButtonWidth = self.isExpanded1 ? 100 : 0
        }
    }) {
        ZStack{
            
            Rectangle() // This is your button's visual representation
                .foregroundColor(.clear)
                .frame(width: 49, height: 49)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(30)
            
            Image(ButtonSymbol1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
        }
    }
                        .padding(.trailing, ButtonPadding1)
                        .padding(.top, ButtonPaddingTop1)
                        
                    }
                    }



/*--------------------------------------------------------
 Medications Main Block
*/
           ZStack(alignment: .trailing) {
                if isExpanded2 {
// Expanded rectangle
Rectangle()
    .foregroundColor(.clear)
    .frame(width: .infinity, height: 450)
    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
    .cornerRadius(16)
    .padding(.trailing)
    .offset(x:0,y:0)

                    PDFGridMedication(pdfDocument: procedure.medicationPdfDocument)
                    
} else {
// Default rectangle
    
    Rectangle()
        .foregroundColor(.clear)
        .frame(width: 713, height: 75)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
    
    HStack {
        VStack{
            Text("Medication")
                .font(Font.custom("Inter", size: 32).weight(.bold))
                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                .frame(width: 200, height: 66, alignment: .center)
           
            
            
        }
        Text("")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .frame(width: 90, height: 43, alignment: .leading)
            .padding(.trailing, 410.0)
    }
}
            
HStack{
        /*
        Button(action: {
            if counter2 * 2 + 1 < userData.ChartVitals.count - 1 {
                counter2 += 1
                counterText2 = "Counter: \(counter2)"
            } else {
                counterText2 = "Counter full"
            }
        }) {
            Text("Submit")
                .foregroundColor(.white)
            
                .frame(width: SubmitButtonWidth2, height: 49)
                .background(.gray)
            
                .cornerRadius(30)
        }
        .padding(.trailing, 15.0)
        .padding(.top, ButtonPaddingTop2)
        */
        
        Button(action: {
            withAnimation(.easeInOut(duration: 0.4)) { // Add the withAnimation block
                self.isExpanded2.toggle() // This toggles the state when the button is pressed
                self.ButtonPadding2 = self.isExpanded2 ? 40 : 20
                self.ButtonPaddingTop2 = self.isExpanded2 ? 350 : 0
                self.ButtonSymbol2 = self.isExpanded2 ? "MinusImage" : "PlusImage"
                self.SubmitButtonWidth2 = self.isExpanded2 ? 100 : 0
                    
            }
        }) {
            ZStack{
                
                Rectangle() // This is your button's visual representation
                    .foregroundColor(.clear)
                    .frame(width: 49, height: 49)
                    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                    .cornerRadius(30)
                
                Image(ButtonSymbol2)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipped()
                    
            }
        }
        .padding(.trailing, ButtonPadding2)
        .padding(.top, ButtonPaddingTop2)
       
        
    }
        }

            
                        
/*--------------------------------------------------------
 FluidsMain Block
*/
                    ZStack(alignment: .trailing) {
                         if isExpanded3 {
         // Expanded rectangle
Rectangle()
 .foregroundColor(.clear)
 .frame(width: .infinity, height: 330)
 .background(Color(red: 0.96, green: 0.96, blue: 0.96))
 .cornerRadius(16)
 .padding(.trailing)
 .offset(x:0,y:0)

                             PDFGridFluids(pdfDocument: procedure.fluidsPdfDocument)
                             
} else {
// Default rectangle
 
 Rectangle()
     .foregroundColor(.clear)
     .frame(width: 713, height: 75)
     .background(Color(red: 0.96, green: 0.96, blue: 0.96))
     .cornerRadius(16)
 
 
 HStack {
     VStack{
         Text("Fluids")
             .font(Font.custom("Inter", size: 32).weight(.bold))
             .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
             .frame(width: 200, height: 66, alignment: .leading)
             .offset(x:20,y:0)
        
         
         
     }
     Text("")
         .font(Font.custom("Inter", size: 14))
         .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
         .frame(width: 90, height: 43, alignment: .leading)
         .padding(.trailing, 410.0)
 }
}
         
HStack{
     
    /*
     Button(action: {
         if counter3 * 2 + 1 < userData.ChartVitals.count - 1 {
             counter3 += 1
             counterText3 = "Counter: \(counter3)"
         } else {
             counterText3 = "Counter full"
         }
     }) {
         Text("Submit")
             .foregroundColor(.white)
         
             .frame(width: SubmitButtonWidth3, height: 49)
             .background(.gray)
         
             .cornerRadius(30)
     }
     .padding(.trailing, 15.0)
     .padding(.top, ButtonPaddingTop3)
     */
     
     Button(action: {
         withAnimation(.easeInOut(duration: 0.4)) { // Add the withAnimation block
             self.isExpanded3.toggle() // This toggles the state when the button is pressed
             self.ButtonPadding3 = self.isExpanded3 ? 40 : 20
             self.ButtonPaddingTop3 = self.isExpanded3 ? 250 : 0
             self.ButtonSymbol3 = self.isExpanded3 ? "MinusImage" : "PlusImage"
             self.SubmitButtonWidth3 = self.isExpanded3 ? 100 : 0
         }
     }) {
         ZStack{
             
             Rectangle() // This is your button's visual representation
                 .foregroundColor(.clear)
                 .frame(width: 49, height: 49)
                 .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                 .cornerRadius(30)
             
             Image(ButtonSymbol3)
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 50, height: 50)
                 .clipped()
         }
     }
     .padding(.trailing, ButtonPadding3)
     .padding(.top, ButtonPaddingTop3)
     
 }
     }
                        
                        
                        
/*--------------------------------------------------------
     Vitals Main Block
*/
                        ZStack(alignment: .trailing) {
                             if isExpanded4 {
             // Expanded rectangle
    Rectangle()
     .foregroundColor(.clear)
     .frame(width: .infinity, height: .infinity)
     .background(Color(red: 0.96, green: 0.96, blue: 0.96))
     .cornerRadius(16)
     .padding(.trailing)
     .offset(x:0,y:0)

                                 Grid2(symbols: $procedure.symbols)
    } else {
    // Default rectangle
     
     Rectangle()
         .foregroundColor(.clear)
         .frame(width: 713, height: 75)
         .background(Color(red: 0.96, green: 0.96, blue: 0.96))
         .cornerRadius(16)
     
     
     HStack {
         VStack{
             Text("Vitals")
                 .font(Font.custom("Inter", size: 32).weight(.bold))
                 .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                 .frame(width: 200, height: 66, alignment: .leading)
                 .offset(x:20,y:0)
            
             
             
         }
         Text("")
             .font(Font.custom("Inter", size: 14))
             .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
             .frame(width: 90, height: 43, alignment: .leading)
             .padding(.trailing, 410.0)
     }
    }
             
    HStack{
       /*
         Button(action: {
             if counter3 * 2 + 1 < userData.ChartVitals.count - 1 {
                 counter3 += 1
                 counterText3 = "Counter: \(counter3)"
             } else {
                 counterText3 = "Counter full"
             }
         }) {
             Text("Submit")
                 .foregroundColor(.white)
             
                 .frame(width: SubmitButtonWidth3, height: 49)
                 .background(.gray)
             
                 .cornerRadius(30)
         }
         .padding(.trailing, 15.0)
         .padding(.top, ButtonPaddingTop3)
         */
         
         Button(action: {
             print("CLICKED")
             withAnimation(.easeInOut(duration: 0.4)) { // Add the withAnimation block
                 self.isExpanded4.toggle() // This toggles the state when the button is pressed
                 self.ButtonPaddingBottom4 = self.isExpanded4 ? 30 : 0
                 self.ButtonPadding4 = self.isExpanded4 ? 40 : 40
                 self.ButtonPaddingTop4 = self.isExpanded4 ? 500 : 0
                 self.ButtonSymbol4 = self.isExpanded4 ? "MinusImage" : "PlusImage"
                 self.SubmitButtonWidth4 = self.isExpanded4 ? 100 : 0
             }
         }) {
             ZStack{
                 
                 Rectangle() // This is your button's visual representation
                     .foregroundColor(.clear)
                     .frame(width: 49, height: 49)
                     .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                     .cornerRadius(30)
                 
                 Image(ButtonSymbol4)
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 50, height: 50)
                     .clipped()
             }
         }
         .padding(.trailing, ButtonPadding4)
         .padding(.top, ButtonPaddingTop4)
         .padding(.bottom, ButtonPaddingBottom4)
         
     }
         }
//-------------------------------------------------


//NavigationLink(destination: Export(userData: userData)) {
//Text("End Procedure")
//    .foregroundColor(.white)
//
//    .frame(width: 283, height: 49)
//    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
//    .cornerRadius(30)
//
//
//}.simultaneousGesture(
//    TapGesture().onEnded {
//        // Perform your action here
//        print("End Procedure TAPPED")
//        userData.monitorsPdfDocument = monitorsPdfDocument
//        userData.medicationPdfDocument = medicationPdfDocument
//        userData.fluidsPdfDocument = fluidsPdfDocument
//    }
//)
        
        
} //End of VStack 2
                    
} // End ScrollView
                
} // End Navigation Stack
    
        }
        
//        .onChange(of: medicationPdfDocument) {_ in
//
//            self.procedure.medicationPdfDocument = medicationPdfDocument
//        }
//        .onChange(of: monitorsPdfDocument) {_ in
//            self.procedure.monitorsPdfDocument = monitorsPdfDocument
//        }
//        .onChange(of: fluidsPdfDocument) {_ in
//            self.procedure.fluidsPdfDocument = fluidsPdfDocument
//        }
}
    
    // End Main body
//
//    private func setInitialCounter() {
//        var foundEmptyPair = false
//        for i in stride(from: 0, to: userData.ChartVitals.count - 1, by: 2) {
//            if userData.ChartVitals[i].isEmpty && userData.ChartVitals[i + 1].isEmpty {
//                counter = i / 2
//                counterText = "Counter: \(counter)"
//                foundEmptyPair = true
//                break
//            }
//        }
//        if !foundEmptyPair {
//            counter = max(0, (userData.ChartVitals.count / 2) - 1)
//            counterText = "Counter full"
//        }
//    }
    
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

} // End Main Struct

struct ProcedureChart_Previews: PreviewProvider {
static var previews: some View {
// Create an instance of UserEntryData for the preview
let userData = UserEntryData()
// Pass the instance to Tester2
//    ProcedureChart(index: 0,userData: userData)
}
}


//---------------------------------------------------------------PDF View Structs------------ -------------------------------------------------------------------------//

//Monitors-------------------

struct PDFKitGridMonitors: UIViewRepresentable {
    let pdfDocument: PDFDocument
    let scaleFactor: CGFloat = 1.8
        
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = false // Disable auto scaling to apply custom scaling
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayDirection = .vertical
        pdfView.usePageViewController(true, withViewOptions: nil)
        pdfView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        pdfView.isUserInteractionEnabled = true
        
        // Apply scaling
        if let page = pdfDocument.page(at: 0) {
            _ = page.bounds(for: .mediaBox)
            _ = scaleFactor / pdfView.scaleFactor
            pdfView.scaleFactor = scaleFactor
            
        }
        
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // No need to update anything here
        print("updateUIView")
    }
}



struct PDFGridMonitors: View {
    var pdfDocument: PDFDocument

    var body: some View {
        PDFKitGridMonitors(pdfDocument: pdfDocument)
            .edgesIgnoringSafeArea(.all)
    }
}



//--------------------------------------------------------

//Medication-------------------

struct PDFKitGridMedication: UIViewRepresentable {
    let pdfDocument: PDFDocument

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayDirection = .vertical
        pdfView.usePageViewController(true, withViewOptions: nil)
        pdfView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        pdfView.isUserInteractionEnabled = true
        
        
        return pdfView
            
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // No need to update anything here
        print("updateUIView")
    }
}



struct PDFGridMedication: View {
    var pdfDocument: PDFDocument

    var body: some View {
        PDFKitGridMedication(pdfDocument: pdfDocument)
            .edgesIgnoringSafeArea(.all)
    }
}



//Fluids-------------------

import SwiftUI
import PDFKit

struct PDFKitGridFluids: UIViewRepresentable {
    let pdfDocument: PDFDocument

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.displayDirection = .vertical
        pdfView.usePageViewController(true, withViewOptions: nil)
        pdfView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
        pdfView.isUserInteractionEnabled = true
        
        
        return pdfView
            
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // No need to update anything here
        print("updateUIView")
    }
}



struct PDFGridFluids: View {
    var pdfDocument: PDFDocument

    var body: some View {
        PDFKitGridFluids(pdfDocument: pdfDocument)
            .edgesIgnoringSafeArea(.all)
    }
}

