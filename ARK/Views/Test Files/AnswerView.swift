//
//  Tester2.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 2/22/24.
//

import SwiftUI

struct AnswerView: View {
    @ObservedObject var userData: UserEntryData
        var body: some View {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                      
                        Text("Procedure Basic View")
                            .font(
                                Font.custom("Inter", size: 26)
                                    .weight(.bold))
                        Text("Section 1")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                       Text("Date:\(userData.DateText)")
                        Text("Room Number:\(userData.RoomNumberText)")
                        Text("Facility:\(userData.FacilityText)")
                        Text("Physician:\(userData.PhysicianText)")
                        Text("CRNA:\(userData.CRNAText)")
                        Text("Section 2")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("First Name:\(userData.FirstNameText)")
                        Text("Last Name:\(userData.LastNameText)")
                        Text("Weight:\(userData.WeightText)")
                        Text("Allergies:\(userData.AllergiesText)")
                        Text("Insert Camera Data Here?")
                        .padding(.bottom)
                        Text("MedHisA")
                            .font(
                                Font.custom("Inter", size: 26)
                                    .weight(.bold))
                        Text("Section 1")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Cardio Vascular:\(userData.CardioVascularText)")
                        Text("Is the Patient on Beta Blockers:\(userData.isPatientOnBetaBlockers ? "Yes" : "No")")
                        Text("If yes, Beta Blockers given day prior to procedure?:\(userData.isBetaBlockerGivenDayPrior ? "Yes" : "No")")
                        Text("Beta Blockers given Intra OP:\(userData.isBetaBlockerGivenIntraOP ? "Yes" : "No")")
                        Text("Beta Blockers contraindicated:\(userData.isBetaBlockerContraindicated ? "Yes" : "No")")
                        Text("Section 2")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Pulmonary:\(userData.PulminaryText)")
                        Text("Is the patient a smoker:\(userData.isPatientASmoker ? "Yes" : "No")")
                        Text("If yes, smoking frequency:\(userData.SmokeFrequency)")
                        Text("Section 3")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Neurological:\(userData.NeurologicalText)")
                        Text("Section 4")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Gastrointestinal:\(userData.GastrointestinalText)")
                        Text("Section 5")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Renal:\(userData.RenalText)")
                        Text("Section 6")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Endocrine:\(userData.EndocrineText)")
                        .padding(.bottom)
                        Text("MedHisB")
                            .font(
                                Font.custom("Inter", size: 26)
                                    .weight(.bold))
                        Text("Section 1")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Airway:\(userData.AirwayText)")
                        Text("Section 2")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("is Camera Presented:\(userData.isCameraPresented ? "Yes" : "No")")
                        Text("Section 3")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Labs One 1:\(userData.LabsOne1)")
                        Text("Labs One 2:\(userData.LabsOne2)")
                        Text("Labs One 3:\(userData.LabsOne3)")
                        Text("Labs One 4:\(userData.LabsOne4)")
                        Text("Labs One 5:\(userData.LabsOne5)")
                        Text("Labs One 6:\(userData.LabsOne6)")
                        Text("Labs One 7:\(userData.LabsOne7)")
                        Text("Labs Two 1:\(userData.LabsTwo1)")
                        Text("Labs Two 2:\(userData.LabsTwo2)")
                        Text("Labs Two 3:\(userData.LabsTwo3)")
                        Text("Labs Two 4:\(userData.LabsTwo4)")
                        Text("Labs Three 1:\(userData.LabsThree1)")
                        Text("Labs Three 2:\(userData.LabsThree2)")
                        Text("Labs Three 3:\(userData.LabsThree3)")
                        Text("Section 4")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        
                        Text("ASA Status:\(userData.ASA1 ? "Yes" : "No")")
                        Text(" \(userData.ASA1 ? "Yes" : "No")")
                        Text(" \(userData.ASA2 ? "Yes" : "No")")
                        Text(" \(userData.ASA3 ? "Yes" : "No")")
                        Text(" \(userData.ASA4 ? "Yes" : "No")")
                        Text(" \(userData.ASA5 ? "Yes" : "No")")
                        Text(" \(userData.ASAE ? "Yes" : "No")")
                        
                        
                        Text("Section 5")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        
                        
                        
                        
                        
                        Text("Pre Op Signature Date:\(userData.PreOpSigDate)")
                        .padding(.bottom)
                        .font(
                            Font.custom("Inter", size: 26)
                                .weight(.bold))
                        Text("Consent View")
                        Text("Section 1")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Method:\(userData.MethodText)")
                        Text("Section 2")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("No Exception to anesthetic recomendations:\(userData.isException ? "Yes" : "No")")
                        Text("Anethesia refused:\(userData.isRefused ? "Yes" : "No")")
                        Text("Type of Anethesia Refused:\(userData.AnesthesiaRefusedText)")
                        Text("Section 3")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Patient Consent Date:\(userData.ConsentDateText)")
                        Text("Patient Signature:\(userData.isPatientSignature ? "Yes" : "No")")
                        Text("Patients Gaurdian or POA Signature:\(userData.isPatientGuardianSignature ? "Yes" : "No")")
                        Text("Section 4")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        // Sig Image 1
                        // Sig Image 2
                        Text("isPresentingSignatureView1:\(userData.isPresentingSignatureView1 ? "Yes" : "No")")
                        Text("isPresentingSignatureView2:\(userData.isPresentingSignatureView2 ? "Yes" : "No")")
                        Text("isPresentingSignatureView3:\(userData.isPresentingSignatureView3 ? "Yes" : "No")")
                        // Path 1
                        // Path 2
                        // Path 3
                        .padding(.bottom)
                        Text("Procedure Start View")
                            .font(
                                Font.custom("Inter", size: 26)
                                    .weight(.bold))
                        Text("Section 1")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Procedure Start Time:\(userData.ProcedureStartTime)")
                        Text("Anesthesia Start Time:\(userData.AnesthesiaStartTime)")
                        Text("Section 2")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Blood Pressure 1:\(userData.BloodPressure1)")
                        Text("Blood Pressure 2:\(userData.BloodPressure2)")
                        Text("Heart Rate:\(userData.HeartRate)")
                        Text("Resperation:\(userData.Resperation)")
                        Text("SpO2:\(userData.SpO2)")
                        Text("Temperature:\(userData.Temperature)")
                        Text("Section 3")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Medication Administered:\(userData.MedicationAdministered)")
                        Text("Dosage:\(userData.Dosage)")
                        Text("Section 4")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Fluids Medication Administered:\(userData.FluidsMedicationAdministered)")
                        .padding(.bottom)
                        Text("Post Op View")
                            .font(
                                Font.custom("Inter", size: 26)
                                    .weight(.bold))
                        Text("Section 1")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Does the Patient Have a Fever:\(userData.isPatientFever ? "Yes" : "No")")
                        Text("Post Blood Pressure 1:\(userData.PostBloodPressure1)")
                        Text("Post Blood Pressure 2:\(userData.PostBloodPressure2)")
                        Text("Post Heart Rate:\(userData.PostHeartRate)")
                        Text("Post Resperation:\(userData.PostResperation)")
                        Text("Post SpO2:\(userData.PostSpO2)")
                        Text("Post Temperature:\(userData.PostTemperature)")
                        Text("Section 2")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("is Airway OK:\(userData.isAirwayOK ? "Yes" : "No")")
                        Text("is Pulse Ok:\(userData.isPulseOK ? "Yes" : "No")")
                        Text("is Arousable:\(userData.isArousable ? "Yes" : "No")")
                        Text("is Pain OK:\(userData.isPainOK ? "Yes" : "No")")
                        Text("is No Vomit:\(userData.isNoVomit ? "Yes" : "No")")
                        Text("is Hydrated:\(userData.isHydrated ? "Yes" : "No")")
                        Text("Section 3")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Post Op Anethesia Sign Date:\(userData.PostOpAnesthesiaSignDate)")
                        Text("Post Op Surgeon Sign Date:\(userData.PostOpSurgeonSignDate)")
                        Text("isPresentingSignatureView4:\(userData.isPresentingSignatureView4 ? "Yes" : "No")")
                        Text("isPresentingSignatureView5:\(userData.isPresentingSignatureView5 ? "Yes" : "No")")
                        // sig image 4
                        // sig image 5
                        // Path 4
                        // Path 5
                        if let signatureImage = userData.signatureImage {
                            Image(uiImage: signatureImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100) // Adjust the height as needed
                            } else {
                            Text("Signature 1 not captured")
                            }
                                    
                                    
                            if let signatureImage2 = userData.signatureImage2 {
                                Image(uiImage: signatureImage2)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100) // Adjust the height as needed
                                    } else {
                                        Text("Signature 2 not captured")
                                    }
                                    

                                    
                                }
                            }
                        }

                       
                    }
                  
                }
            
        
    


struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of UserEntryData for the preview
        let userData = UserEntryData()
        // Pass the instance to this view
        AnswerView(userData: userData)
    }
}
