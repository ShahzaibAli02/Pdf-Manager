//
//  ProcedureBasicsView.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 1/21/24.
//

import Foundation

import SwiftUI


struct ProcedureBasicsView: View {
    
    @ObservedObject var userData: UserEntryData
    
@State private var showNotes = false
    
@State private var ErrorMessage: String = ""
@State private var NavigateNextView: Bool = false
    
@State private var isAnimating = false
@State private var RoomNumberTextError = ""
@State private var FacilityTextError = ""
@State private var PhysicianTextError = ""
@State private var CRNATextError = ""
@State private var ProcedureTextError = ""
    
@State private var FirstNameTextError = ""
@State private var LastNameTextError = ""
@State private var WeightTextError = ""
@State private var NPOError = ""
@State private var AllergiesTextError = ""
    
    let commonText = CommonText()

    

var body: some View {
NavigationStack{

// Title Header
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

Button(action: {
           showNotes.toggle()
}) {


    AdditionalNotesSymbol(isAnimating: $isAnimating)

}


}
}
.offset(x:0, y:0)

ScrollView{

VStack(alignment: .leading, spacing: 20) {



/*---------------------------------------------------------------


PROCEDURE SECTION 1
*/


HStack(alignment: .top, spacing: 20) {

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
            .frame(width: 130, height: 35)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(20)
            .offset(x:0,y:0)
            .datePickerStyle(CompactDatePickerStyle()) // You can choose a different style if preferred
        
        // Room Number Field
        Text("Room Number")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            .padding(.top)
        
        
        HStack(alignment:.center){
            
            TextField("Enter Room Number", text: $userData.RoomNumberText)
                .onChange(of: userData.RoomNumberText) { newValue in
                    if newValue.count > 15 {
                        RoomNumberTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        RoomNumberTextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 212, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(RoomNumberTextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 500, alignment: .leading) //
                .lineLimit(3) //
            
        }
        
        // Facility Field
        
        Text("Facility")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){
            
            TextField("Enter Facility", text: $userData.FacilityText)
                .onChange(of: userData.FacilityText) { newValue in
                    if newValue.count > 15 {
                        FacilityTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        FacilityTextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 212, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(FacilityTextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) //
                .lineLimit(nil) //
            
        }
        
        
        
        // Physician Field
        
        Text("Physician")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){
            
            TextField("Enter Physician", text: $userData.PhysicianText)
                .onChange(of: userData.PhysicianText) { newValue in
                    if newValue.count > 15 {
                        PhysicianTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        PhysicianTextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 212, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(PhysicianTextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) //
                .lineLimit(nil) //
            
        }
        
        
        // CRNA Text
        
        Text("CRNA")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){
            
            TextField("Enter CRNA", text: $userData.CRNAText)
                .onChange(of: userData.CRNAText) { newValue in
                    if newValue.count > 15 {
                        CRNATextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        CRNATextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 212, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(CRNATextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) //
                .lineLimit(nil) //
            
        }
        
        
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
        
        VStack(alignment:.leading){
            
            TextField("Enter Procedure", text: $userData.ProcedureText)
                .onChange(of: userData.ProcedureText) { newValue in
                    if newValue.count > 80 {
                        ProcedureTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        ProcedureTextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 612, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(ProcedureTextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 550, alignment: .leading) //
                .lineLimit(nil) //
            
        }
        
        
        
    }
    
    
    
} //End of section1 vstack
}
.padding(.leading)


/*---------------------------------------------------------------


Patient Info SECTION 2
*/
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
    
    
    
    // First Name
    Group{
        Text("First Name")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){
            
            TextField("Enter First Name", text: $userData.FirstNameText)
                .onChange(of: userData.FirstNameText) { newValue in
                    if newValue.count > 15 {
                        FirstNameTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        FirstNameTextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 212, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(FirstNameTextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) //
                .lineLimit(nil) //
            
        }
        
        
        // Last Name Field
        
        Text("Last Name")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){
            
            TextField("Enter Last Name", text: $userData.LastNameText)
                .onChange(of: userData.LastNameText) { newValue in
                    if newValue.count > 15 {
                        LastNameTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        LastNameTextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 212, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(LastNameTextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) //
                .lineLimit(nil) //
            
        }
        
        
        // NPO Field
        
        Text("NPO")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){
            
            TextField("NPO at", text: $userData.NPO)
                .onChange(of: userData.NPO) { newValue in
                    if newValue.count > 15 {
                        NPOError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        NPOError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 212, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(NPOError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) //
                .lineLimit(nil) //
            
        }
        
        
        
        // Weight Field
        
        Text("Weight")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){
            
            TextField("Enter Weight", text: $userData.WeightText)
                .onChange(of: userData.WeightText) { newValue in
                    if newValue.count > 15 {
                        WeightTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        WeightTextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 212, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(WeightTextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) //
                .lineLimit(nil) //
            
        }
        
        
        // Allergies Field
        
        Text("Allergies")
            .font(Font.custom("Inter", size: 14))
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
        
        HStack(alignment:.center){
            
            TextField("Enter Allergies", text: $userData.AllergiesText)
                .onChange(of: userData.AllergiesText) { newValue in
                    if newValue.count > 15 {
                        AllergiesTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        AllergiesTextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 212, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(AllergiesTextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) //
                .lineLimit(nil) //
            
        }
        
        
        
    }
    
    // Patient ID Field
    
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




/*---------------------------------------------------------------


Create New Procedure Section 3
*/
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed

// VStack for the circle and vertical line

CircleThree()
    .padding([.bottom], 5) // Adjust padding as needed

// Create New Procedure Button

HStack(alignment: .center) {
    Button(action: {
        
        
        if userData.RoomNumberText.isEmpty {
            ErrorMessage = "Please enter a room number."
            NavigateNextView = false // Prevent navigation
        } else if userData.FacilityText.isEmpty {
            ErrorMessage = "Please enter a facility name."
            NavigateNextView = false // Prevent navigation
        } else if userData.PhysicianText.isEmpty {
            ErrorMessage = "Please enter the physician's name."
            NavigateNextView = false // Prevent navigation
        } else if userData.CRNAText.isEmpty {
            ErrorMessage = "Please enter CRNA's name."
            NavigateNextView = false // Prevent navigation
        } else if userData.FirstNameText.isEmpty {
            ErrorMessage = "Please enter the patient's first name."
            NavigateNextView = false // Prevent navigation
        } else if userData.LastNameText.isEmpty {
            ErrorMessage = "Please enter the patient's last name."
            NavigateNextView = false // Prevent navigation
        } else if userData.WeightText.isEmpty {
            ErrorMessage = "Please enter the patient's weight."
            NavigateNextView = false // Prevent navigation
        } else if userData.NPO.isEmpty {
            ErrorMessage = "Please enter the NPO status or N/A."
            NavigateNextView = false // Prevent navigation
        } else if userData.AllergiesText.isEmpty {
            ErrorMessage = "Please enter any known allergies or N/A."
            NavigateNextView = false // Prevent navigation
        } else if !userData.General && !userData.Regional && !userData.MAC {
            ErrorMessage = "Please select at least one type of anesthesia (General, Regional, or MAC)."
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
.padding(.leading)



            } // End of top level VStack
                
                .sheet(isPresented: $showNotes) {
                    AdditionalNotes(userData: userData, showNotes: $showNotes)
                }
            
            } // End of Scroll View
        
.navigationDestination(isPresented: $NavigateNextView) {
//    Grid2(userData: userData)
    
    MedHisA(userData: userData)
    
    
}
      
            } // End of Navigation Stack

            } //End of main body

            } // End of main struct view

          
        
      
    
// Generate Preview


struct ProcedureBasicsView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of UserEntryData for the preview
        let userData = UserEntryData()
        // Pass the instance to Tester2
        ProcedureBasicsView(userData: userData)
    }
}
