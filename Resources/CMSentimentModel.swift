////
////  File.swift
////
////
////  Created by Sarah Akhtar on 3/26/23.
////
//
////Find MLModel
//import CoreML
//import Foundation
//import NaturalLanguage
//import SwiftUI
//
//class SentimentModel: ObservableObject {
//    @Published var modelPrediction: String = ""
//    @Published var confidenceLevel: Double = 0.0
//
//    var model = MLModel()
//    var sentimentPredictor = NLModel()
//
//    init() {
//        do {
//            let sentimentModel = try CMSentimentAnalysis(configuration: MLModelConfiguration()).model
//            self.model = sentimentModel
//            do {
//                let predictor = try NLModel(mlModel: model)
//                self.sentimentPredictor = predictor
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//
//        func predict(_ text: String) {
//            self.modelPrediction = sentimentPredictor.predictedLabel(for: text) ?? ""
//            let predictionSet = sentimentPredictor.predictedLabelHypotheses(for: text, maximumCount: 1)
//            self.confidenceLevel = predictionSet[modelPrediction] ?? 0.0
//        }
//    }
//}
