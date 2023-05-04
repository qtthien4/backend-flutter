import { AbstractEntity } from 'src/common/abstract/entity.abstract';
import { Column, Entity, OneToMany, ManyToOne } from 'typeorm';
import { Hotel } from './hotel.entity';
import { User } from './user.entity';

@Entity('favorites')
export class Favorite extends AbstractEntity {
  @Column()
  userId: string;

  @Column()
  hotelId: string;

  @ManyToOne(() => Hotel, (hotel) => hotel.favorite, {
    onDelete: 'CASCADE',
  })
  hotel: Hotel;

  @ManyToOne(() => User, (user) => user.favorite, {
    onDelete: 'CASCADE',
  })
  user: User;
}
