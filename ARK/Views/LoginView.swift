//
//  LoginView.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 1/20/24.
//

import Foundation

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore


struct LoginView: View {
    
    @ObservedObject var userData: UserEntryData
    @State private var username: String = "test@test.com"
    @State private var password: String = "123456"
    
    @StateObject private var coordinator = Coordinator()
//    @State private var path = NavigationPath()

    @State private var showAlert = false
    @State private var errorText = ""

    @EnvironmentObject private var appRootManager: AppRootManager

    
    var body: some View {
        NavigationStack(path: $coordinator.navPath){
            VStack(spacing: 20) {
         
// Header Logo
                Text("ark")
                    .font(Font.custom("Archivo Black", size: 96))
                    .foregroundColor(.black)
                    .frame(width: 187, height: 109, alignment: .leading)
                
// Header Login
                Text("login")
                    .font(Font.custom("Archivo Black", size: 32))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                    .frame(width: 123, height: 66, alignment: .center)
                
// Header Username
                TextField("username", text: $username)
                    .font(Font.custom("Average Sans", size: 20))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                
                    .frame(width: 113, height: 52, alignment: .center)
                    .foregroundColor(.clear)
                    .frame(width: 340, height: 52) // Set the frame to match Figma's dimensions
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85)) // Set the background color
                    .cornerRadius(10) // Set the corner radius
                    .padding()
                    .autocapitalization(.none)
                
// Header Password
                SecureField("password", text: $password)
                    .font(Font.custom("Average Sans", size: 20))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                
                    .frame(width: 113, height: 52, alignment: .center)
                    .foregroundColor(.clear)
                    .frame(width: 340, height: 52) // Set the frame to match Figma's dimensions
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85)) // Set the background color
                    .cornerRadius(10) // Set the corner radius
                    .padding()
                    .autocapitalization(.none)
                
                
                
// Login Button
//                NavigationLink(destination: ProcedureBasicsView(userData: userData)) {
//                    Text("Login")
//                        .foregroundColor(.white)
//                        .frame(width: 340, height: 52)
//                        .background(Color(red: 0.47, green: 0.64, blue: 0.85))
//                        .cornerRadius(10)
//                }
//                .padding()
                
             
                
                Button(action: {
                    print("LOGIN TAPPED")
                    Auth.auth().signIn(withEmail: username, password: password) { authResult, error in
                        if (error == nil){
                            print(Auth.auth().currentUser?.email as Any)
                            
                            if let currUser = Auth.auth().currentUser {
                                let db = Firestore.firestore()
                                db.collection("approvedUsers").getDocuments { querySnapshot, error in
                                    var approved: [String] = []
 
                                    if let snap = querySnapshot {
                                        for document in snap.documents {
                                            print("\(document.documentID)") // Get documentID
                                            approved.append(document.documentID)
                                        }
                                    }
                                    
                                    if (approved.contains(currUser.uid)) {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0 ) {
//                                            coordinator.navPath.append(LoginViewPath.main)
                                            
                                                withAnimation(.spring()) {
                                                appRootManager.currentRoot = .home
                                                }
                                        }
                                    } else {
                                        errorText = "Please wait for approve your account."
                                        showAlert = true
                                    }
                                }
                            }
                            
                          
                        } else {
                            print("error: ", error?.localizedDescription as Any)
                            errorText = error!.localizedDescription
                            showAlert = true
                        }
                    }
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                }
                .alert(errorText, isPresented: $showAlert) {
                            Button("OK") { }
                        }
                .frame(width: 340, height: 52)
                .background(Color(red: 0.47, green: 0.64, blue: 0.85))
                .cornerRadius(10)
                .padding()
                
                // - REGISTRATION Button
                Button(action: {
                    print("REGISTER TAPPED")
                    
                    Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
                        if (error == nil){
                            print(Auth.auth().currentUser?.email as Any)
//                            coordinator.navPath.append(LoginViewPath.main)
                            
                            errorText = "Registration completed. Please wait for approve your account."
                            showAlert = true
                            
                        } else {
                            print("error: ", error?.localizedDescription as Any)
                            errorText = error!.localizedDescription
                            showAlert = true
                        }
                    }
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                }
                .alert(errorText, isPresented: $showAlert) {
                            Button("OK") { }
                        }
                .frame(width: 340, height: 52)
                .background(Color(red: 0.47, green: 0.64, blue: 0.85))
                .cornerRadius(10)
                .padding()
            }
            
            
            
            .padding(0.0)
        }.navigationDestination(for: LoginViewPath.self) { path in

            switch path {
            case .login:
                LoginView(userData: userData)
            case .main:
               ProcedureBasicsView(userData: userData)
            }
        }
    }
}
    
class Coordinator: ObservableObject {
    @Published var navPath = NavigationPath()
}
enum LoginViewPath: Hashable {
    case login
    case main
}

/*
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }

*/

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of UserEntryData for the preview
        let userData = UserEntryData()
        // Pass the instance to Tester2
        LoginView(userData: userData)
    }
}
