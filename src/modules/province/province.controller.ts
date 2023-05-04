import { Body, Controller } from '@nestjs/common';
import { Post, Get } from '@nestjs/common/decorators';
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';
import { ProvinceService } from './province.service';

@ApiTags('province')
@ApiBearerAuth()
@Controller('province')
export class ProvinceController {
  constructor(private provinceService: ProvinceService) {}

  @Get('')
  async createHotel() {
    return this.provinceService.getListProvince();
  }
}
