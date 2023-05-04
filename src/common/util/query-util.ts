import { SelectQueryBuilder } from 'typeorm';
const _ = require('lodash');


export class PaginationResponse {
  content: any;
  total: number;
  page: number;
  size: number;
}

export class PaginationParam<T> {
  query: SelectQueryBuilder<T>;
  alias: string;
  size?: number;
  page?: number;
  sort?: string;
  defaultSort?: string = 'descend-createdOnDate';
}

export async function toPaginationResponse<T>(params: PaginationParam<T>) {
  if (params.sort) {
    const sortKeyValue = params.sort.split('-');
    const direction = sortKeyValue[0];
    const key = sortKeyValue[1];
    switch (direction) {
      case 'ascend':
        params.query.addOrderBy(`${params.alias}.${key}`, 'ASC');
        break;
      case 'descend':
        params.query.addOrderBy(`${params.alias}.${key}`, 'DESC');
        break;
      default:
        break;
    }
  } else {
    params.query.addOrderBy(`${params.alias}.createdOnDate`, 'DESC');
  }

  const total = await params.query.getCount();
  const take = params.size;
  const skip = (params.page - 1) * take;

  if (!isNaN(take) && !isNaN(skip)) {
    params.query.take(take).skip(skip);
  }

  const content = await params.query.getMany();
  const result: PaginationResponse = {
    content,
    total,
    page: Number(params.page),
    size: Number(params.size),
  };
  return result;
}

export class ExtendableParam<T> {
  array: Array<T>;
  size?: number;
}

export class ExtendableResponse {
  content: any;
  total: number;
  size: number = 10;
}
export async function arrayToExtendableResponse<T>(params: ExtendableParam<T>) {
  const total = params.array.length;
  const take = params.size;

  const result: ExtendableResponse = {
    content: _.take(params.array, take),
    total,
    size: Number(params.size),
  };
  return result;
}
