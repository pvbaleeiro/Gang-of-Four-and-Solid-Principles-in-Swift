//: [Previous](@previous)

import Foundation

public struct Book {
    var name : String
}

public struct Library {
    var catalog = [Book]()
}

public struct LibraryIterator : IteratorProtocol {
    
    public  var lib : Library
    private var currentIndex : Int = 0
    
    public init(lib: Library) {
        self.lib = lib
    }
    
    mutating public func next() -> Book? {
        defer { currentIndex = currentIndex + 1 }
        return currentIndex >= lib.catalog.count ? nil : lib.catalog[currentIndex]
    }
}

extension Library : Sequence {
    public func makeIterator() -> LibraryIterator {
        return LibraryIterator(lib:self)
    }
}


let catalog = [Book(name:"Bla"), Book(name:"Blub"), Book(name:"Foo")]
let library = Library(catalog: catalog)

for book in library {
    print(book.name)
}


// Victor's code
public struct Model {
    var name: String
}

public struct IPhoneCatalog {
    var models = [Model]()
}

public struct IPhoneCatalogIterator: IteratorProtocol {
    
    public var iPhoneCatalog: IPhoneCatalog
    private var currentIndex: Int = 0

    public init(iPhoneCatalog: IPhoneCatalog) {
        self.iPhoneCatalog = iPhoneCatalog
    }

    mutating public func next() -> Model? {
        defer { currentIndex = currentIndex + 1 }
        return currentIndex >= iPhoneCatalog.models.count ? nil : iPhoneCatalog.models[currentIndex]
    }
}

extension IPhoneCatalog : Sequence {
    public func makeIterator() -> IPhoneCatalogIterator {
        return IPhoneCatalogIterator(iPhoneCatalog: self)
    }
}

let models = [Model(name:"iPhone 5S"), Model(name:"iPhone 8"), Model(name:"iPhone X")]
let iphoneCatalog = IPhoneCatalog(models: models)

for model in iphoneCatalog {
    print(model.name)
}
//: [Next](@next)


