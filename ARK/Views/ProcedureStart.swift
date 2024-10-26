//
//  ProcedureStart.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 2/19/24.
//

import Foundation

import SwiftUI


struct ProcedureStart: View {
    
    @ObservedObject var userData: UserEntryData
    
@State private var showNotes = false
  
@State private var isAnimating = false
@State private var ErrorMessage: String = ""
@State private var NavigateNextView: Bool = false
    
    
@State private var BloodPressureError = ""
@State private var HeartRateError = ""
@State private var ResperationError = ""
@State private var SpO2Error = ""
@State private var TemperatureError = ""
@State private var MedicationAdministeredError = ""
@State private var DosageError = ""
@State private var FluidsMedicationAdministeredError = ""
        
    let commonText = CommonText()
    
    
    
    var body: some View {
        NavigationStack{
            
            Group{
                // Title
                Text("Procedure Start")
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
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(10)
                    
                    // Bar 6
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 24.90, height: 19)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
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
    
    
    
   
                    
   
/*------------------------------------------------------------
             
Airway SECTION 1
*/
            
    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
                
                // VStack for the circle and vertical line
        VStack {
        CircleOne()
        .padding([.bottom], 5) // Adjust padding as needed
                    
        Rectangle()
        .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
        .frame(width: 1, height: 60) // Adjust height as needed
                    
                    
                }
                
                

// VStack for the "Start Time" and its related fields

VStack(alignment: .leading, spacing: 20) {
    
    Text("Airway")
        .font(
            Font.custom("Inter", size: 24)
                .weight(.semibold)
        )
        .kerning(0.24)
        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
        .frame(width: 187, height: 63.12318, alignment: .leading)
        .padding(.bottom,-10)
    
    
    
    // Procedure Start Time
    Text("Select conditions that apply")
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
    

    VStack(alignment: .leading, spacing: 20) {
        Button(action: {
            withAnimation {
                userData.isAirwayExpanded.toggle()
            }
        }) {
            
            HStack {
                   Text("Airway Options")
                    .padding([.top, .leading, .bottom])
                       .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                       .font(
                           Font.custom("Inter", size: 18)
                               .weight(.semibold))

                   // Arrow to the right of the text
                   Image(systemName: userData.isAirwayExpanded ? "chevron.up" : "chevron.down")
                       .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                       .padding(.trailing)
               }
               .background(Color(red: 0.96, green: 0.96, blue: 0.96)) // Apply background to the entire HStack
               .cornerRadius(8) // Apply corner radius to the entire HStack
        }

        if userData.isAirwayExpanded {
            VStack {
                AirwayDropdownMenu(userData: userData)
                    .frame(width: 280) // Adjust the width here
                    .background(Color.white)
                    .border(Color.gray, width: 1)
                    .cornerRadius(8)
                    .shadow(radius: 5)
            }
            .padding(.top, 5) // Adjust the top padding as needed
        }
        
        
//Display your answers
Group{
if userData.AirwayNasalC {
        
            Text("Nasal Cannula with ETCO2")
                .multilineTextAlignment(.leading)
                .frame(width: 250, height: 42.65168)
                .foregroundColor(.black)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
        
    }

    if userData.AirwayPreO2 {
      
            Text("Pre-Oxygenation")
                .multilineTextAlignment(.leading)
                .frame(width: 200, height: 42.65168)
                .foregroundColor(.black)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
        
    }

    if userData.AirwayMask {
        HStack{
            Text("Mask")
                .multilineTextAlignment(.leading)
                .frame(width: 100, height: 42.65168)
                .foregroundColor(.black)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
         
            Button(action: {
                
                    userData.AirwayMaskEasy.toggle()
                    userData.AirwayMaskHard = false
                    
            }) {
                Image(systemName: userData.AirwayMaskEasy ? "checkmark.square" : "square")
                    .foregroundColor(userData.AirwayMaskEasy ? .black : .gray) // Change the color here
                Text("Easy")
                    .foregroundColor(userData.AirwayMaskEasy ? .black : .gray)
            }
            .padding(.trailing)

            Button(action: {
              
                    userData.AirwayMaskHard.toggle()
                    userData.AirwayMaskEasy = false
            }) {
                Image(systemName: userData.AirwayMaskHard ? "checkmark.square" : "square")
                    .foregroundColor(userData.AirwayMaskHard ? .black : .gray) // Change the color here
                Text("Hard")
                    .foregroundColor(userData.AirwayMaskHard ? .black : .gray)
            }
        }
    }

    if userData.AirwayOral {
        
            Text("Oral Airway")
                .multilineTextAlignment(.leading)
                .frame(width: 130, height: 42.65168)
                .foregroundColor(.black)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
        
    }

    if userData.AirwayNasalA {
        
            Text("Nasal Airway")
                .multilineTextAlignment(.leading)
                .frame(width: 150, height: 42.65168)
                .foregroundColor(.black)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
        
    }

    if userData.AirwayTrach {
        
            Text("Trach")
                .multilineTextAlignment(.leading)
                .frame(width: 100, height: 42.65168)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
        
    }

    if userData.AirwayLMA {
        
        HStack{
            Text("LMA")
                .multilineTextAlignment(.leading)
                .frame(width: 100, height: 42.65168)
                .foregroundColor(.black)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
                .padding(.trailing)
            
            
            TextField("Enter LMA #", text: $userData.AirwayLMANumber)
                .multilineTextAlignment(.leading)
                .frame(width: 120, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
               // .padding(.leading)
            
        }
            
        
    }

    if userData.AirwayIntubation {
       
        HStack{
            
        
            Text("Intubation")
                .multilineTextAlignment(.leading)
                .frame(width: 130, height: 42.65168)
                .foregroundColor(.black)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
        
            Button(action: {
                if userData.AirwayIntubation {
                    userData.AirwayIntubationEasy.toggle()
                    userData.AirwayIntubationHard = false
                } else {
                    // Set both to false if AirwayMask is false
                    userData.AirwayIntubationEasy = false
                    userData.AirwayIntubationHard = false
                }
            }) {
                Image(systemName: userData.AirwayIntubationEasy ? "checkmark.square" : "square")
                    .foregroundColor(userData.AirwayIntubationEasy ? .black : .gray) // Change the color here
                Text("Easy")
                    .foregroundColor(userData.AirwayIntubationEasy ? .black : .gray)
            }
            .padding(.trailing)

            Button(action: {
                if userData.AirwayIntubation {
                    userData.AirwayIntubationHard.toggle()
                    userData.AirwayIntubationEasy = false             } else {
                    // Set both to false if AirwayMask is false
                    userData.AirwayIntubationEasy = false
                    userData.AirwayIntubationHard = false
                }
            }) {
                Image(systemName: userData.AirwayIntubationHard ? "checkmark.square" : "square")
                    .foregroundColor(userData.AirwayIntubationHard ? .black : .gray) // Change the color here
                Text("Hard")
                    .foregroundColor(userData.AirwayIntubationHard ? .black : .gray)
            }
        }
    }
            
            
            
    

    if userData.AirwayOralNasal {
        
            Text("Oral/Nasal")
                .multilineTextAlignment(.leading)
                .frame(width: 130, height: 42.65168)
                .foregroundColor(.black)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
        
    }

    if userData.AirwayCuff {
        
            Text("Cuff")
                .multilineTextAlignment(.leading)
                .frame(width: 100, height: 42.65168)
                .foregroundColor(.black)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
        
    }

if userData.AirwayRapid {
    
                Text("Rapid Sequence")
                    .multilineTextAlignment(.leading)
                    .frame(width: 180, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
            
        }

        if userData.AirwayMacMil {
            HStack{
                Text("Mac/Mill:")
                    .multilineTextAlignment(.leading)
                    .frame(width: 100, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
                TextField("Enter Mac", text: $userData.AirwayMac)
                    .multilineTextAlignment(.leading)
                    .frame(width: 120, height: 42.65168)
                    .padding(.leading, 10) // Add padding to the left
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
                TextField("Enter Mil", text: $userData.AirwayMil)
                    .multilineTextAlignment(.leading)
                    .frame(width: 120, height: 42.65168)
                    .padding(.leading, 10) // Add padding to the left
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)                        }
            
        }

        if userData.AirwayEtt {
            
            HStack{
                Text("ETT")
                    .multilineTextAlignment(.leading)
                    .frame(width: 100, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
             
                TextField("ETT Size", text: $userData.AirwayETTSize)
                    .multilineTextAlignment(.leading)
                    .frame(width: 120, height: 42.65168)
                    .padding(.leading, 10) // Add padding to the left
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
            }
            
            // ETT Attempts and Views
            HStack {
                
                Text("Attempts: ")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.24)
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                 
                
                Button(action: {
                    userData.AirwayETTAttempt1.toggle()
                    userData.AirwayETTAttempt2 = false
                    userData.AirwayETTAttempt3 = false
                }) {
                    
                    Image(systemName: userData.AirwayETTAttempt1 ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayETTAttempt1 ? .black : .gray) // Change the color here
                    Text("1")
                        .foregroundColor(userData.AirwayETTAttempt1 ? .black : .gray)
                    
                }
                
                
                Button(action: {
                    userData.AirwayETTAttempt2.toggle()
                    userData.AirwayETTAttempt1 = false
                    userData.AirwayETTAttempt3 = false
                }) {
                    
                    Image(systemName: userData.AirwayETTAttempt2 ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayETTAttempt2 ? .black : .gray) // Change the color here
                    Text("2")
                        .foregroundColor(userData.AirwayETTAttempt2 ? .black : .gray)
                    
                }
                .padding(.leading)
                
                Button(action: {
                    userData.AirwayETTAttempt3.toggle()
                    userData.AirwayETTAttempt1 = false
                    userData.AirwayETTAttempt2 = false
                }) {
                    
                    Image(systemName: userData.AirwayETTAttempt3 ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayETTAttempt3 ? .black : .gray) // Change the color here
                    Text("3")
                        .foregroundColor(userData.AirwayETTAttempt3 ? .black : .gray)
                    
                }
                .padding(.trailing,50)
                
                Text("View: ")
                    .font(
                        Font.custom("Inter", size: 16)
                            .weight(.semibold)
                    )
                    .kerning(0.24)
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                 
                
                Button(action: {
                    userData.AirwayETTView1.toggle()
                    userData.AirwayETTView2 = false
                    userData.AirwayETTView3 = false
                    userData.AirwayETTView4 = false
                }) {
                    
                    Image(systemName: userData.AirwayETTView1 ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayETTView1 ? .black : .gray) // Change the color here
                    Text("1")
                        .foregroundColor(userData.AirwayETTView1 ? .black : .gray)
                    
                }
                
                
                Button(action: {
                    userData.AirwayETTView2.toggle()
                    userData.AirwayETTView1 = false
                    userData.AirwayETTView3 = false
                    userData.AirwayETTView4 = false
                }) {
                    
                    Image(systemName: userData.AirwayETTView2 ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayETTView2 ? .black : .gray) // Change the color here
                    Text("2")
                        .foregroundColor(userData.AirwayETTView2 ? .black : .gray)
                    
                }
                .padding(.leading)
                
                Button(action: {
                    userData.AirwayETTView3.toggle()
                    userData.AirwayETTView1 = false
                    userData.AirwayETTView2 = false
                    userData.AirwayETTView4 = false
                }) {
                    
                    Image(systemName: userData.AirwayETTView3 ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayETTView3 ? .black : .gray) // Change the color here
                    Text("3")
                        .foregroundColor(userData.AirwayETTView3 ? .black : .gray)
                    
                }
                .padding(.leading,20)
                
                Button(action: {
                    userData.AirwayETTView4.toggle()
                    userData.AirwayETTView1 = false
                    userData.AirwayETTView2 = false
                    userData.AirwayETTView3 = false
                }) {
                    
                    Image(systemName: userData.AirwayETTView4 ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayETTView4 ? .black : .gray) // Change the color here
                    Text("4")
                        .foregroundColor(userData.AirwayETTView4 ? .black : .gray)
                    
                }
                .padding(.leading,20)
                
                
            }
            .padding(.trailing,20)
            
            HStack {
                TextField("Enter Taped at", text: $userData.AirwayETTTapped)
                    .multilineTextAlignment(.leading)
                    .frame(width: 120, height: 42.65168)
                    .padding(.leading, 10) // Add padding to the left
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
                
                TextField("Enter EtCo2", text: $userData.AirwayETTCo2)
                    .multilineTextAlignment(.leading)
                    .frame(width: 140, height: 42.65168)
                    .padding(.leading, 10) // Add padding to the left
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                .padding(.leading)
                
                
                
                
                
            }
            .padding(.bottom)                    }


        if userData.AirwayBillBreathSounds {
            
                Text("Bill Breath Sounds")
                    .multilineTextAlignment(.leading)
                    .frame(width: 250, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
            
        }
                            
                            
                        }// End of display group
                        
                        
                    }
                    

                    
                    
                }
                
                
            }

                    
/*------------------------------------------------------------
                     
Start Time SECTION 2
*/
                    
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
            
            // VStack for the circle and vertical line
    VStack {
    CircleOne()
    .padding([.bottom], 5) // Adjust padding as needed
                
    Rectangle()
    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
    .frame(width: 1, height: 220) // Adjust height as needed
                
                
            }
            
            
            
            // VStack for the "Start Time" and its related fields
            
            VStack(alignment: .leading, spacing: 20) {
                // Sub head
                Text("Start Time")
                    .font(
                        Font.custom("Inter", size: 24)
                            .weight(.semibold)
                    )
                    .kerning(0.24)
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                    .frame(width: 187, height: 63.12318, alignment: .leading)
                
                
                
                // Procedure Start Time
                Text("Procedure Start Time")
                    .font(Font.custom("Inter", size: 14))
                    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                
                
                DatePicker("Enter Start Time", selection: $userData.ProcedureStartTime, displayedComponents: .hourAndMinute)
                    .frame(width: 250, height: 42.65168)
                    .padding(.leading)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)

                
                Text("Anesthesia Start Time")
                    .font(Font.custom("Inter", size: 14))
                    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                
                
                DatePicker("Enter Start Time", selection: $userData.AnesthesiaStartTime, displayedComponents: .hourAndMinute)
                    .frame(width: 250, height: 42.65168)
                    .padding(.leading)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)

                
                
            }
            
            
        }
        
        
/*---------------------------------------------------------------
         
Initial Vitals SECTION 3
         */
        HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
            
            // VStack for the circle and vertical line
            VStack {
                CircleTwo()
                    .padding([.bottom], 5) // Adjust padding as needed
                
                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 1, height: 420) // Adjust height as needed
                
                
                
                            
                            
                        }
                        
                        
    
