//: [Previous](@previous)

import Foundation

protocol Responder {
    func speak(input: String) -> String
}

public struct Chatbot {
    
    var responder : Responder
    
    init(responder: Responder) {
        self.responder = responder
    }
    
    public func respond(inputString: String) -> String {
        return responder.speak(input: inputString)
    }
}

public struct EnglishSpeaker : Responder {
    func speak(input: String) -> String {
        return "You said:" + input
    }
}

public struct GermanSpeaker : Responder {
    func speak(input: String) -> String {
        return "Du hast gesagt:" + input
    }
}

let germanResponder = GermanSpeaker()
let englishResponder = EnglishSpeaker()

var mainBot = Chatbot(responder: germanResponder)
mainBot.respond(inputString: "Hello Bot")

mainBot.responder = englishResponder
mainBot.respond(inputString: "Hello Bot")


// Victor's code
protocol CharacterState {
    func enterState()
}

class GoodGuy {
    
    private var characterState: CharacterState?
    
    func setState(cs: CharacterState) {
        self.characterState = cs
        characterState?.enterState()
    }
}

class RunningState : CharacterState{
    
    func enterState() {
        print("Entering running state")
    }
}

class StandingState : CharacterState{
    
    func enterState() {
        print("Entering standing state")
    }
}

class WalkingState : CharacterState{
    
    func enterState() {
        print("Entering walking state")
    }
}

let goodGuy = GoodGuy()

goodGuy.setState(cs: WalkingState())
goodGuy.setState(cs: StandingState())
goodGuy.setState(cs: RunningState())

//: [Next](@next)
