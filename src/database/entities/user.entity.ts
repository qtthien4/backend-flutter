import { AbstractEntity } from 'src/common/abstract/entity.abstract';

import { Column, Entity, OneToMany, OneToOne } from 'typeorm';
import { Booking } from './booking.entity';
import { Favorite } from './favorite.entity';

@Entity('users')
export class User extends AbstractEntity {
  @Column({ unique: true })
  phoneNumber: string;

  @Column({ select: false })
  password: string;

  @Column()
  name: string;

  @Column()
  email: string;

  @Column()
  bdd: Date;

  @Column({ nullable: true })
  otp: string;

  @OneToMany(() => Booking, (booking) => booking.user, {
    onDelete: 'CASCADE',
  })
  bookings: Booking[];

  @OneToMany(() => Favorite, (favorite) => favorite.user, {
    onDelete: 'CASCADE',
  })
  favorite: Favorite[];
}
