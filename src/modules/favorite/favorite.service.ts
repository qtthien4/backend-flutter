import { FavoriteRepository } from './favorite.repository';
import { Injectable } from '@nestjs/common';
import { CreateFavoriteDto } from './dto/create-favorite.dto';
import { UpdateFavoriteDto } from './dto/update-favorite.dto';

@Injectable()
export class FavoriteService {
  constructor(private favoriteRepository: FavoriteRepository) {}
  async create(createFavoriteDto: CreateFavoriteDto) {
    const favorite = await this.favoriteRepository.findOne({
      where: { userId: createFavoriteDto.userId, hotelId: createFavoriteDto.hotelId },
    });
    if (favorite) {
      return this.favoriteRepository.delete(favorite.id);
    }
    return this.favoriteRepository.save(createFavoriteDto);
  }

  async checkFavorite(payload: CreateFavoriteDto) {
    const favoriteUser = await this.favoriteRepository.findOne({
      where: { userId: payload.userId, hotelId: payload.hotelId },
    });

    if (favoriteUser) return true;
    else return false;
  }

  async findOne(id: string) {
    return await this.favoriteRepository.find({ where: { userId: id }, relations: ['hotel', 'hotel.province'] });
  }

  update(id: number, updateFavoriteDto: UpdateFavoriteDto) {
    return `This action updates a #${id} favorite`;
  }

  remove(id: number) {
    return `This action removes a #${id} favorite`;
  }
}
