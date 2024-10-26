//
//  UserEnteredData.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 2/25/24.
//

import Foundation
import SwiftUI
import PDFKit

class UserEntryData: ObservableObject {
    
//-----------------------------------------------------------------------
// ProcedureBasicsView
    
//Section 1
    
    
    
    var procedures: [Procedure] = []
    var symbols: [Symbol] = []
    var monitorsPdfDocument: PDFDocument? = nil
    var medicationPdfDocument: PDFDocument? = nil
    var fluidsPdfDocument: PDFDocument? = nil
//    var monitorsPdfDocument: PDFDocument? = nil
    
    @Published var AdditionalNotes = ""
    
    @Published var selectedDate = Date()
    
    var DateText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: selectedDate)}
    
    @Published var RoomNumberText: String =  ""
    @Published var FacilityText: String =  ""
    @Published var PhysicianText: String =  ""
    @Published var CRNAText: String = ""
    @Published var ProcedureText: String = ""
    @Published var General = false
    @Published var Regional = false
    @Published var MAC = false
    
//Section 2 Patient Info
    @Published var FirstNameText: String = ""
    @Published var LastNameText: String = ""
    @Published var NPO: String = ""
    @Published var WeightText: String = ""
    @Published var AllergiesText: String = ""
    @Published var PatientIDImage: UIImage?
    
    
//-----------------------------------------------------------------------
// MedHisA
    
//Section 1 Cardiovascular
    @Published var CardioVascularText: String = ""
    @Published var isCardioExpanded = false

    @Published var CardioWNL = false
    @Published var CardioHTN = false
    @Published var CardioAngina = false
    @Published var CardioPTCAStent = false
    @Published var CardioCAD = false
    @Published var CardioMI = false
    @Published var CardioCABG = false
    @Published var CardioHLD = false
    @Published var CardioPVD = false
    @Published var CardioAfib = false
    @Published var CardioCHF = false
    @Published var CardioEKGText: String = ""
    
    @Published var HeartExamRegular = false
    @Published var HeartExamIrregular = false
    @Published var HeartExamMurmur = false
    
    @Published var isPatientOnBetaBlockers = false
    @Published var isBetaBlockerGivenDayPrior = false
    @Published var LastBetaBlockerText: String = ""
    @Published var isBetaBlockerGivenIntraOP = false
    @Published var isBetaBlockerContraindicated = false
    
//Section 2 Pulminary
    @Published var PulminaryText: String = ""
    @Published var isPulmonaryExpanded = false
    
    @Published var PulmWNL = false
    @Published var PulmAsthma = false
    @Published var PulmPneumonia = false
    @Published var PulmCOPD = false
    @Published var PulmOSA = false
    @Published var PulmBronchitis = false
    
    @Published var isPatientASmoker = false
    @Published var SmokeFrequency: String = ""
    @Published var LungsCTA = false
    @Published var LungsOther: String = ""
    
//Section 3 Neurological
    @Published var NeurologicalText: String = ""
    @Published var isNeurologicalExpanded = false
    
    @Published var CNSWNL = false
    @Published var CNSDementia = false
    @Published var CNSSeizure = false
    @Published var CNSETOH = false
    @Published var CNSCVA = false
    @Published var CNSMigraines = false
    @Published var CNSDrugAbuse = false
    @Published var CNSAnxietyDepression = false
    @Published var CNSOther = false
    @Published var CNSOtherText: String = ""
    
//Section 4 Gastrointestinal
    @Published var GastrointestinalText: String = ""
    @Published var GIOtherText: String = ""
    @Published var isGastrointestinalExpanded = false
    
    @Published var GIWNL = false
    @Published var GIHernia = false
    @Published var GIGERD = false
    @Published var GIDiverticulosis = false
    @Published var GIHepatitis = false
    @Published var GIOther = false
    
//Section 5 Renal
    @Published var RenalText: String = ""
    @Published var RenalOtherText: String = ""
    @Published var isRenalExpanded = false
    
    @Published var RenalWNL = false
    @Published var RenalCKD = false
    @Published var RenalBPH = false
    @Published var RenalESRD = false
    @Published var RenalOther = false
    
