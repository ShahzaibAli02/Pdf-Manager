//
//  Export.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 3/9/24.
//

import SwiftUI
import PDFKit
import SwiftyDropbox

struct Export: View {
    @ObservedObject var userData: UserEntryData
    
    @State private var pdfDocument: PDFDocument? = nil
    
    @State private var isEndProcedureSheetPresented = false
    
    @State private var isHideLoader:Bool = true
    @State private var showAlert:Bool = false
    @State private var alertText = ""
    @State private var xValue: String = ""
    @State private var yValue: String = ""
    @State var isShown = false
    
    var body: some View {
        VStack {
            
//            TextField("Enter X value", text: $xValue)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .keyboardType(.decimalPad)
//
//                        TextField("Enter Y value", text: $yValue)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .keyboardType(.decimalPad)
            
            ZStack{
                
               
            NavigationStack{
                
/*--------------------------------------------------------
Header
*/

                
                Group{    
        // Title
        Text("Final Review")
            .font(
                Font.custom("Inter", size: 20)
                    .weight(.bold)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .frame(width: 308, height: 28, alignment: .center)
            .offset(x:0  ,y:0)
        
        // Progress Bar
        HStack{
            // Bar 1
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 24.90, height: 19)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(10)
            // Bar 2
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 143.44, height: 19)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(10)
            // Bar 3
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 82.68, height: 19)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(10)
            // Bar 4
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 24.90, height: 19)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(10)
            // Bar 5
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 289.86, height: 19)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(10)
            
            // Bar 6
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 24.90, height: 19)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(10)
            // Bar 7
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 143.44, height: 19)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(10)
            
            
        }
                    
                    

    }
    
//-------------------------------------------------
    
    PDFDocumentView(pdfDocument: $pdfDocument)
        .onAppear {
            createPDF(xValue : xValue,yValue : yValue)
        }
