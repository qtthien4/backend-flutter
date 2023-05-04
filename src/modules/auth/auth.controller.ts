import { Body, Controller, Get, Param, Post, Put, Query } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { AuthService } from './auth.service';
import { LoginDto, RegisterDto, changePassword, editProfile } from './auth.dto';

@ApiTags('auth')
@Controller('auth')
@ApiBearerAuth()
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('register')
  async register(@Body() payload: RegisterDto) {
    return this.authService.register(payload);
  }

  @Put('edit-profile/:userId')
  async editProfile(@Body() payload: editProfile, @Param('userId') userId: string) {
    return this.authService.editProfile(payload, userId);
  }

  @Put('change-password/:userId')
  async changePassword(@Body() payload: changePassword, @Param('userId') userId: string) {
    return this.authService.changePassword(payload, userId);
  }

  @Post('login')
  async login(@Body() payload: LoginDto) {
    return this.authService.login(payload);
  }

  @Get('me')
  async me(@Query('userId') userId: string) {
    return this.authService.me(userId);
  }
}
