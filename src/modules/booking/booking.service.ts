import { UserRepository } from './../user/user.repository';
import { Injectable } from '@nestjs/common';
import { CreateBookingDto } from './dto/create-booking.dto';
import { UpdateBookingDto } from './dto/update-booking.dto';
import { BookingRepository } from './booking.repository';

@Injectable()
export class BookingService {
  constructor(private userRepository: UserRepository, private bookingRepository: BookingRepository) {}
  async create(createBookingDto: CreateBookingDto) {
    const user = await this.userRepository.findOne({ where: { email: createBookingDto.email } });

    return this.bookingRepository.save({ ...createBookingDto, user });
  }

  findAll() {
    return `This action returns all booking`;
  }

  findOne(id: string) {
    return this.bookingRepository.find({ where: { userId: id }, relations: ['hotel'] });
  }

  update(id: number, updateBookingDto: UpdateBookingDto) {
    return `This action updates a #${id} booking`;
  }

  remove(id: number) {
    return `This action removes a #${id} booking`;
  }
}
