//
//  DropDownMenus.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 3/21/24.
//

import SwiftUI

//---------------------------------------------------------------------------------------------
//MedHisA
struct CardioDropdownMenu: View {
    
    @ObservedObject var userData: UserEntryData
    
    
    var body: some View {
        
        ScrollView{
            
          
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Button(action: {
                        userData.CardioWNL.toggle()
                    }) {
                        Image(systemName: userData.CardioWNL ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioWNL ? .black : .gray) // Change the color here
                        Text("WNL")
                            .foregroundColor(userData.CardioWNL ? .black : .gray)
                    }
                    .padding(.top)
                    
                    
                    Button(action: {
                        userData.CardioHTN.toggle()
                    }) {
                        Image(systemName: userData.CardioHTN ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioHTN ? .black : .gray) // Change the color here
                        Text("HTN")                      .foregroundColor(userData.CardioHTN ? .black : .gray)
                    }
                    
                    Button(action: {
                        userData.CardioAngina.toggle()
                        
                    }) {
                        Image(systemName: userData.CardioAngina ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioAngina ? .black : .gray) // Change the color here
                        Text("Angina")
                            .foregroundColor(userData.CardioAngina ? .black : .gray)
                    }
                    
                    Button(action: {
                        userData.CardioPTCAStent.toggle()
                    }) {
                        Image(systemName: userData.CardioPTCAStent ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioPTCAStent ? .black : .gray) // Change the color here
                        Text("PTCA/Stent")
                            .foregroundColor(userData.CardioPTCAStent ? .black : .gray)
                    }
                    
                    Button(action: {
                        userData.CardioCAD.toggle()
                    }) {
                        Image(systemName: userData.CardioCAD ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioCAD ? .black : .gray) // Change the color here
                        Text("CAD")
                            .foregroundColor(userData.CardioCAD ? .black : .gray)
                    }
                    
                    Button(action: {
                        userData.CardioMI.toggle()
                    }) {
                        Image(systemName: userData.CardioMI ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioMI ? .black : .gray) // Change the color here
                        Text("MI")
                            .foregroundColor(userData.CardioMI ? .black : .gray)
                    }
                    
                
                
          
                    Button(action: {
                        userData.CardioCABG.toggle()
                        
                    }) {
                        Image(systemName: userData.CardioCABG ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioCABG ? .black : .gray) // Change the color here
                        Text("CABG.")
                            .foregroundColor(userData.CardioCABG ? .black : .gray)
                    }
                    
                    Button(action: {
                        userData.CardioHLD.toggle()
                        
                    }) {
                        Image(systemName: userData.CardioHLD ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioHLD ? .black : .gray) // Change the color here
                        Text("HLD")
                            .foregroundColor(userData.CardioHLD ? .black : .gray)
                    }
                    
                    Button(action: {
                        userData.CardioPVD.toggle()
                    }) {
                        Image(systemName: userData.CardioPVD ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioPVD ? .black : .gray) // Change the color here
                        Text("PVD")
                            .foregroundColor(userData.CardioPVD ? .black : .gray)
                    }
                    
                    Button(action: {
                        userData.CardioAfib.toggle()
                    }) {
                        Image(systemName: userData.CardioAfib ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioAfib ? .black : .gray) // Change the color here
                        Text("Afib")
                            .foregroundColor(userData.CardioAfib ? .black : .gray)
                    }
                    
                    
                    Button(action: {
                        userData.CardioCHF.toggle()
                    }) {
                        Image(systemName: userData.CardioCHF ? "checkmark.square" : "square")
                            .foregroundColor(userData.CardioCHF ? .black : .gray) // Change the color here
                        Text("CHF")
                            .foregroundColor(userData.CardioCHF ? .black : .gray)
                    }
                    .padding(.bottom)
                    
                    Button(action: {
                        userData.isCardioExpanded = false
                    }) {
                        Text("Done")
                            .multilineTextAlignment(.leading)
                            .frame(width: 200, height: 42.65168)
                            .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                            .cornerRadius(16)
                            .padding(.bottom)
                            .padding(.leading,0)
                    }
                    
                } //End of 2nd Vstack
                
            
            
         
        } // End of Dropdown Scrollview
        } //End of Main Dropdown view
        } // End of Dropdown Struct View
     
struct PulmonaryDropdownMenu: View {
    
