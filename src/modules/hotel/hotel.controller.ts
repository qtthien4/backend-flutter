import { Body, Controller } from '@nestjs/common';
import { Get, Param, Post, Query } from '@nestjs/common/decorators';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import { HotelService } from './hotel.service';
import { SearchFilter } from './hotel.dto';

@ApiTags('hotel')
@ApiBearerAuth()
@Controller('hotel')
export class HotelController {
  constructor(private hotelService: HotelService) {}

  @Post('')
  async createHotel(@Body() payload: any) {
    return this.hotelService.createHotel(payload);
  }

  @Get('')
  async getHotel(@Query() payload: SearchFilter) {
    return this.hotelService.getHotel(payload);
  }

  @Get('/:id')
  async findHotel(@Param('id') id: string) {
    return this.hotelService.findHotel(id);
  }
}
