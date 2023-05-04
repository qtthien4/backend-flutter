import { ApiProperty } from '@nestjs/swagger';
import { IsOptional, IsString } from 'class-validator';

export class SearchFilter {
  @ApiProperty({
    required: false,
  })
  @IsString()
  @IsOptional()
  fullTextSearch?: string;
}
