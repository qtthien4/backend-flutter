import { AbstractEntity } from 'src/common/abstract/entity.abstract';

import { Column, Entity, ManyToOne, JoinColumn } from 'typeorm';
import { User } from './user.entity';
import { Hotel } from './hotel.entity';

@Entity('bookings')
export class Booking extends AbstractEntity {
  @ManyToOne(() => User, (user) => user.bookings, {
    cascade: true,
  })
  @JoinColumn({ name: 'userId' })
  user: User;

  @Column()
  userId: string;

  @Column()
  chooseDate: string;

  @Column()
  depTime: string;

  @Column()
  person: string;

  @Column()
  name: string;

  @Column()
  number: string;

  @Column()
  email: string;

  @ManyToOne(() => Hotel, (hotel) => hotel.bookings, {
    cascade: true,
  })
  @JoinColumn({ name: 'hotelId' })
  hotel: Hotel;

  @Column()
  hotelId: string;
}
