//
//  Review1.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 3/3/24.
//

import SwiftUI

struct Review1: View {
    @ObservedObject var userData: UserEntryData
        var body: some View {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                      
                        Text("Review 1")
                            .font(
                                Font.custom("Inter", size: 26)
                                    .weight(.bold))
                        Text("Section 1")
                            .font(
                                Font.custom("Inter", size: 22)
                                    .weight(.bold))
                        Text("Your answers array:")

                        ForEach(userData.ChartVitals.indices.filter { !userData.ChartVitals[$0].isEmpty }, id: \.self) { index in
                            Text("Answer \(index + 1): \(userData.ChartVitals[index])")
                        }

                       
                                    

                                    
                                }
                            }
                        }

                       
                    }
                  
                }
            
        
    


struct Review1_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of UserEntryData for the preview
        let userData = UserEntryData()
        // Pass the instance to this view
        Review1(userData: userData)
    }
}
