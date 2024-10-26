//
//  PostOpView.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 2/20/24.
//

import SwiftUI

struct PostOpView: View {
    
@ObservedObject var userData: UserEntryData
    
@State private var showNotes = false

@State private var isAnimating = false
@State private var ErrorMessage: String = ""
@State private var NavigateNextView: Bool = false

@State private var clearSignature4 = false
@State private var signatureImage4: UIImage?
@State private var clearSignature5 = false
@State private var signatureImage5: UIImage?
@State private var pdfSignature: Data?

@State private var PostBloodPressureError = ""
@State private var PostHeartRateError = ""
@State private var PostResperationError = ""
@State private var PostSpO2Error = ""
@State private var PostTemperatureError = ""

@State private var isPresentingSignatureView4 = false
@State private var isPresentingSignatureView5 = false
    
    let commonText = CommonText()
    

    
    var body: some View {
        NavigationStack{
            
            Group{
                // Title
                Text("Post Op")
                    .font(
                        Font.custom("Inter", size: 20)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                    .frame(width: 308, height: 28, alignment: .center)
                  
                
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
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(10)
                    
                    Button(action: {
                                    showNotes.toggle()
                    }) {
                        
                        
                        AdditionalNotesSymbol(isAnimating: $isAnimating)
                        
                    }

                    
                }
                
                
            }
            
            ScrollView{
                
                
VStack(alignment: .leading, spacing: 20) {






/*---------------------------------------------------------------
 
 
Start Time SECTION 1
*/

HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
    
    // VStack for the circle and vertical line
    VStack {
        CircleOne()
            .padding([.bottom], 5) // Adjust padding as needed
        
        Rectangle()
            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
            .frame(width: 1, height: 550) // Adjust height as needed
        
        
    }
    
    
    
    // VStack for the "Start Time" and its related fields
    
    VStack(alignment: .leading, spacing: 20) {
        // Sub head
        Text("Vitals")
            .font(
                Font.custom("Inter", size: 24)
                    .weight(.semibold)
            )
            .kerning(0.24)
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .frame(width: 187, height: 63.12318, alignment: .leading)
        
        
        
//Patient Fever
        Text("Patient temperature on arival at PACU greater than or equal to 86 C / 98 F?")
            .font(Font.custom("Inter", size: 16))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .frame(width: 280, height: 40, alignment: .leading)
            .offset(x:0,y:0)
        
        HStack {
            Button(action: {
                userData.isPatientFever = true
            }) {
                HStack {
                    Image(systemName: userData.isPatientFever ? "checkmark.square" : "square")
                        .foregroundColor(userData.isPatientFever ? .black : .gray)
                    Text("Yes")
                        .foregroundColor(.black)
                }
            }
        

            Button(action: {
                userData.isPatientFever = false
            }) {
                HStack {
                    Image(systemName: !userData.isPatientFever ? "checkmark.square" : "square")
                        .foregroundColor(userData.isPatientFever ? .gray : .gray)
                    Text("No")
                        .foregroundColor(.black)
                }
            }
           
        }
        .padding(.bottom)
        
//Blood Pressure
        
        Text("Blood Pressure")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        
        HStack{
                TextField("", text: $userData.PostBloodPressure1)
                       .onChange(of: userData.PostBloodPressure1) { newValue in
                           if newValue.count > 6 {
                               PostBloodPressureError = "Character limit reached. \nAdd more info to notes"
                               isAnimating = true
                           } else {
                               PostBloodPressureError = ""
                               isAnimating = false
                           }
                       }
                    .frame(width: 61, height: 42.65168)
                    .padding(.leading)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
    
            
            
            
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 1, height: 40)
                .rotationEffect(.degrees(20), anchor: .bottom)
            
            TextField("", text: $userData.PostBloodPressure2)
                   .onChange(of: userData.PostBloodPressure2) { newValue in
                       if newValue.count > 6 {
                           PostBloodPressureError = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                           
                       } else {
                           PostBloodPressureError = ""
                           isAnimating = false
                       }
                   }
                .frame(width: 61, height: 42.65168)
                .padding(.leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
                .padding(.leading)
            
            Text(PostBloodPressureError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading)
                .lineLimit(nil)
            
        }
// Resperation
        Text("Resperation")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){

            TextField("", text: $userData.PostResperation)
                   .onChange(of: userData.PostResperation) { newValue in
                       if newValue.count > 6 {
                           PostResperationError = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                       } else {
                           PostResperationError = ""
                           isAnimating = false
                       }
                   }
                .frame(width: 85, height: 42.65168)
                .padding(.leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(PostResperationError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading)
                .lineLimit(nil)
        }
        
        // Resperation
        Text("SpO2")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){

            TextField("", text: $userData.PostSpO2)
                   .onChange(of: userData.PostSpO2) { newValue in
                       if newValue.count > 6 {
                           PostSpO2Error = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                       } else {
                           PostSpO2Error = ""
                           isAnimating = false
                       }
                   }
                .frame(width: 85, height: 42.65168)
                .padding(.leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(PostSpO2Error)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading)
                .lineLimit(nil)
        }
        
        
        // Temperature
        Text("Temperature")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){

            TextField("", text: $userData.PostTemperature)
                   .onChange(of: userData.PostTemperature) { newValue in
                       if newValue.count > 6 {
                           PostTemperatureError = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                       } else {
                           PostTemperatureError = ""
                           isAnimating = false
                       }
                   }
                .frame(width: 85, height: 42.65168)
                .padding(.leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(PostTemperatureError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading)
                .lineLimit(nil)
        }
        
    }
    
    
}







/*---------------------------------------------------------------
 
 
Evaluation SECTION 2
 */
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
    
// VStack for the circle and vertical line
    VStack {
        CircleTwo()
            .padding([.bottom], 5) // Adjust padding as needed
        
        Rectangle()
            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
            .frame(width: 1, height: 400) // Adjust height as needed
        
        
    }
    
    
    
// VStack for the "Start Time" and its related fields
    
    VStack(alignment: .leading, spacing: 20) {
        // Sub head
        Text("Evaluation")
            .font(
                Font.custom("Inter", size: 24)
                    .weight(.semibold)
            )
            .kerning(0.24)
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .frame(width: 187, height: 63.12318, alignment: .leading)
        
        //Airway OK
                HStack {
                    Button(action: {
                        userData.NoComplications.toggle()
                    }) {
                        HStack {
                            Image(systemName: userData.NoComplications ? "checkmark.square" : "square")
                                .foregroundColor(userData.NoComplications ? .black : .gray)
                            Text("No apparent complications")
                                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                        }
                    }
                }
                .padding(.bottom)
    
//Airway OK

        HStack {
            Button(action: {
                userData.isAirwayOK.toggle()
            }) {
                HStack {
                    Image(systemName: userData.isAirwayOK ? "checkmark.square" : "square")
                        .foregroundColor(userData.isAirwayOK ? .black : .gray)
                    Text("Airway Patent rate and Oxygenation within expected parameter")
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                }
            }
        }
        .padding(.bottom)

        
//Pulse and BP OK
        HStack {
            Button(action: {
                userData.isPulseOK.toggle()
            }) {
                HStack {
                    Image(systemName: userData.isPulseOK ? "checkmark.square" : "square")
                        .foregroundColor(userData.isPulseOK ? .black : .gray)
                    Text("Pulse and BP within expected parameter")
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                }
            }
           
        }
        .padding(.bottom)
        
        
//Arousable OK
                                    
        HStack {
            Button(action: {
                userData.isArousable.toggle()
            }) {
                HStack {
                    Image(systemName: userData.isArousable ? "checkmark.square" : "square")
                        .foregroundColor(userData.isArousable ? .black : .gray)
                    Text("Arousable and able to follow commands")
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                }
            }
        
           
        }
        .padding(.bottom)
        
        
// Temperatire and Pain OK
                                    
        HStack {
            Button(action: {
                userData.isPainOK.toggle()
            }) {
                HStack {
                    Image(systemName: userData.isPainOK ? "checkmark.square" : "square")
                        .foregroundColor(userData.isPainOK ? .black : .gray)
                    Text("Temperature and Pain within the expected parameter")
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                }
            }
        


           
        }
        .padding(.bottom)
        
        
//Nausea or Vomit
                                    
        HStack {
            Button(action: {
                userData.isNoVomit.toggle()
            }) {
                HStack {
                    Image(systemName: userData.isNoVomit ? "checkmark.square" : "square")
                        .foregroundColor(userData.isNoVomit ? .black : .gray)
                    Text("No acute nausea or vomiting")
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                }
            }
        

   
           
        }
        .padding(.bottom)

// Hydrated
        
        HStack {
            Button(action: {
                userData.isHydrated.toggle()
            }) {
                HStack {
                    Image(systemName: userData.isHydrated ? "checkmark.square" : "square")
                        .foregroundColor(userData.isHydrated ? .black : .gray)
                    Text("Appears adequately hydrated")
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                }
            }
        

           
        }
        .padding(.bottom)
   
    }
                        
                    }
                    
/*---------------------------------------------------------------
                     
                     
Post Op Signatures SECTION 3
*/
                    
                    
                    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
                        
                        // VStack for the circle and vertical line
                        VStack {
                            CircleThree()
                                .padding([.bottom], 5) // Adjust padding as needed
                            
                            Rectangle()
                                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .frame(width: 1, height: 400) // Adjust height as needed
                            
                        }
                        
                        
                        
        VStack(alignment: .leading, spacing: 8) {
            // Procedure Info Text
            Text("Medication")
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.semibold)
                )
                .kerning(0.24)
                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                .frame(width: 187, height: 63.12318, alignment: .leading)
            

// Tap to Sign Anesthesia
            Text("Anesthesia Clinician Signature")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .frame(width: 256, height: 32.80899, alignment: .leading)
            

