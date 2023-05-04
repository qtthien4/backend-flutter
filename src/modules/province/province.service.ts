import { Injectable } from '@nestjs/common';
import 'dotenv/config';
import { ProvinceRepository } from './province.repository';

@Injectable()
export class ProvinceService {
  constructor(private provinceRepository: ProvinceRepository) {}

  async getListProvince() {
    const provinces = await this.provinceRepository.find({ relations: ['hotels'] });
    return provinces;
  }
}
