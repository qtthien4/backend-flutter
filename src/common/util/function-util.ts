import * as bcryptjs from 'bcryptjs';
import { format } from 'date-fns';
import * as moment from 'moment-timezone';

export const hashPassword = async (password: string) => {
  const saltOrRounds = 10;
  const hash = await bcryptjs.hash(password, saltOrRounds);
  return hash;
};

export const generateFromDate = (fromDate: Date) => {
  const result = format(fromDate, 'yyyy-MM-dd');
  return result + ' 00:00:00';
};

export const generateToDate = (toDate: Date) => {
  const result = format(toDate, 'yyyy-MM-dd');
  return result + ' 23:59:20';
};

export const JST = (date: Date = new Date(Date.now())) => {
  const result = moment(date).tz('Asia/Tokyo');
  return result;
};

export const jstAt = (set: moment.MomentSetObject) => {
  const result = moment().tz('Asia/Tokyo').set(set);
  return result;
};

export const replicateObject = (obj: Object) => {
  return JSON.parse(JSON.stringify(obj));
};

export const typeormRepos = () => {
  return [];
};
