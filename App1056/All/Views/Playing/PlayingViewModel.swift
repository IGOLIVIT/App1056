//
//  PlayingViewModel.swift
//  App1056
//
//  Created by IGOR on 12/11/2024.
//

import SwiftUI
import CoreData

final class PlayingViewModel: ObservableObject {
    
    @Published var photos: [String] = ["Pinpong", "Tennis"]
    @Published var currentPhoto = ""

    @AppStorage("categories") var categories: [String] = []
    @Published var addCateg: String = ""
    @Published var currCateg: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isCat: Bool = false

    @Published var plPhoto: String = ""
    @Published var plName: String = ""
    @Published var plText: String = ""
    @Published var plCat: String = ""

    @Published var playings: [PlayModel] = []
    @Published var selectedPlay: PlayModel?

    func addPlay() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlayModel", into: context) as! PlayModel

        loan.plPhoto = plPhoto
        loan.plName = plName
        loan.plText = plText
        loan.plCat = plCat

        CoreDataStack.shared.saveContext()
    }

    func fetchPlays() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlayModel>(entityName: "PlayModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.playings = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.playings = []
        }
    }
}
