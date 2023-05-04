import {
  Injectable,
  CanActivate,
  ExecutionContext,
  Logger,
  UnauthorizedException,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { AuthService } from './auth.service';
import { AUTH_KEY, PermissionType } from './auth.decorator';
// import { UserRole } from 'src/common/enums/user';

@Injectable()
export class AuthorizationGuard implements CanActivate {
  constructor(private reflector: Reflector, private authService: AuthService) {}

  checkValid<T>(requiredArray: T[], array: T[]) {
    let valid = true;
    requiredArray.forEach((require) => {
      valid = valid && array.includes(require);
    });
    return valid;
  }

  async canActivate(context: ExecutionContext): Promise<boolean> {
    return true
    // ////// Switch from role-permission to user-role 2022/06/24
    // // const requiredPermissions = this.reflector.get<PermissionType[]>(
    // //   AUTH_KEY,
    // //   context.getHandler(),
    // // );
    // ////// User-role only guard 2022/06/24
    // const requiredPermissions = this.reflector.get<UserRole[]>(
    //   AUTH_KEY,
    //   context.getHandler(),
    // );

    // if (!requiredPermissions || requiredPermissions.length === 0) return true;

    // try {
    //   const token = context.switchToHttp().getRequest().headers
    //     .authorization as string;

    //   const userJwt = this.authService.decode(token);
    //   if (!userJwt) {
    //     throw new UnauthorizedException();
    //   }

    //   if (userJwt.role === UserRole.ADMIN) {
    //     return true;
    //   }

    //   //mở khi có entity User
    //   // const user = await this.authService.profile(userJwt.id);

    //   ////// Switch from role-permission to user-role 2022/06/24
    //   // const userPermissions = [];
    //   // user.roles
    //   //   .map((r) => r.permissions)
    //   //   .forEach((p) => {
    //   //     userPermissions.push([...p.map((x) => x.name)]);
    //   //   });
    //   // return requiredPermissions.every((p) => userPermissions.includes(p));

    //   ////// User-role only guard 2022/06/24
    //   const userPermissions = [user.role];
    //   const authResult = requiredPermissions.some((p) =>
    //     userPermissions.includes(p),
    //   );

    //   if (!authResult) throw new UnauthorizedException();

    //   return authResult;
    // } catch (e) {
    //   Logger.error(e);
    //   throw new UnauthorizedException();
    // }
  }
}
