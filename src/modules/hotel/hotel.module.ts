import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { HotelController } from "./hotel.controller";
import { HotelService } from "./hotel.service";
import { HotelRepository } from "./hotel.repository";

@Module({
  imports: [
    TypeOrmModule.forFeature([
      HotelRepository
    ]),
  ],
  controllers: [HotelController],
  providers: [HotelService],
})
export class HotelModule {}
