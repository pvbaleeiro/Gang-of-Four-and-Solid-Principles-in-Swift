//: [Previous](@previous)

/*:
 ## Command Pattern
 
 Wrapping functions into object with generalized interface
*/

import Foundation

protocol DoorCommand {
    func execute() -> String
}

class OpenCommand : DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Openend \(doors)"
    }
}

class CloseCommand : DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Closed \(doors)"
    }
}

class DoorOperations {
    let openCommand: DoorCommand
    let closeCommand: DoorCommand
    
    init(doors: String) {
        self.openCommand = OpenCommand(doors: doors)
        self.closeCommand = CloseCommand(doors: doors)
    }
    
    func close() -> String {
        return closeCommand.execute()
    }
    
    func open() -> String {
        return openCommand.execute()
    }
}


let podBayDoors = "Pod Bay Doors"
let doorModule = DoorOperations(doors: podBayDoors)
doorModule.open()
doorModule.close()


// Victor's code
protocol Command {
    func execute()
}

class ClockApp {
    
    func showClock() {
        print("Showing clock...")
    }
    
    func removeClock() {
        print("Removing clock...")
    }
}

class WeatherApp {
    
    func getWeatherData() {
        print("Getting weather data")
    }
    
    func showWeatherAnimation() {
        print("Showing correct weather animation")
    }
    
    func deleteWheaterData() {
        print("Deleting weather data")
    }
    
    func closeWeatherApp() {
        print("Closing weather app")
    }
}

class WeatherAppOpenCommand: Command {
    
    let weatherApp: WeatherApp
    
    init(weatherApp: WeatherApp) {
        self.weatherApp = weatherApp
    }
    
    func execute() {
        self.weatherApp.getWeatherData()
        self.weatherApp.showWeatherAnimation()
    }
}

class WeatherAppCloseCommand: Command {
    
    let weatherApp: WeatherApp
    
    init(weatherApp: WeatherApp) {
        self.weatherApp = weatherApp
    }
    
    func execute() {
        self.weatherApp.deleteWheaterData()
        self.weatherApp.closeWeatherApp()
    }
}

class ClockAppOpenCommand: Command {
    
    let clockApp: ClockApp
    
    init(clockApp: ClockApp) {
        self.clockApp = clockApp
    }
    
    func execute() {
        self.clockApp.showClock()
    }
}

class ClockAppCloseCommand: Command {
    
    let clockApp: ClockApp
    
    init(clockApp: ClockApp) {
        self.clockApp = clockApp
    }
    
    func execute() {
        self.clockApp.removeClock()
    }
}

class Springboard {
    
    private var openCommands = [Command]()
    private var closeCommands = [Command]()
    
    func setCommand(openCommand: Command, closeCommand: Command) {
        self.openCommands.append(openCommand)
        self.closeCommands.append(closeCommand)
    }
    
    func openApp(atIndex index: Int) {
        if openCommands.count < index {
            print("App não existe")
            return
        }
        openCommands[index].execute()
    }
    
    func closeApp(atIndex index: Int) {
        if closeCommands.count < index {
            print("App não existe")
            return
        }
        closeCommands[index].execute()
    }
}

let springboard = Springboard()
let weatherApp = WeatherApp()
let clockApp = ClockApp()

springboard.setCommand(openCommand: WeatherAppOpenCommand(weatherApp: weatherApp), closeCommand: WeatherAppCloseCommand(weatherApp: weatherApp))
springboard.openApp(atIndex: 0)
springboard.closeApp(atIndex: 0)

springboard.setCommand(openCommand: ClockAppOpenCommand(clockApp: clockApp), closeCommand: ClockAppCloseCommand(clockApp: clockApp))
springboard.openApp(atIndex: 1)
springboard.closeApp(atIndex: 1)

//: [Next](@next)