//Section 6 Endocrine
    @Published var EndocrineText: String = ""
    @Published var EndoOtherText: String = ""
    @Published var isEndocrineExpanded = false
    
    @Published var EndoWNL = false
    @Published var EndoDiabetes = false
    @Published var EndoObesity = false
    @Published var EndoThyroid = false
    @Published var EndoOther = false
    
//-----------------------------------------------------------------------
// MedHisB
    
//Section 1 Data
    @Published var AirwayText: String = ""
    
    @Published var Airway1 = false
    @Published var Airway2 = false
    @Published var Airway3 = false
    @Published var Airway4 = false
    
// Section 2 Data
    @Published var isCameraPresented = false
    @Published var DentitionImage: UIImage?
    
    @Published var DentitionIntact = false
    @Published var DentitionLoose = false
    @Published var DentitionBridge = false
    @Published var DentitionCap = false
    
// Section 3 Data
    @Published var LabsOne1: String = ""
    @Published var LabsOne2: String = ""
    @Published var LabsOne3: String = ""
    @Published var LabsOne4: String = ""
    @Published var LabsOne5: String = ""
    @Published var LabsOne6: String = ""
    @Published var LabsOne7: String = ""
    
    @Published var LabsTwo1: String = ""
    @Published var LabsTwo2: String = ""
    @Published var LabsTwo3: String = ""
    @Published var LabsTwo4: String = ""
    
    @Published var LabsThree1: String = ""
    @Published var LabsThree2: String = ""
    @Published var LabsThree3: String = ""
 
// Section 4 Data
    @Published var ASAStatus: String = ""
    @Published var ASA1 = false
    @Published var ASA2 = false
    @Published var ASA3 = false
    @Published var ASA4 = false
    @Published var ASA5 = false
    @Published var ASAE = false
    
    // Section  Data
    @Published var PreOpSigDate: String = ""
    
    

//-----------------------------------------------------------------------
// Consent View
    
// Section 2 Data
    @Published var MethodText: String = ""
    @Published var MethodGenA = false
    @Published var MethodSpinal = false
    
    @Published var MethodNerveBlockAxillary = false
    @Published var MethodNerveBlock = false
    @Published var MethodNerveBlockInterscalene = false
    @Published var MethodNerveBlockFemoral = false
    @Published var MethodNerveBlockIVRegional = false
    @Published var MethodNerveBlockOtherText = ""
    
    @Published var MethodMonitoredA = false

 
// Section 3 Data
    @Published var  isException = false
    @Published var  isRefused = false
    @Published var  AnesthesiaRefusedText: String = ""
    
// Section 4 Data
    @Published var ConsentDateText = Date()
    @Published var isPatientSignature = false
    @Published var isPatientGuardianSignature = false
    
    @Published var signatureImage: UIImage?
    @Published var signatureImage2: UIImage?
    @Published var signatureImage3: UIImage?
    
    @Published var isPresentingSignatureView1 = false
    @Published var isPresentingSignatureView2 = false
    @Published var isPresentingSignatureView3 = false
    
    @Published var path1 = Path()
    @Published var path2 = Path()
    @Published var path3 = Path()

    @Published var CRNAConsentDateText = Date()
 
//-----------------------------------------------------------------------
// Procedure Start View
    
