import { ApiProperty } from '@nestjs/swagger';
import { IsBoolean, IsBooleanString, IsEnum, IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class UserJwtDto {
  id: string;
  email: string;
  // role: UserRole;
}

export class RegisterDto {
  @IsString()
  @IsNotEmpty()
  phoneNumber: string;

  @IsString()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  password: string;

  @IsString()
  @IsNotEmpty()
  name: string;

  @IsNotEmpty()
  bdd: Date;
}

export class editProfile {
  @IsString()
  @IsNotEmpty()
  phoneNumber: string;

  @IsString()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  name: string;
}

export class changePassword {
  @IsString()
  @IsNotEmpty()
  password: string;
}

export class LoginDto {
  @IsString()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  password: string;
}