//        .onChange(of: xValue) { _ in
//            createPDF(xValue : xValue,yValue : yValue)
//        }
//        .onChange(of: yValue) { _ in
//            createPDF(xValue : xValue,yValue : yValue)
//        }
    
                if isEndProcedureSheetPresented {
                                      EndProcedureSheet()
                                          .offset(y: isEndProcedureSheetPresented ? 0 : UIScreen.main.bounds.height)
                                          .animation(.easeInOut(duration: 0.5), value: isEndProcedureSheetPresented)
                                          .zIndex(1)
                                  }
                
                
    HStack{
        //TODO CHANGE
        NavigationLink(destination: ProcedureChartList(userData: userData)) {
            // Button
            
            Text("Save Changes")
                .font(
                    Font.custom("Inter", size: 20)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .frame(width: 176.48665, height: 49, alignment: .center)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(30)
            
            
        }

        
        Button(action: {
            withAnimation {
                isEndProcedureSheetPresented.toggle()
            }
        }) {
            Text("Edit")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 150, height: 49)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(30)
                .padding(.leading, 100)
        }
        
  

        
        
        Button(action: {     // DROPBOX
       
            if (DropboxClientsManager.authorizedClient != nil){
                if let client = DropboxClientsManager.authorizedClient {
                    print("successful login")
                    isHideLoader = false
                    
                    let fileData = self.pdfDocument?.dataRepresentation()
                    
                    _ = client.files.upload(path: "/ARK.pdf", mode:.overwrite, input: fileData!)
                        .response { response, error in
                            if let response = response {
                                alertText = "Uploaded"
                                print(response)
                            } else if let error = error {
                                alertText = error.localizedDescription
                                print(error)
                            }
                            
                            showAlert = true
                            isHideLoader = true
                            
                        }
                        .progress { progressData in
                            print(progressData)
                        }
                } else {
                    print("Error")
                }
            } else {
                self.isShown.toggle()
            }
        }) {
            Text("Dropbox")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 150, height: 49)
                .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                .cornerRadius(30)
                .padding(.leading,100)
        }
        .onOpenURL { url in
            let oauthCompletion: DropboxOAuthCompletion = {
                if let authResult = $0 {
                    switch authResult {
                    case .success:
                        print("Success! User is logged into DropboxClientsManager.")
                    case .cancel:
                        print("Authorization flow was manually canceled by user!")
                    case .error(_, let description):
                        print("Error: \(String(describing: description))")
                    }
                }
            }
            DropboxClientsManager.handleRedirectURL(url, includeBackgroundClient: true, completion: oauthCompletion)
        }

        
        DropboxView(isShown: $isShown)
            .frame(width: 10, height: 49)
                    
                    
                }
                .padding(.top)
                
            } //End Nav Stack
            .alert(alertText, isPresented: $showAlert) {
                        Button("OK") { }
                    }
                
                LoaderView(tintColor: .red, scaleSize: 3.0)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .background(Color(red: 0.5, green: 0.5, blue: 0.5))
                    .opacity(isHideLoader ? 0 : 0.5)
                
        } // End ZStack
        } //VStack End
        
    } // Main Body End
    
    fileprivate func combineAnotationsVals(_ pdfDocument: PDFDocument, _ targetpdfDocument : PDFDocument?) {
        // Iterate through the pages of the source PDF (monitorsPdfDocument)
        if let monitorsPdfDocument  = targetpdfDocument{
            for pageIndex in 0..<monitorsPdfDocument.pageCount {
                guard let sourcePage = monitorsPdfDocument.page(at: pageIndex),
                      let targetPage = pdfDocument.page(at: pageIndex) else {
                    continue
                }
                
                // Get all annotations (form fields) from the source page
                let sourceAnnotations = sourcePage.annotations
                let targetAnnotations = targetPage.annotations
                
                // Iterate through the form fields and copy values
                for sourceAnnotation in sourceAnnotations {
                    if let targetAnnotation = targetAnnotations.first(where: { $0.fieldName == sourceAnnotation.fieldName }) {
                        // Assuming you're copying values from text fields
                        targetAnnotation.widgetStringValue = sourceAnnotation.widgetStringValue
                    }
                }
            }
        }
    }
    func mapPosition(from sourcePosition: CGPoint, sourceSize: CGSize, targetSize: CGSize, tartGetStartGap:CGFloat , targetBottomGap: CGFloat) -> CGPoint {
        // Calculate the scale factors for width and height
        let xScale = targetSize.width / sourceSize.width
        let yScale = targetSize.height / sourceSize.height

        // Map x position directly
        let targetX = (sourcePosition.x * xScale) + tartGetStartGap

        // Invert and scale the y position, then add the bottom gap
        let targetY = (sourceSize.height - sourcePosition.y) * yScale + targetBottomGap

        return CGPoint(x: targetX, y: targetY)
    }
    func getSymbol(_ type: String) -> UIImage {
        return {
            print("TYPE ",type)
            let colorBlue = UIColor(red: 0.54, green: 0.68, blue: 0.97, alpha: 1.0)
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: 20, height: 20))
            return renderer.image { context in
            
                if(type == "Heart Rate")
                {
                    context.cgContext.setFillColor(colorBlue.cgColor)
                    context.cgContext.fillEllipse(in: CGRect(x: 0, y: 0, width: 10, height: 10))
                }
                else
                if(type == "Systolic")
                {
                    context.cgContext.setStrokeColor(colorBlue.cgColor)
                    context.cgContext.setLineWidth(2.0)

                           // Define the checkmark path
                           let checkmarkPath = UIBezierPath()
                           checkmarkPath.move(to: CGPoint(x: 0, y: 10))
                           checkmarkPath.addLine(to: CGPoint(x: 9, y: 13))
                           checkmarkPath.addLine(to: CGPoint(x: 16, y: 0))
                           
                           context.cgContext.addPath(checkmarkPath.cgPath)
                           context.cgContext.strokePath()
                }
                else
                if(type == "Diastolic")
                {
                    context.cgContext.setStrokeColor(colorBlue.cgColor)
                    context.cgContext.setLineWidth(1.0)

                           // Define the checkmark path
                           let checkmarkPath = UIBezierPath()
                           checkmarkPath.move(to: CGPoint(x: 0, y: 20))
                           checkmarkPath.addLine(to: CGPoint(x: 10, y: 0))
                           checkmarkPath.addLine(to: CGPoint(x: 20, y: 20))
                           
                           context.cgContext.addPath(checkmarkPath.cgPath)
                           context.cgContext.strokePath()
                }
             
                
                
            }
        }()
    }
    
    private func createPDF( xValue : String,yValue : String) {
        
        
//        guard let pdfURL = Bundle.main.url(forResource: "ARKPDF", withExtension: "pdf"),
//              let pdfDocument = PDFDocument(url: pdfURL) else {
//            print("Unable to load the PDF.")
//            return
//        }
        
        var newX = 0.0
        var newY  = 0.0
        
        if let mX = Float(xValue), let mY = Float(yValue) {
            newX = Double(mX)
            newY = Double(mY)
                   }
        guard let pdfURL = Bundle.main.url(forResource: "ARKPDF", withExtension: "pdf"),
              let mainPdfDocument = PDFDocument(url: pdfURL) else {
            print("Unable to load the PDF.")
            return
        }
        
        
        userData.procedures.forEach { procedure in
     
            print("SYMBOLS \(procedure.symbols)")
            guard let pdfURL = Bundle.main.url(forResource: "ARKPDF grid", withExtension: "pdf"),
                  let pdfDocument0 = PDFDocument(url: pdfURL) else {
                print("Unable to load the PDF.")
                return
            }
            
            
            // ======= //
//            if let monitorsPdfDocument = procedure.monitorsPdfDocument{
//                
//            }
            combineAnotationsVals(pdfDocument0,procedure.monitorsPdfDocument)
            combineAnotationsVals(pdfDocument0,procedure.medicationPdfDocument)
            combineAnotationsVals(pdfDocument0,procedure.fluidsPdfDocument)
        
          
            
            procedure.symbols.forEach { symBol in
                let purpleDotImage: UIImage = getSymbol(symBol.type)
                let sourcePosition = symBol.actualPosition
                let sourceSize = CGSize(width: symBol.width, height: symBol.height)
                let targetSize = CGSize(width: 536, height: 223)
                let targetPosition = mapPosition(from: sourcePosition, sourceSize: sourceSize, targetSize: targetSize , tartGetStartGap: 32 , targetBottomGap: 80 )

    //            let image = UIImage(systemName: "checkmark")
                
                let imageAnnotation = PDFImageAnnotation(purpleDotImage, bounds: CGRect(x: targetPosition.x, y: targetPosition.y, width: 20, height: 20), properties: nil)
                
    //            let imageAnnotation = PDFImageAnnotation(image, bounds: CGRect(x: newX, y: newY, width: 10, height: 10), properties: nil)
                pdfDocument0.page(at: 0)?.addAnnotation(imageAnnotation)
            }
            if let page = pdfDocument0.page(at: 0) {
                mainPdfDocument.insert(page, at:  mainPdfDocument.pageCount)
            }
        }
     
    
       
        
        if let page = mainPdfDocument.page(at: 0) {
            let annotations = page.annotations
            for annotation in annotations {
                switch annotation.fieldName {
                case "DateText":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.DateText
                    }
                case "FacilityText":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.FacilityText
                    }
                case "PhysicianText":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.PhysicianText
                    }
                    
                case "ProcedureText":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.PhysicianText
                    }
                    
                    
                case "General":
                    annotation.buttonWidgetState = userData.General ? .onState : .offState
                case "Regional":
                    annotation.buttonWidgetState = userData.Regional ? .onState : .offState
                case "MAC":
                    annotation.buttonWidgetState = userData.MAC ? .onState : .offState
              
                    
                    
                case "NPO":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.NPO
                    }
                
                case "FirstNameText":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.FirstNameText
                    }
                    
                case "LastNameText":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.LastNameText
                    }
                      
                case "WeightText":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.WeightText
                    }
                
                case "AllergiesText":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.AllergiesText
                    }
                    
                    
                case "CardioWNL":annotation.buttonWidgetState = userData.CardioWNL ? .onState : .offState

                case "CardioHTN":
