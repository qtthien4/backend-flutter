import { ApiProperty } from '@nestjs/swagger';
import { IsOptional, IsString } from 'class-validator';

export class CreateBookingDto {
  @ApiProperty()
  @IsString()
  @IsOptional()
  hotelId?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  name?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  email?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  number?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  chooseDate?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  depTime?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  person?: string;

  @ApiProperty()
  @IsString()
  @IsOptional()
  total?: string;
}
