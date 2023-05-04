import { Module } from '@nestjs/common';
import { BookingService } from './booking.service';
import { BookingController } from './booking.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserRepository } from '../user/user.repository';
import { BookingRepository } from './booking.repository';

@Module({
  imports: [TypeOrmModule.forFeature([UserRepository, BookingRepository])],
  controllers: [BookingController],
  providers: [BookingService],
})
export class BookingModule {}
