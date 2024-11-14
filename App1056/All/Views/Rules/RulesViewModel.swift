//
//  RulesViewModel.swift
//  App1056
//
//  Created by IGOR on 12/11/2024.
//

import SwiftUI
import CoreData

final class RulesViewModel: ObservableObject {

    @Published var photos: [String] = ["Pinpong", "Tennis"]
    @Published var currentPhoto = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var ruPhoto: String = ""
    @Published var ruName: String = ""
    @Published var ruText: String = ""

    @Published var rules: [RulesModel] = []
    @Published var selectedRule: RulesModel?

    func addRule() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "RulesModel", into: context) as! RulesModel

        loan.ruPhoto = ruPhoto
        loan.ruName = ruName
        loan.ruText = ruText

        CoreDataStack.shared.saveContext()
    }

    func fetchRules() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RulesModel>(entityName: "RulesModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.rules = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.rules = []
        }
    }
}
