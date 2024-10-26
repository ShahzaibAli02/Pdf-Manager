//
//  Tester.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 2/2/24.
//

import Foundation

import SwiftUI




struct Tester: View {
    
    //Section 1 Data
    @State private var selectedOptions: [String] = []
    @State private var isPatientOnBetaBlockers = false
    @State private var isBetaBlockerGivenDayPrior = false
    @State private var isBetaBlockerGivenIntraOP = false
    @State private var isBetaBlockerContraindicated = false
    
    struct CustomCheckBox: View {
        @Binding var isChecked: Bool
        
        var body: some View {
            Button(action: {
                isChecked.toggle()
            }) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
    }
    
    struct DropdownMenu: View {
        var options: [String]
        @Binding var selectedOptions: [String]
        @State private var isMenuVisible = false
        
        var body: some View {
            VStack(alignment: .leading) {
                Button(action: {
                    withAnimation {
                        isMenuVisible.toggle()
                    }
                }) {
                    HStack {
                        Text("Selected options: \(selectedOptions.joined(separator: ", "))")
                        Image(systemName: "chevron.down")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                
                if isMenuVisible {
                    ForEach(options.indices, id: \.self) { index in
                        Toggle(isOn: Binding(
                            get: {
                                self.selectedOptions.contains(self.options[index])
                            },
                            set: { newValue in
                                if newValue {
                                    self.selectedOptions.append(self.options[index])
                                } else {
                                    self.selectedOptions.removeAll { $0 == self.options[index] }
                                }
                            }
                        )) {
                            Text(options[index])
                        }
                        .padding(.vertical, 8)
                    }
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
            }
            
        }
    }
    
    
    @State private var dateText: String = ""
    @State private var roomNumberText: String = ""
    let commonText = CommonText()
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 20) {
            
            VStack(alignment:.center){
                Text("Header")
                    .font(.headline)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray) // Set the rectangle color
                    .shadow(color: .black, radius: 2, x: 0, y: 2) // Add shadow below the rectangle
                    .edgesIgnoringSafeArea(.horizontal) // Make it extend to the edges of the screen
            }
           
            ScrollView{
                HStack(alignment: .top, spacing: 20) {
            
            VStack {
                CircleOne()
                    .padding([.bottom], 5) // Adjust padding as needed
                
           
                
                
                
                
            }
            
            // VStack for the "Cardio Vascular" and its related fields
                
                
                VStack{
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Cardio Vascular")
                            .font(.headline)
                        
                        // Dropdown Menu
                        HStack {
                            Text("Select options:")
                            DropdownMenu(options: ["Option 1", "Option 2", "Option 3"], selectedOptions: $selectedOptions)
                        }
                        
                        Text("Is the patient on beta blockers?")
                            .font(.subheadline)
                        
                        HStack {
                            Text("Yes")
                            CheckBox(isChecked: $isPatientOnBetaBlockers)
                            Text("No")
                            CheckBox(isChecked: .constant(!isPatientOnBetaBlockers))
                        }
                        
                        if isPatientOnBetaBlockers {
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenDayPrior)
                                Text("Beta Blocker given either day prior to day of procedure")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenIntraOP)
                                Text("Beta Blocker given intra-OP")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerContraindicated)
                                Text("Beta Blocker contraindicated")
                            }
                        }
                        
                        
                    }
                    .padding([.top,.bottom],50)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Cardio Vascular")
                            .font(.headline)
                        
                        // Dropdown Menu
                        HStack {
                            Text("Select options:")
                            DropdownMenu(options: ["Option 1", "Option 2", "Option 3"], selectedOptions: $selectedOptions)
                        }
                        
                        Text("Is the patient on beta blockers?")
                            .font(.subheadline)
                        
                        HStack {
                            Text("Yes")
                            CheckBox(isChecked: $isPatientOnBetaBlockers)
                            Text("No")
                            CheckBox(isChecked: .constant(!isPatientOnBetaBlockers))
                        }
                        
                        if isPatientOnBetaBlockers {
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenDayPrior)
                                Text("Beta Blocker given either day prior to day of procedure")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenIntraOP)
                                Text("Beta Blocker given intra-OP")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerContraindicated)
                                Text("Beta Blocker contraindicated")
                            }
                        }
                        
                        
                    }
                    .padding([.top,.bottom],50)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Cardio Vascular")
                            .font(.headline)
                        
                        // Dropdown Menu
                        HStack {
                            Text("Select options:")
                            DropdownMenu(options: ["Option 1", "Option 2", "Option 3"], selectedOptions: $selectedOptions)
                        }
                        
                        Text("Is the patient on beta blockers?")
                            .font(.subheadline)
                        
                        HStack {
                            Text("Yes")
                            CheckBox(isChecked: $isPatientOnBetaBlockers)
                            Text("No")
                            CheckBox(isChecked: .constant(!isPatientOnBetaBlockers))
                        }
                        
                        if isPatientOnBetaBlockers {
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenDayPrior)
                                Text("Beta Blocker given either day prior to day of procedure")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenIntraOP)
                                Text("Beta Blocker given intra-OP")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerContraindicated)
                                Text("Beta Blocker contraindicated")
                            }
                        }
                        
                        
                    }
                    .padding([.top,.bottom],50)
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Cardio Vascular")
                            .font(.headline)
                        
                        // Dropdown Menu
                        HStack {
                            Text("Select options:")
                            DropdownMenu(options: ["Option 1", "Option 2", "Option 3"], selectedOptions: $selectedOptions)
                        }
                        
                        Text("Is the patient on beta blockers?")
                            .font(.subheadline)
                        
                        HStack {
                            Text("Yes")
                            CheckBox(isChecked: $isPatientOnBetaBlockers)
                            Text("No")
                            CheckBox(isChecked: .constant(!isPatientOnBetaBlockers))
                        }
                        
                        if isPatientOnBetaBlockers {
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenDayPrior)
                                Text("Beta Blocker given either day prior to day of procedure")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenIntraOP)
                                Text("Beta Blocker given intra-OP")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerContraindicated)
                                Text("Beta Blocker contraindicated")
                            }
                        }
                        
                        
                    }
                    .padding([.top,.bottom],50)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Cardio Vascular")
                            .font(.headline)
                        
                        // Dropdown Menu
                        HStack {
                            Text("Select options:")
                            DropdownMenu(options: ["Option 1", "Option 2", "Option 3"], selectedOptions: $selectedOptions)
                        }
                        
                        Text("Is the patient on beta blockers?")
                            .font(.subheadline)
                        
                        HStack {
                            Text("Yes")
                            CheckBox(isChecked: $isPatientOnBetaBlockers)
                            Text("No")
                            CheckBox(isChecked: .constant(!isPatientOnBetaBlockers))
                        }
                        
                        if isPatientOnBetaBlockers {
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenDayPrior)
                                Text("Beta Blocker given either day prior to day of procedure")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerGivenIntraOP)
                                Text("Beta Blocker given intra-OP")
                            }
                            
                            HStack {
                                CheckBox(isChecked: $isBetaBlockerContraindicated)
                                Text("Beta Blocker contraindicated")
                            }
                        }
                        
                        
                    }
                    .padding(.top,50)
                    
                }
                }
                
            }
        }
        
    }
    
}

    


struct Tester_Previews: PreviewProvider {
    static var previews: some View {
        Tester()
    }
}
