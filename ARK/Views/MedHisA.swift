//
//  MedHisA.swift
//  ARK
//  Created by Ebenezer Tubbs on 2/5/24.
//

import Foundation

import SwiftUI


struct MedHisA: View {
    
@ObservedObject var userData: UserEntryData
    
@State private var showNotes = false
    
@State private var ErrorMessage: String = ""
@State private var NavigateNextView: Bool = false
@State private var isAnimating = false
    
@State private var SmokeFrequencyError = ""
@State private var LungsOtherError = ""
@State private var CNSOtherTextError = ""
@State private var GIOtherTextError = ""
@State private var RenalOtherTextError = ""
@State private var EndoOtherTextError = ""
    
let commonText = CommonText()



var body: some View {
NavigationStack{
   
    Text("Medical History Part 1")
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
        
        ScrollView{
            
            VStack(alignment: .leading, spacing: 20) {
                
               
                
                
                
/*----------------------------------------------------
                 
                 
                 Cardio Vascular SECTION 1
                 */
                
        HStack(alignment: .top, spacing: 20) {
            
            VStack {
                CircleOne()
                    .padding([.bottom], 5) // Adjust padding as needed
                
                Rectangle()
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 1, height: 340) // Adjust height as needed
                
                
                
                
            }
            
            // VStack for the "Cardio Vascular" and its related fields
            
            VStack(alignment: .leading, spacing: 20) {
                // Sub head
                Text("Cardio Vascular")
                    .font(
                        Font.custom("Inter", size: 24)
                            .weight(.semibold)
                    )
                    .kerning(0.24)
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                    .frame(width: 187, height: 43.12318, alignment: .leading)
                
Text("Select Conditions That Apply:")
.font(Font.custom("Inter", size: 14))
.foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))


VStack(alignment: .leading, spacing: 20) {
Button(action: {
withAnimation {
    userData.isCardioExpanded.toggle()
}
}) {

HStack {
    Text("Cardio Vascular Options")
        .padding([.top, .leading, .bottom])
        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
        .font(
            Font.custom("Inter", size: 18)
                .weight(.semibold))
    
    // Arrow to the right of the text
    Image(systemName: userData.isCardioExpanded ? "chevron.up" : "chevron.down")
        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
        .padding(.trailing)
}
.background(Color(red: 0.96, green: 0.96, blue: 0.96)) // Apply background to the entire HStack
.cornerRadius(8) // Apply corner radius to the entire HStack
}

if userData.isCardioExpanded {
VStack {
    CardioDropdownMenu(userData: userData)
        .frame(width: 250) // Adjust the width here
        .background(Color.white)
        .border(Color.gray, width: 1)
        .cornerRadius(8)
        .shadow(radius: 5)
}
.padding(.top, 5) // Adjust the top padding as needed
}


//Display your answers
Group{

Text("Selected Conditions Below:")
    .font(Font.custom("Inter", size: 14))
    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

if userData.CardioWNL {
    
    Text("WNL")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.CardioHTN {
    
    Text("HTN")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.CardioAngina {
    
    Text("Angina")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
}

if userData.CardioPTCAStent {
    
    Text("PTCA/Stent")
        .multilineTextAlignment(.leading)
        .frame(width: 150, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.CardioCAD {
    
    Text("Cad")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.CardioMI {
    
    Text("MI")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.CardioCABG {
    
    
    Text("CABG")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
        .padding(.trailing)
    
}

if userData.CardioHLD {
    
    Text("OHLD")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.CardioPVD {
    
    Text("PVD")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.CardioAfib {
    
    Text("Afib")
        .multilineTextAlignment(.leading)
        .frame(width: 180, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.CardioCHF {
    
    Text("CHF")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}


}// End of display group


}

//EKG
Text("EKG:\nExam of Heart")
.font(.subheadline)
.lineLimit(nil) // Allows for unlimited lines
.fixedSize(horizontal: false, vertical: true)
.foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

HStack {
Button(action: {
userData.HeartExamRegular.toggle()
}) {

Image(systemName: userData.HeartExamRegular ? "checkmark.square" : "square")
    .foregroundColor(userData.HeartExamRegular ? .black : .gray) // Change the color here
Text("Regular")
    .foregroundColor(userData.HeartExamRegular ? .black : .gray)

}


Button(action: {
userData.HeartExamIrregular.toggle()
}) {

Image(systemName: userData.HeartExamIrregular ? "checkmark.square" : "square")
    .foregroundColor(userData.HeartExamIrregular ? .black : .gray) // Change the color here
Text("Irregular")
    .foregroundColor(userData.HeartExamIrregular ? .black : .gray)

}
.padding(.leading)


Button(action: {
userData.HeartExamMurmur.toggle()
}) {

Image(systemName: userData.HeartExamMurmur ? "checkmark.square" : "square")
    .foregroundColor(userData.HeartExamMurmur ? .black : .gray) // Change the color here
Text("Murmur")
    .foregroundColor(userData.HeartExamMurmur ? .black : .gray)
}
.padding(.leading)


}
.padding(.bottom)


//CheckBox
Text("Is the patient on beta blockers?")
.font(.subheadline)
.foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

HStack {
Button(action: {
userData.isPatientOnBetaBlockers = true
}) {
HStack {
    Image(systemName: userData.isPatientOnBetaBlockers ? "checkmark.square" : "square")
        .foregroundColor(userData.isPatientOnBetaBlockers ? .black : .gray) // Change the color here
    Text("Yes")
        .foregroundColor(userData.isPatientOnBetaBlockers ? .black : .gray)
}
}


Button(action: {
userData.isPatientOnBetaBlockers = false
}) {
HStack {
    Image(systemName: !userData.isPatientOnBetaBlockers ? "checkmark.square" : "square")
        .foregroundColor(userData.isPatientOnBetaBlockers ? .gray : .gray)
    Text("No")
        .foregroundColor(.gray)
}
}
}

//CheckBox drop down POP
if userData.isPatientOnBetaBlockers {

Button(action: {userData.isBetaBlockerGivenDayPrior.toggle()})
{
HStack {
    
    Image(systemName: userData.isBetaBlockerGivenDayPrior ? "checkmark.square" : "square")
        .foregroundColor(userData.isBetaBlockerGivenDayPrior ? .black : .gray)
    Text("Beta Blocker given either day prior to day of procedure")
        .foregroundColor(userData.isBetaBlockerGivenDayPrior ? .black : .gray)
}
}
Button(action: {userData.isBetaBlockerGivenIntraOP.toggle()})
{
HStack {
    Image(systemName: userData.isBetaBlockerGivenIntraOP ? "checkmark.square" : "square")
        .foregroundColor(userData.isBetaBlockerGivenIntraOP ? .black : .gray)
    Text("Beta Blocker given intra-OP")
        .foregroundColor(userData.isBetaBlockerGivenIntraOP ? .black : .gray)
}
}
Button(action: {userData.isBetaBlockerContraindicated.toggle()})
{
HStack {
    Image(systemName: userData.isBetaBlockerContraindicated ? "checkmark.square" : "square")
        .foregroundColor(userData.isBetaBlockerContraindicated ? .black : .gray)
    Text("Beta Blocker contraindicated")
        .foregroundColor(userData.isBetaBlockerContraindicated ? .black : .gray)
}
}
}
}
}

/*---------------------------------------------------


Pulmonary SECTION 2
*/
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed

// VStack for the circle and vertical line
VStack {
CircleTwo()
.padding([.bottom], 5) // Adjust padding as needed

Rectangle()
.fill(Color(red: 0.85, green: 0.85, blue: 0.85))
.frame(width: 1, height: 260) // Adjust height as needed





}

// VStack for Section 2

VStack(alignment: .leading, spacing: 8) {
// Procedure Info Text
Text("Pulmonary")
.font(
Font.custom("Inter", size: 24)
    .weight(.semibold)
)
.kerning(0.24)
.foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
.frame(width: 187, height: 63.12318, alignment: .leading)



// Pulmonary Condition Text


Text("Select Conditions That Apply:")
.font(Font.custom("Inter", size: 14))
.foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

VStack(alignment: .leading, spacing: 20) {
Button(action: {
withAnimation {
    userData.isPulmonaryExpanded.toggle()
}
}) {

HStack {
    Text("Pulmonary Options")
        .padding([.top, .leading, .bottom])
        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
        .font(
            Font.custom("Inter", size: 18)
                .weight(.semibold))
    
    // Arrow to the right of the text
    Image(systemName: userData.isPulmonaryExpanded ? "chevron.up" : "chevron.down")
        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
        .padding(.trailing)
}
.background(Color(red: 0.96, green: 0.96, blue: 0.96)) // Apply background to the entire HStack
.cornerRadius(8) // Apply corner radius to the entire HStack
}

if userData.isPulmonaryExpanded {
VStack {
    PulmonaryDropdownMenu(userData: userData)
        .frame(width: 250) // Adjust the width here
    //.frame(height: 250)
        .background(Color.white)
        .border(Color.gray, width: 1)
        .cornerRadius(8)
        .shadow(radius: 5)
}
.padding(.top, 5) // Adjust the top padding as needed
}


//Display your answers
Group{

Text("Selected Conditions Below:")
    .font(Font.custom("Inter", size: 14))
    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

if userData.PulmWNL {
    
    Text("WNL")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.PulmAsthma {
    
    Text("Asthma")
        .multilineTextAlignment(.leading)
        .frame(width: 130, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.PulmPneumonia {
    
    Text("Pneumonia")
        .multilineTextAlignment(.leading)
        .frame(width: 150, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
}


if userData.PulmCOPD {
    
    Text("COPD")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.PulmOSA {
    
    Text("OSA")
        .multilineTextAlignment(.leading)
        .frame(width: 100, height: 42.65168)
        .foregroundColor(.black)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}

if userData.PulmBronchitis {
    
    Text("Bronchitis")
        .multilineTextAlignment(.leading)
        .frame(width: 150, height: 42.65168)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
}




}// End of display group


}


// Checkbox: Is Patient a smoker?
Group{
Text("Is the patient a smoker?")
.font(.subheadline)
.foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
.padding(.top)

HStack {
Button(action: {
    userData.isPatientASmoker = true
}) {
    HStack {
        Image(systemName: userData.isPatientASmoker ? "checkmark.square" : "square")
            .foregroundColor(userData.isPatientASmoker ? .black : .gray) // Change the color here
        Text("Yes")
            .foregroundColor(userData.isPatientASmoker ? .black : .gray)
    }
}


Button(action: {
    userData.isPatientASmoker = false
}) {
    
    
    HStack {
        Image(systemName: !userData.isPatientASmoker ? "checkmark.square" : "square")
            .foregroundColor(userData.isPatientASmoker ? .gray : .gray)
        Text("No")
            .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
    }
    
    
}

}
.padding(.bottom)

// If Yes, Enter Frequency


if userData.isPatientASmoker == true {

Text("If Yes, Enter Frequency")
    .font(Font.custom("Inter", size: 14))
    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

HStack(alignment:.center){
    
    TextField("Enter Smoker Frequency", text: $userData.SmokeFrequency)
        .onChange(of: userData.SmokeFrequency) { newValue in
            if newValue.count > 15 {
                SmokeFrequencyError = "Character limit reached. Add more info to notes"
                isAnimating = true
            } else {
                SmokeFrequencyError = ""
                isAnimating = false
            }
        }
        .multilineTextAlignment(.leading)
        .frame(width: 212, height: 42.65168)
        .padding(.leading, 10) // Add padding to the left
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
    Text(SmokeFrequencyError)
        .foregroundColor(.red)
        .font(
            Font.custom("Inter", size: 15)
                .weight(.bold)
        )
        .frame(maxWidth: 400, alignment: .leading) //
        .lineLimit(nil) //
    
}


}

//Exam of Lungs
Text("Exam of Lungs")
.font(.subheadline)
.foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

HStack {
Button(action: {
    userData.LungsCTA.toggle()
}) {
    HStack {
        Image(systemName: userData.LungsCTA ? "checkmark.square" : "square")
            .foregroundColor(userData.LungsCTA ? .black : .gray) // Change the color here
        Text("CTA")
            .foregroundColor(userData.LungsCTA ? .black : .gray)
    }
}

HStack(alignment:.center){
    
    TextField("Enter Lungs Other", text: $userData.LungsOther)
        .onChange(of: userData.LungsOther) { newValue in
            if newValue.count > 15 {
                LungsOtherError = "Character limit reached. Add more info to notes"
                isAnimating = true
            } else {
                LungsOtherError = ""
                isAnimating = false
            }
        }
        .multilineTextAlignment(.leading)
        .frame(width: 192, height: 42.65168)
        .padding(.leading, 10) // Add padding to the left
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .cornerRadius(16)
    
    Text(LungsOtherError)
        .foregroundColor(.red)
        .font(
            Font.custom("Inter", size: 15)
                .weight(.bold)
        )
        .frame(maxWidth: 400, alignment: .leading) //
        .lineLimit(nil) //
    
}



}

}



}
}


/*---------------------------------------------------------------


Neurological Section 3
*/
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed

// VStack for the circle and vertical line
VStack {
CircleThree()
.padding([.bottom], 5) // Adjust padding as needed

Rectangle()
.fill(Color(red: 0.85, green: 0.85, blue: 0.85))
.frame(width: 1, height: 100) // Adjust height as needed

}

// VStack for Section 3

VStack(alignment: .leading, spacing: 8) {
Group{

Text("Select Conditions That Apply:")
.font(Font.custom("Inter", size: 14))
.foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))

VStack(alignment: .leading, spacing: 20) {
Button(action: {
    withAnimation {
        userData.isNeurologicalExpanded.toggle()
    }
}) {
    
    HStack {
        Text("CNS Options")
            .padding([.top, .leading, .bottom])
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .font(
                Font.custom("Inter", size: 18)
                    .weight(.semibold))
        
        // Arrow to the right of the text
        Image(systemName: userData.isNeurologicalExpanded ? "chevron.up" : "chevron.down")
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .padding(.trailing)
    }
    .background(Color(red: 0.96, green: 0.96, blue: 0.96)) // Apply background to the entire HStack
    .cornerRadius(8) // Apply corner radius to the entire HStack
}

if userData.isNeurologicalExpanded {
    VStack {
        NeurologicalDropdownMenu(userData: userData)
            .frame(width: 250) // Adjust the width here
        //.frame(height: 250)
            .background(Color.white)
            .border(Color.gray, width: 1)
            .cornerRadius(8)
            .shadow(radius: 5)
    }
    .padding(.top, 5) // Adjust the top padding as needed
}


//Display your answers
Group{
    
    Text("Selected Conditions Below:")
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
    
    if userData.CNSWNL {
        
        Text("WNL")
            .multilineTextAlignment(.leading)
            .frame(width: 100, height: 42.65168)
            .foregroundColor(.black)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
        
    }
    
    if userData.CNSDementia {
        
        Text("Dementia")
            .multilineTextAlignment(.leading)
            .frame(width: 130, height: 42.65168)
            .foregroundColor(.black)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
        
    }
    
    if userData.CNSSeizure {
        
        Text("Seizure")
            .multilineTextAlignment(.leading)
            .frame(width: 150, height: 42.65168)
            .foregroundColor(.black)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
    }
    
    
    if userData.CNSETOH {
        
        Text("ETOH")
            .multilineTextAlignment(.leading)
            .frame(width: 100, height: 42.65168)
            .foregroundColor(.black)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
        
    }
    
    if userData.CNSCVA {
        
        Text("CVA")
            .multilineTextAlignment(.leading)
            .frame(width: 100, height: 42.65168)
            .foregroundColor(.black)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
        
    }
    
    if userData.CNSMigraines {
        
        Text("Migraines")
            .multilineTextAlignment(.leading)
            .frame(width: 150, height: 42.65168)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
        
    }
    
    if userData.CNSDrugAbuse {
        
        
        Text("Drug Abuse")
            .multilineTextAlignment(.leading)
            .frame(width: 150, height: 42.65168)
            .foregroundColor(.black)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
            .padding(.trailing)
        
    }
    
    
    if userData.CNSAnxietyDepression {
        
        Text("Anxiety/Depression")
            .multilineTextAlignment(.leading)
            .frame(width: 200, height: 42.65168)
            .foregroundColor(.black)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
        
    }
    
    if userData.CNSOther {
        
        
        HStack(alignment:.center){
            
            TextField("Enter CNS Other", text: $userData.CNSOtherText)
                .onChange(of: userData.CNSOtherText) { newValue in
                    if newValue.count > 15 {
                        CNSOtherTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                    } else {
                        CNSOtherTextError = ""
                        isAnimating = false
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(width: 192, height: 42.65168)
                .padding(.leading, 10) // Add padding to the left
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(16)
            
            Text(CNSOtherTextError)
                .foregroundColor(.red)
                .font(
                    Font.custom("Inter", size: 15)
                        .weight(.bold)
                )
                .frame(maxWidth: 400, alignment: .leading) //
                .lineLimit(nil) //
// Procedure Info Text
Text("Neurological")
.font(
Font.custom("Inter", size: 24)
    .weight(.semibold)
)
.kerning(0.24)
.foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
.frame(width: 187, height: 63.12318, alignment: .leading)



// CNS Condition Text
            
        }
        
        
    }
    
    
    
    
}// End of display group


}



}



}


}

/*---------------------------------------------------------------


Gastrointestinal Section 4
*/
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed

// VStack for the circle and vertical line
VStack {
CircleFour()
.padding([.bottom], 5) // Adjust padding as needed

Rectangle()
.fill(Color(red: 0.85, green: 0.85, blue: 0.85))
.frame(width: 1, height: 180) // Adjust height as needed

}

// VStack for the "Procedure Info" and its related fields

VStack(alignment: .leading, spacing: 8) {

// Procedure Info Text
Text("Gastrointestinal")
.font(
Font.custom("Inter", size: 24)
    .weight(.semibold)
)
.kerning(0.24)
.foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
.frame(width: 187, height: 63.12318, alignment: .leading)
                
                

// Gastrointestinal Condition Text
Group{
    
    Text("Select Conditions That Apply:")
        .font(Font.custom("Inter", size: 14))
        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
    
    VStack(alignment: .leading, spacing: 20) {
        Button(action: {
            withAnimation {
                userData.isGastrointestinalExpanded.toggle()
            }
        }) {
            
            
            HStack {
                Text("GI Options")
                    .padding([.top, .leading, .bottom])
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                    .font(
                        Font.custom("Inter", size: 18)
                            .weight(.semibold))
                
                // Arrow to the right of the text
                Image(systemName: userData.isGastrointestinalExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                    .padding(.trailing)
            }
            .background(Color(red: 0.96, green: 0.96, blue: 0.96)) // Apply background to the entire HStack
            .cornerRadius(8) // Apply corner radius to the entire HStack
        }
        
        if userData.isGastrointestinalExpanded {
            VStack {
                GastrointestinalDropdownMenu(userData: userData)
                    .frame(width: 250) // Adjust the width here
                //.frame(height: 250)
                    .background(Color.white)
                    .border(Color.gray, width: 1)
                    .cornerRadius(8)
                    .shadow(radius: 5)
            }
            .padding(.top, 5) // Adjust the top padding as needed
        }
        
        
        //Display your answers
        Group{
            
            Text("Selected Conditions Below:")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            
            if userData.GIWNL {
                
                Text("WNL")
                    .multilineTextAlignment(.leading)
                    .frame(width: 100, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
            }
            
            if userData.GIHernia {
                
                Text("Dementia")
                    .multilineTextAlignment(.leading)
                    .frame(width: 130, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
            }
            
            if userData.GIGERD {
                
                Text("Hernia")
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
            }
            
            
            if userData.GIDiverticulosis {
                
                Text("Diverticulosis")
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
            }
            
            if userData.GIHepatitis {
                
                Text("Hepatitis")
                    .multilineTextAlignment(.leading)
                    .frame(width: 100, height: 42.65168)
                    .foregroundColor(.black)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(16)
                
            }
            
            
            if userData.GIOther {
                
                
                HStack(alignment:.center){
                    
                    TextField("Enter GI Other", text: $userData.GIOtherText)
                        .onChange(of: userData.GIOtherText) { newValue in
                            if newValue.count > 15 {
                                GIOtherTextError = "Character limit reached. Add more info to notes"
                                isAnimating = true
        
                            } else {
                                GIOtherTextError = ""
                                isAnimating = false
                            }
                        }
                        .multilineTextAlignment(.leading)
                        .frame(width: 192, height: 42.65168)
                        .padding(.leading, 10) // Add padding to the left
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                    
                    Text(GIOtherTextError)
                        .foregroundColor(.red)
                        .font(
                            Font.custom("Inter", size: 15)
                                .weight(.bold)
                        )
                        .frame(maxWidth: 400, alignment: .leading) //
                        .lineLimit(nil) //
                    
                }
                
                
            }
            
            
            
            
        }// End of display group
        
        
    }
    
    
    
        }
    }
    
    
}





/*---------------------------------------------------------------
 
 
 Endocrine Section 5
 */
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
    
    // VStack for the circle and vertical line
    VStack {
        CircleFive()
            .padding(0) // Adjust padding as needed
        
        Rectangle()
            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
            .frame(width: 1, height: 180) // Adjust height as needed
        
    }
    
    // VStack for the "Procedure Info" and its related fields
    
    VStack(alignment: .leading, spacing: 8) {
        // Procedure Info Text
        Text("Endocrine")
            .font(
                Font.custom("Inter", size: 24)
                    .weight(.semibold)
            )
            .kerning(0.24)
            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            .frame(width: 187, height: 63.12318, alignment: .leading)
        
        
        
        // Endocrine Data input
        
        Group{
            
            Text("Select Conditions That Apply:")
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
            
            VStack(alignment: .leading, spacing: 20) {
                Button(action: {
                    withAnimation {
                        userData.isEndocrineExpanded.toggle()
                    }
                }) {
                    
                    
                    HStack {
                        Text("Endo Options")
                            .padding([.top, .leading, .bottom])
                            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                            .font(
                                Font.custom("Inter", size: 18)
                                    .weight(.semibold))
                        
                        // Arrow to the right of the text
                        Image(systemName: userData.isEndocrineExpanded ? "chevron.up" : "chevron.down")
                            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                            .padding(.trailing)
                    }
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96)) // Apply background to the entire HStack
                    .cornerRadius(8) // Apply corner radius to the entire HStack
                }
                
                if userData.isEndocrineExpanded {
                    VStack {
                        EndocrineDropdownMenu(userData: userData)
                            .frame(width: 250) // Adjust the width here
                        //.frame(height: 250)
                            .background(Color.white)
                            .border(Color.gray, width: 1)
                            .cornerRadius(8)
                            .shadow(radius: 5)
                    }
                    .padding(.top, 5) // Adjust the top padding as needed
                }
                
                
                //Display your answers
                Group{
                    
                    Text("Selected Conditions Below:")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                    
                    if userData.EndoWNL {
                        
                        Text("WNL")
                            .multilineTextAlignment(.leading)
                            .frame(width: 100, height: 42.65168)
                            .foregroundColor(.black)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(16)
                        
                    }
                    
                    if userData.EndoDiabetes {
                        
                        Text("Diabetes")
                            .multilineTextAlignment(.leading)
                            .frame(width: 130, height: 42.65168)
                            .foregroundColor(.black)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(16)
                        
                    }
                    
                    if userData.EndoObesity {
                        
                        Text("Obesity")
                            .multilineTextAlignment(.leading)
                            .frame(width: 150, height: 42.65168)
                            .foregroundColor(.black)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(16)
                    }
                    
                    
                    if userData.EndoThyroid {
                        
                        Text("Thyroid")
                            .multilineTextAlignment(.leading)
                            .frame(width: 150, height: 42.65168)
                            .foregroundColor(.black)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(16)
                        
                    }
                    
                    
                    
                    if userData.EndoOther {
                        
                        
                        HStack(alignment:.center){
                            
                            TextField("Enter Endo Other", text: $userData.EndoOtherText)
                                .onChange(of: userData.EndoOtherText) { newValue in
                                    if newValue.count > 15 {
                                        EndoOtherTextError = "Character limit reached. Add more info to notes"
                        isAnimating = true
                                    } else {
                                        EndoOtherTextError = ""
                       isAnimating = false
                                    }
                                }
                                .multilineTextAlignment(.leading)
                                .frame(width: 192, height: 42.65168)
                                .padding(.leading, 10) // Add padding to the left
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .cornerRadius(16)
                            
                            Text(EndoOtherTextError)
                                .foregroundColor(.red)
                                .font(
                                    Font.custom("Inter", size: 15)
                                        .weight(.bold)
                                )
                                .frame(maxWidth: 400, alignment: .leading) //
                                .lineLimit(nil) //
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                }// End of display group
                
                
            }
            
        }
        
    }
    
}


/*---------------------------------------------------------------
 
 
 Continue Section 6
 */
HStack(alignment: .top, spacing: 20) { // Adjust spacing as needed
    
    // VStack for the circle and vertical line
    
    CircleSix()
        .padding([.bottom], 5) // Adjust padding as needed
    
    // Continue Button
    
    
    
    HStack(alignment: .center) {
        Button(action: {
            
            // Data Validation Section
            
            if !(userData.CardioWNL || userData.CardioHTN || userData.CardioAngina ||
                 userData.CardioPTCAStent || userData.CardioCAD || userData.CardioMI ||
                 userData.CardioCABG || userData.CardioHLD || userData.CardioPVD ||
                 userData.CardioAfib || userData.CardioCHF){
                ErrorMessage = "" //Please select at least one Cardio condition."
                NavigateNextView = true // Prevent navigation {
                
                
            } else if !(userData.PulmWNL || userData.PulmAsthma || userData.PulmPneumonia ||
                        userData.PulmCOPD || userData.PulmOSA || userData.PulmBronchitis) {
                
                ErrorMessage = "" //Please select at least one Pulmonary condition."
                NavigateNextView = true // Prevent navigation
                
            } else if !(userData.CNSWNL || userData.CNSDementia || userData.CNSSeizure ||
                        userData.CNSETOH || userData.CNSCVA || userData.CNSMigraines ||
                        userData.CNSDrugAbuse || userData.CNSAnxietyDepression) {
                
                ErrorMessage = "" //Please select at least one CNS condition."
                NavigateNextView = true // Prevent navigation
                
            } else if !(userData.GIWNL || userData.GIHernia || userData.GIGERD ||
                        userData.GIDiverticulosis || userData.GIHepatitis) {
                
                ErrorMessage = "" //Please select at least one GI condition."
                NavigateNextView = true // Prevent navigation
                
            } else if !(userData.EndoWNL || userData.EndoDiabetes || userData.EndoObesity || userData.EndoThyroid) {
                
                ErrorMessage = "" //Please select at least one endocrine condition."
                NavigateNextView = true // Prevent navigation
                
                
            } else {
                ErrorMessage = ""
                NavigateNextView = true // Trigger navigation
                
            }
        }) {
            Text("Continue")
                .foregroundColor(.white)
                .frame(width: 223, height: 49)
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
    
}
                
                
                //----------------------------------------------------
                
                
    }  // End of main VStack
            
            .sheet(isPresented: $showNotes) {
                AdditionalNotes(userData: userData, showNotes: $showNotes)
            }
            
    } // End of Scroll View
    

    
.navigationDestination(isPresented: $NavigateNextView) {
    MedHisB(userData: userData)}
       
    }  //End of Navigation Stack
   


    }  //End of body view


    } // End of main struct


struct MedHisA_Previews: PreviewProvider {
static var previews: some View {
// Create an instance of UserEntryData for the preview
let userData = UserEntryData()
// Pass the instance to this view
MedHisA(userData: userData)
}
}


