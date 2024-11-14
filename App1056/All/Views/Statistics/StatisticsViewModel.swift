//
//  StatisticsViewModel.swift
//  App1056
//
//  Created by IGOR on 13/11/2024.
//

import SwiftUI

final class StatisticsViewModel: ObservableObject {

    @AppStorage("AverPoints") var AverPoints: String = ""
    @AppStorage("WinPerc") var WinPerc: String = ""
    @AppStorage("NumWins") var NumWins: String = ""
    @AppStorage("NumGames") var NumGames: String = ""
    @AppStorage("numWon") var numWon: String = ""
    @AppStorage("numAces") var numAces: String = ""
    @AppStorage("mDur") var mDur: String = ""
    @AppStorage("percServ") var percServ: String = ""
    @AppStorage("numDFaults") var numDFaults: String = ""
    
    @Published var addAverPoints: String = ""
    @Published var addWinPerc: String = ""
    @Published var addNumWins: String = ""
    @Published var addNumGames: String = ""
    @Published var addnumWon: String = ""
    @Published var addnumAces: String = ""
    @Published var addmDur: String = ""
    @Published var addpercServ: String = ""
    @Published var addnumDFaults: String = ""

    @Published var isAdd: Bool = false
}

