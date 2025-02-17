//
//  AppDelegate.swift
//  Budget

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourAppName")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        let sceneConfiguration = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        
        // Configure the scene based on the user activity in the connection options.
        guard let userActivity = options.userActivities.first ?? connectingSceneSession.stateRestorationActivity else {
            return sceneConfiguration
        }
        
        // Customize the scene configuration based on the type of user activity.
        switch userActivity.activityType {
        case "com.example.myapp.search":
            // Customize the scene for a search user activity.
            sceneConfiguration.delegateClass = SearchSceneDelegate.self
            sceneConfiguration.storyboard = UIStoryboard(name: "Search", bundle: nil)
        case "com.example.myapp.detail":
            // Customize the scene for a detail user activity.
            sceneConfiguration.delegateClass = DetailSceneDelegate.self
            sceneConfiguration.storyboard = UIStoryboard(name: "Detail", bundle: nil)
        default:
            break
        }
        
        return sceneConfiguration
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
        for sceneSession in sceneSessions {
            if let sceneDelegate = sceneSession.delegate as? SceneDelegate {
                // Release any resources associated with the scene delegate.
                sceneDelegate.releaseResources()
            }
        }
    }

}

