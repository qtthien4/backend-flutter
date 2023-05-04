import { Hotel } from 'src/database/entities/hotel.entity';
import { EntityRepository, Repository } from 'typeorm';

@EntityRepository(Hotel)
export class HotelRepository extends Repository<Hotel> {}
