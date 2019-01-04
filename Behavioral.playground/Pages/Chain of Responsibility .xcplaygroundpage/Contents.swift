//: ![Chain of Responsibility](ChainOfResponsibility.png)


import Foundation

var steve = Mechanic(skill: .MasterMechanic, name: "Steve Frank")
var joe = Mechanic(skill: .MasterMechanic, name: "Joe Alison")
var jack = Mechanic(skill: .MasterMechanic, name: "Jack Ryan")
var brian = Mechanic(skill: .MasterMechanic, name: "Drake Jin")

var masterMechanics = MechanicSkillGroup(skill: .MasterMechanic,
                                         mechanics: [steve, joe, jack, brian],
                                         nextLevel: nil)

var tyson = Mechanic(skill: .Apprentice, name: "Tyson Trump")
var tina = Mechanic(skill: .Apprentice, name: "Tina Bernard")
var bryan = Mechanic(skill: .Apprentice, name: "Bryan Tram")
var lin = Mechanic(skill: .Apprentice, name: "Lin Young")

var apprenticeMechanics = MechanicSkillGroup(skill: .Apprentice,
                                             mechanics: [tyson, tina, bryan, lin],
                                             nextLevel: masterMechanics)

var ken = Mechanic(skill: .Junior, name: "Ken Hudson")
var matt = Mechanic(skill: .Junior, name: "Matt Lowes")
var sandeep = Mechanic(skill: .Junior, name: "Sandeep Shenoy")
var tom = Mechanic(skill: .Junior, name: "Tom Berry")

var juniorMechanics = MechanicSkillGroup(skill: .Junior,
                                         mechanics: [ken, matt, sandeep, tom],
                                         nextLevel: apprenticeMechanics)

var grant = Mechanic(skill: .OilChangeOnly, name: "Grant Hughes")

var oilChangeOnlyes = MechanicSkillGroup(skill: .OilChangeOnly,
                                         mechanics: [grant],
                                         nextLevel: juniorMechanics)

var shop = Shop(firstMechanics: oilChangeOnlyes)

var jobs = [Job(minSkill: .Junior, name: "Windshield Wiper"),
            Job(minSkill: .Apprentice, name: "Light Bulb Change"),
            Job(minSkill: .Apprentice, name: "Battery Replacement"),
            Job(minSkill: .OilChangeOnly, name: "General Oil Change"),
            Job(minSkill: .OilChangeOnly, name: "General Oil Change"),
            Job(minSkill: .OilChangeOnly, name: "General Oil Change"),
            Job(minSkill: .OilChangeOnly, name: "General Oil Change"),
            Job(minSkill: .MasterMechanic, name: "Timing Belt Replacement"),
            Job(minSkill: .Junior, name: "Brake Pads Replacement")
]

for job in jobs{
    shop.performJob(job: job)
}


// Victor's code
class Despesa {
    
    private var _total = Int()
    var total: Int {
        get {
            return _total
        }
        
        set {
            _total = newValue
        }
    }
    
    init(total: Int) {
        self.total = total
    }
}

protocol Chain {
    var proximoNivelGerenciamento: Chain { get set }
    func deveAprovarDespesa(despesa: Despesa)
}

class CEO: Chain {
    private var _proximoNivelGerenciamento: Chain?
    var proximoNivelGerenciamento: Chain {
        get {
            return _proximoNivelGerenciamento!
        }
        
        set {
            _proximoNivelGerenciamento = newValue
        }
    }
    
    func deveAprovarDespesa(despesa: Despesa) {
        if despesa.total > 1001 && despesa.total < 10000 {
            print("O CEO pode aprovar esta despesa")
        } else {
            print("Esta despesa é muito alta e não será aprovada")
        }
    }
}

class Boss: Chain {
    private var _proximoNivelGerenciamento: Chain?
    var proximoNivelGerenciamento: Chain {
        get {
            return _proximoNivelGerenciamento!
        }
        
        set {
            _proximoNivelGerenciamento = newValue
        }
    }
    
    func deveAprovarDespesa(despesa: Despesa) {
        if despesa.total > 101 && despesa.total < 1000 {
            print("Seu boss pode aprovar esta despesa")
        } else {
            if _proximoNivelGerenciamento != nil {
                proximoNivelGerenciamento.deveAprovarDespesa(despesa: despesa)
            }
        }
    }
}

class Funcionario: Chain {
    private var _proximoNivelGerenciamento: Chain?
    var proximoNivelGerenciamento: Chain {
        get {
            return _proximoNivelGerenciamento!
        }
        
        set {
            _proximoNivelGerenciamento = newValue
        }
    }
    
    func deveAprovarDespesa(despesa: Despesa) {
        if despesa.total > 0 && despesa.total < 100 {
            print("Um funcionário pode aprovar esta despesa")
        } else {
            if _proximoNivelGerenciamento != nil {
                proximoNivelGerenciamento.deveAprovarDespesa(despesa: despesa)
            }
        }
    }
}

let funcionario = Funcionario()
let boss = Boss()
let ceo = CEO()

funcionario.proximoNivelGerenciamento = boss
boss.proximoNivelGerenciamento = ceo

let despesa = Despesa(total: 5)
funcionario.deveAprovarDespesa(despesa: despesa)

despesa.total = 500
funcionario.deveAprovarDespesa(despesa: despesa)

despesa.total = 5000
funcionario.deveAprovarDespesa(despesa: despesa)

despesa.total = 50000
funcionario.deveAprovarDespesa(despesa: despesa)

//: [Next](@next)


