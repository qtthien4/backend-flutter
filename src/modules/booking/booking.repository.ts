import { Booking } from 'src/database/entities/booking.entity';
import { Hotel } from 'src/database/entities/hotel.entity';
import { EntityRepository, Repository } from 'typeorm';

@EntityRepository(Booking)
export class BookingRepository extends Repository<Booking> {}
