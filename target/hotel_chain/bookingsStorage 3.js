class BookingsStorage {
    constructor(){
        this.bookingList = [];
    }

    getBookings(){
        return this.bookingList;
    }

    addBooking(roomtype, number){
        let bookings = this.getBookings();

        if(bookings.findIndex(item => item.roomtype == roomtype) == -1){
            bookings.push({roomtype, number});
        }
        return bookings;
    }

    removeBooking(roomtype){
        let bookings = this.getBookings();
        let index = bookings.findIndex(item => item.roomtype == roomtype);

        if(index != -1){
            bookings.splice(index, 1);
        }

        return bookings;
    }
}

const bookingsStorage = new BookingsStorage();