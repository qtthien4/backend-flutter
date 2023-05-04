import { AbstractEntity } from 'src/common/abstract/entity.abstract';
import { Column, Entity, OneToMany } from 'typeorm';
import { Hotel } from './hotel.entity';

@Entity('provinces')
export class Province extends AbstractEntity {
  @Column()
  name: string;

  @Column({ nullable: true })
  image: string;

  @OneToMany(() => Hotel, (hotel) => hotel.province, {
    onDelete: 'CASCADE',
  })
  hotels: Hotel[];
}
