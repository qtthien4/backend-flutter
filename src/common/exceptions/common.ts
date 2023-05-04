import * as _ from 'lodash';

export const NotFound = (text: string) => {
  return `NOT_FOUND_${text.toUpperCase()}`;
};

export const Require = (text: string) => {
  return `REQUIRE_${text.toUpperCase()}`;
};

export const Unexpected = (text: string) => {
  return `UNEXPECTED_${text.toUpperCase()}`;
};

export const CustomException = (text: string) => {
  return `${text.toUpperCase()}`;
};

// export class BaseCustomException extends Error {
//   constructor(
//     private readonly error: string | Record<string, any>,
//     private readonly description?: string
//   ) {
//     super();
//     this.initMessage();
//     this.initName();
//   }

//   public initMessage() {
//     if (_.isString(this.error)) {
//       this.message = this.error;
//     } else if (this.error?.message) {
//       this.message = this.error.message;
//     } else if (this.constructor) {
//       this.message = this.constructor.name
//         .match(/[A-Z][a-z]+|[0-9]+/g)
//         .join(' ');
//     }
//   }

//   public initName() {
//     this.name = this.constructor.name;
//   }

//   public getError(): string | object {
//     return this.error;
//   }

//   public static createBody(objectOrError: object | string, message?: string) {
//     if (!objectOrError) {
//       return { message: message };
//     }
//     return _.isObject(objectOrError) && !Array.isArray(objectOrError)
//       ? objectOrError
//       : { message: objectOrError, error: message };
//   }
// }
