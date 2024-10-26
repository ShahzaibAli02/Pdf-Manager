//
//  ARKApp.swift
//  ARK
//
//  Created by Ebenezer Tubbs on 1/16/24.
//

import SwiftUI
import FirebaseCore
import SwiftyDropbox

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      DropboxClientsManager.setupWithAppKey("hj25yr07oruj23f")

    return true
  }
}

@main
struct ARKApp: App {
    @StateObject var userData = UserEntryData()
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .login: LoginView(userData: userData)
                case .home: NavigationStack{ ProcedureChartList(userData: userData) }
                case .export: NavigationStack{ Export(userData: userData) }
                    
                }
            }
            .environmentObject(appRootManager)
        }
    }

}

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .login
    
    enum eAppRoots {
        case login
        case home
        case export
    }
}


               
           
