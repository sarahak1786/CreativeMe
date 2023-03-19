//
//  CMNotes.swift
//  
//
//  Created by Sarah Akhtar on 3/18/23.
//

import Foundation
import SwiftUI

enum NoteType: String, Decodable {
    case poem
    case haiku
    case argumentativeEssay
    case expositoryEssay
    case narrativeEssay
    case informativeEssay
    case shakespeareSonnet
    case spenserianSonnet
    case play
    case song
    case speech
    case other
}

class Note: ObservableObject, Identifiable, Codable {
    @Published var id: UUID
    @Published var title: String
    @Published var body: String
    @Published var date: Date
    @Published var type: NoteType
    
    enum CodingKeys: CodingKey {
        case id, title, body, date, type
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
        date = try container.decode(Date.self, forKey: .date)
        type = try container.decode(NoteType.self, forKey: .type)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(body, forKey: .body)
        try container.encode(date, forKey: .date)
        try container.encode(type.rawValue, forKey: .type)
    }
    
    init(id: UUID = UUID(), title: String, body: String, date: Date = Date(), type: NoteType = .other) {
        self.id = id
        self.title = title
        self.body = body
        self.date = date
        self.type = type
    }
    
    static let examplePoem: Note = Note(title: "The Worlds of Nonconformity", body: "The discovery of uncharted land vigorously awaits,\nForeshadowing both sun and moon of an uncertain future.\nColumbus sails the seas as all sense of worry dissipates,\nEntering a world full of new sights which allure.\n\nWith everlasting reciprocals of untimely magnification,\nConquering was nothing but interconnected transformations.\nErosion of obsolescent ancestry to competitions alike,\nFeasts of undergrowth unravel with wonders of opulence.\n\nOf such elements, conditions fall both swindling and variant,\nThose hearts combating captivity seek disparity from one.\nContrasting people fall circumstance to order aligning fate,\nWhile vanquishing battles hold contemporary pertinence.\n\nIn paradoxical universes, souls may diminish or flourish,\nBoth conquering and surviving worlds seek the new light.", date: Date(), type: NoteType.poem)

    static let exampleHaiku: Note = Note(title: "The Worlds of Nonconformity", body: "Watching the view glow,\nThe beach seems to ebb and flow;\nSifting sands below", date: Date(), type: NoteType.haiku)

    static let examplePoetry: Note = Note(title: "The Deck of Changes", body: "Like the deity that dawns upon the sprouted flora,\nAce of spades, calls out with a hand blessed with aura.\nOthers find comfort, while I may brew steams of wrath.\nThe silhouette of clasped beads taint a shaded path—\n\nYet, the spiritual cards fly high and low and fast and slow,\nBreaking the odds of science as they glide with flow…\nI stride through a labyrinth, pondering everlasting thoughts,\nThe glowing ace of spades dims its light as it ought.\n\nLeaves of autumn begin to fall as winter sprawls swiftly,\nSpring blooms bright, and summer simmers as it all makes history.\nThe breaths, the time, the essence, the blindness that follows,\nThe ace of spades remains in the distance with sorrow.\n\nAs I continue, I search a hollowed room for a source,\nA shadow stretches out, revealingly in a sudden force.\nFingers brushed, eyes meet each other like sharp blades,\nThe slip beamed loudly — the ace of spades.\n\nAmidst a venture of ambiguous consciousness,\nThe ace of spades is one that is innocuous.\nLike a friend that can be revisited in any moment,\nThe card of hope and sorrow is a besowment—\n\nA curse, a spell, a gift, a legacy, the Ace of…\nSpades is one to forever remember with love.", date: Date(), type: NoteType.poem)
}

@MainActor class Notes: ObservableObject {
    @Published private(set) var notes: [Note]
    let saveKey = "SaveNotes"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Note].self, from: data) {
                notes = decoded
                return
            }
        }
        notes = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func add(_ note: Note) {
        notes.append(note)
        save()
    }
}
