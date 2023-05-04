import { Injectable } from '@nestjs/common';
import 'dotenv/config';
import { HotelRepository } from './hotel.repository';
import { SearchFilter } from './hotel.dto';
import { Brackets } from 'typeorm';

@Injectable()
export class HotelService {
  constructor(private hotelRepository: HotelRepository) {}

  async createHotel(payload: any) {
    const province = payload.province;

    await Promise.all(
      payload.data?.map(async (e) => {
        const dataSave = { ...e, provinceId: province };
        await this.hotelRepository.save(dataSave);
      })
    );
  }

  async getHotel(payload: SearchFilter) {
    const query = this.hotelRepository.createQueryBuilder('hotel').leftJoinAndSelect('hotel.province', 'province');

    if (payload.fullTextSearch) {
      query.andWhere(
        new Brackets((e) => {
          e.orWhere('province.name like :nameProvince', {
            nameProvince: `%${payload.fullTextSearch}%`,
          }).orWhere('hotel.name like :name', {
            name: `%${payload.fullTextSearch}%`,
          });
        })
      );
    }

    return query.getMany();
  }

  async findHotel(id: string) {
    const hotel = await this.hotelRepository.findOne({
      where: {
        id,
      },
      relations: ['province'],
    });

    if (!hotel) return;
    return hotel;
  }
}
