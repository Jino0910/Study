import UIKit

protocol Drivable {}
protocol Stoppable {}

func create<T: Drivable & Stoppable>(car: T) -> T {
    return car
}

class BMW: Drivable, Stoppable {
    
}

create(car: BMW())
