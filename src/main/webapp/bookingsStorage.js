class BookingsStorage {
    constructor(){
        this.bookingList = [];
    }

    getBookings(){
        return this.bookingList;
    }

    addBooking(id){
        let bookings = this.getBookings();

        if(bookings.indexOf(id) == -1){
            bookings.push(id);
        }
        return bookings;
    }

    removeBooking(id){
        let bookings = this.getBookings();
        let index = bookings.indexOf(id);

        if(index != -1){
            bookings.splice(index, 1);
        }

        return bookings;
    }
}

const bookingsStorage = new BookingsStorage();