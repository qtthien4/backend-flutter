import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
  Logger,
  BadRequestException,
} from '@nestjs/common';
import { catchError, map, Observable, throwError } from 'rxjs';

export interface Response<T> {
  statusCode: number;
  data?: T;
  message?: string;
}

@Injectable()
export class TransformInterceptor<T>
  implements NestInterceptor<T, Response<T>>
{
  intercept(
    context: ExecutionContext,
    next: CallHandler,
  ): Observable<Response<T>> {
    const http = context.switchToHttp();

    const rawResponse = http.getResponse();
    const statusCode = rawResponse.statusCode;
    return next.handle().pipe(
      map((response) => {
        return {
          isSuccess: true,
          statusCode,
          message: response?.message || 'Success',
          data: response?.data || response,
        };
      }),
      catchError((error) => {
        if (
          error.name === 'QueryFailedError' ||
          error.name === 'EntityColumnNotFound'
        ) {
          throw new BadRequestException(error.message);
        } else {
          throw error;
        }
      }),
    );
  }
}
