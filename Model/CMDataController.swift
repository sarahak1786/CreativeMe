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
    case shakespeareanSonnet
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
    @Published var favorites: Bool
    
    enum CodingKeys: CodingKey {
        case id, title, body, date, type, favorties
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
        date = try container.decode(Date.self, forKey: .date)
        type = try container.decode(NoteType.self, forKey: .type)
        favorites = try container.decode(Bool.self, forKey: .favorties)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(body, forKey: .body)
        try container.encode(date, forKey: .date)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(favorites, forKey: .favorties)
    }
    
    init(id: UUID = UUID(), title: String, body: String, date: Date = Date(), type: NoteType, favorites: Bool) {
        self.id = id
        self.title = title
        self.body = body
        self.date = date
        self.type = type
        self.favorites = favorites
    }
    
    static let examplePoem: Note = Note(id: UUID(), title: "Worlds of Nonconformity", body: "The discovery of uncharted land vigorously awaits,\nForeshadowing both sun and moon of an uncertain future.\nColumbus sails the seas as all sense of worry dissipates,\nEntering a world full of new sights which allure.\n\nWith everlasting reciprocals of untimely magnification,\nConquering was nothing but interconnected transformations.\nErosion of obsolescent ancestry to competitions alike,\nFeasts of undergrowth unravel with wonders of opulence.\n\nOf such elements, conditions fall both swindling and variant,\nThose hearts combating captivity seek disparity from one.\nContrasting people fall circumstance to order aligning fate,\nWhile vanquishing battles hold contemporary pertinence.\n\nIn paradoxical universes, souls may diminish or flourish,\nBoth conquering and surviving worlds seek the new light.", date: Date(), type: NoteType.poem, favorites: true)

    static let exampleHaiku: Note = Note(id: UUID(), title: "Flawless Coastal Day", body: "Watching the view glow,\nThe beach seems to ebb and flow;\nSifting sands below", date: Date(), type: NoteType.haiku, favorites: true)

    static let examplePoetry: Note = Note(id: UUID(), title: "The Deck of Changes", body: "Like the deity that dawns upon the sprouted flora,\nAce of spades, calls out with a hand blessed with aura.\nOthers find comfort, while I may brew steams of wrath.\nThe silhouette of clasped beads taint a shaded path—\n\nYet, the spiritual cards fly high and low and fast and slow,\nBreaking the odds of science as they glide with flow…\nI stride through a labyrinth, pondering everlasting thoughts,\nThe glowing ace of spades dims its light as it ought.\n\nLeaves of autumn begin to fall as winter sprawls swiftly,\nSpring blooms bright, and summer simmers as it all makes history.\nThe breaths, the time, the essence, the blindness that follows,\nThe ace of spades remains in the distance with sorrow.\n\nAs I continue, I search a hollowed room for a source,\nA shadow stretches out, revealingly in a sudden force.\nFingers brushed, eyes meet each other like sharp blades,\nThe slip beamed loudly — the ace of spades.\n\nAmidst a venture of ambiguous consciousness,\nThe ace of spades is one that is innocuous.\nLike a friend that can be revisited in any moment,\nThe card of hope and sorrow is a besowment—\n\nA curse, a spell, a gift, a legacy, the Ace of…\nSpades is one to forever remember with love.", date: Date(), type: NoteType.poem, favorites: true)
}

@MainActor class Notes: ObservableObject, Identifiable {
    @Published private(set) var notes: [Note]
    let saveKey = "SaveNotes"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Note].self, from: data) {
                notes = decoded
                save()
                return
            }
        }
        notes = [Note.exampleHaiku, Note.examplePoem, Note.examplePoetry]
        save()
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
    
    func addFavorites(_ note: Note) {
        note.favorites.toggle()
        save()
    }
    
    func saveBody(_ note: Note, _ newBody: String){
        note.body = newBody
        save()
    }
    
    func getBody(_ note: Note) -> String {
        return note.body
    }
    
    func getType(_ note: Note) -> NoteType {
        return note.type
    }
    
    func getInformation(_ index: Int) -> Note {
        return notes[index]
    }
    
    func getFilteredInformation(_ index: Int, from list: [Note]) -> Note {
        return list[index]
    }
}
