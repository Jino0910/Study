import UIKit

@dynamicMemberLookup
struct Thing {
    subscript(dynamicMember member: String) -> String {
        let props = [
            "name": "Afraz",
            "channel": "iOS Academy",
            "platform": "iOS",
            "country": "US",
        ]
        return props[member, default: "-"]
    }
}

let myThing = Thing()
print(myThing.channel) // iOS Academy
print(myThing.platform) // iOS



@dynamicMemberLookup
protocol Lookupable {
    subscript(dynamicMember member: String) -> String { get }
}

class Bar: Lookupable {
    private let json = [
        "setting1": "1",
        "setting2": "2",
        "setting3": "3",
        "setting4": "4",
        "setting5": "5",
    ]
    
    subscript(dynamicMember member: String) -> String {
        return json[member, default: "0"]
    }
}

let bar = Bar()
print(bar.setting3) // 3
