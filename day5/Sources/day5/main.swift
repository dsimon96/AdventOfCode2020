import Airplane

var maxSeen = -1
while let s = readLine(strippingNewline: true) {
    let seat = Seat(s)
    let id = seat.id()
    if id > maxSeen {
        maxSeen = id
    }
}

print(maxSeen)