            Button(action: {
            isPresentingSignatureView4 = true
            }) {
            Text("Tap to Sign")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
           .frame(width: 181, height: 40.79258)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
            .padding(.bottom)
            }
            
// Popover Signature
            .popover(isPresented: $isPresentingSignatureView4) {
                Group {
                                
                Text("Sign Here")
                .font(Font.custom("Inter", size: 20))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                .frame(width: 126, height: 32.80899, alignment: .leading)

            SignatureViewContainer(clearSignature: $clearSignature4, signatureImage: $signatureImage4, pdfSignature: $pdfSignature)
                    .frame(height: 200)
                    .border(Color.gray, width: 1)
                                        
                    HStack{
                    // Button to clear the signature
                Button("Clear Signature") {
                clearSignature4 = true
                        }
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                .frame(width: 181, height: 40.79258)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
                .padding()
                                            
            Button("Save Signature") {
                if let signature = signatureImage4 {
                userData.signatureImage4 = signature
                isPresentingSignatureView4 = false
                            }
                        }
            .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                .frame(width: 181, height: 40.79258)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
                        }
                        }
                .frame(width: 500, height: 350)
                .background(Color.white.opacity(1))
                                }
                                       
       
// Anesthisa Sign Date
                                           
            Text("Date")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

            DatePicker("", selection: $userData.PostOpAnesthesiaSignDate, displayedComponents: .date)
                .frame(width: 120, height: 35)
                .padding(.trailing)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
                .datePickerStyle(CompactDatePickerStyle()) // You can choose a different style if preferred
                .padding(.bottom)
            
            
// Tap to Sign Surgeon