    @ObservedObject var userData: UserEntryData
    
    
    var body: some View {
        
        ScrollView{

                
       VStack(alignment: .leading, spacing: 20) {
                  
                  Button(action: {
                      userData.PulmWNL.toggle()
                  }) {
                      Image(systemName: userData.PulmWNL ? "checkmark.square" : "square")
                          .foregroundColor(userData.PulmWNL ? .black : .gray) // Change the color here
                      Text("WNL")
                          .foregroundColor(userData.PulmWNL ? .black : .gray)
                  }
                  .padding(.top)
                  
                  
                  Button(action: {
                      userData.PulmAsthma.toggle()
                  }) {
                      Image(systemName: userData.PulmAsthma ? "checkmark.square" : "square")
                          .foregroundColor(userData.PulmAsthma ? .black : .gray) // Change the color here
                      Text("Asthma")                      .foregroundColor(userData.PulmAsthma ? .black : .gray)
                  }
                  
                  Button(action: {
                      userData.PulmPneumonia.toggle()
                      
                  }) {
                      Image(systemName: userData.PulmPneumonia ? "checkmark.square" : "square")
                          .foregroundColor(userData.PulmPneumonia ? .black : .gray) // Change the color here
                      Text("Pneumonia")
                          .foregroundColor(userData.PulmPneumonia ? .black : .gray)
                  }
                  
                  Button(action: {
                      userData.PulmCOPD.toggle()
                  }) {
                      Image(systemName: userData.PulmCOPD ? "checkmark.square" : "square")
                          .foregroundColor(userData.PulmCOPD ? .black : .gray) // Change the color here
                      Text("COPD")
                          .foregroundColor(userData.PulmCOPD ? .black : .gray)
                  }
                  
                  Button(action: {
                      userData.PulmOSA.toggle()
                  }) {
                      Image(systemName: userData.PulmOSA ? "checkmark.square" : "square")
                          .foregroundColor(userData.PulmOSA ? .black : .gray) // Change the color here
                      Text("OSA")
                          .foregroundColor(userData.PulmOSA ? .black : .gray)
                  }
                  
                  Button(action: {
                      userData.PulmBronchitis.toggle()
                  }) {
                      Image(systemName: userData.PulmBronchitis ? "checkmark.square" : "square")
                          .foregroundColor(userData.PulmBronchitis ? .black : .gray) // Change the color here
                      Text("Bronchitis")
                          .foregroundColor(userData.PulmBronchitis ? .black : .gray)
                  }
                  
           Button(action: {
               userData.isPulmonaryExpanded = false
           }) {
               Text("Done")
                   .multilineTextAlignment(.leading)
                   .frame(width: 200, height: 42.65168)
                   .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                   .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                   .cornerRadius(16)
                   .padding(.bottom)
                   .padding(.leading,0)
           }
           
              
      
                  
              } //End of 2nd Vstack



                
            
            
         
        } // End of Dropdown Scrollview
        } //End of Main Dropdown view
        } // End of Dropdown Struct View

struct NeurologicalDropdownMenu: View {
    
    @ObservedObject var userData: UserEntryData
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Button(action: {
                    userData.CNSWNL.toggle()
                }) {
                    Image(systemName: userData.CNSWNL ? "checkmark.square" : "square")
                        .foregroundColor(userData.CNSWNL ? .black : .gray)
                    Text("WNL")
                        .foregroundColor(userData.CNSWNL ? .black : .gray)
                }
                .padding(.top)
                
                Button(action: {
                    userData.CNSDementia.toggle()
                }) {
                    Image(systemName: userData.CNSDementia ? "checkmark.square" : "square")
                        .foregroundColor(userData.CNSDementia ? .black : .gray)
                    Text("Dementia")
                        .foregroundColor(userData.CNSDementia ? .black : .gray)
                }
                
                Button(action: {
                    userData.CNSSeizure.toggle()
                }) {
                    Image(systemName: userData.CNSSeizure ? "checkmark.square" : "square")
                        .foregroundColor(userData.CNSSeizure ? .black : .gray)
                    Text("Seizure")
                        .foregroundColor(userData.CNSSeizure ? .black : .gray)
                }
                
                Button(action: {
                    userData.CNSETOH.toggle()
                }) {
                    Image(systemName: userData.CNSETOH ? "checkmark.square" : "square")
                        .foregroundColor(userData.CNSETOH ? .black : .gray)
                    Text("ETOH")
                        .foregroundColor(userData.CNSETOH ? .black : .gray)
                }
                
                Button(action: {
                    userData.CNSCVA.toggle()
                }) {
                    Image(systemName: userData.CNSCVA ? "checkmark.square" : "square")
                        .foregroundColor(userData.CNSCVA ? .black : .gray)
                    Text("CVA")
                        .foregroundColor(userData.CNSCVA ? .black : .gray)
                }
                
