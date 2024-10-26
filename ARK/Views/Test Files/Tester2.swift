//
//  ProcedureBasicsView.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 1/21/24.
//

import Foundation

import SwiftUI



struct Tester2: View {
    
@ObservedObject var userData: UserEntryData
    
@State private var ErrorMessage: String = ""
    @State private var navigateToNextView: Bool = false
    
    let commonText = CommonText()

    
  

var body: some View {
//        NavigationStack{
ScrollView{

    VStack(alignment: .leading, spacing: 20) {
        
        Group{
            // Title
            Text("New Procedure - \(commonText.FormattedDate)")
                .font(
                    Font.custom("Inter", size: 20)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                .frame(width: 308, height: 28, alignment: .center)
                .offset(x:250  ,y:0)
            
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
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(10)
                // Bar 3
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 82.68, height: 19)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(10)
                // Bar 4
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 24.90, height: 19)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
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
                
                
            }
        }
        .offset(x:0, y:0)
        
        
        /*---------------------------------------------------------------
         
         
         PROCEDURE SECTION 1
         */
        
        
        HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
            
            // VStack for the circle and vertical line
            VStack {
                CircleOne()
                    .padding([.bottom], 5) // Adjust padding as needed
                
                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 1, height: 475) // Adjust height as needed
                
                
                
                
            }
            
            // VStack for the "Procedure Info" and its related fields
            
