//
//  ProcedureChartList.swift
//  ARK
//
//  Created by Shahzaib Ali on 25/10/2024.
//

import SwiftUI

struct ProcedureChartList: View {
    @ObservedObject var userData: UserEntryData
    @State private var items: [Procedure] = [Procedure()]
    @State private var currentPageIndex: Int = 0

    var body: some View {
        VStack {
            Group{
                // Title
                Text("Procedure Charting")
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
                            
                
            // Progress Bar Indicators
            if items.count > 1{
               
                HStack(spacing: 4) {
                    ForEach(items.indices, id: \.self) { index in
                        Rectangle()
                            .fill(index == currentPageIndex ? Color.blue : Color.gray)
                            .frame(height: 5)
                            .animation(.easeInOut, value: currentPageIndex)
                            .onTapGesture {
                                currentPageIndex = index
                            }// Animate the changes
                    }
                }
                .padding(EdgeInsets(top: 20, leading: 60, bottom: 10, trailing: 60))
          
            }
          
            // TabView for pages
            TabView(selection: $currentPageIndex) {
                ForEach(items.indices, id: \.self) { index in
                    ProcedureChart(procedure: items[index]).id(items[index].mID)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always ))
            .animation(.easeInOut, value: currentPageIndex)
            
            // Navigation Buttons
            HStack {
                
                NavigationLink(destination: Export(userData: userData)) {
                Text("End Procedure")
                    .foregroundColor(.white)
                
                    .frame(width: 283, height: 49)
                    .background(Color(red: 0.54, green: 0.68, blue: 0.97))
                    .cornerRadius(30)
                
                
                }.simultaneousGesture(
                    TapGesture().onEnded {
                        // Perform your action here
                        print("End Procedure TAPPED")
                        userData.procedures = items
    
                    }
                )
                Button(action: addPage) {
                    Text("New Page")
                        .foregroundColor(.white)
                        .frame(width: 123, height: 49)
                        .background(Color(red: 0.48, green: 0.47, blue: 0.47))
                        .cornerRadius(30)
                }
//                Button(action: {
//                    print("COUNT \(items.count)")
//                    items.forEach { Procedure in
//                        print("===")
//                        print("SYMBOL  \(Procedure.symbols)")
//                        print("===")
//                    }
//                    
//                }) {
//                    Text("check list")
//                        .foregroundColor(.white)
//                        .frame(width: 123, height: 49)
//                        .background(Color(red: 0.48, green: 0.47, blue: 0.47))
//                        .cornerRadius(30)
//                }

                if(currentPageIndex>0)
                {
                    Button(action: removePage) {
                        
                        Text("Remove Page")
                            .foregroundColor(.white)
                            .frame(width: 123, height: 49)
                            .background(Color.red)
                            .cornerRadius(30)

                    }
                }
              
            }
            .padding()
        }
    }

    private func addPage() {
//        let newPageNumber = items.count + 1
        items.append(Procedure())
        currentPageIndex = items.count - 1
    }

    private func removePage() {
        guard !items.isEmpty else { return }
        items.remove(at: currentPageIndex )
        // Ensure the currentPageIndex is within the bounds
//        if currentPageIndex >= items.count {
//            currentPageIndex = items.count - 1
//        }
    }
}

//struct ProcedureChartList_Previews: PreviewProvider {
//    static var previews: some View {
//        ProcedureChartList()
//    }
//}
