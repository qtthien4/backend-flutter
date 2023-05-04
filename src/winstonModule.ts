import * as moment from "moment";
import { WinstonModule } from 'nest-winston';
import winston from 'winston';
const { createLogger, format, transports, config } = require('winston');
const { combine, timestamp, label, json } = format;

export const WinstonModuleFor = (type: string) =>
  WinstonModule.forRoot({
    format: combine(label({ label: type }), timestamp(), json()),
    // format: combine(
    //   winston.format.timestamp(),
    //   winston.format.json(),
    // ),
    levels: config.syslog.levels,
    transports: [
      new transports.File({
        filename: `./logs/${type}/error-${moment()
          .utc()
          .add(9, 'hours')
          .format('YYYY-MM-DD')}.log`,
        level: 'error',
      }),
      new transports.File({
        filename: `./logs/${type}/info-${moment()
          .utc()
          .add(9, 'hours')
          .format('YYYY-MM-DD')}.log`,
        level: 'info',
      }),
    //   new transports.File({
    //     filename: `./logs/${type}/debug-${moment()
    //       .utc()
    //       .add(9, 'hours')
    //       .format('YYYY-MM-DD-HHmmss')}.log`,
    //     level: 'debug',
    //   }),
    ],
  });