//Section 1 Airway
    @Published var AirwayNasalC = false
    @Published var AirwayPreO2 = false
    @Published var AirwayMask = false
    @Published var AirwayOral = false
    @Published var AirwayNasalA = false
    @Published var AirwayTrach = false
    @Published var AirwayLMA = false
    @Published var AirwayIntubation = false
    @Published var AirwayOralNasal = false
    @Published var AirwayCuff = false
    @Published var AirwayRapid = false
    @Published var AirwayMacMil = false
    @Published var AirwayEtt = false
    @Published var AirwayBillBreathSounds = false
    
    @Published var AirwayMaskEasy = false
    @Published var AirwayMaskHard = false
    @Published var AirwayIntubationEasy = false
    @Published var AirwayIntubationHard = false
    @Published var AirwayLMANumber = ""
    @Published var AirwayMac = ""
    @Published var AirwayMil = ""
    @Published var AirwayETTSize = ""
    @Published var AirwayETTAttempt1 = false
    @Published var AirwayETTAttempt2 = false
    @Published var AirwayETTAttempt3 = false
    @Published var AirwayETTView1 = false
    @Published var AirwayETTView2 = false
    @Published var AirwayETTView3 = false
    @Published var AirwayETTView4 = false
    @Published var AirwayETTTapped = ""
    @Published var AirwayETTCo2 = ""
    
    @Published var isAirwayExpanded = false
    
// Section 2 Data
    @Published var ProcedureStartTime = Date()
    @Published var AnesthesiaStartTime = Date()
    
    
// Section 3 Data
    @Published var BloodPressure1: String = ""
    @Published var BloodPressure2: String = ""
    @Published var HeartRate: String = ""
    @Published var Resperation: String = ""
    @Published var SpO2: String = ""
    @Published var Temperature: String = ""
    
// Section 4 Data
    @Published var MedicationAdministered: String = ""
    @Published var Dosage: String = ""
    
// Section 5 Data
    @Published var FluidsMedicationAdministered: String = ""
    
//-----------------------------------------------------------------------
// PostOp View
    
//Section 1 Data
    @Published var isPatientFever = false
    @Published var NoComplications = false
    @Published var isStable = false
    @Published var ReportGiven = false

    @Published var PostBloodPressure1: String = ""
    @Published var PostBloodPressure2: String = ""
    @Published var PostHeartRate: String = ""
    @Published var PostResperation: String = ""
    @Published var PostSpO2: String = ""
    @Published var PostTemperature: String = ""
    
  
// Section 2 Data
    @Published var isAirwayOK = false
    @Published var isPulseOK = false
    @Published var isArousable = false
    @Published var isPainOK = false
    @Published var isNoVomit = false
    @Published var isHydrated = false

// Section 3 Data
    @Published var PostOpAnesthesiaSignDate = Date()
    @Published var PostOpSurgeonSignDate = Date()
    
    @Published var isPresentingSignatureView4 = false
    @Published var isPresentingSignatureView5 = false
    
    @Published var signatureImage4: UIImage?
    @Published var signatureImage5: UIImage?
    
    @Published var path4 = Path()
    @Published var path5 = Path()

    
// Section 4 Data
    @Published var PostOpFluidsMedicationAdministered: String = ""

//-----------------------------------------------------------------------
// Procedure Chart View
    
// Vitals
    @Published var ChartVitals: [String] = ["", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "",]
    
    
    @Published var ChartVitalsImage: UIImage?
    
    
    
    
//Medications
    @Published var ChartMedication: [String] = ["", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "",]
    
//Fluids
    @Published var ChartFluids: [String] = ["", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "","", "", "", "", "", "",]
    

    
    
    
    
}


let PulmonaryConditions = ["None","WNL", "Asthma", "Pneumonia", "COPD", "OSA", "Bronchitis"]

struct CustomDropDown: View {
    @Binding var selectedCondition: String
  
    
    let conditions: [String]
    let placeholder: String = "Select Here"
    
    var body: some View {
        Menu {
            ForEach(conditions, id: \.self) { condition in
                Button(action: {
                    selectedCondition = condition
                }) {
                    Text(condition)
                        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47)) // Color for options
                }
            }
        } label: {
            HStack {
                Text(selectedCondition.isEmpty ? placeholder : selectedCondition)
                    .foregroundColor(selectedCondition.isEmpty ? Color.gray : Color(red: 0.48, green: 0.47, blue: 0.47)) // Color for placeholder and selected option
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
            }
            .padding()
            .frame(width: 250, height: 42.65168)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(16)
        }
    }
}