annotation.buttonWidgetState = userData.CardioHTN ? .onState : .offState

                case "CardioAngina":
                                    annotation.buttonWidgetState = userData.CardioAngina ? .onState : .offState


                case "CardioPTCAStent":
                                    annotation.buttonWidgetState = userData.CardioPTCAStent ? .onState : .offState


                case "CardioCAD":
                                    annotation.buttonWidgetState = userData.CardioCAD ? .onState : .offState


                case "CardioMI":
                                    annotation.buttonWidgetState = userData.CardioMI ? .onState : .offState


                case "CardioCABG":
                                    annotation.buttonWidgetState = userData.CardioCABG ? .onState : .offState


                case "CardioHLD":
                                    annotation.buttonWidgetState = userData.CardioHLD ? .onState : .offState


                case "CardioPVD":
                                    annotation.buttonWidgetState = userData.CardioPVD ? .onState : .offState


                case "CardioAfib":
                                    annotation.buttonWidgetState = userData.CardioAfib ? .onState : .offState


                case "CardioCHF":
                                    annotation.buttonWidgetState = userData.CardioCHF ? .onState : .offState


                case "CardioEKGText":
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.CardioEKGText
                    }


                case "HeartExamRegular":
                                    annotation.buttonWidgetState = userData.HeartExamRegular ? .onState : .offState


                case "HeartExamIrregular":
                                    annotation.buttonWidgetState = userData.HeartExamIrregular ? .onState : .offState


                case "HeartExamMurmur":
                                    annotation.buttonWidgetState = userData.HeartExamMurmur ? .onState : .offState


                case "IsPatientOnBetaBlockers":
                    annotation.buttonWidgetState = userData.isPatientOnBetaBlockers ? .onState : .offState

                case "isBetaBlockerGivenDayPrior":
                                    annotation.buttonWidgetState = userData.isBetaBlockerGivenDayPrior ? .onState : .offState

                case "isBetaBlockerGivenIntraOP":
                                    annotation.buttonWidgetState = userData.isBetaBlockerGivenIntraOP ? .onState : .offState

                case "isBetaBlockerContraindicated":
                                    annotation.buttonWidgetState = userData.isBetaBlockerContraindicated ? .onState : .offState



                case "PulmWNL":
                                    annotation.buttonWidgetState = userData.PulmWNL ? .onState : .offState

                case "PulmAsthma":
                                    annotation.buttonWidgetState = userData.PulmAsthma ? .onState : .offState

                case "PulmPneumonia":
                                    annotation.buttonWidgetState = userData.PulmPneumonia ? .onState : .offState

                case "PulmCOPD":
                                    annotation.buttonWidgetState = userData.PulmCOPD ? .onState : .offState

                case "PulmOSA":
                                    annotation.buttonWidgetState = userData.PulmOSA ? .onState : .offState

                case "PulmBronchitis":
                                    annotation.buttonWidgetState = userData.PulmBronchitis ? .onState : .offState

                case "isPatientASmoker":
                                    annotation.buttonWidgetState = userData.isPatientASmoker ? .onState : .offState

                case "SmokerFrequency":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.SmokeFrequency
                }
                    
                    if let currentValue = annotation.widgetStringValue {
                        annotation.widgetStringValue = currentValue + " " + userData.CardioEKGText
                    }

                case "LungsCTA":
                                    annotation.buttonWidgetState = userData.LungsCTA ? .onState : .offState

                case "LungsOther":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LungsOther
                }

                case "CNSWNL":
                                    annotation.buttonWidgetState = userData.CNSWNL ? .onState : .offState

                case "CNSDementia":
                                    annotation.buttonWidgetState = userData.CNSDementia ? .onState : .offState

                case "CNSSeizure":
                                    annotation.buttonWidgetState = userData.CNSSeizure ? .onState : .offState

                case "CNSETOH":
                                    annotation.buttonWidgetState = userData.CNSETOH ? .onState : .offState

                case "CNSCVA":
                                    annotation.buttonWidgetState = userData.CNSCVA ? .onState : .offState

                case "CNSMigraines":
                    annotation.buttonWidgetState = userData.CNSMigraines ? .onState : .offState

                case "CNSDrugAbuse":
                                    annotation.buttonWidgetState = userData.CNSDrugAbuse ? .onState : .offState

                case "CNSAnxietyDepression":
                                    annotation.buttonWidgetState = userData.CNSAnxietyDepression ? .onState : .offState

                case "CNSOtherText":
                    if let currentValue = annotation.widgetStringValue {
                    annotation.widgetStringValue = currentValue + " " + userData.CNSOtherText
                    }

                case "GIWNL":
                    annotation.buttonWidgetState = userData.GIWNL ? .onState : .offState

                case "GIHernia":
                                    annotation.buttonWidgetState = userData.GIHernia ? .onState : .offState

                case "GIGERD":
                                    annotation.buttonWidgetState = userData.GIGERD ? .onState : .offState

                case "GIDiverticulosis":
                                    annotation.buttonWidgetState = userData.GIDiverticulosis ? .onState : .offState

                case "GIHepatitis":
                                    annotation.buttonWidgetState = userData.GIHepatitis ? .onState : .offState

                case "GIOtherText":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.GIOtherText
                }

                case "RenalWNL":
                                    annotation.buttonWidgetState = userData.RenalWNL ? .onState : .offState

                case "RenalCKD":
                                    annotation.buttonWidgetState = userData.RenalCKD ? .onState : .offState

                case "RenalBPH":
                                    annotation.buttonWidgetState = userData.RenalBPH ? .onState : .offState

                case "RenalESRD":
                                    annotation.buttonWidgetState = userData.RenalESRD ? .onState : .offState

                case "RenalOtherText":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.RenalOtherText
                }

                case "EndoWNL":
                                    annotation.buttonWidgetState = userData.EndoWNL ? .onState : .offState

                case "EndoDiabetes":
                                    annotation.buttonWidgetState = userData.EndoDiabetes ? .onState : .offState

                case "EndoObesity":
                                    annotation.buttonWidgetState = userData.EndoObesity ? .onState : .offState

                case "EndoThyroid":
                                    annotation.buttonWidgetState = userData.EndoThyroid ? .onState : .offState

                case "EndoOtherText":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.EndoOtherText
                }

                case "Airway1":
                                    annotation.buttonWidgetState = userData.Airway1 ? .onState : .offState

                case "Airway2":
                                    annotation.buttonWidgetState = userData.Airway2 ? .onState : .offState

                case "Airway3":
                                    annotation.buttonWidgetState = userData.Airway3 ? .onState : .offState

                case "Airway4":
                                    annotation.buttonWidgetState = userData.Airway4 ? .onState : .offState

                case "DentitionIntact":
                                    annotation.buttonWidgetState = userData.DentitionIntact ? .onState : .offState

                case "DentitionLoose":
                                    annotation.buttonWidgetState = userData.DentitionLoose ? .onState : .offState

                case "DentitionCap":
                                    annotation.buttonWidgetState = userData.DentitionCap ? .onState : .offState

                case "DentitionBridge":
                                    annotation.buttonWidgetState = userData.DentitionBridge ? .onState : .offState

                case "LabsOne1":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsOne1
                }

                case "LabsOne2":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsOne2
                }

                case "LabsOne3":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsOne3
                }

                case "LabsOne4":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsOne4
                }

                case "LabsOne5":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsOne5
                }

                case "LabsOne6":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsOne6
                }

                case "LabsOne7":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsOne7
                }


                case "LabsTwo1":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsTwo1
                }

                case "LabsTwo2":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsTwo2
                }

                case "LabsTwo3":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsTwo3
                }

                case "LabsTwo4":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsTwo4
                }

                case "LabsThree1":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsThree1
                }


                case "LabsThree2":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsThree2
                }

                case "LabsThree3":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.LabsThree3
                }

                case "ASA1":
                                    annotation.buttonWidgetState = userData.ASA1 ? .onState : .offState
                case "ASA2":
                                    annotation.buttonWidgetState = userData.ASA2 ? .onState : .offState

                case "ASA3":
                                    annotation.buttonWidgetState = userData.ASA3 ? .onState : .offState

                case "ASA4":
                                    annotation.buttonWidgetState = userData.ASA4 ? .onState : .offState

                case "ASAE":
                                    annotation.buttonWidgetState = userData.ASAE ? .onState : .offState

                case "PreOpSigDate":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + "" + userData.PreOpSigDate
                }

                case "MethodGenA":
                                    annotation.buttonWidgetState = userData.MethodGenA ? .onState : .offState

                case "MethodSpinal":
                                    annotation.buttonWidgetState = userData.MethodSpinal ? .onState : .offState

                case "MethodNeveBlock":
                                    annotation.buttonWidgetState = userData.MethodNerveBlock ? .onState : .offState

                case "MethodNeveBlockAxillary":
                                    annotation.buttonWidgetState = userData.MethodNerveBlockAxillary ? .onState : .offState

                case "MethodNeveBlockInterscalene":
                                    annotation.buttonWidgetState = userData.MethodNerveBlockInterscalene ? .onState : .offState

                case "MethodNeveBlockFemoral":
                                    annotation.buttonWidgetState = userData.MethodNerveBlockFemoral ? .onState : .offState

                case "MethodNeveBlockIVRegional":
                                    annotation.buttonWidgetState = userData.MethodNerveBlockIVRegional ? .onState : .offState

                case "MethodNeveBlockOtherText":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.MethodNerveBlockOtherText
                }

                case "MethodMonitoredA":
                                    annotation.buttonWidgetState = userData.MethodMonitoredA ? .onState : .offState

                case "isException":
                                    annotation.buttonWidgetState = userData.isException ? .onState : .offState

                case "isRefused":
                                    annotation.buttonWidgetState = userData.isRefused ? .onState : .offState




                case "AnethesiaRefusedText":
                    if let currentValue = annotation.widgetStringValue {
                    annotation.widgetStringValue = currentValue + " " + userData.AnesthesiaRefusedText
                    }


                case "ConsentDateText":
                    if let currentValue = annotation.widgetStringValue {
                        // Create a DateFormatter
                        let dateFormatter = DateFormatter()
                        // Set the desired date format
                        dateFormatter.dateFormat = "MM-dd-yyy" // Format for time only
                        // Convert the date to a string
                        let dateString = dateFormatter.string(from: userData.ConsentDateText)
                        // Concatenate the strings
                        annotation.widgetStringValue = currentValue + " " + dateString
                    }


                case "AirwayNasalC":
                                    annotation.buttonWidgetState = userData.AirwayNasalC ? .onState : .offState

                case "AirwayPreO2":
                                    annotation.buttonWidgetState = userData.AirwayPreO2 ? .onState : .offState

                case "AirwayMask":
                                    annotation.buttonWidgetState = userData.AirwayMask ? .onState : .offState

                case "AirwayMaskEasy":
                                    annotation.buttonWidgetState = userData.AirwayMaskEasy ? .onState : .offState

                case "AirwayMaskHard":
                                    annotation.buttonWidgetState = userData.AirwayMaskHard ? .onState : .offState

                case "AirwayOral":
                                    annotation.buttonWidgetState = userData.AirwayOral ? .onState : .offState

                case "AirwayNasalA":
                                    annotation.buttonWidgetState = userData.AirwayNasalA ? .onState : .offState

                case "AirwayTrach":
                                    annotation.buttonWidgetState = userData.AirwayTrach ? .onState : .offState

                case "AirwayLMA":
                                    annotation.buttonWidgetState = userData.AirwayLMA ? .onState : .offState

                case "AirwayLMANumber":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.AirwayLMANumber
                }

                case "AirwayIntubation":
                                    annotation.buttonWidgetState = userData.AirwayIntubation ? .onState : .offState

                case "AirwayIntubationEasy":
                                    annotation.buttonWidgetState = userData.AirwayIntubationEasy ? .onState : .offState

                case "AirwayIntubationHard":
                                    annotation.buttonWidgetState = userData.AirwayIntubationHard ? .onState : .offState

                case "AirwayOralNasal":
                                    annotation.buttonWidgetState = userData.AirwayOralNasal ? .onState : .offState
                case "AirwayCuff":
                                    annotation.buttonWidgetState = userData.AirwayCuff ? .onState : .offState

                case "AirwayRapid":
                                    annotation.buttonWidgetState = userData.AirwayRapid ? .onState : .offState

                case "AirwayMacMil":
                                    annotation.buttonWidgetState = userData.AirwayMacMil ? .onState : .offState

                case "AirwayMac":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.AirwayMac
                }

                case "AirwayMil":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.AirwayMil
                }

                case "AirwayEtt":
                                    annotation.buttonWidgetState = userData.AirwayEtt ? .onState : .offState

                case "AirwayETTSize":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.AirwayETTSize
                }

                case "AirwayETTAttempt1":
                                    annotation.buttonWidgetState = userData.AirwayETTAttempt1 ? .onState : .offState

                case "AirwayETTAttempt2":
                                    annotation.buttonWidgetState = userData.AirwayETTAttempt2 ? .onState : .offState

                case "AirwayETTAttempt3":
                                    annotation.buttonWidgetState = userData.AirwayETTAttempt3 ? .onState : .offState

                case "AirwayETTView1":
                                    annotation.buttonWidgetState = userData.AirwayETTView1 ? .onState : .offState

                case "AirwayETTView2":
                                    annotation.buttonWidgetState = userData.AirwayETTView2 ? .onState : .offState

                case "AirwayETTView3":
                                    annotation.buttonWidgetState = userData.AirwayETTView3 ? .onState : .offState

                case "AirwayETTView4":
                                    annotation.buttonWidgetState = userData.AirwayETTView4 ? .onState : .offState

                case "AirwayETTTapped":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.AirwayETTTapped
                }



                case "AirwayETTCo2":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.AirwayETTCo2
                }

                case "AirwayBillBreathSounds":
                                    annotation.buttonWidgetState = userData.AirwayBillBreathSounds ? .onState : .offState

                    
                    