                Text("Surgeon Signature")
                    .font(Font.custom("Inter", size: 14))
                    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    .frame(width: 126, height: 32.80899, alignment: .leading)

// Tap to Sign Surgeon
                Button(action: {
                isPresentingSignatureView5 = true
                }) {
            Text("Tap to Sign")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
           .frame(width: 181, height: 40.79258)
           .background(Color(red: 0.96, green: 0.96, blue: 0.96))
           .cornerRadius(16)
           .padding(.bottom)
                }
            
// Popover Signature
            .popover(isPresented: $isPresentingSignatureView5) {
        Group {
                                        
        Text("Sign Here")
            .font(Font.custom("Inter", size: 20))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .frame(width: 126, height: 32.80899, alignment: .leading)

    SignatureViewContainer(clearSignature: $clearSignature5, signatureImage: $signatureImage5, pdfSignature: $pdfSignature)
            .frame(height: 200)
            .border(Color.gray, width: 1)
                                                
        HStack{
        // Button to clear the signature
        Button("Clear Signature") {
            clearSignature5 = true
                        }
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .frame(width: 181, height: 40.79258)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
            .padding()
                                                    
        Button("Save Signature") {
            if let signature = signatureImage5 {
            userData.signatureImage5 = signature
            isPresentingSignatureView5 = false
                                    }
                                }
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        .frame(width: 181, height: 40.79258)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
                        }
                        }
        .frame(width: 500, height: 350)
        .background(Color.white.opacity(1))
                                        }
                
                

                
// Surgeon Sign Date
                
