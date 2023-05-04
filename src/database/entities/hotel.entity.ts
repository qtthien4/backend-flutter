import { AbstractEntity } from 'src/common/abstract/entity.abstract';
import { TypeHotel } from 'src/common/enums/hotel.enum';
import { Column, Entity, OneToMany, JoinColumn, ManyToOne } from 'typeorm';
import { Province } from './province.entity';
import { Booking } from './booking.entity';
import { Favorite } from './favorite.entity';

@Entity('hotels')
export class Hotel extends AbstractEntity {
  @Column()
  name: string;

  @Column({ type: 'text' })
  decs: string;

  @Column({ type: 'enum', enum: TypeHotel, default: TypeHotel.HOTEL })
  type: TypeHotel;

  @Column()
  price: number;

  @Column()
  image: string;

  @Column()
  latitude: string;

  @Column()
  longitude: string;

  @Column({ default: 5 })
  roomAvailable: number;

  @Column({ nullable: true })
  location: string;

  @ManyToOne(() => Province, (province) => province.hotels, {
    onDelete: 'CASCADE',
  })
  @JoinColumn({ name: 'provinceId' })
  province: Province;

  @Column()
  provinceId: string;

  @OneToMany(() => Booking, (booking) => booking.hotel, {
    onDelete: 'CASCADE',
  })
  bookings: Booking[];

  @OneToMany(() => Favorite, (favorite) => favorite.hotel, {
    onDelete: 'CASCADE',
  })
  favorite: Favorite[];
}
