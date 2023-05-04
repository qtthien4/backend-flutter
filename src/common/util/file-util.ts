import { extname } from 'path';

export const imageRegex =
  /\.(jpg|jpeg|jfif|png|gif|svg|webp|zip|rar|pptx|ppt|xlsx|xlsm|doc|docx|txt|log|mp4|mov|m4v|mwv|csv)$/;
export const pdfRegex = /\.(pdf)$/;

export const S4 = function () {
  return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
};

export const editFileName = (req, file: Express.Multer.File, callback) => {
  //prettier-ignore
  const name = (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
  const fileExtName = extname(file.originalname);
  callback(null, `${name}-${Date.now()}${fileExtName}`);
};

export const imageFileFilter = (req, file: Express.Multer.File, callback) => {
  if (!file.originalname.toLowerCase().match(imageRegex)) {
    return callback(new Error('Không đúng định dạng ảnh'));
  }

  callback(null, true);
};

export const PdfFileFilter = (req, file: Express.Multer.File, callback) => {
  if (!file.originalname.match(pdfRegex)) {
    return callback(new Error('Không đúng định dạng pdf'));
  }

  callback(null, true);
};

export const toResponseFiles = (
  files: Array<Express.Multer.File>,
): Array<Partial<Express.Multer.File>> => {
  const response = [];
  files.forEach((file) => {
    const fileReponse = {
      filename: file.filename,
      minetype: file.mimetype,
    };
    response.push(fileReponse);
  });
  return response;
};

export const toResponseFile = (
  file: Express.Multer.File,
): Partial<Express.Multer.File> => {
  const fileReponse = {
    filename: file.filename,
    minetype: file.mimetype,
  };
  return fileReponse;
};