            Text("Date")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

            DatePicker("", selection: $userData.PostOpSurgeonSignDate, displayedComponents: .date)
                .frame(width: 120, height: 35)
                .padding(.trailing)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
                .datePickerStyle(CompactDatePickerStyle()) // You can choose a different style if preferred
            
            
        }
        
    }
    

/*---------------------------------------------------------------
     
     
Final Review Section 4
*/
    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
        
        // VStack for the circle and vertical line
        
        CircleFour()
            .padding([.bottom], 5) // Adjust padding as needed
        
        // Continue Button
        
        
    
    // Continue Button
    HStack(alignment: .center) {
        Button(action: {
            
            
            if !userData.NoComplications {
                ErrorMessage = ""
                NavigateNextView = true // Prevent navigation
            } else if !userData.isStable {
                ErrorMessage = ""
                NavigateNextView = true // Prevent navigation
            } else if !userData.ReportGiven {
                ErrorMessage = ""
                NavigateNextView = true // Prevent navigation
            } else if userData.PostBloodPressure1.isEmpty && userData.PostBloodPressure2.isEmpty {
                ErrorMessage = "Please enter at least one post-procedure blood pressure."
                NavigateNextView = false // Prevent navigation
            } else if userData.PostHeartRate.isEmpty {
                ErrorMessage = "Please enter the post-procedure heart rate."
                NavigateNextView = false // Prevent navigation
            } else if userData.PostResperation.isEmpty {
                ErrorMessage = "Please enter the post-procedure respiration rate."
                NavigateNextView = false // Prevent navigation
            } else if userData.PostSpO2.isEmpty {
                ErrorMessage = "Please enter the post-procedure SpO2 level."
                NavigateNextView = false // Prevent navigation
            } else if userData.PostTemperature.isEmpty {
                ErrorMessage = "Please enter the post-procedure temperature."
                NavigateNextView = false // Prevent navigation
            } else if !userData.isAirwayOK {
                ErrorMessage = ""
                NavigateNextView = true // Prevent navigation
            } else if !userData.isPulseOK  {
                ErrorMessage = ""
                NavigateNextView = true // Prevent navigation
            } else if !userData.isArousable {
                ErrorMessage = ""
                NavigateNextView = true // Prevent navigation
            } else if !userData.isPainOK {
                ErrorMessage = ""
                NavigateNextView = true // Prevent navigation
            } else if !userData.isNoVomit {
                ErrorMessage = ""
                NavigateNextView = true // Prevent navigation
            } else if !userData.isHydrated {
                ErrorMessage = ""
                NavigateNextView = true // Prevent navigation
            } else {
                // All checks have passed, allow navigation to the next view
                ErrorMessage = ""
                NavigateNextView = true
            }


    }) {
        Text("Final Review")
            .foregroundColor(.white)
            .frame(width: 283, height: 49)
            .background(Color(red: 0.54, green: 0.68, blue: 0.97))
            .cornerRadius(30)
    }
    
    // Notes section display
        if !ErrorMessage.isEmpty {
            Text(ErrorMessage)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 20)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) // Set the width limit here (e.g., 300)
                .lineLimit(nil) // Allow the text to wrap to multiple lines
        }
    }
        
        
        
    }
                    
//----------------------------------------------------------------
                    
            }  // End of main VStack
                
.sheet(isPresented: $showNotes) {
            AdditionalNotes(userData: userData, showNotes: $showNotes)
}

                
            } // End of Scroll View
                
            .navigationDestination(isPresented: $NavigateNextView) {
                //TODO CHANGE
                ProcedureChartList(userData: userData)}
               
            }  //End of Navigation Stack
           
        
        
            }  //End of body view
        
  
    

} // End of main struct


struct PostOpView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of UserEntryData for the preview
        let userData = UserEntryData()
        // Pass the instance to this view
        PostOpView(userData: userData)
    }
}
