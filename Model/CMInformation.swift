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
    
    let poemInstructions: [String]
    let haikuInstructions: [String]
    let aEssayInstructions: [String]
    let eEssayInstructions: [String]
    let nEssayInstructions: [String]
    let iEssayInstructions: [String]
    let shakeSonnetInstructions: [String]
    let spenSonnetInstructions: [String]
    let playInstructions: [String]
    let songInstructions: [String]
    let speechInstructions: [String]
    
    let stepOption: [String]
    let tipOption: [String]
    let otherOption: [String]
    
    private init() {
        randomPoem = ["Write a poem about a well enjoyed trip to any destination of your choosing. Make this location a symbol of the poem.", "Write a poem that has a multi-layered symbol that ultimately shows the relationship between two chosen topics.", "Write a poem with as many literary devices as you can. There is no limit.", "Write a poem that has at least five metaphors and contains a consistent rhyme scheme.", "Write a poem that begins with a consistent rhyme scheme, but breaks at some instance to reveal a compelling message.", "Write a poem that introduces the nuances of a show, artistic piece, or phenomenon that interests you.", "Write a poem that creates an original Greek-like society with a moral message.", "Write a poem that has purposeful usage of syntax such as semicolons, line breaks, and enjambment.", "Write a poem that alludes to one of your favorite novels and evoke your opinion through the tone and/or diction.", "Write a poem about a painting of your choosing. The poem should be read alongside viewing the poem in reflection, reference, or analysis of the piece.", "Write a poem that is of 25+ lines with a style of flow that reveals the importance of its length."]
        
        randomHaiku = ["Write a haiku about a cat walking along the beach without using any of the words in this sentence.", "Write a haiku about a person close to you. Bonus points if you share this haiku with them!", "Write a haiku about a historical event that you find is important or interesting.", "Write a haiku that does not contain the letter ‘J’ in it.", "Write a haiku that rhymes at the end of each line.", "Write a haiku about your greatest passion; show this in your writing!", "Write a haiku about your day. Include one metaphor that aids your tone.", "Write a haiku that has a strongly Romantic tone.", "Write a haiku like a mad scientist on an adventure to Ireland."]
        
        randomAEssay = ["Write an argumentative essay regarding your opinion on your favorite book. Do you believe the ending should have been that way or altered?","Write an argumentative essay on how the world should be run. Would you create a democracy, monarch, or something else?","Write an argumentative essay on economic policy and how effective a money-based system is.","Write an argumentative essay on whether you enjoy cats, dogs, both or other. Anything and everything goes.","Write an argumentative essay without expressing any moral beliefs. Analyze whether this task was hard or not and how this reflects you as a person.","Write an argumentative essay on your opinion of the word “home.” What does this word mean to you?","Write an argumentative essay that begins with the dissenting opinion and then reveal your belief in a creative way.","Write an argumentative essay that could be told as a speech. What is the similarity between the structure of an argumentative essay and a speech?","Write an argumentative essay on your topic of choosing. Don’t make this topic obvious in your writing, but able to be found."]
        
        randomEEssay = ["Write an expository essay on your favorite animal or plant. Do research on the idea of fauna and flora.","Write an expository essay that expands upon your favorite subject. This may be history, computer science, or even a hobby such as playing soccer.","Write an expository essay about an author that you have read more than once. How does their style change between each novel, or lack thereof?","Write an expository essay about a show that you found interesting, but did not explore alternate endings to. Research these endings and create an argument.","Write an expository essay that involves researching water bears. Quick! Make a prediction – will you enjoy this essay or not?","Write an expository essay about the idea of robots replacing humans. How likely is this to happen based on your research?","Write an expository essay that explains the importance of ethos, pathos, and logos. How do these actually aid a person’s argument?","Write an expository essay about how cars were invented. Do you believe the Industrial Revolution was innovative in this regard?","Write an expository essay on how a government system of your choosing is better than another government system of your choosing.", "Write an expository essay on how artists contribute to the world. Research some famous artists for your examples."]
        
        randomNEssay = ["Write a narrative essay on your greatest, most fond passion. Don’t have one? Think of things you do often and enjoy…Aha!","Write a narrative essay on a trip that you enjoyed and how it has impacted your view of the world.","Write a narrative essay on an embarrassing moment. After, reflect on how writing has impacted your reaction to this moment.","Write a narrative essay on a coming of age instance that you had. What is good, bad, or somewhere in between?","Write a narrative essay on a difficult situation you overcame and how your willpower in life has improved.","Write a narrative essay about a character you made up. Make a villain for this character and demonstrate their opposing sides.","Write a narrative essay that includes humor. Let someone else read your story and see if you made them laugh!","Write a narrative essay as fast as you can. Go!","Write a narrative essay in a manner that improves on a skill you have been trying to improve on. (Examples: speed, less long sentences, grammar, punctuation)"]
        
        randomIEssay = ["Write an informative essay with three arguments about why your favorite Pokemon is your favorite.","Write an informative essay with three arguments about what the true meaning of life is. Do you have more of a philosophical or realistic perspective?","Write an informative essay with three arguments about the consumption of food. This can be as specific or broad as you’d like.","Write an informative essay with three arguments about the creation of the lightbulb. How does it impact people’s lives?","Write an informative essay about a topic that solves a fundamental issue such as crime. What would your solution plan be?","Write an informative essay regarding a historical war from any time period. Make it interesting and read it to someone to see if they remain engaged.","Write an informative essay with as many descriptive words you can imagine. Then, search synonyms for 10 large words at random.","Write an informative essay that informs someone about a topic that you have made up. Make this as believable as you can.","Write an informative essay that contains a hidden motif. Have another person review it and see if they can determine what the motif is.","Write an informative essay about a new product that was launched or a commercial you found interesting."]
        
        randomShakeSonnet = ["Write a Shakespearen sonnet about someone you love. Show this through your tone and include at least one symbol.","Write a Shakespearen sonnet about Shakespeare. Write the sonnet in his voice and see how accurate you come by reading some of his sonnets.","Write a Shakespearen sonnet without rhyming any of the words in this sentence. If it rhymes with at least one, you cannot use it.","Write a Shakespearen sonnet that uses iambic pentameter for a specific effect. See if someone else notices what you did with the pattern.","Write a Shakespearen sonnet that includes the usage of enjambment. Review how this impacts the sonnet in general.","Write a Shakespearen sonnet with creative punctuation such as semicolons, dashes, and others.","Write a Shakespearen sonnet about frogs. Include all sensory details when crafting your sonnet.","Write a Shakespearen sonnet about a video game you enjoy or have seen. What spoke out to you about it?","Write a Shakespearen sonnet about something you find particularly tedious. How has writing improved your attitude towards this task/thing?", "Write a Shakespearen sonnet that incorporates science fiction in some manner."]
        
        randomSpenSonnet = ["Write a Spenserian sonnet that chooses rhymes with words that include the letter 'm' in them. See if you can generate this sonnet without looking up words.","Write a Spenserian sonnet that touches upon the beauty of nature. Then, research the Romantic Era and see if you match some Romantic poets.","Write a Spenserian sonnet with your eyes closed. How does this impact the way you write the sonnet?","Write a Spenserian sonnet about an object in the current room you are in. Why did you pick this object and what symbol can it represent?","Write a Spenserian sonnet that involves an article of clothing that you enjoy wearing. Describe its relationship to you in the sonnet.","Write a Spenserian sonnet that has a tragic outcome. How did you use the last two lines of the sonnet structure to aid you point?","Write a Spenserian sonnet that has a clear message. Do you believe that sonnets must always have a message/point?","Write a Spenserian sonnet with any form of dialogue inside it. What effect does it give to the reader?","Write a Spenserian sonnet about the importance of water. Besides survival, what is water important for?","Write a Spenserian sonnet regarding the greatest endeavor you have."]
        
        randomPlay = ["Write a play that involves four or more characters with at least one foil character. Make the setting a cafe with lots of chatter and coziness.","Write a play that is secretly based on an interesting moment in your life. Leave subtle hints about this poem relating to you and present it to a family member.","Write a play that is made for a younger audience. Read it to a friend and see their reaction.","Write a play that takes place in a medieval era. How does the dialogue change?","Write a play about someone becoming strong and being unable to control their power. Make it similar to an action movie’s structure.","Write a play that is about a character seeking a golden flower. How does the golden flower impact her character as a whole?","Write a play that mimics a movie you enjoy. What have you changed about it and how does that reflect your inner thoughts?","Write a play that has a setting of an urbanized, cold city environment. Who are the characters and what are they like?","Write a play that is a satire of a topic of your choosing. Include at least one metaphor.","Write a play that begins with a character in a play as a narrator. What effect does this frame-like play create?", "Write a play that is inspired off the last song you listened to. What characters have you introduced and how is the tone connected to the song?"]
        
        randomSong = ["Write a song about a loved one and your relationship with them. Encompass how they make you feel and a message you’d like them to know.", "Write a song that has a morbid tone, yet concludes oddly well.", "Write a song that raps to a favorite show or movie you enjoy.", "Write a song about a trip you’d love to experience.", "Write a song that you’d believe would become the most popular song in the entire world. Express this emotion in your song as well.", "Write a song that contains more than one language.", "Write a song of your choosing and translate the entire song to another language. How does the tone, voice, and message change when it's sung?", "Write a song that contains the word “avocado” in it. The song cannot be about food in any regard.", "Write a song that is based on another song. How does your addition alter the song for the better or worse?", "Write a song about horses. Have another person or you sing the song out loud. Rate the song and have a discussion about it.", "Write a song about a philosophical idea. Share it with another person."]
        
        randomSpeech = ["Write a speech about how to conquer the world. Make it inspirational.", "Write a speech for the President. Recite the speech to someone else and have them rate your policy.", "Write a speech for the State of the Union Address. This speech is given every year in the United States and often concludes with, 'The state of the union is strong.'", "Write a speech about speeches. Incorporate the emotional connection you have to speeches, or lack thereof.", "Write a speech that is secretly about chickens. See how long it takes for someone to figure out what the speech is referring to.", "Write a speech that you feel you’d want to give in person. Compare this speech to others and improve on your writing.", "Write a speech that involves a strong opinion you have. Reflect on how the speech may have altered your opinion afterwards."]
        
        poemInstructions = ["A poem is a form of writing that may have attributes like meter, stanzas, and rhyme schemes.", "In this poem, the rhyme scheme is ABAB-CC. A stanza is a group of lines of various lengths.", "While rhythm and stanzas are common, poems can be written in any style.", "Meter in poetry is used to determine what syllables of a poem are stressed or unstressed. When following a pattern, meter can create a desired effect.", "All unstressed syllables are are marked it a “U” shape above and stressed syllables are bolded. Popular meter patterns include iambic pentameter.", "Meter can provide structure and pattern for writing. Poetry may include specific meter patterns, but you are free to use any style or even make up your own!"]
        
        haikuInstructions = ["A haiku is a 3-line poem with a 5-7-5 syllable structure. This type of poem is short and simple.","Syllables can be counted by a single vowel sound with any amount of consonants.","Haikus separate thoughts or create deliberate pauses (enjambment) for literary effect."]
        
        aEssayInstructions = ["Your thesis statement should be between 1-2 sentences and creates a defensible (subjective) argument.", "Reasoning in your essay should be around twice the size of your evidence piece. Don’t be afraid to be extensive!"]
        
        eEssayInstructions = ["An expository essay requires research prior to writing and makes an objective argument for the thesis.", "There is often 3-4 body paragraphs and does not include a rebuttal perspective. Expository essays are more data-driven."]
        
        nEssayInstructions = ["This essay type tells a story and mimics a plot structure. Exposition, climax, and resolution are all parts of a narrative.", "While narrative essays are stories, you may have to tell a personal narrative about an experience or journey you had."]
        
        iEssayInstructions = ["Informative essays contain a thesis with three miniature arguments separated each by a comma.", "Each paragraph should expand upon one of the subsections in your thesis. Paragraphs should be assorted in order."]
        
        shakeSonnetInstructions = ["A Shakespearean sonnet is a 14-line poem that has a specific rhyme scheme of ABAB-CDCD-EFEF and EE. The poem contains iambic pentameter, which is shown above.", "A Shakespearean sonnet often has a “volta”, or a turn during the last two lines of the sonnet."]
        
        spenSonnetInstructions = ["A Spenserian sonnet contains one less rhyme couplet, but has two four-pairs sandwiched in the structure. The meter tends to follow iambic pentameter, but does not require it.", "Spenserian sonnets contain quatrains, but they are interlocked between the first three stanzas."]
        
        playInstructions = ["To begin, a play contains a list of characters and age. Time and place are detailed as well.", "The title and authors of the play can be formatted in many manners, but must be centered.", "Create a title for  parts of the play as shown above. All stage directions are in parenthesis.", "Character names should be in all capital letters and dialogue falls directly below.", "Plays can be any length you’d like. Particularly, it is important to follow correct format."]
        
        songInstructions = ["A verse is a section of a song that contains different lyrics each time. These sections are important for building a purpose or story.", "A chorus is the main area of a song that is repeated and sticks with the listener. On each iteration, the chorus remains the same.", "A bridge is the most distinctive part of a song and connects two sections. It is often different from both the verse and chorus."]
        
        speechInstructions = ["Speeches often have a variety of purposes. Some involve governmental addresses while others are simply personal speeches.", "Most importantly, a listener should be able to get a main point from the speech. Focus on clearness and delivering coherently.", "The last words of a speech are the best opportunity to leave a lasting impression on the listener and everyone around."]
        
        stepOption = ["Tip #1:", "Tip #2:", "Tip #3:"]
        
        tipOption = ["Tip #1:", "Tip #2:", "Tip #3:"]
        
        otherOption = ["What is a verse?", "What is a chorus?", "What is a bridge?"]
    }
}
