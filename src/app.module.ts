import { JwtService } from '@nestjs/jwt';
import { Module } from '@nestjs/common';
import { APP_GUARD } from '@nestjs/core';
import { CommonModule } from './common/common.module';
import { AuthModule } from './modules/auth/auth.module';
import { AuthorizationGuard } from './modules/auth/authorization.guard';
import { UploadModule } from './modules/upload/upload.module';
import { HotelModule } from './modules/hotel/hotel.module';
import { ProvinceModule } from './modules/province/province.module';
import { BookingModule } from './modules/booking/booking.module';
import { FavoriteModule } from './modules/favorite/favorite.module';

@Module({
  imports: [CommonModule, AuthModule, UploadModule, HotelModule, ProvinceModule, BookingModule, FavoriteModule],
  controllers: [],
  providers: [
    {
      provide: APP_GUARD,
      useClass: AuthorizationGuard,
    },
  ],
})
export class AppModule {}