    VStack(alignment: .leading, spacing: 8) {
        
        Text("Initial Vitals")
            .font(
                Font.custom("Inter", size: 24)
                    .weight(.semibold)
            )
            .kerning(0.24)
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .frame(width: 187, height: 63.12318, alignment: .leading)
                            
                            
//Blood Pressure
                    
        Text("Blood Pressure")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    
                    
        HStack{
            
        
            TextField("", text: $userData.BloodPressure1)
                   .onChange(of: userData.BloodPressure1) { newValue in
                       if newValue.count > 6 {
                           BloodPressureError = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                       } else {
                           BloodPressureError = ""
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
            .padding(.trailing, 15.0)
                        
            TextField("", text: $userData.BloodPressure2)
                   .onChange(of: userData.BloodPressure2) { newValue in
                       if newValue.count > 6 {
                           BloodPressureError = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                       } else {
                           BloodPressureError = ""
                           isAnimating = false
                       }
                   }
                .frame(width: 61, height: 42.65168)
                .padding(.leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            
            Text(BloodPressureError)
                   .foregroundColor(.red)
                   .font(
                       Font.custom("Inter", size: 15)
                           .weight(.bold)
                   )
                   .frame(maxWidth: 400, alignment: .leading)
                   .lineLimit(nil)
                        
                    }
        
// Heart Rate
                Text("Heart Rate")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            
        HStack(alignment:.center){
            
            TextField("", text: $userData.HeartRate)
                   .onChange(of: userData.HeartRate) { newValue in
                       if newValue.count > 6 {
                           HeartRateError = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                       } else {
                           HeartRateError = ""
                           isAnimating = false
                       }
                   }
                .frame(width: 85, height: 42.65168)
                .padding(.leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(HeartRateError)
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

            TextField("", text: $userData.Resperation)
                   .onChange(of: userData.Resperation) { newValue in
                       if newValue.count > 6 {
                           ResperationError = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                       } else {
                           ResperationError = "" 
                           isAnimating = false
                       }
                   }
                .frame(width: 85, height: 42.65168)
                .padding(.leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(ResperationError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading)
                .lineLimit(nil)
        }

                            
// SpO2
                Text("SpO2")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                            
        HStack(alignment:.center){

            TextField("", text: $userData.SpO2)
                   .onChange(of: userData.SpO2) { newValue in
                       if newValue.count > 6 {
                           SpO2Error = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                       } else {
                           SpO2Error = ""
                           isAnimating = false
                       }
                   }
                .frame(width: 85, height: 42.65168)
                .padding(.leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(SpO2Error)
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

            TextField("", text: $userData.Temperature)
                   .onChange(of: userData.Temperature) { newValue in
                       if newValue.count > 6 {
                           TemperatureError = "Character limit reached. \nAdd more info to notes"
                           isAnimating = true
                       } else {
                           TemperatureError = ""
                           isAnimating = false
                       }
                   }
                .frame(width: 85, height: 42.65168)
                .padding(.leading)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(TemperatureError)
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
                    
/*------------------------------------------------------------
                     
Medication Section 4
*/
                    
    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
        
        // VStack for the circle and vertical line
        VStack {
            CircleThree()
                .padding([.bottom], 5) // Adjust padding as needed
            
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 1, height: 150) // Adjust height as needed
            
        }
        
        
        
        VStack(alignment: .leading, spacing: 8) {
// Section 3 Info Text
            
            Text("Medication")
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.semibold)
                )
                .kerning(0.24)
                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                .frame(width: 187, height: 63.12318, alignment: .leading)
            
            
            // Medication Administered
            
            Text("Enter Medication Administered")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            
            HStack(alignment:.center){

                TextField("", text: $userData.MedicationAdministered)
                       .onChange(of: userData.MedicationAdministered) { newValue in
                           if newValue.count > 17 {
                               MedicationAdministeredError = "Character limit reached. \nAdd more info to notes"
                               isAnimating = true
                           } else {
                               MedicationAdministeredError = ""
                               isAnimating = false
                           }
                       }
                    .frame(width: 175, height: 42.65168)
                    .padding(.leading)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
                Text(MedicationAdministeredError)
                    .foregroundColor(.red)
                    .font(
                        Font.custom("Inter", size: 15)
                            .weight(.bold)
                    )
                    .frame(maxWidth: 450, alignment: .leading)
                    .lineLimit(nil)
            }

            
            
            // Medication Administered
            
            Text("Enter Dosage")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            
            HStack(alignment:.center){

                TextField("", text: $userData.Dosage)
                       .onChange(of: userData.Dosage) { newValue in
                           if newValue.count > 17 {
                               DosageError = "Character limit reached. \nAdd more info to notes"
                               isAnimating = true
                           } else {
                               DosageError = ""
                               isAnimating = false
                           }
                       }
                    .frame(width: 175, height: 42.65168)
                    .padding(.leading)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
                Text(DosageError)
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
     
     
     Fluids Section 4
     */
    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
        
        // VStack for the circle and vertical line
        VStack {
            CircleFour()
                .padding([.bottom], 5) // Adjust padding as needed
            
            Rectangle()
                .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                .frame(width: 1, height: 90) // Adjust height as needed
            
        }
        
        
        
        VStack(alignment: .leading, spacing: 8) {
// Section 4 Info Text
            Text("Fluids")
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.semibold)
                )
                .kerning(0.24)
                
                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                .frame(width: 187, height: 63.12318, alignment: .leading)
            
            
            
// Fluid Medication Administered
            
            Text("Enter Medication Administered")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            
            HStack(alignment:.center){

                TextField("", text: $userData.FluidsMedicationAdministered)
                       .onChange(of: userData.FluidsMedicationAdministered) { newValue in
                           if newValue.count > 17 {
                               FluidsMedicationAdministeredError = "Character limit reached. \nAdd more info to notes"
                               isAnimating = true
                               
                           } else {
                               FluidsMedicationAdministeredError = ""
                               isAnimating = false
                           }
                       }
                    .frame(width: 175, height: 42.65168)
                    .padding(.leading)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
                Text(FluidsMedicationAdministeredError)
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
    
    
    
/*--------------------------------------------------------------
     
     
     Continue Section 6
     */
    HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
        
        // VStack for the circle and vertical line
        
        CircleSix()
            .padding([.bottom], 5) // Adjust padding as needed
        
        // Continue Button
        HStack(alignment: .center) {
            Button(action: {
                
                
                if userData.BloodPressure1.isEmpty || userData.BloodPressure2.isEmpty  {
                    ErrorMessage = "Please enter blood pressure."
                    NavigateNextView = false // Prevent navigation
                } else if userData.HeartRate.isEmpty {
                    ErrorMessage = "Please enter heart rate."
                    NavigateNextView = false // Prevent navigation
                } else if userData.Resperation.isEmpty {
                    ErrorMessage = "Please enter respiration rate."
                    NavigateNextView = false // Prevent navigation
                } else if userData.SpO2.isEmpty {
                    ErrorMessage = "Please enter the SpO2 level."
                    NavigateNextView = false // Prevent navigation
                } else if userData.Temperature.isEmpty {
                    ErrorMessage = "Please enter the temperature."
                    NavigateNextView = false // Prevent navigation
                } else if userData.MedicationAdministered.isEmpty {
                    ErrorMessage = "Please enter the medication administered or N/A.."
                    NavigateNextView = false // Prevent navigation
                } else if userData.Dosage.isEmpty {
                    ErrorMessage = "Please enter the dosage or N/A.."
                    NavigateNextView = false // Prevent navigation
                } else if userData.FluidsMedicationAdministered.isEmpty {
                    ErrorMessage = "Please enter the fluids or medication administered or N/A."
                    NavigateNextView = false // Prevent navigation
                } else {
                    // All checks have passed, allow navigation to the next view
                    ErrorMessage = ""
                    NavigateNextView = true
                }



        }) {
            Text("Create New Procedure")
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
                PostOpView(userData: userData)}
               
            }  //End of Navigation Stack
           
        
        
    }
  
    

} // End of main struct

struct AirwayDropdownMenu: View {
    
    @ObservedObject var userData: UserEntryData
    
    func updateAirwayMask() {
        if !userData.AirwayMask {
            userData.AirwayMaskEasy = false
            userData.AirwayMaskHard = false
        }
    }
    
    func updateAirwayIntubation() {
        if !userData.AirwayIntubation {
            userData.AirwayIntubationEasy = false
            userData.AirwayIntubationHard = false
        }
    }
    
    func updateAirwayLMANumber() {
        if !userData.AirwayLMA {
            userData.AirwayLMANumber = ""
        }
    }
    
    func updateAirwayMacMil() {
        if !userData.AirwayMacMil {
            userData.AirwayMac = ""
            userData.AirwayMil = ""
        }
    }
    
    func updateAirwayETT() {
        if !userData.AirwayEtt {
            userData.AirwayETTSize = ""
            userData.AirwayETTAttempt1 = false
            userData.AirwayETTAttempt2 = false
            userData.AirwayETTAttempt3 = false
            userData.AirwayETTView1 = false
            userData.AirwayETTView2 = false
            userData.AirwayETTView3 = false
            userData.AirwayETTView4 = false
            userData.AirwayETTTapped = ""
            userData.AirwayETTCo2 = ""
        }
    }
    
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
                
                Button(action: {
                    userData.AirwayNasalC.toggle()
                }) {
                    Image(systemName: userData.AirwayNasalC ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayNasalC ? .black : .gray) // Change the color here
                    Text("Nasal Cannula with ETCO2")
                        .foregroundColor(userData.AirwayNasalC ? .black : .gray)
                }
                .padding(.top)
                
                
                Button(action: {
                    userData.AirwayPreO2.toggle()
                }) {
                    Image(systemName: userData.AirwayPreO2 ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayPreO2 ? .black : .gray) // Change the color here
                    Text("Pre - Oxygenation")                      .foregroundColor(userData.AirwayPreO2 ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayMask.toggle()
                    updateAirwayMask()
                }) {
                    Image(systemName: userData.AirwayMask ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayMask ? .black : .gray) // Change the color here
                    Text("Mask")
                        .foregroundColor(userData.AirwayMask ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayOral.toggle()
                }) {
                    Image(systemName: userData.AirwayOral ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayOral ? .black : .gray) // Change the color here
                    Text("Oral Airway")
                        .foregroundColor(userData.AirwayOral ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayNasalA.toggle()
                }) {
                    Image(systemName: userData.AirwayNasalA ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayNasalA ? .black : .gray) // Change the color here
                    Text("Nasal Airway")
                        .foregroundColor(userData.AirwayNasalA ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayTrach.toggle()
                }) {
                    Image(systemName: userData.AirwayTrach ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayTrach ? .black : .gray) // Change the color here
                    Text("Trach")
                        .foregroundColor(userData.AirwayTrach ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayLMA.toggle()
                    updateAirwayMask()
                }) {
                    Image(systemName: userData.AirwayLMA ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayLMA ? .black : .gray) // Change the color here
                    Text("LMA")
                        .foregroundColor(userData.AirwayLMA ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayIntubation.toggle()
                    updateAirwayIntubation()
                }) {
                    Image(systemName: userData.AirwayIntubation ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayIntubation ? .black : .gray) // Change the color here
                    Text("Intubation")
                        .foregroundColor(userData.AirwayIntubation ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayOralNasal.toggle()
                }) {
                    Image(systemName: userData.AirwayOralNasal ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayOralNasal ? .black : .gray) // Change the color here
                    Text("Oral/Nasal")
                        .foregroundColor(userData.AirwayOralNasal ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayCuff.toggle()
                }) {
                    Image(systemName: userData.AirwayCuff ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayCuff ? .black : .gray) // Change the color here
                    Text("Cuff")
                        .foregroundColor(userData.AirwayCuff ? .black : .gray)
                }
                
                
                Button(action: {
                    userData.AirwayRapid.toggle()
                }) {
                    Image(systemName: userData.AirwayRapid ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayRapid ? .black : .gray) // Change the color here
                    Text("Rapid Sequence")
                        .foregroundColor(userData.AirwayRapid ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayMacMil.toggle()
                    updateAirwayMacMil()
                }) {
                    Image(systemName: userData.AirwayMacMil ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayMacMil ? .black : .gray) // Change the color here
                    Text("Mac/Mill")
                        .foregroundColor(userData.AirwayMacMil ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayEtt.toggle()
                    updateAirwayETT()
                }) {
                    Image(systemName: userData.AirwayEtt ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayEtt ? .black : .gray) // Change the color here
                    Text("ETT")
                        .foregroundColor(userData.AirwayEtt ? .black : .gray)
                }
                
                Button(action: {
                    userData.AirwayBillBreathSounds.toggle()
                }) {
                    Image(systemName: userData.AirwayBillBreathSounds ? "checkmark.square" : "square")
                        .foregroundColor(userData.AirwayBillBreathSounds ? .black : .gray) // Change the color here
                    Text("Bill Breath Sounds")
                        .foregroundColor(userData.AirwayBillBreathSounds ? .black : .gray)
                }
                .padding(.bottom)
                
                Button(action: {
                    userData.isAirwayExpanded = false
                }) {
                    Text("Done")
                        .multilineTextAlignment(.leading)
                        .frame(width: 200, height: 42.65168)
                        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                        .padding(.bottom)
                        .padding(.leading)
                }
                
                
        } // End of Main VStack
        } // End of ScrollView
        } // End of end of Main View
        } // End of Dropdown Struct


struct ProcedureStart_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of UserEntryData for the preview
        let userData = UserEntryData()
        // Pass the instance to this view
        ProcedureStart(userData: userData)
    }
}
    
    

        
    
