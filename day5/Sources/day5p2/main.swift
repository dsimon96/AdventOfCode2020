import Airplane

let numSeats = 128 * 8

// Mark all of the occupied seats
var occupancy: [Bool] = Array(repeating: false, count: numSeats)
while let s = readLine(strippingNewline: true) {
    let seat = Seat(s)
    occupancy[seat.id()] = true
}

// Identify the unoccupied seat in between two occupied seats
for i in 1..<(numSeats-1) {
    if !occupancy[i] && occupancy[i-1] && occupancy[i+1] {
        print(i)
        break
    }
}