                Button(action: {
                    userData.CNSMigraines.toggle()
                }) {
                    Image(systemName: userData.CNSMigraines ? "checkmark.square" : "square")
                        .foregroundColor(userData.CNSMigraines ? .black : .gray)
                    Text("Migraines")
                        .foregroundColor(userData.CNSMigraines ? .black : .gray)
                }
                
                Button(action: {
                    userData.CNSDrugAbuse.toggle()
                }) {
                    Image(systemName: userData.CNSDrugAbuse ? "checkmark.square" : "square")
                        .foregroundColor(userData.CNSDrugAbuse ? .black : .gray)
                    Text("Drug Abuse")
                        .foregroundColor(userData.CNSDrugAbuse ? .black : .gray)
                }
                
                Button(action: {
                    userData.CNSAnxietyDepression.toggle()
                }) {
                    Image(systemName: userData.CNSAnxietyDepression ? "checkmark.square" : "square")
                        .foregroundColor(userData.CNSAnxietyDepression ? .black : .gray)
                    Text("Anxiety/Depression")
                        .foregroundColor(userData.CNSAnxietyDepression ? .black : .gray)
                }
                
                Button(action: {
                    userData.CNSOther.toggle()
                }) {
                    Image(systemName: userData.CNSOther ? "checkmark.square" : "square")
                        .foregroundColor(userData.CNSOther ? .black : .gray)
                    Text("Other")
                        .foregroundColor(userData.CNSOther ? .black : .gray)
                }
                
                
                Button(action: {
                    userData.isNeurologicalExpanded = false
                }) {
                    Text("Done")
                        .multilineTextAlignment(.leading)
                        .frame(width: 200, height: 42.65168)
                        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                        .padding(.bottom)
                        .padding(.leading,0)
                }
                
            } // End of VStack
            
        } // End of ScrollView
    } // End of body
} // End of struct

struct GastrointestinalDropdownMenu: View {
    
    @ObservedObject var userData: UserEntryData
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Button(action: {
                    userData.GIWNL.toggle()
                }) {
                    Image(systemName: userData.GIWNL ? "checkmark.square" : "square")
                        .foregroundColor(userData.GIWNL ? .black : .gray)
                    Text("WNL")
                        .foregroundColor(userData.GIWNL ? .black : .gray)
                }
                .padding(.top)
                
                Button(action: {
                    userData.GIHernia.toggle()
                }) {
                    Image(systemName: userData.GIHernia ? "checkmark.square" : "square")
                        .foregroundColor(userData.GIHernia ? .black : .gray)
                    Text("Hernia")
                        .foregroundColor(userData.GIHernia ? .black : .gray)
                }
                
                Button(action: {
                    userData.GIGERD.toggle()
                }) {
                    Image(systemName: userData.GIGERD ? "checkmark.square" : "square")
                        .foregroundColor(userData.GIGERD ? .black : .gray)
                    Text("GERD")
                        .foregroundColor(userData.GIGERD ? .black : .gray)
                }
                
                Button(action: {
                    userData.GIDiverticulosis.toggle()
                }) {
                    Image(systemName: userData.GIDiverticulosis ? "checkmark.square" : "square")
                        .foregroundColor(userData.GIDiverticulosis ? .black : .gray)
                    Text("Diverticulosis")
                        .foregroundColor(userData.GIDiverticulosis ? .black : .gray)
                }
                
                Button(action: {
                    userData.GIHepatitis.toggle()
                }) {
                    Image(systemName: userData.GIHepatitis ? "checkmark.square" : "square")
                        .foregroundColor(userData.GIHepatitis ? .black : .gray)
                    Text("Hepatitis")
                        .foregroundColor(userData.GIHepatitis ? .black : .gray)
                }
                
                Button(action: {
                    userData.GIOther.toggle()
                }) {
                    Image(systemName: userData.GIOther ? "checkmark.square" : "square")
                        .foregroundColor(userData.GIOther ? .black : .gray)
                    Text("Other")
                        .foregroundColor(userData.GIOther ? .black : .gray)
                }
                
             
                
                Button(action: {
                    userData.isGastrointestinalExpanded = false
                }) {
                    Text("Done")
                        .multilineTextAlignment(.leading)
                        .frame(width: 200, height: 42.65168)
                        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                        .padding(.bottom)
                        .padding(.leading,0)
                }
                
            } // End of VStack
            
        } // End of ScrollView
    } // End of body
} // End of struct

struct EndocrineDropdownMenu: View {
    
