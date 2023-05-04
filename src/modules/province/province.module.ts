import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProvinceController } from './province.controller';
import { ProvinceService } from './province.service';
import { ProvinceRepository } from './province.repository';

@Module({
  imports: [TypeOrmModule.forFeature([ProvinceRepository])],
  controllers: [ProvinceController],
  providers: [ProvinceService],
})
export class ProvinceModule {}
