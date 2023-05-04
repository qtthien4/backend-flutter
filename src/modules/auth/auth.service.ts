import { BadRequestException, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import 'dotenv/config';
// import { User } from './../../database/entities/user.entity';
import { LoginDto, RegisterDto, UserJwtDto, changePassword, editProfile } from './auth.dto';
import { UserRepository } from '../user/user.repository';

@Injectable()
export class AuthService {
  constructor(private userRepository: UserRepository, private jwtService: JwtService) {}

  public async register(payload: RegisterDto) {
    return this.userRepository.save(payload);
  }

  public async login(payload: LoginDto) {
    const user = await this.userRepository.findOne({
      where: { email: payload.email, password: payload.password },
    });
    console.log(user);
    if (!user) throw new BadRequestException('NOT_FOUND_USER');

    return user;
  }

  public async changePassword(payload: changePassword, userId: string) {
    return this.userRepository.update(userId, { password: payload.password });
  }

  public async me(userId: string) {
    return this.userRepository.findOne(userId);
  }

  public async editProfile(payload: editProfile, userId: string) {
    return this.userRepository.update(userId, payload);
  }

  public decode(token: string) {
    try {
      const jwt = token.replace('Bearer ', '');
      return this.jwtService.decode(jwt, { json: true }) as UserJwtDto;
    } catch (e) {
      return null;
    }
  }
}
