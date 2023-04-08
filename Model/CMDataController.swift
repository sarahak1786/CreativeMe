//
//  CMNotes.swift
//  
//
//  Created by Sarah Akhtar on 4/2/23.
//

import Foundation
import SwiftUI

//MARK: Enumeration for Note Type
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

//MARK: Class for Individual Notes
class Note: ObservableObject, Identifiable, Codable {
    
    ///Variables for each aspect of a singular note
    @Published var id: UUID
    @Published var title: String
    @Published var body: String
    @Published var date: Date
    @Published var type: NoteType
    @Published var favorites: Bool
    
    
    ///Conventional enumeration for saving to UserDefaults
    enum CodingKeys: CodingKey {
        case id, title, body, date, type, favorties
    }
    
    ///Decoding from UserDefaults
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
        date = try container.decode(Date.self, forKey: .date)
        type = try container.decode(NoteType.self, forKey: .type)
        favorites = try container.decode(Bool.self, forKey: .favorties)
    }
    
    ///Encoding to UserDefaults
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(body, forKey: .body)
        try container.encode(date, forKey: .date)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(favorites, forKey: .favorties)
    }
    
    ///Class constructor for new notes
    init(id: UUID = UUID(), title: String, body: String, date: Date = Date(), type: NoteType, favorites: Bool) {
        self.id = id
        self.title = title
        self.body = body
        self.date = date
        self.type = type
        self.favorites = favorites
    }
    
    ///Static variable examples presented with each user automatically
    static let examplePoem: Note = Note(id: UUID(), title: "Worlds of Nonconformity", body: "The discovery of uncharted land vigorously awaits,\nForeshadowing both sun and moon of an uncertain future.\nColumbus sails the seas as all sense of worry dissipates,\nEntering a world full of new sights which allure.\n\nWith everlasting reciprocals of untimely magnification,\nConquering was nothing but interconnected transformations.\nErosion of obsolescent ancestry to competitions alike,\nFeasts of undergrowth unravel with wonders of opulence.\n\nOf such elements, conditions fall both swindling and variant,\nThose hearts combating captivity seek disparity from one.\nContrasting people fall circumstance to order aligning fate,\nWhile vanquishing battles hold contemporary pertinence.\n\nIn paradoxical universes, souls may diminish or flourish,\nBoth conquering and surviving worlds seek the new light.", date: Date(), type: NoteType.poem, favorites: true)

    static let exampleHaiku: Note = Note(id: UUID(), title: "Flawless Coastal Day", body: "Watching the view glow,\nThe beach seems to ebb and flow;\nSifting sands below", date: Date(), type: NoteType.haiku, favorites: true)

    static let examplePoetry: Note = Note(id: UUID(), title: "The Deck of Changes", body: "Like the deity that dawns upon the sprouted flora,\nAce of spades, calls out with a hand blessed with aura.\nOthers find comfort, while I may brew steams of wrath.\nThe silhouette of clasped beads taint a shaded path—\n\nYet, the spiritual cards fly high and low and fast and slow,\nBreaking the odds of science as they glide with flow…\nI stride through a labyrinth, pondering everlasting thoughts,\nThe glowing ace of spades dims its light as it ought.\n\nLeaves of autumn begin to fall as winter sprawls swiftly,\nSpring blooms bright, and summer simmers as it all makes history.\nThe breaths, the time, the essence, the blindness that follows,\nThe ace of spades remains in the distance with sorrow.\n\nAs I continue, I search a hollowed room for a source,\nA shadow stretches out, revealingly in a sudden force.\nFingers brushed, eyes meet each other like sharp blades,\nThe slip beamed loudly — the ace of spades.\n\nAmidst a venture of ambiguous consciousness,\nThe ace of spades is one that is innocuous.\nLike a friend that can be revisited in any moment,\nThe card of hope and sorrow is a besowment—\n\nA curse, a spell, a gift, a legacy, the Ace of…\nSpades is one to forever remember with love.", date: Date(), type: NoteType.poem, favorites: true)
}

//MARK: Class for Storing a Collection of Notes
@MainActor class Notes: ObservableObject, Identifiable {
    
    ///Variables for an array of all notes created by user and a UserDefaults key
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
    
    ///Saves user selections to UserDefaults
    private func save() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    ///Adds new note and saves to UserDefaults
    func add(_ note: Note) {
        notes.append(note)
        save()
    }
    
    ///Toggles between favorites and saves to UserDefaults
    func addFavorites(_ note: Note) {
        note.favorites.toggle()
        save()
    }
    
    ///Saves current body text based on input to UserDefaults
    func saveBody(_ note: Note, _ newBody: String){
        note.body = newBody
        save()
    }
    
    ///A getter for the text body of a note
    func getBody(_ note: Note) -> String {
        return note.body
    }
    
    ///A getter for the NoteType of a note
    func getType(_ note: Note) -> NoteType {
        return note.type
    }
    
    ///A getter for the a note based on its position in the 'notes' array
    func getInformation(_ index: Int) -> Note {
        return notes[index]
    }
    
    ///A getter for a note based on its position in a given array
    func getFilteredInformation(_ index: Int, from list: [Note]) -> Note {
        return list[index]
    }
}