            VStack(alignment: .leading, spacing: 8) {
                // Procedure Info Text
                Text("Procedure Info")
                    .font(Font.custom("Inter", size: 24).weight(.semibold))
                    .kerning(0.24)
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                
                
                
                // Date Field
                Group{
                    Text("Date")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    
                    DatePicker("", selection: $userData.selectedDate, displayedComponents: .date)
                        .frame(width: 120, height: 35)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                        .datePickerStyle(CompactDatePickerStyle()) // You can choose a different style if preferred
                    
                    
                    
                    // Room Number Field
                    
                    Text("Room Number")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    
                    TextField("Enter Room Number", text: $userData.RoomNumberText)
                        .multilineTextAlignment(.leading)
                        .frame(width: 212, height: 42.65168)
                        .padding(.leading, 10) // Add padding to the left
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                    
                    
                    // Room Number Field
                    
                    Text("Facility")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    
                    TextField("Enter Facility", text: $userData.FacilityText)
                        .multilineTextAlignment(.leading)
                        .frame(width: 212, height: 42.65168)
                        .padding(.leading, 10) // Add padding to the left
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                    
                    
                    
                    // Room Number Field
                    
                    Text("Physician")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    
                    TextField("Enter Physician", text: $userData.PhysicianText)
                        .multilineTextAlignment(.leading)
                        .frame(width: 212, height: 42.65168)
                        .padding(.leading, 10) // Add padding to the left
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                    
                    
                    // CRNA Text
                    
                    Text("CRNA")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    
                    TextField("Enter CRNA", text: $userData.CRNAText)
                        .multilineTextAlignment(.leading)
                        .frame(width: 212, height: 42.65168)
                        .padding(.leading, 10) // Add padding to the left
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                        .padding(.bottom)
                    
                    // General, Regional and MAC check boxes
                    HStack {
                        Button(action: {
                            userData.General.toggle()
                        }) {
                            
                            Image(systemName: userData.General ? "checkmark.square" : "square")
                                .foregroundColor(userData.General ? .black : .gray) // Change the color here
                            Text("General")
                                .foregroundColor(userData.General ? .black : .gray)
                            
                        }
                        
                        
                        Button(action: {
                            userData.Regional.toggle()
                        }) {
                            
                            Image(systemName: userData.Regional ? "checkmark.square" : "square")
                                .foregroundColor(userData.Regional ? .black : .gray) // Change the color here
                            Text("Regional")
                                .foregroundColor(userData.Regional ? .black : .gray)
                            
                        }
                        .padding(.leading)
                        
                        
                        Button(action: {
                            userData.MAC.toggle()
                        }) {
                            
                            Image(systemName: userData.MAC ? "checkmark.square" : "square")
                                .foregroundColor(userData.MAC ? .black : .gray) // Change the color here
                            Text("MAC")
                                .foregroundColor(userData.MAC ? .black : .gray)
                            
                        }
                        .padding(.leading)
                        
                        
                    }
                    .padding(.bottom)
                    
                    
                    // Procedure Text
                    
                    Text("Procedure Info")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    
                    TextField("Enter Procedure", text: $userData.ProcedureText)
                        .multilineTextAlignment(.leading)
                        .frame(width: 612, height: 42.65168)
                        .padding(.leading, 10) // Add padding to the left
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                        .padding(.bottom)
                    
                    
                    
                    
                    
                }
                
                
                
            } //End of section1 vstack
        }
        .padding(.leading)
        
        
        /*---------------------------------------------------------------
         
         
         Patient Info SECTION 2
         */
        /*
         HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
         
         // VStack for the circle and vertical line
         VStack {
         CircleTwo()
         .padding([.bottom], 5) // Adjust padding as needed
         
         Rectangle()
         .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
         .frame(width: 1, height: 375) // Adjust height as needed
         
         
         
         
         
         }
         
         // VStack for Section 2
         
         VStack(alignment: .leading, spacing: 8) {
         // Procedure Info Text
         Text("Patient Info")
         .font(Font.custom("Inter", size: 24).weight(.semibold))
         .kerning(0.24)
         .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
         
         
         
         // Date Field
         Group{
         Text("First Name")
         .font(Font.custom("Inter", size: 14))
         .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
         
         TextField("Enter First Name", text: $userData.FirstNameText)
         .multilineTextAlignment(.leading)
         .frame(width: 212, height: 42.65168)
         .padding(.leading, 10) // Add padding to the left
         .background(Color(red: 0.96, green: 0.96, blue: 0.96))
         .cornerRadius(16)
         
         // Last Name Field
         
         Text("Last Name")
         .font(Font.custom("Inter", size: 14))
         .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
         
         TextField("Enter Last Name", text: $userData.LastNameText)
         .multilineTextAlignment(.leading)
         .frame(width: 212, height: 42.65168)
         .padding(.leading, 10) // Add padding to the left
         .background(Color(red: 0.96, green: 0.96, blue: 0.96))
         .cornerRadius(16)
         
         // NPO Field
         
         Text("NPO")
         .font(Font.custom("Inter", size: 14))
         .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
         
         TextField("NPO at", text: $userData.NPO)
         .multilineTextAlignment(.leading)
         .frame(width: 212, height: 42.65168)
         .padding(.leading, 10) // Add padding to the left
         .background(Color(red: 0.96, green: 0.96, blue: 0.96))
         .cornerRadius(16)
         
         
         // Weight Field
         
         Text("Weight")
         .font(Font.custom("Inter", size: 14))
         .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
         
         TextField("Enter Weight", text: $userData.WeightText)
         .multilineTextAlignment(.leading)
         .frame(width: 212, height: 42.65168)
         .padding(.leading, 10) // Add padding to the left
         .background(Color(red: 0.96, green: 0.96, blue: 0.96))
         .cornerRadius(16)
         
         // Allergies Field
         
         Text("Allergies")
         .font(Font.custom("Inter", size: 14))
         .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
         
         TextField("   Enter Allergies If any", text: $userData.AllergiesText)
         .multilineTextAlignment(.leading)
         .frame(width: 212, height: 42.65168)
         .padding(.leading, 10) // Add padding to the left
         .background(Color(red: 0.96, green: 0.96, blue: 0.96))
         .cornerRadius(16)
         
         
         }
         
         // Allergies Field
         
         Text("Patient ID")
         .font(Font.custom("Inter", size: 14))
         .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
         .padding(.top)
         
         //Patient ID Camera Button
         
         Button(action: {
         userData.isCameraPresented = true
         }) {
         Image("CameraButton")
         .frame(width: 46, height: 43)
         }
         .sheet(isPresented: $userData.isCameraPresented) {
         ImagePicker(isPresented: $userData.isCameraPresented, selectedImage: $userData.PatientIDImage)
         }
         
         }
         }
         .padding(.leading)
         
         */
        
        
        /*---------------------------------------------------------------
         
         
         Create New Procedure Section 3
         */
HStack(alignment: .center, spacing: 20.0) { // Adjust spacing as needed
    
    // VStack for the circle and vertical line
    
    CircleThree()
        .padding([.bottom], 5) // Adjust padding as needed
    
    // Create New Procedure Button
    
    
    
    VStack {
        Button(action: {
            if userData.RoomNumberText.isEmpty {
                ErrorMessage = "Please fill in all forms."
                navigateToNextView = false // Prevent navigation
            } else {
                ErrorMessage = ""
                navigateToNextView = true // Trigger navigation
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
                        .weight(.bold))
        }
    


                    
   
        
        
        
    
        
    
    
    
}
.padding(.leading)
                
            } // End of top level VStack
            
            } // End of Scroll View
    
    .navigationDestination(isPresented: $navigateToNextView) {
        MedHisA(userData: userData)}
      
            } // End of Navigation Stack

            } //End of main body

            } // End of main struct view

          
        
      
    
// Generate Preview


struct Tester2_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of UserEntryData for the preview
        let userData = UserEntryData()
        // Pass the instance to Tester2
        Tester2(userData: userData)
    }
}