    @ObservedObject var userData: UserEntryData
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Button(action: {
                    userData.EndoWNL.toggle()
                }) {
                    Image(systemName: userData.EndoWNL ? "checkmark.square" : "square")
                        .foregroundColor(userData.EndoWNL ? .black : .gray)
                    Text("WNL")
                        .foregroundColor(userData.EndoWNL ? .black : .gray)
                }
                .padding(.top)
                
                Button(action: {
                    userData.EndoDiabetes.toggle()
                }) {
                    Image(systemName: userData.EndoDiabetes ? "checkmark.square" : "square")
                        .foregroundColor(userData.EndoDiabetes ? .black : .gray)
                    Text("Diabetes")
                        .foregroundColor(userData.EndoDiabetes ? .black : .gray)
                }
                
                Button(action: {
                    userData.EndoObesity.toggle()
                }) {
                    Image(systemName: userData.EndoObesity ? "checkmark.square" : "square")
                        .foregroundColor(userData.EndoObesity ? .black : .gray)
                    Text("Obesity")
                        .foregroundColor(userData.EndoObesity ? .black : .gray)
                }
                
                Button(action: {
                    userData.EndoThyroid.toggle()
                }) {
                    Image(systemName: userData.EndoThyroid ? "checkmark.square" : "square")
                        .foregroundColor(userData.EndoThyroid ? .black : .gray)
                    Text("Thyroid")
                        .foregroundColor(userData.EndoThyroid ? .black : .gray)
                }
                
                Button(action: {
                    userData.EndoOther.toggle()
                }) {
                    Image(systemName: userData.EndoOther ? "checkmark.square" : "square")
                        .foregroundColor(userData.EndoOther ? .black : .gray)
                    Text("Other")
                        .foregroundColor(userData.EndoOther ? .black : .gray)
                }
                
                if userData.EndoOther {
                    TextField("Other (please specify)", text: $userData.EndoOtherText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    userData.isEndocrineExpanded = false
                }) {
                    Text("Done")
                        .multilineTextAlignment(.leading)
                        .frame(width: 200, height: 42.65168)
                        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                        .padding(.bottom)
                        .padding(.leading,0)
                }
                
            } // End of VStack
            
        } // End of ScrollView
    } // End of body
} // End of struct

//--------------------------------------------------------------------------------------------
//MedHisB

struct RenalDropdownMenu: View {
    
    @ObservedObject var userData: UserEntryData
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Button(action: {
                    userData.RenalWNL.toggle()
                }) {
                    Image(systemName: userData.RenalWNL ? "checkmark.square" : "square")
                        .foregroundColor(userData.RenalWNL ? .black : .gray)
                    Text("WNL")
                        .foregroundColor(userData.RenalWNL ? .black : .gray)
                }
                .padding(.top)
                
                Button(action: {
                    userData.RenalCKD.toggle()
                }) {
                    Image(systemName: userData.RenalCKD ? "checkmark.square" : "square")
                        .foregroundColor(userData.RenalCKD ? .black : .gray)
                    Text("CKD")
                        .foregroundColor(userData.RenalCKD ? .black : .gray)
                }
                
                Button(action: {
                    userData.RenalBPH.toggle()
                }) {
                    Image(systemName: userData.RenalBPH ? "checkmark.square" : "square")
                        .foregroundColor(userData.RenalBPH ? .black : .gray)
                    Text("BPH")
                        .foregroundColor(userData.RenalBPH ? .black : .gray)
                }
                
                Button(action: {
                    userData.RenalESRD.toggle()
                }) {
                    Image(systemName: userData.RenalESRD ? "checkmark.square" : "square")
                        .foregroundColor(userData.RenalESRD ? .black : .gray)
                    Text("ESRD")
                        .foregroundColor(userData.RenalESRD ? .black : .gray)
                }
                
                Button(action: {
                    userData.RenalOther.toggle()
                }) {
                    Image(systemName: userData.RenalOther ? "checkmark.square" : "square")
                        .foregroundColor(userData.RenalOther ? .black : .gray)
                    Text("Other")
                        .foregroundColor(userData.RenalOther ? .black : .gray)
                }
                
                Button(action: {
                    userData.isRenalExpanded = false
                }) {
                    Text("Done")
                        .multilineTextAlignment(.leading)
                        .frame(width: 200, height: 42.65168)
                        .foregroundColor(Color(red: 0.48, green: 0.47, blue: 0.47))
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(16)
                        .padding(.bottom)
                        .padding(.leading,0)
                }
                
            } // End of VStack
            
        } // End of ScrollView
    } // End of body
} // End of struct

//--------------------------------------------------------------------------------------------
