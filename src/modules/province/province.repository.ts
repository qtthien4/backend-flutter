import { Hotel } from 'src/database/entities/hotel.entity';
import { Province } from 'src/database/entities/province.entity';
import { EntityRepository, Repository } from 'typeorm';

@EntityRepository(Province)
export class ProvinceRepository extends Repository<Province> {}
