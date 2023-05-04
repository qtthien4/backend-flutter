import {
  createParamDecorator,
  ExecutionContext,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UserJwtDto } from 'src/modules/auth/auth.dto';

export const UserReq = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();

    if (!request.user) {
      throw new UnauthorizedException();
    }
    return request.user;
  },
);

export const UserReqSocket = createParamDecorator(
  (data: unknown, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest();
    if (request.handshake?.headers?.authorization?.includes('Bearer')) {
      const token = request.handshake.headers.authorization.replace(
        'Bearer ',
        '',
      );

      try {
        const jwtService: JwtService = new JwtService();
        const user = jwtService.decode(token, { json: true }) as UserJwtDto;
        if (!user) throw new UnauthorizedException();
        return user;
      } catch (e) {
        throw new UnauthorizedException();
      }
    }
    throw new UnauthorizedException();
  },
);
