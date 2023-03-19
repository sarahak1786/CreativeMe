//
//  File.swift
//  
//
//  Created by Sarah Akhtar on 3/18/23.
//

import Foundation

class Information {
    
    static let shared = Information()
    let randomPoem: [String]
    let randomHaiku: [String]
    let randomAEssay: [String]
    let randomEEssay: [String]
    let randomNEssay: [String]
    let randomIEssay: [String]
    let randomShakeSonnet: [String]
    let randomSpenSonnet: [String]
    let randomPlay: [String]
    let randomSong: [String]
    let randomSpeech: [String]
    
    private init() {
        randomPoem = ["Write a poem about a well enjoyed trip to any destination of your choosing. Make this location a symbol of the poem.", "Write a poem that has a multi-layered symbol that ultimately shows the relationship between two chosen topics.", "Write a poem with as many literary devices as you can. There is no limit.", "Write a poem that has at least five metaphors and contains a consistent rhyme scheme.", "Write a poem that begins with a consistent rhyme scheme, but breaks at some instance to reveal a compelling message.", "Write a poem that introduces the nuances of a show, artistic piece, or phenomenon that interests you.", "Write a poem that creates an original Greek-like society with a moral message.", "Write a poem that has purposeful usage of syntax such as semicolons, line breaks, and enjambment.", "Write a poem that alludes to one of your favorite novels and evoke your opinion through the tone and/or diction.", "Write a poem about a painting of your choosing. The poem should be read alongside viewing the poem in reflection, reference, or analysis of the piece.", "Write a poem that is of 25+ lines with a style of flow that reveals the importance of its length."]
        
        randomHaiku = ["Write a haiku about a cat walking along the beach without using any of the words in this sentence.", "Write a haiku about a person close to you. Bonus points if you share this haiku with them!", "Write a haiku about a historical event that you find is important or interesting.", "Write a haiku that does not contain the letter ‘J’ in it.", "Write a haiku that rhymes at the end of each line.", "Write a haiku about your greatest passion; show this in your writing!", "Write a haiku about your day. Include one metaphor that aids your tone.", "Write a haiku that has a strongly Romantic tone.", "Write a haiku like a mad scientist on an adventure to Ireland."]
        
        randomAEssay = [""]
        
        randomEEssay = [""]
        
        randomNEssay = [""]
        
        randomIEssay = [""]
        
        randomShakeSonnet = [""]
        
        randomSpenSonnet = [""]
        
        randomPlay = [""]
        
        randomSong = ["Write a song about a loved one and your relationship with them. Encompass how they make you feel and a message you’d like them to know.", "Write a song that has a morbid tone, yet concludes oddly well.", "Write a song that raps to a favorite show or movie you enjoy.", "Write a song about a trip you’d love to experience.", "Write a song that you’d believe would become the most popular song in the entire world. Express this emotion in your song as well.", "Write a song that contains more than one language.", "Write a song of your choosing and translate the entire song to another language. How does the tone, voice, and message change when it's sung?", "Write a song that contains the word “avocado” in it. The song cannot be about food in any regard.", "Write a song that is based on another song. How does your addition alter the song for the better or worse?", "Write a song about horses. Have another person or you sing the song out loud. Rate the song and have a discussion about it.", "Write a song about a philosophical idea. Share it with another person."]
        
        randomSpeech = ["Write a speech about how to conquer the world. Make it inspirational.", "Write a speech for the President. Recite the speech to someone else and have them rate your policy.", "Write a speech for the State of the Union Address. This speech is given every year in the United States and often concludes with, 'The state of the union is strong.'", "Write a speech about speeches. Incorporate the emotional connection you have to speeches, or lack thereof.", "Write a speech that is secretly about chickens. See how long it takes for someone to figure out what the speech is referring to.", "Write a speech that you feel you’d want to give in person. Compare this speech to others and improve on your writing.", "Write a speech that involves a strong opinion you have. Reflect on how the speech may have altered your opinion afterwards."]
    }
}