//Need to figure out time/date formate or convert to string or some shit
                case "ProcedureStartTime":
                    if let currentValue = annotation.widgetStringValue {
                        // Create a DateFormatter
                        let dateFormatter = DateFormatter()
                        // Set the desired date format
                        dateFormatter.dateFormat = "HH:mm:ss" // Format for time only
                        // Convert the date to a string
                        let dateString = dateFormatter.string(from: userData.ProcedureStartTime)
                        // Concatenate the strings
                        annotation.widgetStringValue = currentValue + " " + dateString
                    }


//Need to figure out time/date formate or convert to string or some shit
                case "AnesthesiaStartTime":
                    if let currentValue = annotation.widgetStringValue {
                        // Create a DateFormatter
                        let dateFormatter = DateFormatter()
                        // Set the desired date format
                        dateFormatter.dateFormat = "HH:mm:ss" // Format for time only
                        // Convert the date to a string
                        let dateString = dateFormatter.string(from: userData.AnesthesiaStartTime)
                        // Concatenate the strings
                        annotation.widgetStringValue = currentValue + " " + dateString
                    }
                    
                    
                    
                    
                    

                case "BloodPressure1":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.BloodPressure1
                }

                case "BloodPressure2":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.BloodPressure2
                }

                case "HeartRate":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.HeartRate
                }

                case "Resperation":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.Resperation
                }

                case "SpO2":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.SpO2
                }

                case "Temperature":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.Temperature
                }

                case "MedicationAdministered":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.MedicationAdministered
                }




                case "Dosage":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.Dosage
                }

                case "FluidsMedicationAdministered":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.FluidsMedicationAdministered
                }

                case "isPatientFever":
                                    annotation.buttonWidgetState = userData.isPatientFever ? .onState : .offState

                case "NoComplications":
                                    annotation.buttonWidgetState = userData.NoComplications ? .onState : .offState

                case "isStable":
                                    annotation.buttonWidgetState = userData.isStable ? .onState : .offState

                case "ReportGiven":
                                    annotation.buttonWidgetState = userData.ReportGiven ? .onState : .offState

                case "PostBloodPressure1":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.PostBloodPressure1
                }

                case "PostBloodPressure2":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.PostBloodPressure2
                }

                case "PostHeartRate":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.PostHeartRate
                }

                case "PostResperation":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.PostResperation
                }

                case "PostSpO2":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.PostSpO2
                }

                case "PostTemperature":
                if let currentValue = annotation.widgetStringValue {
                annotation.widgetStringValue = currentValue + " " + userData.PostTemperature
                }




                case "isAirwayOK":
                                    annotation.buttonWidgetState = userData.isAirwayOK ? .onState : .offState

                case "isPulseOk":
                    annotation.buttonWidgetState = userData.isPulseOK ? .onState : .offState

                case "isArousable":
                                    annotation.buttonWidgetState = userData.isArousable ? .onState : .offState

                case "isPainOK":
                                    annotation.buttonWidgetState = userData.isPainOK ? .onState : .offState

                case "isNoVomit":
                                    annotation.buttonWidgetState = userData.isNoVomit ? .onState : .offState

                case "isHydrated":
                                    annotation.buttonWidgetState = userData.isHydrated ? .onState : .offState



                        
                    
                default:
                    break
                }
            }
        }
       


        // Save the modified PDF to the app's document directory or a temporary directory
        let fileManager = FileManager.default
        do {
            let documentsURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let outputURL = documentsURL.appendingPathComponent("Modified_PDF_Test_Sheet1.pdf")
            
            if mainPdfDocument.write(to: outputURL) {
                print("PDF successfully saved to: \(outputURL.path)")
            } else {
                print("Failed to save the PDF.")
            }
        } catch {
            print("Error saving the PDF: \(error.localizedDescription)")
        }

        // Force refresh the PDF view by updating the pdfDocument state variable
        self.pdfDocument = nil
        DispatchQueue.main.async {
            self.pdfDocument = mainPdfDocument
        }
    }
        
        struct PDFDocumentView: UIViewRepresentable {
            @Binding var pdfDocument: PDFDocument?
            
            func makeUIView(context: Context) -> PDFView {
                let pdfView = PDFView()
                pdfView.autoScales = true
                pdfView.backgroundColor = .clear
                return pdfView
            }
            
            func updateUIView(_ uiView: PDFView, context: Context) {
                uiView.document = pdfDocument
            }
        }
    }
    


struct Export_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserEntryData()
        Export(userData: userData)
    }
}

struct DropboxView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    @Binding var isShown : Bool
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        if isShown {
            let scopeRequest = ScopeRequest(scopeType: .user, scopes: ["account_info.read", "files.metadata.write", "files.metadata.read", "files.content.write", "files.content.read"], includeGrantedScopes: false)
            DropboxClientsManager.authorizeFromControllerV2(
                UIApplication.shared,
                controller: uiViewController,
                loadingStatusDelegate: nil,
                openURL: { (url: URL) -> Void in UIApplication.shared.open(url, options: [:], completionHandler: nil) },
                scopeRequest: scopeRequest)
        }
    }
    
    func makeUIViewController(context _: Self.Context) -> UIViewController {
        return UIViewController()
    }
}

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}
