import { Favorite } from 'src/database/entities/favorite.entity';
import { Hotel } from 'src/database/entities/hotel.entity';
import { EntityRepository, Repository } from 'typeorm';

@EntityRepository(Favorite)
export class FavoriteRepository extends Repository<Favorite> {}
